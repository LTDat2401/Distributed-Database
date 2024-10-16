IF EXISTS (SELECT name FROM master.sys.databases WHERE name = N'KingFastFood')
	BEGIN
		PRINT 'MyCheck! Drop Database and regenerate again!'
		USE master
		DROP DATABASE [KingFastFood]
	END
GO


CREATE DATABASE [KingFastFood]
GO

USE [KingFastFood]
GO

-----------------------------------------------------------------------------------------
/****** Object:  Table [dbo].[ChiNhanh] ******/
CREATE TABLE [dbo].[ChiNhanh](
	[MaCN] [varchar](13) NOT NULL,
	[TenCN] [nvarchar](20) NOT NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
 	CONSTRAINT [PK_ChiNhanh] PRIMARY KEY (MaCN)
)
GO

/****** Object:  Table [dbo].[CheBien] ******/
CREATE TABLE [dbo].[CheBien](
	[MaMA] [varchar](13) NOT NULL,
	[MANL] [varchar](13) NOT NULL,
	[SoLuong] [int] NOT NULL,
 	CONSTRAINT [PK_CheBien] PRIMARY KEY (MaMA, MANL)
) 
GO

/****** Object:  Table [dbo].[ChucVu] ******/

CREATE TABLE [dbo].[ChucVu](
	[MaCV] [varchar](13) NOT NULL,
	[TenCV] [nvarchar](30) NOT NULL,
 	CONSTRAINT [PK_ChucVU] PRIMARY KEY (MaCV)
) 
GO

/****** Object:  Table [dbo].[CTHD] ******/
CREATE TABLE [dbo].[CTHD](
	[MaHD] [varchar](13) NOT NULL,
	[MaMA] [varchar](13) NOT NULL,
	[SoLuong] [int] NOT NULL,
 	CONSTRAINT [PK_CTHD] PRIMARY KEY (MaHD, MaMA)
) 
GO

/****** Object:  Table [dbo].[CTPN] ******/
CREATE TABLE [dbo].[CTPN](
	[MaPhieuNhap] [varchar](13) NOT NULL,
	[MaNL] [varchar](13) NOT NULL,
	[SoLuong] [int] NOT NULL,
	CONSTRAINT [PK_CTPN] PRIMARY KEY (MaPhieuNhap, MaNL)
) 
GO

/****** Object:  Table [dbo].[CTK] ******/
CREATE TABLE [dbo].[CTK](
	[MaCN] [varchar](13) NOT NULL,
	[MaNL] [varchar](13) NOT NULL,
	[SoLuong] [int] NOT NULL,
	CONSTRAINT [PK_CTK] PRIMARY KEY (MaCN, MaNL)
) 
GO

/****** Object:  Table [dbo].[HoaDon] ******/
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [varchar](13) NOT NULL,
	[MaNV] [varchar](13) NOT NULL,
	[MaKH] [varchar](13) NOT NULL,
	[MaGiamGia] [varchar](13) NOT NULL,
	[NgayBan] [datetime] NOT NULL,
	[TongHoaDon] [float] NOT NULL,
	CONSTRAINT [PK_HoaDon] PRIMARY KEY (MaHD)
)
GO

/****** Object:  Table [dbo].[KhachHang] ******/
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [varchar](13) NOT NULL,
	[TenKH] [nvarchar](30) NOT NULL,
	[SDT] [nchar](10) NOT NULL,
	CONSTRAINT [PK_KhachHang] PRIMARY KEY (MaKH)
)
GO

/****** Object:  Table [dbo].[MonAn] ******/
CREATE TABLE [dbo].[MonAn](
	[MaMA] [varchar](13) NOT NULL,
	[TenMA] [nvarchar](30) NOT NULL,
	[DonGia] [float] NOT NULL,
	[SoLuong] [int] NOT NULL,
 	CONSTRAINT [PK_MonAn] PRIMARY KEY (MaMA)
)
GO

/****** Object:  Table [dbo].[NguyenLieu] ******/
CREATE TABLE [dbo].[NguyenLieu](
	[MaNL] [varchar](13) NOT NULL,
	[TenNL] [nvarchar](30) NOT NULL,
	[PhanLoai] [nvarchar](30) NOT NULL,
	[DonVi] [nvarchar](10) NOT NULL,
	CONSTRAINT [PK_NguyenLieu] PRIMARY KEY (MaNL)
) 
GO

/****** Object:  Table [dbo].[NhaCungCap] ******/
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [varchar](13) NOT NULL,
	[TenNCC] [nvarchar](30) NOT NULL,
	[SDT] [nchar](10) NOT NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
 	CONSTRAINT [PK_NhaCungCap] PRIMARY KEY (MaNCC)
) 
GO

/****** Object:  Table [dbo].[NhanVien] ******/
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [varchar](13) NOT NULL,
	[MaCV] [varchar](13) NOT NULL,
	[TenNV] [nvarchar](30) NOT NULL,
	[CMND] [nchar](12) NOT NULL,
	[SDT] [nchar](10) NOT NULL,
	[MaCN] [varchar](13) NOT NULL,
 	CONSTRAINT [PK_NhanVien] PRIMARY KEY (MaNV)
)
GO

/****** Object:  Table [dbo].[PhieuGiamGia] ******/
CREATE TABLE [dbo].[PhieuGiamGia](
	[MaGiamGia] [varchar](13) NOT NULL,
	[NoiDung] [nvarchar](30) NOT NULL,
	[TileGiam] [float] NOT NULL,
 	CONSTRAINT [PK_PhieuGiamGia] PRIMARY KEY (MaGiamGia)
) 
GO

/****** Object:  Table [dbo].[PhieuNhap] ******/
CREATE TABLE [dbo].[PhieuNhap](
	[MaPhieuNhap] [varchar](13) NOT NULL,
	[MaNCC] [varchar](13) NOT NULL,
	[NgayNhap] [date] NOT NULL,
	[MaCN] [varchar](13) NOT NULL,
 	CONSTRAINT [PK_PhieuNhap] PRIMARY KEY (MaPhieuNhap)
)
GO

/****** Object:  Table [dbo].[CaLamViec] ******/
-- CREATE TABLE [dbo].[CaLamViec](
-- 	[MaCa] [varchar](13) NOT NULL,
-- 	[TenCa] [nvarchar](30) NOT NULL,
-- 	[thoiGian] [nvarchar](30) NOT NULL,
--  	CONSTRAINT [PK_CaLamViec] PRIMARY KEY (MaCa)
-- ) 
-- GO

