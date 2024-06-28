/**1. Luu y
    ssms -> oracle 
    C# -> microsoft
    CSDL => Database (SQL)
    Database co rat nhieu loai: MySQL , SQL Server, Postgress, H2...
    Hoc o truong J1 - 6: SQL Server 
    Convention trong SQL: theo ran 
    sinh_vien
    Java: 
    int a;
    int A;
    SQL : 
    a 
    A 
    => 1 bien 
    Moi loai ten trong SQL => Khong phan biet hoa thuong 
    Cach comment: 
    comment 1 dong 
    comment khoi lenh 
    /**
        noi dung muon comment
    */
    2. Kieu du lieu trong SQL 
    Giong C:
    so nguyen: int, bigint(tuong ung vs long)
    so thuc: float, decimal(so), money
    chuoi: 
        Viet duoc tieng viet: nvarchar(do dai toi da)
        Khong duoc viet tieng viet: varchar(do dai toi da)
    dung/sai: bool (C) , boolean, bit(chi nhan dc so 0 va so 1)
        0 : false 
        1: true 
    ngay thang: date, datetime, datetime2, timestamp(k co trong sql server)...
    ......(Tu tim hieu them)
    Java -> tao project 
    SQL -> tao database 
    Cu phap:
    1. Tao database
    CREATE DATABASE tendatabase;
    2. Tao bang 
    CREATE TABLE ten bang(
        liet ke cac thuoc tinh cua bang
        ten thuoc tinh kieu du lieu dieu kien neu co,
    )
*/
-- Bai tap
-- Tao CSDL buoi1_sd1805
-- Tao bang sinh vien gom cac thuoc tinh:
-- mssv - varchar(50) - la khoa chinh 
-- ten - nvarchar(100)
-- tuoi - int 
-- dia_chi - nvarchar(100)
-- Them 3 dong du lieu cho doi tuong sinh vien
-- In thong tin cua 3 dong du lieu ra man hinh
-- Chi chay dc lan 1 duy nhat
-- Khi muon chay => Boi den doan muon chay => run 
CREATE DATABASE buoi1_sd1805
-- Co 2 cach de co the su dung duoc 1 database bat ky
-- C1: USE 
-- C2: Chon database tren giao dien 
GO
USE buoi1_sd1805
GO
-- Tao bang : Giong tao doi tuong trong SQL
-- Khoa chinh: Chi duoc xuat hien 1 lan va no la duy nhat cua 1 doi tuong
-- 1 bang co the co rat nhieu thuoc tinh 
-- NHUNG CHI CO 1 KHOA CHINH DUY NHAT 
-- NHUNG 1 KHOA CHINH CO THE CO RAT NHIEU THUOC TINH KHOA CHINH 
-- Tao bang
CREATE TABLE sinh_vien(
    mssv VARCHAR(50) NOT NULL, 
    -- Cai nao la khoa chinh cua bang => Them tu khoa PRIMARY KEY BEN CANH
    ten NVARCHAR(100),
    tuoi INT,
)

ALTER TABLE sinh_vien 
ADD dia_chi NVARCHAR(100)

ALTER TABLE sinh_vien
ADD PRIMARY KEY(mssv)

-- Them du lieu vao bang: INSERT INTO 
INSERT INTO sinh_vien
VALUES('HE130463',N'Nguyễn Thuý Hằng', 10, N'Hà Nội')

INSERT INTO sinh_vien
VALUES('HE130464',N'Nguyễn Thuý gdf', 104, N'Hà g')

INSERT INTO sinh_vien
VALUES
    ('HE130465',N'Nguyễn Thuý gdf', 104, N'Hà g'),
    ('HE130466',N'Nguyễn Thuý gdf', 104, N'Hà g')

INSERT INTO sinh_vien(mssv,tuoi,ten)
VALUES('wf2',1,N'fdf')

-- Hien thi du lieu = > SELECT 
SELECT * FROM sinh_vien

-- CREATE DATABASE test1
-- -- Xoa 
-- -- -- Xoa database : DROP  => Cam dung 
-- DROP DATABASE buoi1_sd1805
--- DELETE 
-- -- -- Chuyen database 
-- -- -- USE ten CSDL
-- USE FINALASS_FPOLYSHOP_FA22_SOF205__SOF2041
-- ALTER : Sua (sua ten CSDl hoac table....)

