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

CREATE PROCEDURE USP_AvailableRoom
	@Arrive datetime,
	@Depart datetime,
	@Type nvarchar(20)
AS
BEGIN
	IF @Arrive IS NULL OR @Depart IS NULL OR @Type = ''
	BEGIN
		SELECT 'PLEASE FILL UP ALL FIELDS' AS 'ERROR';
	END
	ELSE IF NOT EXISTS (SELECT maphong FROM phong WHERE maphong NOT IN (SELECT maphong FROM chitietdatphong WHERE mapdk IN (SELECT mapdk FROM phieudatphong WHERE @Arrive BETWEEN ngayden AND ngaydi)) and loaiphong = @Type)
	BEGIN
		SELECT 'No available rooms were ready for the selected dates.' AS 'ERROR';
	END
	ELSE IF NOT EXISTS (SELECT maphong FROM phong WHERE maphong NOT IN (SELECT maphong FROM chitietdatphong WHERE mapdk IN (SELECT mapdk FROM phieudatphong WHERE @Depart BETWEEN ngayden AND ngaydi)) and loaiphong = @Type)
	BEGIN
		SELECT 'No available rooms were ready for the selected dates.' AS 'ERROR';
	END
	ELSE
	BEGIN
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
		ORDER BY P.MAPHONG ASC;
	END
END
GO


DECLARE @Arrive Date = GETDATE();
DECLARE @Depart Date = DATEADD(day, 4, @Arrive);
EXEC USP_AvailableRoom '2023-05-05', '2023-05-09', 2;
SELECT maphong FROM phong WHERE maphong NOT IN (SELECT maphong FROM chitietdatphong WHERE mapdk IN (SELECT mapdk FROM phieudatphong WHERE @Depart BETWEEN ngayden AND ngaydi)) and loaiphong = '2';
SELECT maphong FROM phong WHERE maphong NOT IN (SELECT maphong FROM chitietdatphong WHERE mapdk IN (SELECT mapdk FROM phieudatphong WHERE @Arrive BETWEEN ngayden AND ngaydi)) and loaiphong = '2';
select * from phieudatphong where mapdk in (select mapdk from chitietdatphong WHERE maphong = 'P105');
--select *from PHONG;
--select maphong from phong where maphong not in (select maphong from chitietdatphong where mapdk in (select mapdk from phieudatphong)) and loaiphong = '1';
--select maphong from phong where maphong not in (select maphong from chitietdatphong where mapdk in (select mapdk from phieudatphong))
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
    -- Insert danh gia for each phong in the phieu dat phong
    INSERT INTO dbo.DANHGIA (MAPHONG, MAKH, DIEM)
	-- OUTPUT 'New review successfully received.' AS Message
    SELECT CTP.MAPHONG, PD.MAKH, @diem
    FROM dbo.CHITIETDATPHONG CTP
    INNER JOIN dbo.PHIEUDATPHONG PD ON CTP.MAPDK = PD.MAPDK
    WHERE PD.MAPDK = @mapdk;

	SELECT 'New review successfully received.' AS Message
GO

--EXEC USP_ThemDanhGiaChoPhong 'ADC45',  5;

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
	--SELECT * FROM @AvailableRooms;

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
    SELECT TOP (@SoPhong) @MAPDK, AR.MAPHONG, @NOTE
    FROM @AvailableRooms AR
    ORDER BY AR.MAPHONG ASC

    SELECT 'New reservation successfully created.' AS 'Message'
END
GO

--EXEC USP_ThemPhieuDatPhong 'ADC45', 'ABC1234', '2022-05-06', 'NV01', '2022-05-20', '2022-05-22', 2, 1000000.0, '1', 3, 'Ghi chú';

--Thêm khách hàng
DROP PROC IF EXISTS USP_ThemThongTinDoan
GO

CREATE 
PROCEDURE USP_ThemThongTinDoan
	@MaKH varchar(15),
	@TenKH nvarchar(30),
	@CCCD varchar(15),
	@DiaChi nvarchar(50),
	@SDT varchar(15),
	@Fax varchar(20),
	@Email varchar(30),
	@TenDoan nvarchar(30),
	@SoLuong int
AS
BEGIN
	INSERT INTO THONGTINDOAN (MAKH, TENKH, CCCD, DIACHI, SDT, FAX, EMAIL, TENDOAN, SOLUONG)
	OUTPUT 'New customer successfully received.' AS Message
	VALUES (@MaKH, @TenKH, @CCCD, @DiaChi, @SDT, @Fax, @Email, @TenDoan, @SoLuong)
END
GO

--EXEC USP_ThemThongTinDoan 'ABC1234', 'John Doe', '1234567890', '123 Main St', '555-555-1234', NULL, 'john.doe@example.com', 'Test Group', 10;






















