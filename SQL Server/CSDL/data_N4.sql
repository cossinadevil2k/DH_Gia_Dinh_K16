﻿-- 221402 - N4

use master;
ALTER DATABASE QLNCKH SET OFFLINE WITH ROLLBACK IMMEDIATE;
ALTER DATABASE QLNCKH SET ONLINE;

DROP DATABASE QLNCKH;


CREATE DATABASE QLNCKH;
GO
use QLNCKH;
GO

-- Create table
CREATE TABLE GIAOVIEN (
	MA VARCHAR(8) NOT NULL,
	HO NVARCHAR(32) DEFAULT NULL,
	TENLOT NVARCHAR(32) DEFAULT NULL,
	TEN NVARCHAR(32) NOT NULL,
	PHAI NVARCHAR(3) NOT NULL CHECK (PHAI IN (N'NAM', N'NỮ')),
	NGSINH DATETIME DEFAULT NULL,
	LUONG INT NOT NULL DEFAULT 0,
	BO_MON VARCHAR(8),
	KHOA VARCHAR(8),
	PHU_CAP FLOAT NOT NULL DEFAULT 0.0,
	PRIMARY KEY (MA),
	CHECK(LUONG >= 0),
	CHECK(PHU_CAP >= 0.0)
);

CREATE TABLE PHONG (
	MA VARCHAR(8) NOT NULL,
	TEN NVARCHAR(64) DEFAULT NULL,
	PRIMARY KEY (MA)
);

CREATE TABLE KHOA (
	MA VARCHAR(8) NOT NULL,
	TEN NVARCHAR(255) NOT NULL,
	NAM_THANH_LAP INT NOT NULL,
	PHONG_LAM_VIEC VARCHAR(8),
	SO_DIEN_THOAI NVARCHAR(16),
	TRUONG_KHOA VARCHAR(8),
	NGAY_NHAN_CHUC DATETIME,
	PRIMARY KEY (MA),
	FOREIGN KEY (TRUONG_KHOA) REFERENCES GIAOVIEN (MA),
	FOREIGN KEY (PHONG_LAM_VIEC) REFERENCES PHONG (MA)
);

CREATE TABLE BO_MON (
	MA VARCHAR(8) NOT NULL,
	TEN NVARCHAR(255) NOT NULL,
	PHONG VARCHAR(8) NOT NULL,
	SO_DIEN_THOAI NVARCHAR(16),
	MA_KHOA VARCHAR(8) NOT NULL,
	TRUONG_BO_MON VARCHAR(8),
	NGAY_NHAN_CHUC DATETIME,
	PRIMARY KEY (MA),
	FOREIGN KEY (TRUONG_BO_MON) REFERENCES GIAOVIEN (MA),
	FOREIGN KEY (MA_KHOA) REFERENCES KHOA (MA),
);

CREATE TABLE SDT (
	MAGV VARCHAR(8) NOT NULL,
	SO_DIEN_THOAI NVARCHAR(32) NOT NULL,
	PRIMARY KEY (SO_DIEN_THOAI),
	FOREIGN KEY (MAGV) REFERENCES GIAOVIEN (MA)
);

CREATE TABLE DIA_CHI (
	MAGV VARCHAR(8) NOT NULL UNIQUE,
	SONHA NVARCHAR(255) DEFAULT NULL,
	DUONG NVARCHAR(255) DEFAULT NULL,
	QUAN NVARCHAR(255) DEFAULT NULL,
	THANHPHO NVARCHAR(255) DEFAULT NULL,
	FOREIGN KEY (MAGV) REFERENCES GIAOVIEN (MA)
);

CREATE TABLE CHU_DE (
	MA VARCHAR(8) NOT NULL,
	TEN NVARCHAR(255) NOT NULL,
	PRIMARY KEY (MA)
);

CREATE TABLE DE_TAI (
	STT INT NOT NULL IDENTITY(1,1) UNIQUE,
	MA VARCHAR(8) NOT NULL,
	TEN NVARCHAR(255) NOT NULL,
	CAP_QUAN_LY VARCHAR(8),
	KINH_PHI INT NOT NULL,
	NGAY_BAT_DAU DATETIME,
	NGAY_KET_THUC DATETIME,
	CHU_DE VARCHAR(8),
	LA_CAPTRUONG BIT NOT NULL DEFAULT 0,
	PRIMARY KEY (MA),
	FOREIGN KEY (CAP_QUAN_LY) REFERENCES GIAOVIEN (MA),
	FOREIGN KEY (CHU_DE) REFERENCES CHU_DE (MA),
	CHECK (NGAY_BAT_DAU <= NGAY_KET_THUC)
);