-----------------------------------------------------------------------------------------
-- Tạo ràng buộc toàn vẹn 
-- Bảng NhanVien và Bảng ChiNhanh
ALTER TABLE [dbo].[NhanVien] 
ADD CONSTRAINT [FK_NhanVien_ChiNhanh] 
FOREIGN KEY([MaCN]) REFERENCES [dbo].[ChiNhanh] ([MaCN])
GO

-- Bảng CheBien và Bảng MonAn
ALTER TABLE [dbo].[CheBien] 
ADD CONSTRAINT [FK_CheBien_MonAn] 
FOREIGN KEY([MaMA]) REFERENCES [dbo].[MonAn] ([MaMA])
GO

-- Bảng CheBien và Bảng NguyenLieu
ALTER TABLE [dbo].[CheBien] 
ADD CONSTRAINT [FK_CheBien_NguyenLieu] 
FOREIGN KEY([MANL]) REFERENCES [dbo].[NguyenLieu] ([MaNL])
GO

-- Bảng CTHD và Bảng HoaDon
ALTER TABLE [dbo].[CTHD] 
ADD CONSTRAINT [FK_CTHD_HoaDon] 
FOREIGN KEY([MaHD]) REFERENCES [dbo].[HoaDon] ([MaHD])
GO

-- Bảng CTHD và Bảng MonAn
ALTER TABLE [dbo].[CTHD] 
ADD CONSTRAINT [FK_CTHD_MonAn] 
FOREIGN KEY([MaMA]) REFERENCES [dbo].[MonAn] ([MaMA])
GO

-- Bảng CTPN và Bảng NguyenLieu
ALTER TABLE [dbo].[CTPN]
ADD CONSTRAINT [FK_CTPN_NguyenLieu] 
FOREIGN KEY([MaNL]) REFERENCES [dbo].[NguyenLieu] ([MaNL])
GO

-- Bảng CTK và Bảng ChiNhanh
ALTER TABLE [dbo].[CTK]
ADD CONSTRAINT [FK_CTK_ChiNhanh]
FOREIGN KEY([MaCN]) REFERENCES [dbo].[ChiNhanh] ([MaCN])
GO

-- Bảng CTK và Bảng NguyenLieu
ALTER TABLE [dbo].[CTK]
ADD CONSTRAINT [FK_CTK_NguyenLieu]
FOREIGN KEY([MaNL]) REFERENCES [dbo].[NguyenLieu] ([MaNL])
GO

-- Bảng CTPN và Bảng PhieuNhap
ALTER TABLE [dbo].[CTPN] 
ADD CONSTRAINT [FK_CTPN_PN] 
FOREIGN KEY([MaPhieuNhap]) REFERENCES [dbo].[PhieuNhap] ([MaPhieuNhap])
GO

-- Bảng PhieuNhap và Bảng ChiNhanh
ALTER TABLE [dbo].[PhieuNhap]
ADD CONSTRAINT [FK_PhieuNhap_ChiNhanh]
FOREIGN KEY([MaCN]) REFERENCES [dbo].[ChiNhanh] ([MaCN])
GO

-- Bảng HoaDon và Bảng KhachHang
ALTER TABLE [dbo].[HoaDon]
ADD CONSTRAINT [FK_HoaDon_KhachHang] 
FOREIGN KEY([MaKH]) REFERENCES [dbo].[KhachHang] ([MaKH])
GO

-- Bảng HoaDon và Bảng NhanVien
ALTER TABLE [dbo].[HoaDon] 
ADD CONSTRAINT [FK_HoaDon_NhanVien] 
FOREIGN KEY([MaNV]) REFERENCES [dbo].[NhanVien] ([MaNV])
GO

-- Bảng HoaDon và Bảng PhieuGiamGia
ALTER TABLE [dbo].[HoaDon] 
ADD CONSTRAINT [FK_HoaDon_PhieuGiamGia]
FOREIGN KEY([MaGiamGia]) REFERENCES [dbo].[PhieuGiamGia] ([MaGiamGia])
GO

-- Bảng NhanVien và Bảng ChucVu
ALTER TABLE [dbo].[NhanVien] 
ADD  CONSTRAINT [FK_NhanVien_ChucVU]
FOREIGN KEY([MaCV]) REFERENCES [dbo].[ChucVu] ([MaCV])
GO

-- Bảng PhieuNhap và Bảng NhaCungCap
ALTER TABLE [dbo].[PhieuNhap] 
ADD CONSTRAINT [FK_PhieuNhap_NhaCungCap] 
FOREIGN KEY([MaNCC]) REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO

-- Bảng NhanVien và Bảng CaLamViec
-- ALTER TABLE [dbo].[NhanVien] 
-- ADD  CONSTRAINT [FK_NhanVien_CaLamViec] 
-- FOREIGN KEY([MaCa]) REFERENCES [dbo].[CaLamViec] ([MaCa])
-- GO

-----------------------------------------------------------------------------------------
-- Nhập dữ liệu cho các bảng
-- Bảng ChiNhanh
INSERT [dbo].[ChiNhanh] ([MaCN], [TenCN], [DiaChi]) VALUES('MIENBAC', N'Miền Bắc', N'Số 292 Bà Triệu, P. Lê Đại Hành, Q. Hai Bà Trưng, TP. Hà Nội')
INSERT [dbo].[ChiNhanh] ([MaCN], [TenCN], [DiaChi]) VALUES('MIENTRUNG', N'Miền Trung', N'148 Nguyễn Văn Linh, phường Nam Dương, quận Hải Châu, Đà Nẵng')
INSERT [dbo].[ChiNhanh] ([MaCN], [TenCN], [DiaChi]) VALUES('MIENNAM', N'Miền Nam', N' 446 Lý Thường Kiệt, phường 7, quận Tân Bình, TP. HCM')

-- Bảng ChucVu
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES ('AD', N'Chủ nhà hàng')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES ('BP', N'Bếp phó')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES ('BT', N'Bếp trưởng')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES ('KTT', N'Kế toán trưởng')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES ('NVBH', N'Nhân viên bán hàng')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES ('NVBV', N'Nhân viên bảo vệ')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES ('NVGH', N'Nhân viên giao hàng')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES ('NVPV', N'Nhân viên phục vụ')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES ('PB', N'Phụ bếp')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES ('QLGS', N'Quản lí giám sát')
GO

