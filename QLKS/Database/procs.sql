USE QLKS
GO 

update phong set gia = 600000
where loaiphong = 'Không đảm bảo';

update phong set gia = 1000000
where loaiphong = 'Đảm bảo';

update phieudatphong
set sodemluutru = datediff(day, ngayden, ngaydi) + 1;

update phong 
set tinhtrang = 'Còn trống'
where maphong not in (select maphong from chitietdatphong where mapdk in (select mapdk from phieudatphong where getdate() >= ngayden  and getdate() <= ngaydi));

update phong 
set tinhtrang = 'Đã đặt'
where maphong in (select maphong from chitietdatphong where mapdk in (select mapdk from phieudatphong where getdate() >= ngayden and getdate() <= ngaydi));

-- Danh sách các phòng hiện có thể đặt
--DROP PROC IF EXISTS USP_AvailableRoom
--GO

CREATE 
--ALTER 
PROC USP_AvailableRoom
	@Arrive Date,
	@Depart Date,
	@Type varchar(20)
AS
BEGIN TRAN
	IF NOT EXISTS (select maphong from phong where maphong not in (select maphong from chitietdatphong where mapdk in (select mapdk from phieudatphong where @Arrive between ngayden and ngaydi)))
		BEGIN
			SELECT 'No available rooms were ready for the selected dates.' AS 'ERROR';
			ROLLBACK TRAN;
			RETURN;
		END
	IF NOT EXISTS (select maphong from phong where maphong not in (select maphong from chitietdatphong where mapdk in (select mapdk from phieudatphong where @Depart between ngayden and ngaydi)))
		BEGIN
			SELECT 'No available rooms were ready for the selected dates.' AS 'ERROR';
			ROLLBACK TRAN;
			RETURN;
		END
	
	--DECLARE @TEMP TABLE (MAPHONG VARCHAR(8))
	--INSERT INTO @TEMP SELECT maphong FROM chitietdatphong WHERE mapdk IN (SELECT mapdk FROM phieudatphong WHERE @Arrive BETWEEN ngayden AND ngaydi)

	--INSERT INTO @TEMP (MAPHONG)
	--SELECT maphong
	--FROM chitietdatphong c
	--WHERE mapdk IN (SELECT mapdk FROM phieudatphong WHERE @Depart BETWEEN ngayden AND ngaydi)
	--AND NOT EXISTS (SELECT 1 FROM @TEMP t WHERE t.MAPHONG = c.MAPHONG)

	--SELECT MAPHONG, MOTA, LOAIPHONG, GIA  
	--FROM PHONG 
	--where MAPHONG NOT IN (SELECT MAPHONG FROM @TEMP) 
	--ORDER BY MAPHONG ASC
	
	SELECT P.MAPHONG, P.MOTA, P.LOAIPHONG, P.GIA  
	FROM PHONG P
	LEFT JOIN (
		SELECT C.MAPHONG
		FROM chitietdatphong C
		INNER JOIN phieudatphong PD ON C.MAPDK = PD.MAPDK
		WHERE @Arrive BETWEEN PD.NGAYDEN AND PD.NGAYDI 
			OR @Depart BETWEEN PD.NGAYDEN AND PD.NGAYDI
			OR (PD.NGAYDEN BETWEEN @Arrive AND @Depart OR PD.NGAYDI BETWEEN @Arrive AND @Depart)
		GROUP BY C.MAPHONG
		HAVING COUNT(*) >= 1
	) T ON P.MAPHONG = T.MAPHONG
	WHERE T.MAPHONG IS NULL AND P.LOAIPHONG = @Type
	ORDER BY P.MAPHONG ASC
	SELECT 'The available rooms for the selected dates were successfully retrieved.' AS '1'
COMMIT TRAN
GO

--DECLARE @Arrive Date = GETDATE();
--DECLARE @Depart Date = DATEADD(day, 11, @Arrive);
--EXEC USP_AvailableRoom '2023-04-13', '2023-04-13', 'Đảm bảo';
--select maphong from phong where maphong not in (select maphong from chitietdatphong where mapdk in (select mapdk from phieudatphong)) and loaiphong = 'Không đảm bảo';
--select maphong from phong where maphong not in (select maphong from chitietdatphong where mapdk in (select mapdk from phieudatphong)) and loaiphong = 'Đảm bảo';
--select maphong from phong where maphong in (select maphong from chitietdatphong where mapdk in (select mapdk from phieudatphong where '2023-05-13' between ngayden and ngaydi))
--select maphong from phong where maphong in (select maphong from chitietdatphong where mapdk in (select mapdk from phieudatphong where @Arrive between ngayden and ngaydi))

--Đánh giá
--DROP PROC IF EXISTS USP_ThemDanhGiaChoPhong
--GO

CREATE 
--ALTER
PROCEDURE dbo.USP_ThemDanhGiaChoPhong
    @mapdk varchar(15),
    @diem float
AS
BEGIN TRAN;    
    -- Insert danh gia for each phong in the phieu dat phong
    INSERT INTO dbo.DANHGIA (MAPHONG, MAKH, DIEM)
    SELECT CTP.MAPHONG, PD.MAKH, @diem
    FROM dbo.CHITIETDATPHONG CTP
    INNER JOIN dbo.PHIEUDATPHONG PD ON CTP.MAPDK = PD.MAPDK
    WHERE PD.MAPDK = @mapdk;
    
COMMIT TRAN;
GO

--