CREATE TABLE NGUOI_THAN (
	STT INT NOT NULL IDENTITY(1,1) UNIQUE, 
	HO NVARCHAR(32) DEFAULT NULL,
	TENLOT NVARCHAR(32) DEFAULT NULL,
	TEN NVARCHAR(32) NOT NULL,
	PHAI NVARCHAR(3) NOT NULL CHECK (PHAI IN (N'NAM', N'NỮ')),
	NGSINH DATETIME DEFAULT NULL,
	MAGV VARCHAR(8) NOT NULL,
	FOREIGN KEY (MAGV) REFERENCES GIAOVIEN (MA)
);

CREATE TABLE CONG_VIEC (
	STT_CONGVIEC INT NOT NULL,
	MA VARCHAR(8) NOT NULL,
	TEN NVARCHAR(255) NOT NULL,
	NGAY_BAT_DAU DATETIME DEFAULT NULL,
	NGAY_KET_THUC DATETIME DEFAULT NULL,
	PRIMARY KEY (STT_CONGVIEC),
	FOREIGN KEY (MA) REFERENCES DE_TAI (MA),
	CHECK (NGAY_BAT_DAU <= NGAY_KET_THUC)
);

CREATE TABLE THAMGIADT (
	STT INT NOT NULL IDENTITY(1,1) UNIQUE,
	MA VARCHAR(8) NOT NULL,
	MAGV VARCHAR(8) NOT NULL,
	STT_CONGVIEC INT NOT NULL,
	KETQUA INT NOT NULL DEFAULT 0,
	FOREIGN KEY (MA) REFERENCES DE_TAI (MA),
	FOREIGN KEY (MAGV) REFERENCES GIAOVIEN (MA),
	FOREIGN KEY (STT_CONGVIEC) REFERENCES CONG_VIEC (STT_CONGVIEC)
);

-- CONSTRAINT

ALTER TABLE GIAOVIEN ADD FOREIGN KEY (KHOA) REFERENCES KHOA (MA);
ALTER TABLE GIAOVIEN ADD FOREIGN KEY (BO_MON) REFERENCES BO_MON (MA);

-- FUNCTION
GO
CREATE FUNCTION dbo.CHECK_KHOA_NAM_THANH_LAP (@MA_KHOA VARCHAR(8))
RETURNS VARCHAR(8)
AS
BEGIN
    RETURN (
		SELECT DISTINCT
			KHOA.NAM_THANH_LAP
		FROM 
			KHOA
		WHERE (
			KHOA.MA = @MA_KHOA
		)
	);
END;
GO

GO
CREATE FUNCTION dbo.CHECK_DE_TAI_NGAY_BAT_DAU (@MA_DE_TAI VARCHAR(8))
RETURNS VARCHAR(8)
AS
BEGIN
    RETURN (
		SELECT DISTINCT
			NGAY_BAT_DAU
		FROM 
			DE_TAI
		WHERE (
			DE_TAI.MA = @MA_DE_TAI
		)
	);
END;
GO

GO
CREATE FUNCTION dbo.CHECK_DE_TAI_NGAY_KET_THUC (@MA_DE_TAI VARCHAR(8))
RETURNS VARCHAR(8)
AS
BEGIN
    RETURN (
		SELECT DISTINCT
			NGAY_KET_THUC
		FROM 
			DE_TAI
		WHERE (
			DE_TAI.MA = @MA_DE_TAI
		)
	);
END;
GO

GO
CREATE FUNCTION dbo.CHECK_THAMGIADT_MADT (@STT_CONGVIEC VARCHAR(8))
RETURNS VARCHAR(8)
AS
BEGIN
    RETURN (
		SELECT DISTINCT
			MA
		FROM 
			CONG_VIEC
		WHERE (
			CONG_VIEC.STT_CONGVIEC = @STT_CONGVIEC
		)
	);
END;
GO
-- 

ALTER TABLE 
	BO_MON 
ADD CHECK (
	YEAR(dbo.CHECK_KHOA_NAM_THANH_LAP(MA_KHOA)) <= YEAR(NGAY_NHAN_CHUC)
);