-- Bảng NhanVien
--Miền Bắc
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV002', 'BP', N'Quang Ngọc Trinh', N'079202034889', N'0909029548', 'MIENBAC')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV012', 'BT', N'Quang Ngọc', N'08702034889', N'0349029548', 'MIENBAC')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV004', 'KTT', N'Quốc Ân', N'079202022222', N'0202054988', 'MIENBAC')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV013', 'NVBV', N'Quân Huỳnh', N'07920202562', N'0362054988', 'MIENBAC')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV015', 'NVBH', N'Quân Phạm', N'09992020562', N'0346054988', 'MIENBAC')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV008', 'NVPV', N'Nguyễn Quang Triệu', N'079202034001', N'0909099284', 'MIENBAC')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV010', 'PB', N'Trần Thanh Long', N'079202078222', N'0606029548', 'MIENBAC')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV017', 'NVGH', N'Trần Thanh', N'080092078222', N'0967729548', 'MIENBAC')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV018', 'QLGS', N'Phạm Thanh', N'090099998222', N'0888889548', 'MIENBAC')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV019', 'NVPV', N'Phạm Quân', N'090099998222', N'0777889548', 'MIENBAC')
--Miền Trung
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV003', 'BT', N'Nguyên Quân', N'079202034222', N'0101029488', 'MIENTRUNG')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV020', 'BP', N'Nguyên Tấn', N'079202034222', N'0701102488', 'MIENTRUNG')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV014', 'KTT', N'Nguyễn Tấn', N'089202534222', N'0311029488', 'MIENTRUNG')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV021', 'NVPV', N'Tấn Võ', N'089225399232', N'0311023388', 'MIENTRUNG')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV006', 'NVBV', N'Hải Dương', N'079202034666', N'0909029542', 'MIENTRUNG')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV009', 'NVBH', N'Nguyên Tam Hoàng', N'079202022202', N'0101052988', 'MIENTRUNG')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV023', 'NVPV', N'Hoàng Quân', N'073242223202', N'0910105238', 'MIENTRUNG')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV022', 'PB', N'Nguyên Hoàng', N'079777722202', N'0301052988', 'MIENTRUNG')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV016', 'NVGH', N'Nguyên Hoàng', N'09202022202', N'0301053588', 'MIENTRUNG')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV024', 'QLGS', N'Hoàng Huy', N'07901122202', N'0802352588', 'MIENTRUNG')
--Miền Nam
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV025', 'QLGS', N'Nguyên Lộc', N'079202011188', N'0997029548', 'MIENNAM')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV001', 'NVBH', N'Nguyên Lộc', N'08902034888', N'0738029568', 'MIENNAM')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV005', 'KTT', N'Quốc An', N'079202039999', N'0909029549', 'MIENNAM')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV026', 'NVPV', N'Quốc Siêu', N'079202032219', N'0309033549', 'MIENNAM')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV027', 'NVPV', N'Nguyễn Siêu', N'079211132219', N'0309113549', 'MIENNAM')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV007', 'NVGH', N'Long An', N'079202034111', N'0909299542', 'MIENNAM')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV028', 'NVPV', N'Song Long', N'079203333111', N'0999296642', 'MIENNAM')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV030', 'NVBV', N'Song Ngư', N'079202222511', N'0888296642', 'MIENNAM')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV011', 'BT', N'Trần Quốc An Khánh', N'079202054888', N'0404029548', 'MIENNAM')
INSERT [dbo].[NhanVien] ([MaNV], [MaCV], [TenNV], [CMND], [SDT], [MaCN]) VALUES ('NV029', 'BP', N'Trần Quốc Khánh', N'089205554888', N'0804029548', 'MIENNAM')
GO

-- Bảng KhachHang
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT]) VALUES ('KH000', N'Lê Hồng Phát', N'0909098687')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT]) VALUES ('KH001', N'Trần Quang Long', N'0909029548')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT]) VALUES ('KH002', N'Hồ Sĩ Minh', N'0202054922')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT]) VALUES ('KH003', N'Quang Triệu', N'0202949882')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT]) VALUES ('KH004', N'Nguyễn Quốc Siêu', N'0101092884')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT]) VALUES ('KH005', N'Lâm Triệu Khánh', N'0202021938')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT]) VALUES ('KH006', N'Quốc Triệu Phong', N'0902932149')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT]) VALUES ('KH007', N'Nguyễn Lâm Chung', N'0021231234')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT]) VALUES ('KH008', N'Nguyễn Trung Hải', N'0321420424')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT]) VALUES ('KH009', N'Nguyễn Tấn Quốc', N'0204214242')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT]) VALUES ('KH010', N'Võ Trung Quang', N'9920411234')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT]) VALUES ('KH011', N'Đoàn Văn Phát', N'5582041312')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT]) VALUES ('KH012', N'Lê Kim Nga', N'1231412321')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT]) VALUES ('KH013', N'Đỗ Đình Võ', N'8576565453')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT]) VALUES ('KH014', N'Kim Thanh Thu', N'4094009466')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT]) VALUES ('KH015', N'Trương Tấn Võ', N'0021149875')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT]) VALUES ('KH016', N'Nguyễn Vân Khánh', N'3724869521')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT]) VALUES ('KH017', N'Nguyễn Thu Hoài', N'1984203457')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT]) VALUES ('KH018', N'Lê Vĩnh Hưng', N'1940245124')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT]) VALUES ('KH019', N'Phạm Thế Vinh', N'5255215666')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT]) VALUES ('KH020', N'Châu Kim Hoa', N'4901012112')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT]) VALUES ('KH021', N'Đỗ Chí Huy', N'0922451424')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT]) VALUES ('KH022', N'Lê Ánh Tuyết', N'423434325')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT]) VALUES ('KH023', N'Đinh Hưng Phú', N'3432852221')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT]) VALUES ('KH024', N'Ngô Trung Chánh', N'8432043801')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT]) VALUES ('KH025', N'Lương Thế Thành', N'5203258220')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT]) VALUES ('KH026', N'Nguyễn Văn Sáng', N'5324325522')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT]) VALUES ('KH027', N'Ngô Chí Quốc', N'4567703229')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT]) VALUES ('KH028', N'Lê Anh Kiệt', N'4548905309')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT]) VALUES ('KH029', N'Trần Quang Huy', N'4439003450')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT]) VALUES ('KH030', N'Trần Văn Tấn', N'5934030347')
GO

-- Bảng PhieuGiamGia
INSERT [dbo].[PhieuGiamGia] ([MaGiamGia], [NoiDung], [TileGiam]) VALUES ('GIAMGIA10', N'Giảm giá 10%', 0.1)
INSERT [dbo].[PhieuGiamGia] ([MaGiamGia], [NoiDung], [TileGiam]) VALUES ('GIAMGIA15', N'Giảm giá 15%', 0.15)
INSERT [dbo].[PhieuGiamGia] ([MaGiamGia], [NoiDung], [TileGiam]) VALUES ('GIAMGIA20', N'Giảm giá 20%', 0.2)
INSERT [dbo].[PhieuGiamGia] ([MaGiamGia], [NoiDung], [TileGiam]) VALUES ('GIAMGIA5', N'Giảm giá 5%', 0.05)
INSERT [dbo].[PhieuGiamGia] ([MaGiamGia], [NoiDung], [TileGiam]) VALUES ('KHONG', N'Không giảm', 0)
GO

