CREATE DATABASE Buoi4_P21
-- 1 bảng có n thuộc tinh
-- 1 bảng có 1 KHOÁ CHÍNH  
-- Khoá chinh => Duy nhất trong 1 bảng . 
-- Cac cach de tao khoa chinh:
-- 1. Tu nhap tu ban phim khi them 
-- 2. Khoa chinh tu tang (la so - int/bigint): IDENTITY(1,1) IDENTITY
-- 3. Khoa chinh tu gen (UUID - uniqueidentifier...): DEFAULT NEWID()
-- =>  Moi lan them du lieu => Tao ra 1 doan ma bat ky 
-- UUID phai them cac truong khi insert

-- Tao bang SinhVien gom cac thuoc tinh
-- id - int , ma - varchar(20), ten - nvarchar(50), gioi_tinh - bit 
-- Khoa chinh id - tu tang 
-- Tao bang NhanVien gom cac thuoc tinh
-- id - uniqueidentifier , ma - varchar(20), ten - nvarchar(50), gioi_tinh - bit 
-- Khoa chinh id - tu gen
-- Them vao moi bang 2 ban ghi
CREATE TABLE SinhVien(
    id INT PRIMARY KEY IDENTITY,
    ma VARCHAR(20) ,
    ten NVARCHAR(50),
    gioi_tinh BIT
);
CREATE TABLE NhanVien(
    id UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    ma VARCHAR(20),
    ten NVARCHAR(50),
    gioi_tinh BIT,
    CONSTRAINT id1 PRIMARY KEY(id),
);

INSERT INTO SinhVien 
VALUES
    ('HE130461',N'ABC',1)
INSERT INTO SinhVien (ten)
VALUES
    (N'ABC')

SELECT * FROM SinhVien

INSERT INTO NhanVien(ma,ten,gioi_tinh)
VALUES
    ('H345',N'Thanh',1)
-- BIT: Chi nhan vao 0, 1: 0  - FALSE , 1 - TRUE 
SELECT * FROM NhanVien
-- Điều kiện ràng buộc 
-- 1. Null & Not null 
-- 1 column table co the null/not null 
-- default column : Null 
-- C1: Them truc tiep vao bang 
-- C2: Su dung tu ALTER de chinh sua 
-- 2. UNIQUE : Duy nhat 
-- 3. Default value: la gia tri khoi tao ban dau cua thuoc tinh
ALTER TABLE SinhVien 
ALTER COLUMN ma VARCHAR(20)  NOT NULL
CREATE TABLE SinhVien1(
    id INT PRIMARY KEY IDENTITY,
    ma VARCHAR(20) NOT NULL,
    ten NVARCHAR(50),
    gioi_tinh BIT
);
INSERT INTO SinhVien1 (ten)
VALUES
    (N'ABC')
-- Tao bang SinhVien2 : id - int, ma - varchar(100), sdt - varchar(20), 
-- ten - nvarchar(50), gioi_tinh - bit
-- ID: Khoa chinh tu tang 
-- Ma, SDT: La duy nhat 
-- Ten, Ma: Khong duoc de trong 
-- Them 3 du lieu vao bang SInhVien2
CREATE TABLE SinhVien2(
    id INT PRIMARY KEY IDENTITY,
    ma VARCHAR(100) UNIQUE,
    sdt VARCHAR(20) UNIQUE,
    ten NVARCHAR(50) NOT NULL,
    gioi_tinh BIT
)
INSERT INTO SinhVien2
VALUES ('HT66','4555',N'DRT',0),
('TH77','879',N'TTT',0),
('YU88','666',N'UUU',1)
SELECT * FROM SinhVien2

-- De yeu cau : gia tri khoi tao ban dau cua gioi tinh la 0 
CREATE TABLE SinhVien3(
    id INT PRIMARY KEY IDENTITY,
    ma VARCHAR(100) UNIQUE,
    sdt VARCHAR(20) UNIQUE,
    ten NVARCHAR(50) NOT NULL,
    gioi_tinh BIT DEFAULT 0
)
-- Khong insert gioi tinh
INSERT INTO SinhVien3(ma,sdt,ten)
VALUES('123','1231',N'abcd');
SELECT * FROM SinhVien3



