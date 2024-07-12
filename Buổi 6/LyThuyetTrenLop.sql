CREATE DATABASE Buoi5_TrenLop 
CREATE TABLE GiangVien(
    ID INT PRIMARY KEY IDENTITY,
    MaGiangVien VARCHAR(100) NOT NULL UNIQUE,
    TenGiangVien NVARCHAR(100),
    TenTaiKhoan NVARCHAR(100),
    SoDienThoai NVARCHAR(20)
)
CREATE TABLE MonHoc(
    ID INT PRIMARY KEY IDENTITY,
    MaMonHoc VARCHAR(100) NOT NULL UNIQUE,
    TenMonHoc NVARCHAR(100),
    SoTinChi INT,
    SoHocPhan INT
)
CREATE TABLE PhanCongGiangVien(
    giang_vien_id INT,
    mon_hoc_id INT,
    SoLanDay INT,
    TiLeDo INT,
    PRIMARY KEY (giang_vien_id,mon_hoc_id)
)

INSERT INTO GiangVien(MaGiangVien, TenGiangVien, TenTaiKhoan, SoDienThoai)
VALUES
(N'GV10151', N'Nguyễn Thúy Hằng', N'Hangnt169', N'0819123456'),
(N'GV11302', N'Nguyễn Thành Nam', N'Namnt123', N'0819123456'),
(N'GV11202', N'Ngi Thị Thu', N'Thunt207', N'0999123456'),
(N'GV15093', N'Hồ Ngọc Bảo Khiêm', N'Khiemhnb509', N'0999123459'),
(N'GV11294', N'Ngô Thị Thủy', N'Thuynt295', N'0999123451')

INSERT INTO MonHoc 
VALUES 
    ('MH06',N'Toán', 1,1),
    ('MH07',N'Lý', 2,1),
    ('MH08',N'Hoá', 3,1),
    ('MH09',N'Văn', 4,1),
    ('MH10',N'Sử', 1,2)

INSERT INTO PhanCongGiangVien 
VALUES 
    (1,1, 1,1),
    (2,1, 2,1),
    (1,2, 3,1),
    (3,2, 4,1),
    (3,3, 1,2)

SELECT * FROM GiangVien
SELECT * FROM MonHoc
SELECT * FROM PhanCongGiangVien 

-- Doi ten tam thoi : AS 
-- Doi ten tieng viet : them N 
SELECT MaGiangVien as N'Mã Giảng Viên', TenGiangVien,SoDienThoai
FROM GiangVien

-- Lọc dữ liệu - điều kiện - WHERE 
-- Cu phap:
-- SELECT column1,column2... 
-- FROM table1 
-- WHERE dieu kien
--      >: SS lon hon 
--      < : SS nho hon
--      >=: SS lon hon hoac bang 
--      <= : SS nho hon hoac bang
--      = : Bang
--      <> : Khac 
--      AND : Ket hop nhieu dk cung dung
--      OR : Ket hop 1 trong cac dk dung
--      LIKE :
--      BETWEEN: Giong AND  
--      ...
-- Hiển thị tất cả danh sách giảng viên có mã là GV11305 
SELECT *
FROM GiangVien
WHERE MaGiangVien = 'GV11305'
-- Hiển thị tất cả các môn học có số tín trong <=3 
SELECT *
FROM MonHoc
WHERE SoTinChi <= 3
-- <> : Khac #
-- Hiển thị tất cả các môn học có số tín trong khoảng 2 – 3 
-- DK : so tin >= 2 && so tin <=3
-- C1:AND
SELECT *
FROM MonHoc
WHERE SoTinChi >=2 AND SoTinChi <=3
-- C2: BETWEEN... AND
SELECT *
FROM MonHoc
WHERE SoTinChi BETWEEN 2 AND 3

-- Hiển thị tất cả các môn học có số tín trong khoảng 2 – 3  va ten mon hoc la Lý 
SELECT *
FROM MonHoc
WHERE 
    SoTinChi >=2 
    AND SoTinChi <=3
    AND TenMonHoc = N'Lý'

-- Hiển thị top 3 môn học có số tín <= 4 
SELECT TOP 3 * 
FROM MonHoc 
WHERE SoTinChi <=4

-- endWiths: KT bang
-- startWiths: Bat dau bang
-- contains: Chua
-- = LIKE :
-- Ket thuc bang '%gia tri'
-- Bat dau bang 'gia tri%'
-- Chua: '%gia tri%'
-- Hiển thị danh sách giảng viên gồm các thông tin sau: ma, ten, sdt 
-- với giảng viên có sđt kết thúc bằng 56 
SELECT MaGiangVien,TenGiangVien,SoDienThoai
FROm GiangVien
WHERE SoDienThoai LIKE '%56'
-- Hiển thị tất cả các giảng viên có mã là GV11302 và sdt bắt đầu bằng “081” 
SELECT MaGiangVien, TenGiangVien, SoDienThoai
From GiangVien
WHERE MaGiangVien = 'GV11302' AND SoDienThoai LIKE '081%'
-- Hiển thị tất cả các giảng viên có mã là GV11202 OR sdt bắt đầu bằng “081” 
SELECT MaGiangVien, TenGiangVien, SoDienThoai
From GiangVien
WHERE MaGiangVien = 'GV11202' OR SoDienThoai LIKE '081%'
-- Hiển thị tất cả các giảng viên có tên chứ chứ “a" và có sđt ket thuc là “8687” 
SELECT *
From GiangVien
WHERE TenGiangVien LIKE '%h%' AND SoDienThoai LIKE '09%'