-- Bảng NhaCungCap
--Miền Bắc
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SDT], [DiaChi]) VALUES ('TPDA', N'Thực Phẩm Đông An', N'0129548726', N'299/4 Tân Thuận Mỹ, Q9, TP. HCM')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SDT], [DiaChi]) VALUES ('TPCA', N'Thực Phẩm Chi Ánh', N'0905294874', N'199/12 Nguyễn Lâm Đồng, Q4, TP. HCM')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SDT], [DiaChi]) VALUES ('TPTM', N'Thực Phẩm Thu Mai', N'7890243219', N'174/4 An Dương Vương, Q5, TP. HCM')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SDT], [DiaChi]) VALUES ('TPCK', N'Thực Phẩm Chika', N'9908233248', N'312/12 Nguyễn Văn Cừ, Q7, TP. HCM')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SDT], [DiaChi]) VALUES ('TPHL', N'Thực Phẩm Hải La', N'8012413433', N'19/13 Hoàng Hoa Thám, Q1, TP. HCM')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SDT], [DiaChi]) VALUES ('TPAP', N'Thực Phẩm An Phú', N'2343532119', N'40 Chung An, Q10, TP. HCM')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SDT], [DiaChi]) VALUES ('TPBA', N'Thực Phẩm Binh An', N'0938423221', N'80 Nguyễn Văn Lượng, Q.Gò Vấp, TP. HCM')
--Miền Trung
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SDT], [DiaChi]) VALUES ('TPCC', N'Thực Phẩm Chân Chu', N'8829413243', N'221 Nguyễn Chu Anh, Q2, Đà Nẵng')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SDT], [DiaChi]) VALUES ('TPHA', N'Thực Phẩm Hải Ánh', N'9922341017', N'129 Lê Quang Phát, Q1, Đà Nẵng')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SDT], [DiaChi]) VALUES ('TPLC', N'Thực Phẩm Luông Chú', N'4892932911', N'320 Nguyễn Cư Chú, Q5, Đà Nẵng')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SDT], [DiaChi]) VALUES ('TPMA', N'Thực Phẩm Mai Anh', N'9904238243', N'12 Võ Văn Phát, Q8, Đà Nẵng')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SDT], [DiaChi]) VALUES ('TPKA', N'Thực Phẩm Khá An', N'5696493219', N'31 Ngô Chi Phú, Q7, Đà Nẵng')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SDT], [DiaChi]) VALUES ('TPKK', N'Thực Phẩm Kim Kha', N'4303242039', N'12/18 Lê Chí Nghĩa, Q10, Đà Nẵng')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SDT], [DiaChi]) VALUES ('TPHP', N'Thực Phẩm Hồ Phát', N'9901432143', N'480 Hồng Phúc, Q12, Đà Nẵng')
--Miền Nam
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SDT], [DiaChi]) VALUES ('TPNC', N'Thực Phẩm Nhân Chung', N'4234323207', N'190 Láng Hạ, Q2, TP. Hà Nội')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SDT], [DiaChi]) VALUES ('TPCM', N'Thực Phẩm Cầu Mai', N'4320034521', N'3 Hồ Tây, Q4, TP. Hà Nội')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SDT], [DiaChi]) VALUES ('TPTC', N'Thực Phẩm Thành Cư', N'1124323208', N'2 Nguyễn Chi Anh, Q3, TP. Hà Nội')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SDT], [DiaChi]) VALUES ('TPAN', N'Thực Phẩm An Nhiên', N'4920330294', N'301 Lê-nin, Q6, TP. Hà Nội')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SDT], [DiaChi]) VALUES ('TPH', N'Thực Phẩm Hồng', N'4843902213', N'123 Hòa Hưng, Q9, TP. Hà Nội')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SDT], [DiaChi]) VALUES ('TPPA', N'Thực Phẩm Phú Anh', N'0933822141', N'31 Ông Lãnh, Q10, TP. Hà Nội')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SDT], [DiaChi]) VALUES ('TPCB', N'Thực Phẩm Công Bình', N'5029411121', N'333 Ngư Chú, Q8, TP. Hà Nội')
GO

-- Bảng PhieuNhap
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNCC], [NgayNhap], [MaCN]) VALUES ('PN0001', 'TPDA', CAST(N'2023-03-04' AS Date), 'MIENTRUNG')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNCC], [NgayNhap], [MaCN]) VALUES ('PN0002', 'TPNC', CAST(N'2023-02-21' AS Date), 'MIENBAC')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNCC], [NgayNhap], [MaCN]) VALUES ('PN0003', 'TPKA', CAST(N'2023-02-22' AS Date), 'MIENBAC')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNCC], [NgayNhap], [MaCN]) VALUES ('PN0004', 'TPLC', CAST(N'2023-02-12' AS Date), 'MIENBAC')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNCC], [NgayNhap], [MaCN]) VALUES ('PN0005', 'TPAP', CAST(N'2023-02-18' AS Date), 'MIENTRUNG')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNCC], [NgayNhap], [MaCN]) VALUES ('PN0006', 'TPCK', CAST(N'2023-02-01' AS Date), 'MIENNAM')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNCC], [NgayNhap], [MaCN]) VALUES ('PN0007', 'TPHA', CAST(N'2023-01-31' AS Date), 'MIENTRUNG')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNCC], [NgayNhap], [MaCN]) VALUES ('PN0008', 'TPCM', CAST(N'2023-01-23' AS Date), 'MIENNAM')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNCC], [NgayNhap], [MaCN]) VALUES ('PN0009', 'TPHA', CAST(N'2023-01-18' AS Date), 'MIENTRUNG')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNCC], [NgayNhap], [MaCN]) VALUES ('PN0010', 'TPTM', CAST(N'2022-12-26' AS Date), 'MIENNAM')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNCC], [NgayNhap], [MaCN]) VALUES ('PN0011', 'TPCA', CAST(N'2022-12-18' AS Date), 'MIENBAC')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNCC], [NgayNhap], [MaCN]) VALUES ('PN0012', 'TPH', CAST(N'2022-12-05' AS Date), 'MIENTRUNG')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNCC], [NgayNhap], [MaCN]) VALUES ('PN0013', 'TPCB', CAST(N'2022-11-30' AS Date), 'MIENNAM')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNCC], [NgayNhap], [MaCN]) VALUES ('PN0014', 'TPKK', CAST(N'2022-11-24' AS Date), 'MIENNAM')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNCC], [NgayNhap], [MaCN]) VALUES ('PN0015', 'TPCK', CAST(N'2022-11-21' AS Date), 'MIENNAM')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNCC], [NgayNhap], [MaCN]) VALUES ('PN0016', 'TPAN', CAST(N'2022-11-19' AS Date), 'MIENBAC')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNCC], [NgayNhap], [MaCN]) VALUES ('PN0017', 'TPHL', CAST(N'2022-11-15' AS Date), 'MIENNAM')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNCC], [NgayNhap], [MaCN]) VALUES ('PN0018', 'TPTC', CAST(N'2022-11-10' AS Date), 'MIENNAM')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNCC], [NgayNhap], [MaCN]) VALUES ('PN0019', 'TPHA', CAST(N'2022-10-31' AS Date), 'MIENBAC')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNCC], [NgayNhap], [MaCN]) VALUES ('PN0020', 'TPMA', CAST(N'2022-10-25' AS Date), 'MIENTRUNG')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNCC], [NgayNhap], [MaCN]) VALUES ('PN0021', 'TPBA', CAST(N'2022-10-20' AS Date), 'MIENTRUNG')
GO

