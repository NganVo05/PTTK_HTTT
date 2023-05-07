
create 
--alter
proc BANSPDV_XemPhieuDatSP_DV
as
begin
	select PHIEU_DKDV_SP.MAPDK, PHIEU_DKDV_SP.STT, PHIEU_DKDV_SP.MAKH, CASE
            WHEN PHIEU_DKDV_SP.MADV = 'DVBANSP'
               THEN MASP
               ELSE PHIEU_DKDV_SP.MADV
       END as LOAIDV_SP, CAST(NGAYLAP AS CHAR(11)) NGAYLAP, PHIEU_DKDV_SP.THANHTIEN 
	   from PHIEU_DKDV_SP where not exists 
	   (select *from HOADONDV where HOADONDV.MAPDK = PHIEU_DKDV_SP.MAPDK and HOADONDV.STT = PHIEU_DKDV_SP.STT)
end

-----------------------------------------------------------

create
--alter 
proc BANSPDV_XemThongTinPhieuSP_DV
 @mapdk varchar(20),
 @stt int
as
begin
	select PHIEU_DKDV_SP.MAPDK, PHIEU_DKDV_SP.MAKH, CASE
            WHEN PHIEU_DKDV_SP.MADV = 'DVBANSP'
               THEN MASP
               ELSE PHIEU_DKDV_SP.MADV
       END as LOAIDV_SP, PHIEU_DKDV_SP.THANHTIEN, SOLUONG, CAST(GIOBD AS CHAR(8))GIOBD, CAST(GIOKT AS CHAR(8))GIOKT, 
	   PHIEU_DKDV_SP.NOTE GHICHU, HOADONDV.TINHTRANG
	from PHIEU_DKDV_SP join KHUNGGIODV on PHIEU_DKDV_SP.MAKG = KHUNGGIODV.MAKG and MAPDK = @mapdk and STT = @stt
	join HOADONDV on PHIEU_DKDV_SP.MAPDK = HOADONDV.MAPDK and PHIEU_DKDV_SP.STT = HOADONDV.STT
end

-----------------------------------------------------------

create 
--alter
proc BANSPDV_TaoHoaDonSPDV
	@mahd varchar(15),
	@mapdk varchar(15),
	@stt int
as
begin tran
	if exists(select *from HOADONDV where MAHD = @mahd)
	begin
		select N'Lỗi tạo hoá đơn' ERROR
		rollback tran
		return 0
	end
	declare @makh varchar(15), @thanhtien float, @manv varchar(8), @makg varchar(15), @madv varchar(15)
	select @makh = MAKH, @thanhtien = THANHTIEN, @manv = MANV, @makg = MAKG, @madv = MADV
	from PHIEU_DKDV_SP where MAPDK = @mapdk and STT = @stt 

	INSERT HOADONDV VALUES(@mahd,@makh,GETDATE(),@thanhtien,'Tien Mat',
	'Da Thanh Toan',@manv,@makg, @madv,@mapdk,@stt,null)

	INSERT PHIEU_SDDV VALUES(@makh, @makg, @madv, @mapdk, @stt, GETDATE())

	select N'Tạo Hoá Đơn Thành Công' RESULT
	
commit tran 
return 1

-----------------------------------------------------------

create 
--alter
proc BANSPDV_XoaPhieuDK_SPDV
 @mapdk varchar(15),
 @stt int
as
begin tran
	if exists( select *from HOADONDV where MAPDK = @mapdk and STT = @stt)
	begin
		select N'Phiếu đã xuất hoá đơn!' ERROR
		rollback tran
		return 0
	end
	if not exists( select *from PHIEU_DKDV_SP where MAPDK = @mapdk and STT = @stt)
	begin
		select N'Phiếu đăng ký dịch vụ/ sản phẩm không tồn tại!' ERROR
		rollback tran
		return 0
	end
	delete PHIEU_DKDV_SP
	where MAPDK = @mapdk and STT = @stt
	
	select N'Xoá phiếu thành công' RESULT
commit tran
return 1

-----------------------------------------------------------

create 
--alter 
proc BANSPDV_LayMAKH
	@mapdk varchar(15)
as
begin
	if not exists(select * from PHIEUDATPHONG where MAPDK = @mapdk)
	begin
		select N'Không tồn tại mã phiếu đặt phòng' ERROR
		return 
	end
	if exists(select * from PHIEU_DKDV_SP where MAPDK = @mapdk)
	begin
		declare @stt int
		select @stt = MAX(STT) from PHIEU_DKDV_SP where MAPDK = @mapdk 
		set @stt = @stt + 1
		select MAKH, @stt STT from PHIEUDATPHONG where MAPDK = @mapdk
	end
	else
	begin
		select MAKH ,0 STT from PHIEUDATPHONG where MAPDK = @mapdk
	end
end

-----------------------------------------------------------

create 
--alter
proc BANSPDV_LayDS_DPDV
as
begin
	select MADV from DICHVU where MADV != 'DVBANSP'
	select MASP from SANPHAM
end

exec BANSPDV_LayDS_DPDV

-----------------------------------------------------------

create
--alter
proc BANSPDV_LayGia_SP
 @masp varchar(15)
as
begin
	select GIA from SANPHAM where MASP = @masp
end

-----------------------------------------------------------

create
--alter
proc BANSPDV_Lay_KG_Gia_DV
 @madv varchar(15)
as
begin
	select CHITIETDV.MAKG, CAST(GIOBD AS char(8)) GIOBD, CAST(GIOKT AS CHAR(8)) GIOKT ,GIA  
	from CHITIETDV join KHUNGGIODV on MADV = @madv and CHITIETDV.MAKG = KHUNGGIODV.MAKG 
end

-----------------------------------------------------------

create 
--alter
proc BANSPDV_TaoPhieuDK_SPDV
	@madv varchar(15),
	@makg varchar(15),
	@makh varchar(15),
	@mapdk varchar(15),
	@masp varchar(15),
	@soluong int,
	@stt int,
	@thanhtien float,
	@ghichu varchar(50)
as
begin tran
	insert PHIEU_DKDV_SP VALUES (@madv, @makg, @mapdk, @stt, 'NV01', @makh, GETDATE(), @masp, @ghichu, @thanhtien, @soluong)
	select N'Tạo phiếu đăng ký thành công!' RESULT
commit tran
return 1
