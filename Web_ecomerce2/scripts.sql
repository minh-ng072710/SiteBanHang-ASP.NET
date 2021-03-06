USE [e_comerce]
GO
/****** Object:  Table [dbo].[CTHD]    Script Date: 27/05/2019 2:15:31 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTHD](
	[MaSP] [int] NOT NULL,
	[MaHD] [int] NOT NULL,
	[SoLuong] [nchar](10) NULL,
	[Gia] [float] NULL,
 CONSTRAINT [PK_CTHD] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC,
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 27/05/2019 2:15:31 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[IdDanhMuc] [nvarchar](50) NOT NULL,
	[TenDanhMuc] [nvarchar](50) NULL,
 CONSTRAINT [PK_DanhMuc] PRIMARY KEY CLUSTERED 
(
	[IdDanhMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 27/05/2019 2:15:31 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NULL,
	[NgayGD] [nchar](10) NULL,
	[TongTien] [float] NULL,
	[TrangThai] [nchar](10) NULL,
	[NgayNhan] [nchar](10) NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 27/05/2019 2:15:31 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 27/05/2019 2:15:31 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](50) NULL,
	[Gia] [float] NULL,
	[HA] [text] NULL,
	[SL] [nvarchar](50) NULL,
	[IdDanhMuc] [nvarchar](50) NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[DanhMuc] ([IdDanhMuc], [TenDanhMuc]) VALUES (N'1         ', N'Bàn làm việc        ')
INSERT [dbo].[DanhMuc] ([IdDanhMuc], [TenDanhMuc]) VALUES (N'2         ', N'Ghế gia đình        ')
INSERT [dbo].[DanhMuc] ([IdDanhMuc], [TenDanhMuc]) VALUES (N'3         ', N'Ghế làm việc        ')
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [SDT], [Email], [MatKhau]) VALUES (12, N'meomeo', N'asdasd', N'0915697297', N'sang@gmail.com', N'202cb962ac59075b964b07152d234b70')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [HA], [SL], [IdDanhMuc]) VALUES (1, N'Ghế Xoay Văn Phòng', 300000, N'images/item2.jpg', N'4', N'3')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [HA], [SL], [IdDanhMuc]) VALUES (2, N'Ghế Mây Tre', 800000, N'images/item1.jpg', N'3', N'2')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [HA], [SL], [IdDanhMuc]) VALUES (3, N'Ghế sofa', 600000, N'images/item5.jpg', N'8', N'2')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [HA], [SL], [IdDanhMuc]) VALUES (4, N'Ghế Eames Kachi chân sắt  E10', 500000, N'images/item6.jpg', N'6', N'2')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [HA], [SL], [IdDanhMuc]) VALUES (5, N'Bàn kính', 800000, N'images/item4.jpg', N'7', N'1')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [HA], [SL], [IdDanhMuc]) VALUES (6, N'Ghế xoay nhựa ', 500, N'images/pic5.jpg', N'5', N'3')
SET IDENTITY_INSERT [dbo].[SanPham] OFF
ALTER TABLE [dbo].[CTHD]  WITH CHECK ADD  CONSTRAINT [FK_CTHD_HoaDon] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[CTHD] CHECK CONSTRAINT [FK_CTHD_HoaDon]
GO
ALTER TABLE [dbo].[CTHD]  WITH CHECK ADD  CONSTRAINT [FK_CTHD_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[CTHD] CHECK CONSTRAINT [FK_CTHD_SanPham]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhachHang]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_DanhMuc] FOREIGN KEY([IdDanhMuc])
REFERENCES [dbo].[DanhMuc] ([IdDanhMuc])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_DanhMuc]
GO
