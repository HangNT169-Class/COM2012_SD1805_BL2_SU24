CREATE DATABASE Buoi11
GO
USE Buoi11 
GO

CREATE TABLE GiangVien(
    maGiangVien VARCHAR(20) PRIMARY KEY NOT NULL,
    tenGiangVien NVARCHAR(100) NOT NULL,
    tenTaiKhoan VARCHAR(100),
    soDienThoai VARCHAR(100) NOT NULL
)
INSERT INTO GiangVien
VALUES
    ('MGV01','TEN A', 'VBBANK', '0123456'),
    ('MGV02', 'TEN B ', 'VBBnk', '012334'),
    ('MGV03', 'TEN C', ' VDSF', ' 912344')

CREATE TABLE ChungChi(
    MaChungChi VARCHAR(20) PRIMARY KEY NOT NULL,
    TenChungChi NVARCHAR(20) NOT NULL,
    BenCap VARCHAR(20),
    Linhvuc NVARCHAR(20) NOT NULL

)
INSERT INTO ChungChi
VALUES
    ('CC01','Da hoan thanh','Dai hoc cong nghiep','CNTT'),
    ('CC02','Da hoan thanh','Dai hoc dong a','TKDH'),
    ('CC03','Da hoan thanh','Cao dang fpt','MKT')
    

CREATE TABLE LichSuHocTap(
    ma_giang_vien VARCHAR(20) NOT NULL FOREIGN KEY REFERENCES GiangVien(maGiangVien),
    ma_chung_chi VARCHAR(20) NOT NULL FOREIGN KEY REFERENCES ChungChi(MaChungChi),
    ngay_cap DATE NOT NULL,
    ghi_chu VARCHAR(10),
    PRIMARY KEY(ma_giang_vien,ma_chung_chi)
);
INSERT INTO LichSuHocTap 
VALUES
    ('MGV01','CC01','2000-12-13','tot'),
    ('MGV01','CC02','2000-01-01','kha')

SELECT * FROM LichSuHocTap
SELECT * FROM ChungChi
SELECT * FROM GiangVien

INSERT INTO GiangVien 
VALUES
(N'GV169', N'Nguyễn Thúy Hằng', N'hangnt169', '0384829501'),
(N'GV114', N'Nghi Thị Thu', N'thunt114', '0814823542'),
(N'GV131', N'Nguyễn Thành Nam', N'namnt131', '0951827196')
INSERT INTO ChungChi
VALUES
(N'CC169', N'Ielts 8.0', N'Ielts Company', N'Bằng Tiếng Anh'),
(N'CC114', N'Ielts 9.0', N'Ielts Company', N'Bằng Tiếng Anh'),
(N'CC131', N'Ielts 6.5', N'Ielts Company', N'Bằng Tiếng Anh')
INSERT INTO LichSuHocTap
VALUES
(N'GV169', N'CC169', '2022-07-21', 'Tot'),
(N'GV114', N'CC114', '2020-05-07', 'Tot'),
(N'GV131', N'CC131', '2023-09-17', 'Tot')

-- Hien thi danh sach Chung chi gom cac truong thong tin :
-- Ma Chung chi, Ten Chung Chi, Linh Vuc,
--  Ten GV nhan chung chi, SDT cua GV 
-- Co 2 cach noi bang
-- C1: Su dung menh de where 
SELECT cc.MaChungChi,cc.TenChungChi, 
       cc.Linhvuc,gv.tenGiangVien,gv.soDienThoai
FROM GiangVien gv, ChungChi cc, LichSuHocTap ls
WHERE gv.maGiangVien = ls.ma_giang_vien 
AND cc.MaChungChi = ls.ma_chung_chi
-- Neu k them dieu kien => Phep nhan (Nhan toan bo du lieu co trong DB )
-- => Du lieu bi sai => Du lieu thanh du lieu khong tai trong CSDL 
-- Phai co dieu kien (Khoa ngoai trung nhau)
SELECT * FROM LichSuHocTap -- ( 5 ban ghi)
SELECT * FROM ChungChi  -- ( 6 ban ghi)
SELECT * FROM GiangVien -- ( 6 ban ghi)
-- C2: Join (ket bang)
-- Co 2 loai join:
    -- inner join <=> where 
    -- outer join: left join, right join, full join 
-- 3 bang
SELECT cc.MaChungChi,cc.TenChungChi,cc.Linhvuc,
    gv.tenGiangVien,gv.soDienThoai
FROM GiangVien gv 
INNER JOIN LichSuHocTap ls 
ON gv.maGiangVien = ls.ma_giang_vien
INNER JOIN ChungChi cc 
ON cc.MaChungChi = ls.ma_chung_chi

-- Liệt kê tên giảng viên và các chứng chỉ mà giảng viên đó đã có 
-- Liệt kê tên giảng viên và số điện thoại của họ 
-- cùng với các chứng chỉ mà họ đã nhận được từ linh vuc CNTT
-- Tìm tất cả giảng viên đã nhận được 
-- chứng chỉ từ noi cap la Ha noi trong khoảng thời gian tu thang 1-2023 den thang 12 -2023:
-- Liệt kê tên giảng viên và các chứng chỉ mà giảng viên đó đã có.
-- Liệt kê tên chứng chỉ và giảng viên đã nhận được chứng chỉ đó.
-- Tìm giảng viên có chứng chỉ trong một lĩnh vực cụ thể.
-- Liệt kê tên giảng viên và số điện thoại của họ cùng với các chứng chỉ mà họ đã nhận được từ một bên cấp cụ thể.
-- Tìm tất cả giảng viên đã nhận được chứng chỉ từ một bên cấp trong khoảng thời gian cụ thể.
-- Đếm số lượng chứng chỉ mà mỗi giảng viên đã nhận được.
-- Liệt kê tất cả giảng viên chưa có bất kỳ chứng chỉ nào.
-- Tìm giảng viên có một chứng chỉ cụ thể và liệt kê các chứng chỉ khác mà họ đã nhận được.
-- Liệt kê tên giảng viên và tên chứng chỉ mà họ đã nhận được, sắp xếp theo ngày cấp.
-- Liệt kê tên giảng viên và số điện thoại của họ cùng với các chứng chỉ mà họ đã nhận được từ một bên cấp cụ thể và trong khoảng thời gian cụ thể.

-- Liệt kê tên giảng viên và các chứng chỉ mà giảng viên đó đã có 
SELECT gv.tenGiangVien, cc.TenChungChi
FROM GiangVien gv, ChungChi cc, LichSuHocTap ls
WHERE gv.maGiangVien = ls.ma_giang_vien
AND cc.MaChungChi = ls.ma_chung_chi
-- Liệt kê tên giảng viên và số điện thoại của họ 
-- cùng với các chứng chỉ mà họ đã nhận được từ linh vuc CNTT
SELECT * FROM ChungChi
SELECT * FROM GiangVien
SELECT * FROM LichSuHocTap
SELECT gv.tenGiangVien, gv.soDienThoai, cc.MaChungChi, cc.TenChungChi, cc.Linhvuc
FROM GiangVien gv, ChungChi cc, LichSuHocTap ls 
WHERE gv.maGiangVien = ls.ma_giang_vien
AND cc.MaChungChi = ls.ma_chung_chi
AND cc.Linhvuc = 'CNTT'