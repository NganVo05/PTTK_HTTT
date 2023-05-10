use QLKS
go

----DANH SÁCH ĐẶT PHÒNG----
DROP PROC IF EXISTS getBookListRoom 
GO

CREATE
--ALTER
proc getBookListRoom
as
begin
	select C.MAPHONG, P.MAKH,P.NGAYLAP,P.NGAYDEN,P.NGAYDI from PHIEUDATPHONG P
		JOIN CHITIETDATPHONG C
		ON P.MAPDK = C.MAPDK
end
GO



--exec getBookListRoom 'NV38'

---DANH SÁCH HÀNH LÝ CẦN VẬN CHUYỂN----

--update  NHANVIEN set BOPHAN = 'Bellman' where MANV = 'NV52'
--update  NHANVIEN set BOPHAN = 'Bellman' where MANV = 'NV14'
--update  NHANVIEN set BOPHAN = 'Bellman' where MANV = 'NV30'
--update  NHANVIEN set BOPHAN = 'Bellman' where MANV = 'NV85'
--SELECT * FROM NHANVIEN WHERE BOPHAN = 'Bellman'

DROP PROC IF EXISTS getSuitcaseList 
GO

CREATE
--ALTER
proc getSuitcaseList
as
begin
	SELECT DISTINCT HL.MAPHONG, KH.TENKH,P.NGAYLAP, P.MANV, P.MAPDK
	FROM PHIEUVCHL P 
	join THONGTINDOAN KH on KH.MAKH = P.MAKH
	JOIN HANHLI HL ON HL.MAKH = KH.MAKH
	WHERE P.TINHTRANG = N'CHỜ VẬN CHUYỂN'
	ORDER BY P.NGAYLAP DESC
end
GO
SELECT * FROM HANHLI HL
SELECT * FROM PHIEUVCHL
exec getSuitcaseList
--SELECT * FROM HANHLI --KHÔNG ĐĂNG KÝ, TỰ VC
--SELECT * FROM PHIEUVCHL --ĐĂNG KÝ VẬN CHUYỂN HL NHƯNG BELLMAN CHƯA VC 
--WHERE TINHTRANG = N'CHỜ VẬN CHUYỂN'
--SELECT * FROM VANCHUYEN --BELLMAN ĐÃ VC THÀNH CÔNG

--THÊM HÀNH LÝ VÀO DANH SÁCH CẦN VẬN CHUYỂN CHO KHÁCH HÀNG
DROP PROC IF EXISTS addSuitcaseNeedToTrans 
GO

CREATE
--ALTER
proc addSuitcaseNeedToTrans
	@mapdk varchar(15),
	@makh varchar(15),
	@ngaylap datetime,
	@soluong int,
	@mahl varchar(15)
as
begin
	declare @manv varchar(15), @maphong varchar(15)
	set @ngaylap = getdate()
	if exists(select * from PHIEUVCHL where MAPDK = @mapdk)
	begin
		select 'Phiếu đăng ký đã tồn tại' AS 'ERROR'
	end
	
	set @manv = ( SELECT TOP 1 MANV FROM NHANVIEN WHERE BOPHAN = 'Bellman' ORDER BY NEWID() )

	set @maphong = ( SELECT TOP 1 MAPHONG FROM CHITIETDATPHONG CT
						join PHIEUDATPHONG P ON CT.MAPDK= P.MAPDK 
						WHERE P.MAKH = @makh)
	insert into HANHLI values(@mahl,@makh,@maphong)
	insert into PHIEUVCHL values(@mapdk, @makh, @ngaylap, @manv,@soluong, N'CHỜ VẬN CHUYỂN')
end
GO
select * from CHITIETDATPHONG
select * from PHIEUDATPHONG
--select * from PHIEUVCHL


----CẬP NHẬT TÌNH TRẠNG VẬN CHUYỂN HÀNH LÝ------------
DROP PROC IF EXISTS updateSuitcase 
GO

CREATE
--ALTER
proc updateSuitcase
	@mapdk char(15)
as
begin
	if not exists(select * from PHIEUVCHL where MAPDK = @mapdk)
	begin
		select 'hanhly Is Not Found' AS 'ERROR'
	end
	UPDATE PHIEUVCHL SET TINHTRANG = N'ĐÃ VẬN CHUYỂN' WHERE MAPDK = @mapdk
end
GO
--exec updateSuitcase 'PDK651659'
--UPDATE PHIEUVCHL SET TINHTRANG = N'CHỜ VẬN CHUYỂN' WHERE MAPDK = 'PDK651659'


--CHI TIẾT ĐẶT PHÒNG CỦA KHÁCH HÀNG
DROP PROC IF EXISTS getRoomDetail 
GO

CREATE
--ALTER
proc getRoomDetail
	@maphong char(15)
as
begin
	if not exists(select * from PHONG where MAPHONG = @maphong)
	begin
		select 'MAPHONG Is Not Found' AS 'ERROR'
	end

	select	P.MAPHONG, KH.MAKH, PDT.NGAYLAP, PDT.NGAYDEN, PDT.NGAYDI
	from PHIEUDATPHONG PDT 
	JOIN CHITIETDATPHONG CT ON  PDT.MAPDK = CT.MAPDK
	JOIN PHONG P ON P.MAPHONG = CT.MAPHONG
	JOIN THONGTINDOAN KH ON KH.MAKH = PDT.MAKH
	WHERE @maphong = P.MAPHONG

	select	KH.TENKH, KH.SDT, KH.DIACHI, P.LOAIPHONG, P.GIA from PHIEUDATPHONG PDT 
	JOIN CHITIETDATPHONG CT ON  PDT.MAPDK = CT.MAPDK
	JOIN PHONG P ON P.MAPHONG = CT.MAPHONG
	JOIN THONGTINDOAN KH ON KH.MAKH = PDT.MAKH
	WHERE @maphong = P.MAPHONG
		
end
GO

--exec getRoomDetail 'P301'

--update phieuvchl set tinhtrang = N'CHỜ VẬN CHUYỂN';

--SELECT * FROM PHONG
--ALTER TABLE PHONG
--ALTER COLUMN TINHTRANG NVARCHAR(50)

--UPDATE PHONG
--SET TINHTRANG = N'CÒN TRỐNG' WHERE TINHTRANG = 'Ðang s?a'