ALTER TABLE 
	CONG_VIEC 
ADD CHECK (
	dbo.CHECK_DE_TAI_NGAY_BAT_DAU(MA) <= NGAY_BAT_DAU
);

ALTER TABLE 
	CONG_VIEC 
ADD CHECK (
	dbo.CHECK_DE_TAI_NGAY_KET_THUC(MA) >= NGAY_KET_THUC
);

ALTER TABLE 
	THAMGIADT 
ADD CHECK (
	dbo.CHECK_THAMGIADT_MADT(STT_CONGVIEC) = MA
);

-- DATA

BEGIN
	ALTER TABLE GIAOVIEN
	NOCHECK CONSTRAINT ALL
	INSERT INTO GIAOVIEN 
		(MA, HO, TENLOT, TEN, PHAI, NGSINH, BO_MON, KHOA, LUONG, PHU_CAP)
	VALUES 
		('GV001', N'Nguyễn', N'Văn', N'Khánh', N'NAM', '02/07/2004', 'HTTT', 'CNTT', 3000, 1.5),
		('GV002', N'Lê', N'Lâm Chiến', N'Thắng', N'NAM', '01/01/2004', 'MMT', 'MKT', 2500, 2.5),
		('GV003', N'Nguyễn', N'Văn', N'Sang', N'NAM', '02/01/2004', 'KTPM', 'NN', 2000, 0.5),
		('GV004', N'Nguyễn', N'Trần Hoàng', N'Thịnh', N'NAM', '03/01/2004', 'HTTT', 'TT', 1500, 3),
		('GV005', N'Nguyễn', N'Văn', N'A', N'NAM', '01/02/2000', 'KTPM', 'TT', 1000, 0),
		('GV006', N'Nguyễn', N'Thị', N'B', N'NỮ', '02/02/2000', 'MMT', 'NN', 1600, 1),
		('GV007', N'Nguyễn', NULL, N'Cường', N'NAM', '03/02/2000', 'NNA', 'MKT', 1700, 0),
		('GV008', N'Nguyễn', N'Tiến', N'D', N'NAM', '04/02/2000', 'NNT', 'CNTT', 1100, 1),
		('GV009', N'Trần', N'Thị', N'E', N'NỮ', '05/02/2000', 'HTTT', 'TT', 1150, 0.5),
		('GV010', N'Trần', N'Văn', N'F', N'NAM', '06/02/2000', 'TKDH', 'MKT', 1200, 0),
		('GV011', N'Trần', N'Văn', N'Khánh', N'NAM', '07/02/2000', 'MMT', 'CNTT', 1250, 0),
		('GV012', N'Lê', N'Hồng', N'Phong', N'NAM', '01/01/1998', 'TKDH', 'TT', 1275, 0),
		('GV013', N'Nguyễn', N'Thị', N'Kiều', N'NỮ', '01/01/1988', 'KTPM', 'MKT', 1300, 0),
		('GV014', N'Nguyễn', N'Anh', N'Quốc', N'NAM', '01/01/1985', 'KTPM', 'CNTT', 1325, 0),
		('GV015', N'Nguyễn', N'Quốc', N'Anh', N'NAM', '01/01/1986', 'MMT', 'NN', 1400, 0),
		('GV016', N'Nguyễn', N'Thị', N'Chi', N'Nữ', '01/01/1995', 'NNT', 'KT', 1550, 0),
		('GV017', N'Nguyễn', N'Thanh', N'Quốc', N'NAM', '01/01/1999', 'TKDH', 'KHCT', 1575, 0),
		('GV018', N'Nguyễn', N'Văn', N'Chánh', N'NAM', '01/06/1997', 'MMT', 'CNTT', 1625, 1),
		('GV019', N'Nguyễn', N'Hành', N'Chánh', N'NAM', '01/06/1994', NULL, 'MKT', 1625, 0)
	ALTER TABLE GIAOVIEN
	CHECK CONSTRAINT ALL
END