-- Bảng NguyenLieu
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [PhanLoai], [DonVi]) VALUES ('BUT1', N'Trái Bơ', N'Trái Cây', N'kg')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [PhanLoai], [DonVi]) VALUES ('FLO1', N'Bột chiên giòn', N'Bột', N'kg')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [PhanLoai], [DonVi]) VALUES ('FLO2', N'Bột mì số 8', N'Bột', N'kg')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [PhanLoai], [DonVi]) VALUES ('FLO3', N'Bột mì số 11', N'Bột', N'kg')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [PhanLoai], [DonVi]) VALUES ('FLO4', N'Bột năng', N'Bột', N'kg')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [PhanLoai], [DonVi]) VALUES ('FLO5', N'Bột nếp', N'Bột', N'kg')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [PhanLoai], [DonVi]) VALUES ('FLO6', N'Bột nở', N'Bột', N'kg')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [PhanLoai], [DonVi]) VALUES ('FLO7', N'Bột xù', N'Bột', N'kg')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [PhanLoai], [DonVi]) VALUES ('FRUI01', N'Chanh Dây', N'Hoa quả', N'kg')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [PhanLoai], [DonVi]) VALUES ('FRUI02', N'Chanh Xanh', N'Hoa quả', N'kg')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [PhanLoai], [DonVi]) VALUES ('FRUI03', N'Cam Xanh', N'Hoa quả', N'kg')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [PhanLoai], [DonVi]) VALUES ('MEA1', N'Sườn heo', N'Thịt', N'kg')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [PhanLoai], [DonVi]) VALUES ('MEA2', N'Đùi gà', N'Thịt', N'kg')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [PhanLoai], [DonVi]) VALUES ('MEA3', N'Ức gà file', N'Thịt', N'kg')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [PhanLoai], [DonVi]) VALUES ('MEA4', N'Cánh gà', N'Thịt', N'kg')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [PhanLoai], [DonVi]) VALUES ('MEA5', N'File bò', N'Thịt', N'kg')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [PhanLoai], [DonVi]) VALUES ('MEA6', N'Steak bò', N'Thịt', N'kg')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [PhanLoai], [DonVi]) VALUES ('OIL1', N'Dầu ăn', N'Dầu', N'L')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [PhanLoai], [DonVi]) VALUES ('OIL2', N'Dầu hào', N'Dầu', N'L')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [PhanLoai], [DonVi]) VALUES ('OR1', N'Tỏi tươi', N'Gia vị', N'kg')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [PhanLoai], [DonVi]) VALUES ('RIC1', N'Gạo', N'Gạo', N'kg')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [PhanLoai], [DonVi]) VALUES ('SPI1', N'Bột ngọt', N'Gia vị', N'kg')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [PhanLoai], [DonVi]) VALUES ('SPI2', N'Đường cát trắng', N'Gia vị', N'kg')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [PhanLoai], [DonVi]) VALUES ('SPI3', N'Đường phèn', N'Gia vị', N'kg')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [PhanLoai], [DonVi]) VALUES ('SPI4', N'Muối Iot', N'Gia vị', N'kg')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [PhanLoai], [DonVi]) VALUES ('SPI5', N'Tiêu đen xay', N'Gia vị', N'kg')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [PhanLoai], [DonVi]) VALUES ('SPI6', N'Nước mắm', N'Gia vị', N'Lít')
INSERT [dbo].[NguyenLieu] ([MaNL], [TenNL], [PhanLoai], [DonVi]) VALUES ('SPI7', N'Nước mắm nhĩ', N'Gia vị', N'Lít')
GO


-- Bảng MonAn
INSERT [dbo].[MonAn] ([MaMA], [TenMA], [DonGia], [SoLuong]) VALUES ('BE01', N'Bánh mì nướng tiêu đen', 15000, 22)
INSERT [dbo].[MonAn] ([MaMA], [TenMA], [DonGia], [SoLuong]) VALUES ('CHI01', N'Gà nướng tỏi', 125000, 10)
INSERT [dbo].[MonAn] ([MaMA], [TenMA], [DonGia], [SoLuong]) VALUES ('CHI02', N'Gà chiên nước mắm', 75000, 20)
INSERT [dbo].[MonAn] ([MaMA], [TenMA], [DonGia], [SoLuong]) VALUES ('CHI03', N'Gà chiên giòn', 55000, 35)
INSERT [dbo].[MonAn] ([MaMA], [TenMA], [DonGia], [SoLuong]) VALUES ('CHI04', N'Ức gà nướng', 70000, 25)
INSERT [dbo].[MonAn] ([MaMA], [TenMA], [DonGia], [SoLuong]) VALUES ('CHI05', N'Ức gà áp chảo', 77000, 19)
INSERT [dbo].[MonAn] ([MaMA], [TenMA], [DonGia], [SoLuong]) VALUES ('RIC01', N'Cơm chiên sườn heo', 40000, 22)
INSERT [dbo].[MonAn] ([MaMA], [TenMA], [DonGia], [SoLuong]) VALUES ('RIC02', N'Cơm chiên cánh gà', 45000, 12)
INSERT [dbo].[MonAn] ([MaMA], [TenMA], [DonGia], [SoLuong]) VALUES ('RIC03', N'Cơm chiên đùi gà', 50000, 9)
INSERT [dbo].[MonAn] ([MaMA], [TenMA], [DonGia], [SoLuong]) VALUES ('STE01', N'Steak tái chín', 120000, 2)
INSERT [dbo].[MonAn] ([MaMA], [TenMA], [DonGia], [SoLuong]) VALUES ('STE02', N'Steak tái mắm nhĩ', 100000, 3)
INSERT [dbo].[MonAn] ([MaMA], [TenMA], [DonGia], [SoLuong]) VALUES ('STE03', N'Steak tái tiêu đen', 100000, 4)
INSERT [dbo].[MonAn] ([MaMA], [TenMA], [DonGia], [SoLuong]) VALUES ('WT1', N'Nước lọc', 10000, 200)
INSERT [dbo].[MonAn] ([MaMA], [TenMA], [DonGia], [SoLuong]) VALUES ('WT2', N'Nước có ga', 12000, 200)
INSERT [dbo].[MonAn] ([MaMA], [TenMA], [DonGia], [SoLuong]) VALUES ('WT3', N'Nước chanh tươi', 15000, 10)
INSERT [dbo].[MonAn] ([MaMA], [TenMA], [DonGia], [SoLuong]) VALUES ('WT4', N'Nước chanh dây', 15000, 14)
INSERT [dbo].[MonAn] ([MaMA], [TenMA], [DonGia], [SoLuong]) VALUES ('WT5', N'Nước cam ', 17000, 8)
GO

