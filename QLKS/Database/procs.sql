USE QLKS
GO 

update phong set gia = 600000
where loaiphong = 'Không đảm bảo';

update phong set gia = 1000000
where loaiphong = 'Đảm bảo';

update phong set loaiphong = 1
where loaiphong = N'Không đảm bảo';

update phong set loaiphong = 2
where loaiphong = N'Ðảm bảo';

update phieudatphong
set sodemluutru = datediff(day, ngayden, ngaydi) + 1;

-- Danh sách các phòng hiện có thể đặt
DROP PROC IF EXISTS USP_AvailableRoom
GO

CREATE 
--ALTER 
PROC USP_AvailableRoom
	@Arrive datetime,
	@Depart datetime,
	@Type nvarchar(20)
AS
BEGIN TRAN
	IF @Arrive = '' OR @Depart = '' OR @Type = ''
		BEGIN
			SELECT 'PLEASE FILL UP ALL FIELDS' AS 'ERROR';
			ROLLBACK TRAN;
			RETURN;
		END
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
	--SELECT 'The available rooms for the selected dates were successfully retrieved.' AS '1'
	select @Arrive,@Depart, @Type	  
COMMIT TRAN
GO

--DECLARE @Arrive Date = GETDATE();
--DECLARE @Depart Date = DATEADD(day, 11, @Arrive);
EXEC USP_AvailableRoom '2023-05-03', '2023-05-03', 2;
select *from PHONG;
select *from PHONG where loaiphong = N'Không đảm bảo';
select *from PHONG where loaiphong = N'Ðảm bảo';
select *from PHONG where loaiphong like '%bảo';
print cast (N'Ðảm bảo' as int)
--select maphong from phong where maphong not in (select maphong from chitietdatphong where mapdk in (select mapdk from phieudatphong)) and loaiphong = 'Không đảm bảo';
--select maphong from phong where maphong not in (select maphong from chitietdatphong where mapdk in (select mapdk from phieudatphong)) and loaiphong = 'Đảm bảo';
--select * from phong where maphong in (select maphong from chitietdatphong where mapdk in (select mapdk from phieudatphong where '2023-05-13' between ngayden and ngaydi))
--select * from phong where maphong in (select maphong from chitietdatphong where mapdk in (select mapdk from phieudatphong where @Arrive between ngayden and ngaydi))

--Đánh giá
DROP PROC IF EXISTS USP_ThemDanhGiaChoPhong
GO

CREATE 
--ALTER
PROCEDURE USP_ThemDanhGiaChoPhong
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

--Đặt phòng
DROP PROC IF EXISTS USP_ThemPhieuDatPhong
GO

CREATE 
--ALTER
PROCEDURE USP_ThemPhieuDatPhong
	@MAPDK VARCHAR(15),
    @MAKH VARCHAR(15),
    @NGAYLAP DATETIME,
    @MANV VARCHAR(8),
    @NGAYDEN DATETIME,
    @NGAYDI DATETIME,
    @SODEMLUUTRU INT,
    @THANHTIEN FLOAT,
    @TYPE VARCHAR(20),
    @SoPhong INT,
	@NOTE VARCHAR(50)
AS
BEGIN
    DECLARE @AvailableRooms TABLE (
        MAPHONG VARCHAR(8),
        MOTA VARCHAR(50),
        LOAIPHONG VARCHAR(20),
        GIA FLOAT
    )

    INSERT INTO @AvailableRooms (MAPHONG, MOTA, LOAIPHONG, GIA)
    EXEC USP_AvailableRoom @NGAYDEN, @NGAYDI, @TYPE

	---- Check if there are enough available rooms for the specified date range and room type
 --   IF @@ROWCOUNT < @SoPhong
 --   BEGIN
 --       RAISERROR('Not enough available rooms for the selected dates and room type.', 16, 1)
 --       RETURN
 --   END

    -- Insert a new record into the PHIEUDATPHONG table
    INSERT INTO PHIEUDATPHONG (MAPDK, MAKH, NGAYLAP, MANV, NGAYDEN, NGAYDI, SODEMLUUTRU, THANHTIEN)
    VALUES (@MAPDK, @MAKH, @NGAYLAP, @MANV, @NGAYDEN, @NGAYDI, @SODEMLUUTRU, @THANHTIEN)

    -- Insert associated records into the CHITIETDATPHONG table
    INSERT INTO CHITIETDATPHONG (MAPDK, MAPHONG, NOTE)
    SELECT TOP (@SoPhong) @MAPDK, MAPHONG, @NOTE
    FROM @AvailableRooms
    ORDER BY MAPHONG ASC

    SELECT 'New reservation successfully created.' AS 'Message'
END
GO

--Thêm khách hàng
DROP PROC IF EXISTS USP_ThemThongTinDoan
GO

CREATE 
PROCEDURE USP_ThemThongTinDoan
	@MaKH varchar(15),
	@TenKH varchar(30),
	@CCCD varchar(15),
	@DiaChi varchar(50),
	@SDT varchar(15),
	@Fax varchar(20),
	@Email varchar(30),
	@TenDoan varchar(30),
	@SoLuong int
AS
BEGIN
	INSERT INTO THONGTINDOAN (MAKH, TENKH, CCCD, DIACHI, SDT, FAX, EMAIL, TENDOAN, SOLUONG)
	VALUES (@MaKH, @TenKH, @CCCD, @DiaChi, @SDT, @Fax, @Email, @TenDoan, @SoLuong)
END
GO






