BEGIN
	INSERT INTO SDT 
		(MAGV, SO_DIEN_THOAI)
	VALUES 
		('GV001', '0987456231'),
		('GV001', '0321987456'),
		('GV001', '0950321698'),
		('GV001', '0376543210'),
		('GV002', '0912345678'),
		('GV002', '0398765432'),
		('GV003', '0945678901'),
		('GV004', '0389012345'),
		('GV004', '0956789012'),
		('GV005', '0323456789'),
		('GV006', '0932109876'),
		('GV007', '0365432109'),
		('GV008', '0978901234'),
		('GV009', '0343210987'),
		('GV010', '0921098765'),
		('GV011', '0387654321'),
		('GV012', '0963524178'),
		('GV013', '0311223344'),
		('GV014', '0955443322'),
		('GV015', '0387659876'),
		('GV016', '0998765432'),
		('GV017', '0334567890'),
		('GV018', '0987654321'),
		('GV019', '0365432101')
END

BEGIN
	INSERT INTO DIA_CHI 
		(MAGV, SONHA, DUONG, QUAN, THANHPHO)
	VALUES
		('GV001', N'371', N'Nguyễn Kiệm', N'Gò Vấp', N'TP.HCM'),
		('GV002', N'162T', N'Trường Chinh', N'Tân Bình', N'TP.HCM'),
		('GV003', N'8 Đ', N'Song Hành', N'Quận 12', N'Bà Rịa Vũng Tàu'),
		('GV004', N'10', N'3', N'Nà Cạn', N'Cao Bằng'),
		('GV005', N'195', N'Yên Ninh', N'Phan Rang-Tháp Chàm', N'Ninh Thuận'),
		('GV006', N'8', N'Số 5', N'Hàm Tân', N'Bình Thuận'),
		('GV007', N'1', N'Tràng Tiền', N'Hoàn Kiếm', N'Hà Nội'),
		('GV008', N'50 Đ', N'Thành Thái', N'Quận 10', N'TP.HCM'),
		('GV009', N'4', N'Số 9', N'Hàm Tân', N'Bình Thuận'),
		('GV010', N'17', N'Nguyễn Văn Lạc', N'Bình Thạnh', N'TP.HCM'),
		('GV011', N'024', N'tổ 23 cũ', N'Nà Cạn', N'Cao Bằng'),
		('GV012', N'265/2', N'Trần Hưng Đạo', N'Khóm 8', N'Sóc Trăng'),
		('GV013', N'8', N'Tân Sơn 2', N'Phan Rang-Tháp Chàm', N'Ninh Thuận'),
		('GV014', N'12', N'An Bình', N'Trảng Bàng', N'Tây Ninh'),
		('GV015', N'48B', N'Hoàng Hoa Thám', N'Tổ 1', N'Hà Giang'),
		('GV016', N'81', N'Phan Ngọc Hiển', N'Phường 4', N'Cà Mau'),
		('GV017', N'18', N'Hồng Việt', N'Hợp giang', N'Cao Bằng')
END

BEGIN
	INSERT INTO PHONG 
		(MA, TEN)
	VALUES 
		('01', N'E001'),
		('02', N'B002'),
		('03', N'A003'),
		('04', N'E004'),
		('05', N'A005'),
		('06', N'A006'),
		('07', N'C007'),
		('08', N'E008'),
		('09', N'D009'),
		('10', N'B010'),
		('11', N'E011'),
		('12', N'E012'),
		('13', N'C013'),
		('14', N'E014'),
		('15', N'D015'),
		('16', N'E016'),
		('17', N'F017'),
		('18', N'C018'),
		('19', N'A019'),
		('20', N'E020')
END

BEGIN
	ALTER TABLE KHOA
	NOCHECK CONSTRAINT ALL
	INSERT INTO KHOA 
		(MA, TEN, NAM_THANH_LAP, PHONG_LAM_VIEC, SO_DIEN_THOAI, TRUONG_KHOA, NGAY_NHAN_CHUC)
	VALUES 
		('CNTT', N'Công nghệ thông tin', '1980', '01', NULL, 'GV001', '02/02/2020'),
		('MKT', N'Marketing', '2020', '02', NULL, 'GV002', '02/02/2022'),
		('NN', N'Ngôn ngữ', '1990', '03', NULL, 'GV003', '02/02/2021'),
		('TT', N'Truyền thông', '2020', '04', NULL, 'GV006', '02/02/2022'),
		('KHCT', N'Khoa học chính trị', '1985', '05', NULL, 'GV001', '01/04/2005'),
		('TLH', N'Tâm lý học', '1991', '06', NULL, NULL, NULL),
		('KT', N'Kế toán', '2000', '07', NULL, 'GV004', '09/08/2001')
	ALTER TABLE KHOA
	CHECK CONSTRAINT ALL
END