-- Bảng HoaDon
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [MaGiamGia], [NgayBan], [TongHoaDon]) VALUES ('HD0001', 'NV001', 'KH001', N'KHONG', CAST(N'2023-03-12T17:22:17.000' AS DateTime), 30000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [MaGiamGia], [NgayBan], [TongHoaDon]) VALUES ('HD0002', 'NV015', 'KH002', N'KHONG', CAST(N'2023-03-10T13:12:05.000' AS DateTime), 250000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [MaGiamGia], [NgayBan], [TongHoaDon]) VALUES ('HD0003', 'NV009', 'KH003', N'GIAMGIA10', CAST(N'2023-03-09T08:12:01.000' AS DateTime), 72000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [MaGiamGia], [NgayBan], [TongHoaDon]) VALUES ('HD0004', 'NV015', 'KH004', N'KHONG', CAST(N'2023-03-01T12:22:17.000' AS DateTime), 140000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [MaGiamGia], [NgayBan], [TongHoaDon]) VALUES ('HD0005', 'NV001', 'KH005', N'GIAMGIA20', CAST(N'2023-02-22T10:16:11.000' AS DateTime), 80000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [MaGiamGia], [NgayBan], [TongHoaDon]) VALUES ('HD0006', 'NV015', 'KH006', N'GIAMGIA5', CAST(N'2023-02-19T08:22:13.000' AS DateTime), 8000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [MaGiamGia], [NgayBan], [TongHoaDon]) VALUES ('HD0007', 'NV009', 'KH007', N'KHONG', CAST(N'2023-02-15T18:18:10.000' AS DateTime), 100000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [MaGiamGia], [NgayBan], [TongHoaDon]) VALUES ('HD0008', 'NV001', 'KH008', N'KHONG', CAST(N'2023-02-13T21:21:15.000' AS DateTime), 120000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [MaGiamGia], [NgayBan], [TongHoaDon]) VALUES ('HD0009', 'NV015', 'KH009', N'GIAMGIA15', CAST(N'2023-02-11T16:30:00.000' AS DateTime), 140000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [MaGiamGia], [NgayBan], [TongHoaDon]) VALUES ('HD0010', 'NV009', 'KH010', N'KHONG', CAST(N'2023-02-09T10:10:20.000' AS DateTime), 100000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [MaGiamGia], [NgayBan], [TongHoaDon]) VALUES ('HD0011', 'NV009', 'KH011', N'GIAMGIA10', CAST(N'2023-02-03T13:10:00.000' AS DateTime), 90000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [MaGiamGia], [NgayBan], [TongHoaDon]) VALUES ('HD0012', 'NV001', 'KH012', N'KHONG', CAST(N'2023-02-01T17:28:17.000' AS DateTime), 250000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [MaGiamGia], [NgayBan], [TongHoaDon]) VALUES ('HD0013', 'NV015', 'KH013', N'KHONG', CAST(N'2023-01-31T14:21:18.000' AS DateTime), 375000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [MaGiamGia], [NgayBan], [TongHoaDon]) VALUES ('HD0014', 'NV015', 'KH014', N'GIAMGIA20', CAST(N'2023-01-27T09:16:10.000' AS DateTime), 112000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [MaGiamGia], [NgayBan], [TongHoaDon]) VALUES ('HD0015', 'NV009', 'KH015', N'KHONG', CAST(N'2023-01-25T07:10:21.000' AS DateTime), 300000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [MaGiamGia], [NgayBan], [TongHoaDon]) VALUES ('HD0016', 'NV001', 'KH016', N'KHONG', CAST(N'2023-01-22T20:22:14.000' AS DateTime), 270000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [MaGiamGia], [NgayBan], [TongHoaDon]) VALUES ('HD0017', 'NV001', 'KH017', N'GIAMGIA10', CAST(N'2023-01-20T17:45:19.000' AS DateTime), 144000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [MaGiamGia], [NgayBan], [TongHoaDon]) VALUES ('HD0018', 'NV009', 'KH018', N'KHONG', CAST(N'2023-01-19T13:49:10.000' AS DateTime), 150000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [MaGiamGia], [NgayBan], [TongHoaDon]) VALUES ('HD0019', 'NV001', 'KH019', N'GIAMGIA20', CAST(N'2023-01-16T11:20:16.000' AS DateTime), 240000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [MaGiamGia], [NgayBan], [TongHoaDon]) VALUES ('HD0020', 'NV015', 'KH020', N'KHONG', CAST(N'2023-01-13T19:17:19.000' AS DateTime), 210000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [MaGiamGia], [NgayBan], [TongHoaDon]) VALUES ('HD0021', 'NV015', 'KH021', N'GIAMGIA5', CAST(N'2023-01-10T10:58:11.000' AS DateTime), 475000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [MaGiamGia], [NgayBan], [TongHoaDon]) VALUES ('HD0022', 'NV009', 'KH022', N'KHONG', CAST(N'2023-01-07T19:28:10.000' AS DateTime), 120000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [MaGiamGia], [NgayBan], [TongHoaDon]) VALUES ('HD0023', 'NV009', 'KH023', N'KHONG', CAST(N'2023-01-02T20:16:12.000' AS DateTime), 462000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [MaGiamGia], [NgayBan], [TongHoaDon]) VALUES ('HD0024', 'NV009', 'KH024', N'KHONG', CAST(N'2022-12-29T12:58:19.000' AS DateTime), 120000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [MaGiamGia], [NgayBan], [TongHoaDon]) VALUES ('HD0025', 'NV001', 'KH025', N'GIAMGIA15', CAST(N'2022-12-20T18:00:01.000' AS DateTime), 144000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [MaGiamGia], [NgayBan], [TongHoaDon]) VALUES ('HD0026', 'NV001', 'KH026', N'KHONG', CAST(N'2022-12-15T14:19:16.000' AS DateTime), 116000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [MaGiamGia], [NgayBan], [TongHoaDon]) VALUES ('HD0027', 'NV009', 'KH027', N'GIAMGIA20', CAST(N'2022-12-12T18:42:11.000' AS DateTime), 120000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [MaGiamGia], [NgayBan], [TongHoaDon]) VALUES ('HD0028', 'NV015', 'KH028', N'KHONG', CAST(N'2022-12-09T18:12:14.000' AS DateTime), 210000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [MaGiamGia], [NgayBan], [TongHoaDon]) VALUES ('HD0029', 'NV015', 'KH029', N'KHONG', CAST(N'2022-12-04T12:30:11.000' AS DateTime), 300000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [MaGiamGia], [NgayBan], [TongHoaDon]) VALUES ('HD0030', 'NV009', 'KH030', N'GIAMGIA5', CAST(N'2022-12-01T19:19:15.000' AS DateTime), 366000)
GO

