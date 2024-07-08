CREATE DATABASE LuyenTapTrenLopBuoi4
GO
USE LuyenTapTrenLopBuoi4
GO

CREATE TABLE XEMAY (
    ma VARCHAR(20) PRIMARY KEY,
    loai NVARCHAR(50),
    mau_sac NVARCHAR(50),
    gia FLOAT,
    trang_thai BIT,
)
INSERT INTO XEMAY
VALUES
    ('Ma1',N'HONDA',N'Den',100,0),
    ('Ma2',N'HONDA2',N'Trang',200,0),
    ('Ma3',N'HONDA3',N'Hong',999,0)
SELECT * FROM XEMAY
-- ALTER TABLE XEMAY
-- ADD ma PRIMARY KEY