BEGIN
	ALTER TABLE BO_MON
	NOCHECK CONSTRAINT ALL
	INSERT INTO BO_MON 
		(MA, TEN, PHONG, SO_DIEN_THOAI, MA_KHOA, TRUONG_BO_MON, NGAY_NHAN_CHUC)
	VALUES 
		('HTTT', N'Hệ thống thông tin', 'B000', NULL, 'CNTT', 'GV001', '02/02/2015'),
		('MMT', N'Mạng máy tính', 'B001', NULL, 'CNTT', 'GV002', '02/03/2014'),
		('KTPM', N'Kỹ thuật phần mềm', 'B002', NULL, 'CNTT', 'GV003', '02/04/2016'),
		('TKDH', N'Thiết kế đồ họa', 'B003', NULL, 'CNTT', 'GV008', '02/05/2017'),
		('NNA', N'Ngôn ngữ Anh', 'B004', NULL, 'NN', 'GV007', '02/06/2022'),
		('NNT', N'Ngôn ngữ Trung', 'B005', NULL, 'NN', 'GV006', '02/07/2022'),
		('CCH', N'Chính trị học', 'B006', NULL, 'KHCT', NULL, NULL),
		('KT', N'Kiến trúc', 'B007', NULL, 'KT', NULL, NULL)
	ALTER TABLE BO_MON
	CHECK CONSTRAINT ALL
END

BEGIN
	INSERT INTO NGUOI_THAN 
		(HO, TENLOT, TEN, PHAI, NGSINH, MAGV)
	VALUES
		(N'Nguyễn', N'Văn', N'Q', N'NAM', '12/31/1980', 'GV001'),
		(N'Ngô', N'Thị', N'H', N'NỮ', '12/31/1981', 'GV001'),
		(N'Nguyễn', N'Chính', N'N', N'NAM', '12/31/1982', 'GV002'),
		(N'Ngô', N'Thị Minh', N'H', N'NỮ', '12/31/1976', 'GV003'),
		(N'Bùi', N'', N'Tiến', N'NAM', '12/31/1984', 'GV004')
END

BEGIN
	INSERT INTO CHU_DE 
		(MA, TEN)
	VALUES
		('CD400', N'Trí tuệ nhân tạo (AI) và Máy học'),
		('CD401', N'An toàn thông tin và Bảo mật mạng'),
		('CD402', N'Phát triển Phần mềm và Lập trình'),
		('CD403', N'Nội dung Tiếp thị'),
		('CD404', N'Marketing số'),
		('CD405', N'Chính trị Xã hội và Đa dạng'),
		('CD406', N'Y tế cộng đồng')
END

BEGIN
	INSERT INTO DE_TAI 
		(MA, TEN, CAP_QUAN_LY, KINH_PHI, NGAY_BAT_DAU, NGAY_KET_THUC, CHU_DE, LA_CAPTRUONG)
	VALUES
		('001', N'HTTT quản lý các trường ĐH', 'GV001', 150000, '01/01/2023', '01/01/2025', 'CD400', 1),
		('002', N'HTTT quản lý giáo vụ cho một Khoa', 'GV002', 150000, '02/01/2023', '01/01/2026', 'CD401', 1),
		('003', N'Ứng dụng hóa học xanh', 'GV003', 120000, '03/01/2023', '01/01/2027', 'CD402', 1),
		('004', N'HTTT quản lý các trường TH', 'GV004', 125000, '04/01/2023', '01/01/2028', 'CD403', 1),
		('005', N'Ứng dụng Di động React Native', 'GV005', 115000, '05/01/2023', '01/01/2029', 'CD402', 1),
		('006', N'Nhận dạng Hình ảnh sử dụng Máy học', 'GV006', 117500, '06/01/2023', '01/01/2030', 'CD400', 0),
		('007', N'Ảnh hưởng của Thói quen Ăn đối với Tim mạch', 'GV007', 107000, '07/01/2023', '01/01/2031', 'CD406', 0),
		('008', N'Dự đoán Ung thư qua Genomic', 'GV008', 90000, '07/01/2023', '01/01/2031', 'CD406', 0),
		('009', N'Yếu tố ảnh hưởng đến Hạnh phúc', 'GV009', 80000, '07/01/2023', '01/01/2031', 'CD406', 0),
		('010', N'Biến đổi Khí hậu và Rừng Amazon', 'GV010', 100000, '07/01/2023', '01/01/2031', 'CD400', 0),
		('011', N'Sáng tạo trong Quảng cáo: Màu sắc và Hình ảnh', 'GV011', 110000, '07/01/2023', '01/01/2031', 'CD403', 0),
		('012', N'Cơ chế Enzyme trong Tiêu hóa thức ăn', 'GV012', 140000, '07/01/2023', '01/01/2031', 'CD406', 0),
		('013', N'Ứng dụng VR cho Trải nghiệm Nghệ thuật tương tác', 'GV013', 130000, '07/01/2023', '01/01/2031', 'CD402', 0),
		('014', N'Văn hóa và Quyết định Kinh tế cá nhân', 'GV014', 115000, '07/01/2023', '01/01/2031', 'CD405', 0),
		('015', N'Nghiên cứu Vắc xin mới chống Vi khuẩn Kháng thuốc', 'GV015', 117000, '07/01/2023', '01/01/2031', 'CD406', 0)
