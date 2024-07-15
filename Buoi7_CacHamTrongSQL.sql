CREATE DATABASE LuyenTap_Buoi7
GO
USE LuyenTap_Buoi7
GO

CREATE TABLE Khoa(
    id INT PRIMARY KEY IDENTITY,
    maKhoa VARCHAR(10) UNIQUE NOT NULL,
    tenKhoa NVARCHAR(50)
)

CREATE TABLE SINHVIEN(
    id INT PRIMARY KEY IDENTITY,
    maSinhVien VARCHAR(10),
    tenSV NVARCHAR(100),
    NgaySinh DATE,
    DiaChi NVARCHAR(100),
    KhoaID INT
)

INSERT INTO Khoa
VALUES
    ('Th123','CNTT'),
    ('Th122','Marketing'),
    ('Th124','CNTT'),
    ('Th125','IT'),
    ('Th126','CNTT'),
    ('Th127','CNTT'),
    ('Th128','Marketing'),
    ('Th129','IT'),
    ('Th130','Marketing'),
    ('Th131','IT')
SELECT * FROM Khoa

INSERT INTO SINHVIEN
VALUES
('fd','anguyen fdas duc','1990-10-12','fdshn',0),
('fdfdgs','anguyen dsaf dh','2006-10-11','dsf',21),
('gdf','anguyen adsf duc','2004-10-13','fads',2),
('fdsa','nguyen anh huy','2003-1-12','hn',3),
('th23422gfs','nguyen d a','2007-10-12','hn',2),
('th23423','nguyen a b','2007-10-1','hn',1),
('th23424','nguyen anh duc','2007-10-12','hn',1),
('th23425','nguyen anh duc','2007-9-12','hn',1),
('th23426','nguyen anh dung','2007-10-12','hn',1),
('th23427','nguyen anh e','2007-4-12','hn',1)

SELECT * FROM SINHVIEN
-- Liệt kê tất cả sinh viên có tuổi từ 20 đến 25 và sắp xếp theo ngày sinh từ mới đến cũ. 
-- Year/MONTH => YEAR(thuoc tinh)...
-- GETDATE() => Lay ra ngay gio hien tai
-- C1: 2024 - nam sinh 
-- C2: DATEDIFF - Su chenh lech giua cac ngay 
-- SELECT maSinhVien, tenSV, YEAR(GETDATE()) - YEAR(NgaySinh)
-- FROM SINHVIEN
-- DATEDIFF(ths1,ths2,ths3)
-- ths1: Loai muon lay (Ngay/Thang/Nam/Gio)
-- ths 2: ngay muon tru di 
-- ths 3: ngay duoc tru di
-- ngay sinh tu moi -> cu : giam dan 
-- Sap xep : TRONG CAU TRUY VAN SQL => ORDER BY LUON LUON O VI TRI CUOI CUNG
    -- ORDER By liet ke cac truong ASC : sap xep tang dan (Co the k can viet ASC)
    -- ORDER By liet ke cac truong DESC : sap xep giam dan (Bat buoc phai viet DESC)

SELECT maSinhVien, tenSV, DATEDIFF(YEAR,NgaySinh,GETDATE()) as tuoi, NgaySinh
FROM SINHVIEN 
WHERE DATEDIFF(YEAR,NgaySinh,GETDATE()) BETWEEN 20 AND 25
ORDER BY NgaySinh DESC 

-- Liệt kê mã sinh viên, tên sinh viên của tất cả sinh viên có khoa_id = 1. 
SELECT maSinhVien, tenSV, KhoaID  
FROM SINHVIEN
WHERE KhoaID = 1
-- Liệt kê tên sv và số lượng sinh viên có tuổi >18, 
-- sắp xếp theo số lượng sinh viên có tuổi > 18 giảm dần.
-- COUNT 
-- SUM 
-- AVG
-- ...
-- Khi COUNT/SUM (column) => co group by (Nhom cac cot vao tuong ung)
SELECT COUNT(*)
FROM SINHVIEN 
SELECT maSinhVien, tenSV, COUNT(YEAR(GETDATE()) - YEAR(NgaySinh))
FROM SINHVIEN 
-- Having giong nhu WHERE: deu hien thi dieu cua cau truy van 
-- WHERE : cua cac cot co san cua table 
-- Having: cua cac cot cua cac ham ho tro 
GROUP BY maSinhVien, tenSV

-- Liệt kê tên sv và số lượng sinh viên ở khoa , với điều kiện số lượng sv ở cac khoa > 3 , 
-- sắp xếp theo số lượng sinh viên ở cac khoa giam dan.

SELECT COUNT(*) as [So luong SV], KhoaID
FROM SINHVIEN
GROUP BY KhoaID 
HAVING COUNT(*) > 3
ORDER BY COUNT(*) DESC
-- Liệt kê mã sinh viên, tên sinh viên của tất cả 
-- sinh viên có tên bắt đầu bằng chữ 'A' và ngày sinh sau năm 2000. 
SELECT maSinhVien,tenSV 
FROM SINHVIEN
WHERE tenSV LIKE 'a%' AND YEAR(NgaySinh) > 2000
-- Liệt kê khoa ID, tong so luong sinh vien theo moi khoa, 
-- chỉ lấy tong số lượng sinh viên lớn hơn 5, sắp xếp theo khoa ID giam dan. 

-- Liệt kê tuổi trung bình của sinh viên trong mỗi khoa id. 

-- Liệt kê  khoa id và ngày sinh trẻ nhất của sinh viên trong mỗi khoa. 