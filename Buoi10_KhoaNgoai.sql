-- 1. Khai niem ve thuc the 
-- Database : Noi luu tru du lieu 
-- Table (Bang): thuoc tinh 
-- => Cac thưc thể (entity) Objec(Object): N/ cum N 
-- VD về thực thể: Nhân viên, Sinh vien, Giang vien, Lop Hoc....
-- Nhung cai xoay quay cuoc song. Phai co that (ton tai trong the gioi thuc)
-- 2. Chuan hoa quan he 
-- Tao DB: Buoi10
-- Tao bang: Sinh vien gom cac thuoc tinh:
-- Ma - varchar(20): khoa chinh 
-- Ten - nvarchar(50)
-- tuoi - int 
-- mon_hoc - nvarchar(100)
-- insert 5 ban ghi 

CREATE DATABASE Buoi10
GO
USE Buoi10
GO

CREATE TABLE SinhVien(
    Ma VARCHAR(20) PRIMARY KEY,
    Ten NVARCHAR(50),
    tuoi INT,
    mon_hoc NVARCHAR(100)
)

INSERT INTO SinhVien
VALUES
    ('SV01', N'Sinh vien A', 18, N'Toan'),
    ('SV02', N'Sinh vien A', 11, N'toan'),
    ('SV03', N'Sinh vien A', 18, N'    toan');

SELECT * FROM SinhVien where mon_hoc ='Toan'
-- Tach bang => Mon hoc (ID, Ma, Ten mon)
-- Chuan hoa du lieu 
-- Muc tieu: Loai bo cac du lieu bi thua 
-- Co 4 loai chuan hoa co ban:
-- 1NF 
-- 2NF 
-- 3NF 
-- BCNF 
-- (khoang 2 -> 3)
-- https://viblo.asia/p/tong-hop-ve-chuan-hoa-co-so-du-lieu-ORNZqP33K0n 

-- Khi co nhieu bang => Xac dinh moi quan he giua cac bang 
-- 1 - 1 
-- 1 - N 
-- N - N 
-- Chu y : Khi doc MQH => Phai doc 2 chieu 
-- Quan he 1 - 1:
    -- 1 co dau -> co 1 chu re 
    -- 1 chu re -> 1 co dau 
    -- MQH : CD <-> CR ( 1 - 1 )
    -- Khoa ngoai de o bang nao cung duoc

-- Quan he 1 - N:
    -- 1 nguoi me -> N nguoi con 
    -- 1 nguoi con  -> 1 me 
    -- MQH : 1 me -> N nguoi con 
    -- Khoa ngoai de o bang nhieu 

-- Quan he N - N:
    -- 1 bac si -> N benh nhan
    -- 1 benh nhan -> N bac si  
    -- MQH : N bac si -> N benh nhan
    -- TACH BANG RIENG O GIUA: DAT KHOA NGOAI CUA 2 BANG 

-- VD:
-- SP, HD, HDCT 

CREATE TABLE SanPham(
    ma_san_pham VARCHAR(50) PRIMARY KEY NOT NULL,
    ten_san_pham NVARCHAR(100) NOT NULL,
    gia FLOAT NOT NULL,
    so_luong_ton INT NOT NULL
);
CREATE TABLE HoaDon(
    ma_hoa_don VARCHAR(50) PRIMARY KEY NOT NULL,
    ngay_lap DATE NOT NULL,
    so_dien_thoai VARCHAR(15)
)
CREATE TABLE HoaDonChiTiet(
    -- C1: FOREIGN KEY REFERENCES o ngay sau thuoc tinh
    MaSanPham VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES SanPham(ma_san_pham),
    MaHoaDon VARCHAR(50) NOT NULL ,
    SoluongMua INT,
    Gia FLOAT,
    PRIMARY KEY(MaSanPham,MaHoaDon),
    -- C2: Them thong qua rang buoc CONSTRAINT
    -- Cu phap:
    -- CONSTRAINT ten dat cho khoa ngoai FOREIGN KEY (thuoc tinh) REFERENCES bang(thuoc tinh)
    -- thuoc tinh: FOREIGN key (thuoc tinh cua bang HDCT)
    -- HOA DON(TEN TRONG BANG FOREIGN)
    CONSTRAINT FK_HoaDon  FOREIGN KEY (MaHoaDon) REFERENCES HoaDon(ma_hoa_don)
) 

-- INSERT San Pham, Hoa Don 
INSERT INTO SanPham
VALUES
    ('SP1', N'Dien thoai',3, 2),
    ('SP2',N'Quat',1,4),
    ('SP3',N'May anh',5,2)
INSERT INTO HoaDon
VALUES 
    ('HD1','2024/7/22','0987234761'),
    ('HD2','2024/7/22','0987231241'),
    ('HD3','2024/7/22','0987234521')

INSERT INTO HoaDonChiTiet
VALUES 
    ('SP1','HD1',10,10),
    ('SP2','HD1',21,14)
SELECT * FROM SanPham 
SELECT * FROM HoaDon 
SELECT * FROM HoaDonChiTiet 