END

BEGIN
	ALTER TABLE CONG_VIEC
	NOCHECK CONSTRAINT ALL
	INSERT INTO CONG_VIEC 
		(STT_CONGVIEC, MA, TEN, NGAY_BAT_DAU, NGAY_KET_THUC)
	VALUES 
		(0, '001', N'Thu thập yêu cầu', '01/01/2023', '01/01/2024'),
		(1, '002', N'Triển khai và hổ trợ', '02/01/2023', '01/01/2025'),
		(2, '003', N'Sắp xếp tài liệu', '03/01/2023', '01/01/2026'),
		(3, '001', N'Thiết kế hệ thống', '04/01/2023', '01/01/2027'),
		(4, '004', N'Thu thập yêu cầu', '05/01/2023', '01/01/2028'),
		(5, '003', N'Tính toán tài liệu', '06/01/2023', '01/01/2029'),
		(6, '001', N'Thống kê và báo cáo', '04/01/2023', '01/01/2027'),
		(7, '005', N'Thiết kế phần mềm', '05/12/2023', '01/04/2024'),
		(8, '002', N'Quản lý hoạt động', '02/01/2023', '01/01/2025'),
		(9, '005', N'Kiểm thử phần mềm', '05/12/2023', '01/04/2025')
	ALTER TABLE CONG_VIEC
	CHECK CONSTRAINT ALL
END

BEGIN
	INSERT INTO THAMGIADT 
		(MA, MAGV, STT_CONGVIEC)
	VALUES 
		('001', 'GV001', 0),
		('001', 'GV001', 3),
		('001', 'GV001', 6),
		('001', 'GV006', 0),
		('001', 'GV006', 3),
		('001', 'GV009', 0),
		('001', 'GV008', 3),
		('002', 'GV008', 1),
		('003', 'GV002', 2),
		('004', 'GV003', 4),
		('005', 'GV004', 7),
		('003', 'GV002', 5),
		('001', 'GV018', 3),
		('001', 'GV018', 0),
		('001', 'GV002', 0),
		('001', 'GV002', 3),
		('001', 'GV002', 6),
		('001', 'GV004', 0),
		('002', 'GV004', 1),
		('003', 'GV004', 2),
		('004', 'GV004', 4),
		('005', 'GV004', 7)
END


-- TRIGGER AFTER INSERT

GO
CREATE TRIGGER AUTO_PHUCAPGV
ON THAMGIADT
AFTER INSERT
AS
BEGIN
    UPDATE GIAOVIEN
    SET PHU_CAP = PHU_CAP + 0.5
    WHERE MA IN (
		SELECT MAGV FROM Inserted
	);
END;

-- TRIGGER UPDATE

GO
CREATE TRIGGER bo_mon_TRUONG_BO_MON
ON BO_MON
AFTER UPDATE
AS 
BEGIN
	IF UPDATE(TRUONG_BO_MON)
	BEGIN
		UPDATE BO_MON
		SET NGAY_NHAN_CHUC = CURRENT_TIMESTAMP
		FROM BO_MON
		INNER JOIN inserted ON BO_MON.MA = inserted.MA
		WHERE (
			inserted.TRUONG_BO_MON IS NOT NULL
		);

		UPDATE BO_MON
		SET NGAY_NHAN_CHUC = NULL
		FROM BO_MON
		INNER JOIN inserted ON BO_MON.MA = inserted.MA
		WHERE (
			inserted.TRUONG_BO_MON IS NULL
		);
	END