-- Bảng CheBien
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('BE01', 'FLO3', 3)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('BE01', 'OIL1', 1)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('BE01', 'OR1',1)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('BE01', 'SPI4', 1)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('BE01', 'SPI5', 1)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('CHI01', 'BUT1', 1)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('CHI01', 'MEA2', 2)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('CHI01', 'OR1',3)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('CHI02', 'MEA2', 2)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('CHI02', 'OIL1', 1)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('CHI02', 'SPI6', 2)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('CHI03', 'MEA2', 2)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('CHI03', 'OIL1', 1)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('CHI04', 'MEA3', 2)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('CHI04', 'SPI4', 1)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('CHI05', 'BUT1', 1)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('CHI05', 'MEA3', 2)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('RIC01', 'MEA1', 3)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('RIC01', 'OIL1', 1)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('RIC01', 'RIC1', 3)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('RIC02', 'MEA4', 3)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('RIC02', 'OIL1', 1)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('RIC02', 'RIC1', 3)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('RIC03', 'MEA2', 3)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('RIC03', 'OIL1', 1)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('RIC03', 'RIC1', 3)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('STE01', 'MEA6', 2)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('STE01', 'OIL1', 1)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('STE02', 'MEA6', 2)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('STE02', 'OIL1', 1)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('STE02', 'SPI7', 2)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('STE03', 'MEA6', 2)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('STE03', 'OIL1', 1)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('STE03', 'SPI5', 3)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('WT3', 'FRUI02', 1)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('WT3', 'SPI2', 1)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('WT4', 'FRUI01', 1)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('WT4', 'SPI3', 1)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('WT5', 'FRUI03', 1)
INSERT [dbo].[CheBien] ([MaMA], [MANL], [SoLuong]) VALUES ('WT5', 'SPI2', 1)
GO

-- Bảng CTHD
INSERT [dbo].[CTHD] ([MaHD], [MaMA], [SoLuong]) VALUES ('HD0001', 'BE01', 02)
INSERT [dbo].[CTHD] ([MaHD], [MaMA], [SoLuong]) VALUES ('HD0002', 'CHI01', 02)--250000
INSERT [dbo].[CTHD] ([MaHD], [MaMA], [SoLuong]) VALUES ('HD0003', 'RIC01', 02)--80000
INSERT [dbo].[CTHD] ([MaHD], [MaMA], [SoLuong]) VALUES ('HD0004', 'CHI04', 02)--140000
INSERT [dbo].[CTHD] ([MaHD], [MaMA], [SoLuong]) VALUES ('HD0005', 'STE02', 01)--100000
INSERT [dbo].[CTHD] ([MaHD], [MaMA], [SoLuong]) VALUES ('HD0006', 'WT1', 01)--10000
INSERT [dbo].[CTHD] ([MaHD], [MaMA], [SoLuong]) VALUES ('HD0007', 'STE03', 01)--100000
INSERT [dbo].[CTHD] ([MaHD], [MaMA], [SoLuong]) VALUES ('HD0008', 'STE01', 01)--120000
INSERT [dbo].[CTHD] ([MaHD], [MaMA], [SoLuong]) VALUES ('HD0009', 'CHI03', 03)--165000
INSERT [dbo].[CTHD] ([MaHD], [MaMA], [SoLuong]) VALUES ('HD0010', 'STE03', 01)--100000
INSERT [dbo].[CTHD] ([MaHD], [MaMA], [SoLuong]) VALUES ('HD0011', 'STE02', 01)--100000
INSERT [dbo].[CTHD] ([MaHD], [MaMA], [SoLuong]) VALUES ('HD0012', 'CHI01', 02)--250000
INSERT [dbo].[CTHD] ([MaHD], [MaMA], [SoLuong]) VALUES ('HD0013', 'CHI02', 05)--375000
INSERT [dbo].[CTHD] ([MaHD], [MaMA], [SoLuong]) VALUES ('HD0014', 'CHI04', 02)--140000
INSERT [dbo].[CTHD] ([MaHD], [MaMA], [SoLuong]) VALUES ('HD0015', 'STE02', 03)--300000
INSERT [dbo].[CTHD] ([MaHD], [MaMA], [SoLuong]) VALUES ('HD0016', 'RIC02', 06)--270000
INSERT [dbo].[CTHD] ([MaHD], [MaMA], [SoLuong]) VALUES ('HD0017', 'RIC01', 04)--160000
INSERT [dbo].[CTHD] ([MaHD], [MaMA], [SoLuong]) VALUES ('HD0018', 'BE01', 10)--150000
INSERT [dbo].[CTHD] ([MaHD], [MaMA], [SoLuong]) VALUES ('HD0019', 'STE03', 03)--300000
INSERT [dbo].[CTHD] ([MaHD], [MaMA], [SoLuong]) VALUES ('HD0020', 'CHI04', 03)--210000
INSERT [dbo].[CTHD] ([MaHD], [MaMA], [SoLuong]) VALUES ('HD0021', 'STE03', 05)--500000
INSERT [dbo].[CTHD] ([MaHD], [MaMA], [SoLuong]) VALUES ('HD0022', 'RIC01', 03)--120000
INSERT [dbo].[CTHD] ([MaHD], [MaMA], [SoLuong]) VALUES ('HD0023', 'CHI05', 06)--462000
INSERT [dbo].[CTHD] ([MaHD], [MaMA], [SoLuong]) VALUES ('HD0024', 'BE01', 08)--120000
INSERT [dbo].[CTHD] ([MaHD], [MaMA], [SoLuong]) VALUES ('HD0025', 'WT5', 10)--170000
INSERT [dbo].[CTHD] ([MaHD], [MaMA], [SoLuong]) VALUES ('HD0026', 'WT2', 18)--116000
INSERT [dbo].[CTHD] ([MaHD], [MaMA], [SoLuong]) VALUES ('HD0027', 'WT3', 10)--150000
INSERT [dbo].[CTHD] ([MaHD], [MaMA], [SoLuong]) VALUES ('HD0028', 'CHI04', 3)--210000
INSERT [dbo].[CTHD] ([MaHD], [MaMA], [SoLuong]) VALUES ('HD0029', 'STE02', 3)--300000
INSERT [dbo].[CTHD] ([MaHD], [MaMA], [SoLuong]) VALUES ('HD0030', 'CHI05', 5)--385000
GO

