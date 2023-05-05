﻿----DANH SÁCH ĐẶT PHÒNG---
--CREATE
ALTER
proc getBookListRoom
	@manv char(15)
as
begin
	if not exists(select * from PHIEUDATPHONG where MANV = @manv)
	begin
		select 'NV Is Not Found' AS 'ERROR'
	end
	select C.MAPHONG, P.MAKH,P.NGAYLAP,P.NGAYDEN,P.NGAYDI from PHIEUDATPHONG P
		JOIN CHITIETDATPHONG C
		ON P.MAPDK = C.MAPDK
end
GO

exec getBookListRoom 'NV38'

---DANH SÁCH HÀNH LÝ CẦN VẬN CHUYỂN----

--update  NHANVIEN set BOPHAN = 'Bellman' where MANV = 'NV52'
--update  NHANVIEN set BOPHAN = 'Bellman' where MANV = 'NV14'
--update  NHANVIEN set BOPHAN = 'Bellman' where MANV = 'NV30'
--update  NHANVIEN set BOPHAN = 'Bellman' where MANV = 'NV85'
SELECT * FROM NHANVIEN WHERE BOPHAN = 'Bellman'

CREATE
--ALTER
proc getSuitcaseList
	@manv char(15)
as
begin
	if not exists(select * from NHANVIEN where MANV = @manv)
	begin
		select 'NV Is Not Found' AS 'ERROR'
	end
	SELECT DISTINCT HL.MAPHONG, KH.TENKH,P.NGAYLAP, P.MANV, P.MAPDK
	FROM PHIEUVCHL P 
	join THONGTINDOAN KH on KH.MAKH = P.MAKH
	join VANCHUYEN VC on VC.MAPDK = P.MAPDK
	JOIN HANHLI HL ON HL.MAKH = KH.MAKH
	WHERE P.TINHTRANG = N'CHỜ VẬN CHUYỂN'
end
GO
exec getSuitcaseList 'NV38'
SELECT * FROM HANHLI --KHÔNG ĐĂNG KÝ, TỰ VC
SELECT * FROM PHIEUVCHL --ĐĂNG KÝ VẬN CHUYỂN HL NHƯNG BELLMAN CHƯA VC
SELECT * FROM VANCHUYEN --BELLMAN ĐÃ VC THÀNH CÔNG

UPDATE PHIEUVCHL SET TINHTRANG = N'CHỜ VẬN CHUYỂN' WHERE MAPDK = 'PDK160740'
UPDATE PHIEUVCHL SET TINHTRANG = N'ĐÃ VẬN CHUYỂN' WHERE MAPDK = 'PDK193639'
UPDATE PHIEUVCHL SET TINHTRANG = N'CHỜ VẬN CHUYỂN' WHERE MAPDK = 'PDK265617'
UPDATE PHIEUVCHL SET TINHTRANG = N'CHỜ VẬN CHUYỂN' WHERE MAPDK = 'PDK381465'
UPDATE PHIEUVCHL SET TINHTRANG = N'ĐÃ VẬN CHUYỂN' WHERE MAPDK = 'PDK582810'
UPDATE PHIEUVCHL SET TINHTRANG = N'CHỜ VẬN CHUYỂN' WHERE MAPDK = 'PDK651659'
UPDATE PHIEUVCHL SET TINHTRANG = N'ĐÃ VẬN CHUYỂN' WHERE MAPDK = 'PDK762957'
UPDATE PHIEUVCHL SET TINHTRANG = N'CHỜ VẬN CHUYỂN' WHERE MAPDK = 'PDK906400'

--THÊM HÀNH LÝ VÀO DANH SÁCH CẦN VẬN CHUYỂN CHO KHÁCH HÀNG
CREATE
--ALTER
proc addSuitcaseNeedToTrans
	@mapdk varchar(15),
	@makh varchar(15),
	@ngaylap datetime,
	@manv varchar(15),
	@soluong int
as
begin
	set @ngaylap = getdate()
	if exists(select * from PHIEUVCHL where MAPDK = @mapdk)
	begin
		select 'Phiếu đăng ký đã tồn tại' AS 'ERROR'
	end
	if not exists(select * from NHANVIEN where MANV = @manv)
	begin
		select 'Nhân viên không tồn tại' AS 'ERROR'
	end
	insert into PHIEUVCHL values(@mapdk,@makh,@ngaylap,@manv ,@soluong, N'CHỜ VẬN CHUYỂN')
end
GO



----CẬP NHẬT TÌNH TRẠNG VẬN CHUYỂN HÀNH LÝ------------
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
exec updateSuitcase 'PDK651659'
UPDATE PHIEUVCHL SET TINHTRANG = N'CHỜ VẬN CHUYỂN' WHERE MAPDK = 'PDK651659'
SELECT * FROM PHIEUVCHL

--CHI TIẾT ĐẶT PHÒNG CỦA KHÁCH HÀNG
--CREATE
ALTER
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

exec getRoomDetail 'P301'

SELECT * FROM PHONG
ALTER TABLE PHONG
ALTER COLUMN TINHTRANG NVARCHAR(50)

UPDATE PHONG
SET TINHTRANG = N'CÒN TRỐNG' WHERE TINHTRANG = 'Ðang s?a'