END;

GO
CREATE TRIGGER khoa_TRUONG_KHOA
ON KHOA	
AFTER UPDATE
AS 
BEGIN
	IF UPDATE(TRUONG_KHOA)
	BEGIN
		UPDATE KHOA
		SET NGAY_NHAN_CHUC = CURRENT_TIMESTAMP
		FROM KHOA
		INNER JOIN inserted ON KHOA.MA = inserted.MA
		WHERE (
			inserted.TRUONG_KHOA IS NOT NULL
		);

		UPDATE KHOA
		SET NGAY_NHAN_CHUC = NULL
		FROM KHOA
		INNER JOIN inserted ON KHOA.MA = inserted.MA
		WHERE (
			inserted.TRUONG_KHOA IS NULL
		);
	END
END;


-- TRIGGER DELETE

GO
CREATE TRIGGER DELETE_GIAOVIEN
ON GIAOVIEN
INSTEAD OF DELETE
AS
BEGIN
	DELETE FROM DIA_CHI
	WHERE MAGV IN (
		SELECT MA FROM deleted
	);
	DELETE FROM SDT
	WHERE MAGV IN (
		SELECT MA FROM deleted
	);
	DELETE FROM NGUOI_THAN 
	WHERE MAGV IN (
		SELECT MA FROM deleted
	);
	DELETE FROM THAMGIADT
	WHERE MAGV IN (
		SELECT MA FROM deleted
	);
	UPDATE KHOA
	SET TRUONG_KHOA = NULL
	WHERE TRUONG_KHOA IN (
		SELECT MA FROM deleted
	);
	UPDATE BO_MON
	SET TRUONG_BO_MON = NULL
	WHERE TRUONG_BO_MON IN (
		SELECT MA FROM deleted
	);
	UPDATE DE_TAI
	SET CAP_QUAN_LY = NULL
	WHERE CAP_QUAN_LY IN (
		SELECT MA FROM deleted
	);
	DELETE FROM GIAOVIEN
	WHERE MA IN (
		SELECT MA FROM deleted
	);
END;

GO

CREATE TRIGGER DELETE_CONG_VIEC
ON CONG_VIEC
INSTEAD OF DELETE
AS
BEGIN
	DELETE FROM THAMGIADT
	WHERE STT_CONGVIEC IN (
		SELECT 
			STT_CONGVIEC 
		FROM 
			THAMGIADT
		WHERE MA IN (
			SELECT MA FROM deleted
		)
	);
	DELETE FROM THAMGIADT
	WHERE MA IN (
		SELECT MA FROM deleted
	);
	DELETE FROM CONG_VIEC
	WHERE STT_CONGVIEC IN (
		SELECT STT_CONGVIEC FROM deleted
	);
END;

GO
CREATE TRIGGER DELETE_DE_TAI
ON DE_TAI
INSTEAD OF DELETE
AS
BEGIN
	DELETE FROM CONG_VIEC
	WHERE MA IN (
		SELECT MA FROM deleted
	);
	DELETE FROM DE_TAI
	WHERE MA IN (
		SELECT MA FROM deleted
	);
END;

GO
CREATE TRIGGER DELETE_CHU_DE
ON CHU_DE
INSTEAD OF DELETE
AS
BEGIN
	DELETE FROM DE_TAI
	WHERE CHU_DE IN (
		SELECT MA FROM deleted
	)
	DELETE FROM CHU_DE
	WHERE MA IN (
		SELECT MA FROM deleted
	);
END;

GO
CREATE TRIGGER DELETE_BO_MON
ON BO_MON
INSTEAD OF DELETE
AS
BEGIN
	UPDATE GIAOVIEN
	SET BO_MON = NULL
	WHERE BO_MON IN (
		SELECT MA FROM deleted
	);
	DELETE FROM BO_MON
	WHERE MA IN (
		SELECT MA FROM deleted
	);
END;

GO
CREATE TRIGGER DELETE_KHOA
ON KHOA
INSTEAD OF DELETE
AS
BEGIN
	UPDATE GIAOVIEN
	SET KHOA = NULL
	WHERE KHOA IN (
		SELECT MA FROM deleted
	);
	DELETE FROM BO_MON 
	WHERE MA_KHOA IN (
		SELECT MA FROM deleted
	);
	DELETE FROM KHOA
	WHERE MA IN (
		SELECT MA FROM deleted
	);
END;