-- Bảng CTPN
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaNL], [SoLuong]) VALUES ('PN0001', 'BUT1', 100)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaNL], [SoLuong]) VALUES ('PN0002', 'FLO1', 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaNL], [SoLuong]) VALUES ('PN0003', 'MEA4', 50)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaNL], [SoLuong]) VALUES ('PN0004', 'SPI3', 20)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaNL], [SoLuong]) VALUES ('PN0005', 'FLO3', 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaNL], [SoLuong]) VALUES ('PN0006', 'MEA6', 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaNL], [SoLuong]) VALUES ('PN0007', 'RIC1', 500)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaNL], [SoLuong]) VALUES ('PN0008', 'FLO1', 120)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaNL], [SoLuong]) VALUES ('PN0008', 'OR1', 120)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaNL], [SoLuong]) VALUES ('PN0009', 'OR1', 120)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaNL], [SoLuong]) VALUES ('PN0010', 'SPI4', 20)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaNL], [SoLuong]) VALUES ('PN0011', 'SPI6', 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaNL], [SoLuong]) VALUES ('PN0012', 'SPI7', 200)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaNL], [SoLuong]) VALUES ('PN0013', 'FLO2', 150)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaNL], [SoLuong]) VALUES ('PN0014', 'OIL1', 10)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaNL], [SoLuong]) VALUES ('PN0015', 'RIC1', 10)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaNL], [SoLuong]) VALUES ('PN0016', 'MEA3', 10)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaNL], [SoLuong]) VALUES ('PN0017', 'MEA2', 15)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaNL], [SoLuong]) VALUES ('PN0018', 'SPI2', 17)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaNL], [SoLuong]) VALUES ('PN0019', 'SPI6', 12)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaNL], [SoLuong]) VALUES ('PN0020', 'RIC1', 18)
INSERT [dbo].[CTPN] ([MaPhieuNhap], [MaNL], [SoLuong]) VALUES ('PN0021', 'OIL2', 2)
GO

-- Bảng CTK
--Miền Bắc
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENBAC','BUT1',10)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENBAC','FLO1',08)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENBAC','FLO2',9)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENBAC','FLO3',13)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENBAC','FLO4',15)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENBAC','FLO5',12)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENBAC','FLO6',14)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENBAC','FLO7',16)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENBAC','FRUI01',09)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENBAC','FRUI02',14)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENBAC','FRUI03',12)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENBAC','MEA1',17)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENBAC','MEA2',19)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENBAC','MEA3',14)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENBAC','MEA4',13)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENBAC','MEA5',15)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENBAC','MEA6',10)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENBAC','OIL1',11)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENBAC','OIL2',09)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENBAC','OR1',08)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENBAC','RIC1',05)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENBAC','SPI1',07)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENBAC','SPI2',08)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENBAC','SPI3',14)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENBAC','SPI4',12)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENBAC','SPI5',11)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENBAC','SPI6',3)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENBAC','SPI7',17)
--Miền Trung
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENTRUNG','BUT1',14)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENTRUNG','FLO1',12)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENTRUNG','FLO2',14)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENTRUNG','FLO3',17)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENTRUNG','FLO4',18)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENTRUNG','FLO5',14)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENTRUNG','FLO6',16)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENTRUNG','FLO7',16)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENTRUNG','FRUI01',11)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENTRUNG','FRUI02',02)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENTRUNG','FRUI03',14)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENTRUNG','MEA1',12)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENTRUNG','MEA2',11)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENTRUNG','MEA3',10)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENTRUNG','MEA4',09)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENTRUNG','MEA5',07)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENTRUNG','MEA6',08)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENTRUNG','OIL1',06)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENTRUNG','OIL2',09)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENTRUNG','OR1',11)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENTRUNG','RIC1',17)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENTRUNG','SPI1',18)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENTRUNG','SPI2',12)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENTRUNG','SPI3',10)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENTRUNG','SPI4',11)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENTRUNG','SPI5',09)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENTRUNG','SPI6',09)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENTRUNG','SPI7',03)
--Miền Nam
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENNAM','BUT1',12)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENNAM','FLO1',15)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENNAM','FLO2',12)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENNAM','FLO3',16)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENNAM','FLO4',18)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENNAM','FLO5',11)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENNAM','FLO6',02)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENNAM','FLO7',10)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENNAM','FRUI01',05)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENNAM','FRUI02',08)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENNAM','FRUI03',07)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENNAM','MEA1',09)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENNAM','MEA2',08)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENNAM','MEA3',05)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENNAM','MEA4',11)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENNAM','MEA5',15)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENNAM','MEA6',13)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENNAM','OIL1',12)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENNAM','OIL2',10)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENNAM','OR1',11)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENNAM','RIC1',09)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENNAM','SPI1',07)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENNAM','SPI2',09)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENNAM','SPI3',06)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENNAM','SPI4',11)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENNAM','SPI5',17)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENNAM','SPI6',11)
INSERT [dbo].[CTK] ([MaCN], [MaNL], [SoLuong]) VALUES('MIENNAM','SPI7',12)

-- Bảng CaLamViec
-- INSERT [dbo].[CaLamViec] ([MaCa], [TenCa], [thoiGian]) VALUES (N'FU1', N'Fulltime sáng', N'6:00 - 14:00')
-- INSERT [dbo].[CaLamViec] ([MaCa], [TenCa], [thoiGian]) VALUES (N'FU2', N'Fulltime chiều', N'14:00 - 22:00')
-- INSERT [dbo].[CaLamViec] ([MaCa], [TenCa], [thoiGian]) VALUES (N'PA1', N'Parttime sáng', N'8:00 - 14:00')
-- INSERT [dbo].[CaLamViec] ([MaCa], [TenCa], [thoiGian]) VALUES (N'PA2', N'Parttime', N'16:00 - 22:00')
-- GO