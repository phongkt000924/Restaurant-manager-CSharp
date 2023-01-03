USE [master]
GO
/****** Object:  Database [QuanlyQuanan]    Script Date: 6/4/2021 3:56:55 PM ******/
CREATE DATABASE [QuanlyQuanan]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanlyQuanan', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QuanlyQuanan.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanlyQuanan_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QuanlyQuanan_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuanlyQuanan] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanlyQuanan].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanlyQuanan] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanlyQuanan] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanlyQuanan] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanlyQuanan] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanlyQuanan] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanlyQuanan] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanlyQuanan] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QuanlyQuanan] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanlyQuanan] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanlyQuanan] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanlyQuanan] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanlyQuanan] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanlyQuanan] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanlyQuanan] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanlyQuanan] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanlyQuanan] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanlyQuanan] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanlyQuanan] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanlyQuanan] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanlyQuanan] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanlyQuanan] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanlyQuanan] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanlyQuanan] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanlyQuanan] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanlyQuanan] SET  MULTI_USER 
GO
ALTER DATABASE [QuanlyQuanan] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanlyQuanan] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanlyQuanan] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanlyQuanan] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [QuanlyQuanan]
GO
/****** Object:  Table [dbo].[ban]    Script Date: 6/4/2021 3:56:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ban](
	[soban] [int] NOT NULL,
	[loaiban] [int] NULL,
	[controng] [bit] NULL,
	[bihu] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[soban] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dshd]    Script Date: 6/4/2021 3:56:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dshd](
	[idmon] [int] NULL,
	[idhoadon] [varchar](15) NULL,
	[dongia] [int] NULL,
	[soluong] [int] NULL,
	[giamgia] [int] NULL,
	[tongtien] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[hoadon]    Script Date: 6/4/2021 3:56:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[hoadon](
	[idhoadon] [varchar](15) NOT NULL,
	[tongtien] [int] NOT NULL,
	[checkin] [datetime] NOT NULL,
	[checkout] [datetime] NULL,
	[soban] [int] NULL,
	[idnv] [varchar](15) NULL,
	[giamgia] [int] NULL,
	[dathanhtoan] [int] NULL,
	[thuctra] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idhoadon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[loai]    Script Date: 6/4/2021 3:56:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loai](
	[idloai] [int] NOT NULL,
	[tenloai] [nvarchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idloai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[loaiban]    Script Date: 6/4/2021 3:56:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loaiban](
	[idloaiban] [int] NOT NULL,
	[tenloai] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[idloaiban] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[taikhoan]    Script Date: 6/4/2021 3:56:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[taikhoan](
	[idnv] [varchar](15) NOT NULL,
	[pass] [varchar](15) NOT NULL,
	[nameDP] [nvarchar](50) NULL,
	[loai] [bit] NOT NULL,
	[ban] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idnv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[thucdon]    Script Date: 6/4/2021 3:56:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[thucdon](
	[id] [int] NOT NULL,
	[ten] [nvarchar](40) NOT NULL,
	[gia] [int] NULL,
	[ngungban] [bit] NULL,
	[loai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[ban] ([soban], [loaiban], [controng], [bihu]) VALUES (1, 1, 1, 0)
INSERT [dbo].[ban] ([soban], [loaiban], [controng], [bihu]) VALUES (2, 1, 1, 0)
INSERT [dbo].[ban] ([soban], [loaiban], [controng], [bihu]) VALUES (3, 1, 1, 0)
INSERT [dbo].[ban] ([soban], [loaiban], [controng], [bihu]) VALUES (4, 1, 1, 0)
INSERT [dbo].[ban] ([soban], [loaiban], [controng], [bihu]) VALUES (5, 2, 1, 0)
INSERT [dbo].[ban] ([soban], [loaiban], [controng], [bihu]) VALUES (6, 2, 1, 0)
INSERT [dbo].[ban] ([soban], [loaiban], [controng], [bihu]) VALUES (7, 2, 1, 0)
INSERT [dbo].[ban] ([soban], [loaiban], [controng], [bihu]) VALUES (8, 2, 1, 0)
INSERT [dbo].[ban] ([soban], [loaiban], [controng], [bihu]) VALUES (9, 3, 1, 0)
INSERT [dbo].[ban] ([soban], [loaiban], [controng], [bihu]) VALUES (10, 3, 1, 0)
INSERT [dbo].[ban] ([soban], [loaiban], [controng], [bihu]) VALUES (11, 3, 1, 0)
INSERT [dbo].[ban] ([soban], [loaiban], [controng], [bihu]) VALUES (12, 3, 1, 0)
INSERT [dbo].[ban] ([soban], [loaiban], [controng], [bihu]) VALUES (13, 4, 1, 0)
INSERT [dbo].[ban] ([soban], [loaiban], [controng], [bihu]) VALUES (14, 4, 1, 0)
INSERT [dbo].[ban] ([soban], [loaiban], [controng], [bihu]) VALUES (15, 4, 1, 0)
INSERT [dbo].[ban] ([soban], [loaiban], [controng], [bihu]) VALUES (16, 4, 1, 0)
INSERT [dbo].[ban] ([soban], [loaiban], [controng], [bihu]) VALUES (17, 5, 1, 0)
INSERT [dbo].[ban] ([soban], [loaiban], [controng], [bihu]) VALUES (18, 5, 1, 0)
INSERT [dbo].[ban] ([soban], [loaiban], [controng], [bihu]) VALUES (19, 5, 1, 1)
INSERT [dbo].[ban] ([soban], [loaiban], [controng], [bihu]) VALUES (20, 5, 1, 1)
INSERT [dbo].[ban] ([soban], [loaiban], [controng], [bihu]) VALUES (21, 6, 1, 0)
INSERT [dbo].[ban] ([soban], [loaiban], [controng], [bihu]) VALUES (22, 6, 1, 1)
INSERT [dbo].[ban] ([soban], [loaiban], [controng], [bihu]) VALUES (23, 6, 1, 0)
INSERT [dbo].[ban] ([soban], [loaiban], [controng], [bihu]) VALUES (24, 6, 1, 0)
INSERT [dbo].[ban] ([soban], [loaiban], [controng], [bihu]) VALUES (25, 7, 1, 0)
INSERT [dbo].[ban] ([soban], [loaiban], [controng], [bihu]) VALUES (26, 7, 1, 0)
INSERT [dbo].[ban] ([soban], [loaiban], [controng], [bihu]) VALUES (27, 4, 1, 0)
INSERT [dbo].[ban] ([soban], [loaiban], [controng], [bihu]) VALUES (28, 7, 1, 0)
INSERT [dbo].[ban] ([soban], [loaiban], [controng], [bihu]) VALUES (33, 7, 1, 0)
INSERT [dbo].[ban] ([soban], [loaiban], [controng], [bihu]) VALUES (44, 2, 1, 1)
INSERT [dbo].[ban] ([soban], [loaiban], [controng], [bihu]) VALUES (55, 7, 1, 0)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (1, N'202106011', 345000, 5, 0, 345000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (7, N'202106024', 80000, 2, 0, 80000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (5, N'2021060418', 30000, 1, 0, 30000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (4, N'2021060428', 96000, 1, 0, 96000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (16, N'202106011', 40000, 1, 0, 40000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (14, N'202106011', 30000, 1, 50, 15000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (8, N'2021060428', 120000, 3, 5, 114000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (19, N'202106013', 180000, 1, 0, 180000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (21, N'202106013', 120000, 1, 15, 102000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (4, N'2021060429', 96000, 1, 0, 96000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (8, N'2021060429', 40000, 1, 0, 40000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (3, N'202106041', 276000, 4, 0, 276000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (11, N'202106015', 160000, 4, 0, 160000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (8, N'202106022', 40000, 1, 0, 40000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (1, N'202106012', 69000, 1, 10, 62000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (37, N'202106025', 10000, 1, 0, 10000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (8, N'202106025', 40000, 1, 0, 40000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (7, N'202106025', 40000, 1, 0, 40000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (5, N'202106025', 30000, 1, 0, 30000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (1, N'202106018', 69000, 1, 0, 69000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (11, N'202106025', 40000, 1, 0, 40000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (11, N'202106022', 40000, 1, 0, 40000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (2, N'2021060429', 96000, 1, 0, 96000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (5, N'202106022', 30000, 1, 0, 30000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (5, N'2021060429', 30000, 1, 0, 30000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (5, N'202106026', 30000, 1, 0, 30000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (6, N'202106026', 30000, 1, 0, 30000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (3, N'2021060418', 69000, 1, 0, 69000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (6, N'2021060420', 30000, 1, 0, 30000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (3, N'2021060420', 69000, 1, 0, 69000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (14, N'2021060118', 30000, 1, 0, 30000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (10, N'2021060129', 160000, 4, 0, 160000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (14, N'2021060143', 30000, 1, 0, 30000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (7, N'202106028', 40000, 1, 0, 40000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (7, N'202106031', 40000, 1, 0, 40000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (1, N'202106032', 69000, 1, 10, 62000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (3, N'202106032', 69000, 1, 0, 69000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (10, N'202106032', 40000, 1, 10, 36000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (5, N'2021052310', 60000, 2, 0, 60000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (3, N'2021052310', 69000, 1, 0, 69000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (6, N'2021052310', 30000, 1, 0, 30000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (7, N'2021052311', 40000, 1, 0, 40000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (27, N'2021052311', 16000, 2, 0, 16000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (25, N'202105234', 8000, 2, 0, 8000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (27, N'2021052312', 8000, 1, 0, 8000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (3, N'2021052312', 138000, 2, 0, 138000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (5, N'2021052312', 30000, 1, 0, 30000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (3, N'2021052313', 69000, 1, 0, 69000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (1, N'2021052313', 69000, 1, 0, 69000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (8, N'2021052317', 80000, 2, 0, 80000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (3, N'2021052317', 69000, 1, 0, 69000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (7, N'2021052317', 40000, 1, 0, 40000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (12, N'2021052317', 40000, 1, 0, 40000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (11, N'2021052317', 40000, 1, 0, 40000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (10, N'2021052316', 40000, 1, 0, 40000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (3, N'2021052316', 69000, 1, 0, 69000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (7, N'2021052316', 80000, 2, 0, 80000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (5, N'2021052316', 30000, 1, 0, 30000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (6, N'2021052316', 30000, 1, 0, 30000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (30, N'2021052316', 15000, 1, 0, 15000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (30, N'202105234', 30000, 2, 0, 30000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (28, N'2021052316', 8000, 1, 0, 8000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (30, N'2021052314', 15000, 1, 0, 15000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (5, N'2021052314', 30000, 1, 0, 30000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (6, N'2021052314', 30000, 1, 0, 30000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (7, N'2021052314', 40000, 1, 0, 40000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (1, N'2021052314', 69000, 1, 0, 69000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (3, N'2021052329', 207000, 3, 0, 207000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (1, N'2021052330', 138000, 2, 0, 138000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (6, N'2021052323', 90000, 3, 0, 90000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (3, N'2021052315', 207000, 3, 0, 207000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (5, N'2021052319', 90000, 3, 0, 90000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (8, N'2021052319', 120000, 3, 0, 120000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (6, N'2021052318', 90000, 3, 0, 90000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (10, N'2021052318', 120000, 3, 0, 120000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (6, N'2021052320', 90000, 3, 0, 90000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (25, N'2021052331', 12000, 3, 0, 12000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (38, N'202105235', 40000, 2, 0, 40000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (15, N'2021052321', 90000, 3, 0, 90000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (16, N'2021052321', 80000, 2, 0, 80000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (3, N'2021052321', 207000, 3, 0, 207000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (5, N'2021052322', 60000, 2, 0, 60000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (6, N'202105231', 60000, 2, 0, 60000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (3, N'202105231', 69000, 1, 0, 69000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (3, N'202105232', 138000, 2, 0, 138000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (1, N'2021052324', 207000, 3, 0, 207000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (10, N'2021052325', 80000, 2, 0, 80000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (12, N'2021052326', 80000, 2, 0, 80000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (6, N'2021052326', 60000, 2, 0, 60000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (35, N'2021052327', 20000, 2, 0, 20000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (15, N'202105235', 90000, 3, 0, 90000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (17, N'2021052327', 100000, 2, 0, 100000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (30, N'2021052328', 30000, 2, 0, 30000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (14, N'2021052328', 60000, 2, 0, 60000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (27, N'2021052328', 16000, 2, 0, 16000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (14, N'202105239', 90000, 3, 0, 90000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (14, N'202105233', 90000, 3, 0, 90000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (30, N'202105233', 45000, 3, 0, 45000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (25, N'202105239', 12000, 3, 0, 12000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (38, N'202105238', 40000, 2, 0, 40000)
GO
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (15, N'202105238', 90000, 3, 0, 90000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (39, N'202105237', 60000, 2, 0, 60000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (14, N'202105237', 90000, 3, 0, 90000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (39, N'202105236', 60000, 2, 0, 60000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (15, N'202105236', 90000, 3, 0, 90000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (3, N'2021052332', 69000, 1, 0, 69000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (6, N'2021052333', 30000, 1, 0, 30000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (3, N'2021052333', 69000, 1, 0, 69000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (7, N'2021052334', 40000, 1, 0, 40000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (3, N'2021052334', 69000, 1, 0, 69000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (10, N'2021052334', 40000, 1, 0, 40000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (8, N'2021052334', 40000, 1, 0, 40000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (6, N'2021052335', 30000, 1, 0, 30000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (5, N'2021052335', 30000, 1, 0, 30000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (5, N'2021052336', 30000, 1, 0, 30000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (6, N'2021052336', 30000, 1, 0, 30000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (30, N'2021052337', 30000, 2, 0, 30000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (17, N'2021052337', 50000, 1, 0, 50000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (3, N'2021052337', 69000, 1, 0, 69000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (1, N'2021052337', 69000, 1, 0, 69000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (1, N'2021052339', 69000, 1, 0, 69000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (3, N'2021052339', 69000, 1, 0, 69000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (3, N'2021052340', 69000, 1, 0, 69000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (5, N'2021052341', 30000, 1, 0, 30000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (7, N'2021052346', 40000, 1, 0, 40000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (1, N'2021052343', 69000, 1, 0, 69000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (1, N'2021052342', 69000, 1, 0, 69000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (6, N'2021052347', 30000, 1, 0, 30000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (1, N'2021052364', 69000, 1, 0, 69000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (5, N'2021052364', 30000, 1, 0, 30000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (3, N'2021052364', 138000, 2, 0, 138000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (5, N'2021052360', 30000, 1, 0, 30000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (3, N'2021052360', 69000, 1, 0, 69000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (1, N'2021052360', 69000, 1, 0, 69000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (6, N'2021052364', 30000, 1, 0, 30000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (3, N'2021052363', 69000, 1, 0, 69000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (1, N'2021052363', 69000, 1, 0, 69000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (7, N'2021052363', 40000, 1, 0, 40000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (3, N'2021052353', 138000, 2, 0, 138000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (7, N'2021052353', 40000, 1, 0, 40000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (8, N'2021052354', 40000, 1, 0, 40000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (6, N'2021052354', 30000, 1, 0, 30000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (3, N'2021052354', 69000, 1, 0, 69000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (5, N'2021052362', 120000, 4, 0, 120000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (3, N'2021052358', 207000, 3, 0, 207000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (1, N'2021052348', 207000, 3, 0, 207000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (3, N'2021052359', 138000, 2, 0, 138000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (6, N'2021052356', 30000, 1, 0, 30000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (6, N'2021052366', 30000, 1, 0, 30000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (1, N'2021052365', 69000, 1, 0, 69000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (3, N'2021052357', 69000, 1, 0, 69000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (3, N'2021052352', 69000, 1, 0, 69000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (33, N'2021052367', 70000, 7, 0, 70000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (1, N'2021052367', 69000, 1, 0, 69000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (1, N'2021052368', 138000, 2, 0, 138000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (34, N'2021052368', 50000, 5, 0, 50000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (33, N'2021052368', 200000, 20, 0, 200000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (3, N'2021052411', 138000, 2, 0, 138000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (1, N'202105241', 138000, 2, 0, 138000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (6, N'2021052410', 90000, 3, 0, 90000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (3, N'202105243', 207000, 3, 0, 207000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (5, N'202105244', 120000, 4, 0, 120000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (19, N'202105245', 540000, 3, 0, 540000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (19, N'202105244', 540000, 3, 0, 540000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (18, N'202105249', 290000, 2, 0, 290000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (21, N'2021052410', 240000, 2, 0, 240000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (23, N'202105247', 280000, 2, 0, 280000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (18, N'202105246', 290000, 2, 0, 290000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (30, N'202105248', 45000, 3, 0, 45000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (23, N'2021052412', 420000, 3, 0, 420000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (15, N'2021052413', 30000, 1, 0, 30000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (18, N'2021052414', 145000, 1, 0, 145000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (30, N'2021052415', 15000, 1, 0, 15000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (7, N'2021052416', 40000, 1, 0, 40000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (11, N'2021052417', 40000, 1, 0, 40000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (21, N'2021052421', 120000, 1, 0, 120000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (10, N'2021052422', 40000, 1, 0, 40000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (7, N'2021052420', 40000, 1, 0, 40000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (2, N'2021060427', 96000, 1, 0, 96000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (17, N'2021052418', 50000, 1, 0, 50000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (1, N'2021052423', 69000, 1, 0, 69000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (3, N'2021060427', 276000, 4, 0, 276000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (22, N'2021052425', 70000, 1, 0, 70000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (17, N'2021052426', 50000, 1, 0, 50000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (1, N'2021052427', 69000, 1, 0, 69000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (7, N'202106041', 120000, 3, 0, 120000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (3, N'202106043', 69000, 1, 0, 69000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (6, N'202106043', 30000, 1, 0, 30000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (6, N'202106042', 30000, 1, 0, 30000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (3, N'202106045', 69000, 1, 0, 69000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (2, N'2021060425', 96000, 1, 0, 96000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (1, N'2021060411', 207000, 3, 0, 207000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (6, N'2021060411', 30000, 1, 0, 30000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (29, N'2021060411', 15000, 1, 0, 15000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (25, N'2021060411', 4000, 1, 0, 4000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (5, N'2021060415', 60000, 2, 0, 60000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (3, N'2021060415', 69000, 1, 0, 69000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (5, N'2021060425', 90000, 3, 0, 90000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (4, N'2021060417', 96000, 1, 0, 96000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (4, N'2021060421', 96000, 1, 0, 96000)
GO
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (7, N'2021060425', 80000, 2, 0, 80000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (3, N'2021060419', 69000, 1, 0, 69000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (6, N'2021060419', 30000, 1, 0, 30000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (1, N'2021060422', 69000, 1, 0, 69000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (6, N'2021060422', 30000, 1, 0, 30000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (3, N'2021060423', 138000, 2, 5, 131000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (4, N'2021060423', 96000, 1, 0, 96000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (5, N'2021060423', 30000, 1, 0, 30000)
INSERT [dbo].[dshd] ([idmon], [idhoadon], [dongia], [soluong], [giamgia], [tongtien]) VALUES (4, N'2021060425', 96000, 1, 0, 96000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202105231', 129000, CAST(N'2021-05-23 16:00:34.000' AS DateTime), CAST(N'2021-05-23 16:07:03.000' AS DateTime), 0, N'1', 0, 1, 129000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052310', 351000, CAST(N'2021-05-23 16:00:46.000' AS DateTime), CAST(N'2021-05-23 16:07:21.000' AS DateTime), 1, N'1', 0, 1, 351000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052311', 440000, CAST(N'2021-05-23 16:00:47.000' AS DateTime), CAST(N'2021-05-23 16:07:24.000' AS DateTime), 2, N'1', 0, 1, 440000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052312', 176000, CAST(N'2021-05-23 16:00:49.000' AS DateTime), CAST(N'2021-05-23 16:42:48.000' AS DateTime), 3, N'1', 0, 1, 176000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052313', 330000, CAST(N'2021-05-23 16:00:49.000' AS DateTime), CAST(N'2021-05-23 16:42:46.000' AS DateTime), 4, N'1', 0, 1, 330000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052314', 184000, CAST(N'2021-05-23 16:00:51.000' AS DateTime), CAST(N'2021-05-23 16:07:26.000' AS DateTime), 9, N'1', 0, 1, 184000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052315', 207000, CAST(N'2021-05-23 16:00:52.000' AS DateTime), CAST(N'2021-05-23 16:42:53.000' AS DateTime), 13, N'1', 0, 1, 207000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052316', 560000, CAST(N'2021-05-23 16:00:53.000' AS DateTime), CAST(N'2021-05-23 16:42:44.000' AS DateTime), 8, N'1', 0, 1, 560000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052317', 557000, CAST(N'2021-05-23 16:00:54.000' AS DateTime), CAST(N'2021-05-23 16:42:49.000' AS DateTime), 7, N'1', 0, 1, 557000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052318', 210000, CAST(N'2021-05-23 16:00:56.000' AS DateTime), CAST(N'2021-05-23 16:42:59.000' AS DateTime), 18, N'1', 0, 1, 210000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052319', 210000, CAST(N'2021-05-23 16:00:57.000' AS DateTime), CAST(N'2021-05-23 16:42:54.000' AS DateTime), 14, N'1', 0, 1, 210000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202105232', 138000, CAST(N'2021-05-23 16:00:35.000' AS DateTime), CAST(N'2021-05-23 16:07:05.000' AS DateTime), 0, N'1', 0, 1, 138000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052320', 498000, CAST(N'2021-05-23 16:00:59.000' AS DateTime), CAST(N'2021-05-23 16:42:57.000' AS DateTime), 21, N'1', 0, 1, 498000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052321', 377000, CAST(N'2021-05-23 16:01:01.000' AS DateTime), CAST(N'2021-05-23 16:43:04.000' AS DateTime), 26, N'1', 0, 1, 377000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052322', 444000, CAST(N'2021-05-23 16:01:03.000' AS DateTime), CAST(N'2021-05-23 16:43:02.000' AS DateTime), 27, N'1', 0, 1, 444000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052323', 90000, CAST(N'2021-05-23 16:01:04.000' AS DateTime), CAST(N'2021-05-23 16:42:51.000' AS DateTime), 12, N'1', 0, 1, 90000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052324', 207000, CAST(N'2021-05-23 16:01:15.000' AS DateTime), CAST(N'2021-05-23 16:07:08.000' AS DateTime), 0, N'1', 0, 1, 207000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052325', 272000, CAST(N'2021-05-23 16:01:16.000' AS DateTime), CAST(N'2021-05-23 16:07:18.000' AS DateTime), 0, N'1', 0, 1, 272000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052326', 428000, CAST(N'2021-05-23 16:01:17.000' AS DateTime), CAST(N'2021-05-23 16:07:18.000' AS DateTime), 0, N'1', 0, 1, 428000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052327', 120000, CAST(N'2021-05-23 16:01:17.000' AS DateTime), CAST(N'2021-05-23 16:07:17.000' AS DateTime), 0, N'1', 0, 1, 120000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052328', 106000, CAST(N'2021-05-23 16:01:18.000' AS DateTime), CAST(N'2021-05-23 16:07:16.000' AS DateTime), 0, N'1', 0, 1, 106000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052329', 207000, CAST(N'2021-05-23 16:01:25.000' AS DateTime), CAST(N'2021-05-23 16:07:28.000' AS DateTime), 10, N'1', 0, 1, 207000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202105233', 135000, CAST(N'2021-05-23 16:00:36.000' AS DateTime), CAST(N'2021-05-23 16:07:16.000' AS DateTime), 0, N'1', 0, 1, 135000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052330', 138000, CAST(N'2021-05-23 16:01:26.000' AS DateTime), CAST(N'2021-05-23 16:43:00.000' AS DateTime), 11, N'1', 0, 1, 138000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052331', 204000, CAST(N'2021-05-23 16:01:28.000' AS DateTime), CAST(N'2021-05-23 16:42:56.000' AS DateTime), 23, N'1', 0, 1, 204000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052332', 261000, CAST(N'2021-05-23 18:43:12.000' AS DateTime), CAST(N'2021-05-23 18:50:45.000' AS DateTime), 0, N'1', 0, 1, 261000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052333', 195000, CAST(N'2021-05-23 18:43:12.000' AS DateTime), CAST(N'2021-05-23 18:50:54.000' AS DateTime), 0, N'1', 0, 1, 195000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052334', 189000, CAST(N'2021-05-23 18:43:13.000' AS DateTime), CAST(N'2021-05-23 18:50:54.000' AS DateTime), 0, N'1', 0, 1, 189000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052335', 252000, CAST(N'2021-05-23 18:43:14.000' AS DateTime), CAST(N'2021-05-23 18:50:53.000' AS DateTime), 0, N'1', 0, 1, 252000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052336', 252000, CAST(N'2021-05-23 18:43:14.000' AS DateTime), CAST(N'2021-05-23 18:50:52.000' AS DateTime), 0, N'1', 0, 1, 252000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052337', 218000, CAST(N'2021-05-23 18:43:15.000' AS DateTime), CAST(N'2021-05-23 18:50:52.000' AS DateTime), 0, N'1', 0, 1, 218000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052338', 96000, CAST(N'2021-05-23 18:43:15.000' AS DateTime), CAST(N'2021-05-23 18:50:51.000' AS DateTime), 0, N'1', 0, 1, 96000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052339', 138000, CAST(N'2021-05-23 18:43:16.000' AS DateTime), CAST(N'2021-05-23 18:50:50.000' AS DateTime), 0, N'1', 0, 1, 138000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202105234', 38000, CAST(N'2021-05-23 16:00:37.000' AS DateTime), CAST(N'2021-05-23 16:07:15.000' AS DateTime), 0, N'1', 0, 1, 38000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052340', 165000, CAST(N'2021-05-23 18:43:16.000' AS DateTime), CAST(N'2021-05-23 18:50:50.000' AS DateTime), 0, N'1', 0, 1, 165000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052341', 126000, CAST(N'2021-05-23 18:43:17.000' AS DateTime), CAST(N'2021-05-23 18:50:49.000' AS DateTime), 0, N'1', 0, 1, 126000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052342', 69000, CAST(N'2021-05-23 18:43:17.000' AS DateTime), CAST(N'2021-05-23 18:50:49.000' AS DateTime), 0, N'1', 0, 1, 69000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052343', 69000, CAST(N'2021-05-23 18:43:18.000' AS DateTime), CAST(N'2021-05-23 18:50:48.000' AS DateTime), 0, N'1', 0, 1, 69000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052344', 96000, CAST(N'2021-05-23 18:43:18.000' AS DateTime), CAST(N'2021-05-23 18:50:47.000' AS DateTime), 0, N'1', 0, 1, 96000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052345', 96000, CAST(N'2021-05-23 18:43:19.000' AS DateTime), CAST(N'2021-05-23 18:50:47.000' AS DateTime), 0, N'1', 0, 1, 96000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052346', 40000, CAST(N'2021-05-23 18:43:20.000' AS DateTime), CAST(N'2021-05-23 18:50:46.000' AS DateTime), 0, N'1', 0, 1, 40000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052347', 222000, CAST(N'2021-05-23 18:43:25.000' AS DateTime), CAST(N'2021-05-23 19:31:21.000' AS DateTime), 1, N'1', 0, 1, 222000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052348', 207000, CAST(N'2021-05-23 18:43:28.000' AS DateTime), CAST(N'2021-05-23 19:31:44.000' AS DateTime), 6, N'1', 0, 1, 207000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052349', 192000, CAST(N'2021-05-23 18:43:29.000' AS DateTime), CAST(N'2021-05-23 19:31:46.000' AS DateTime), 11, N'1', 0, 1, 192000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202105235', 130000, CAST(N'2021-05-23 16:00:37.000' AS DateTime), CAST(N'2021-05-23 16:07:14.000' AS DateTime), 0, N'1', 0, 1, 130000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052350', 96000, CAST(N'2021-05-23 18:43:30.000' AS DateTime), CAST(N'2021-05-23 19:31:47.000' AS DateTime), 16, N'1', 0, 1, 96000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052351', 96000, CAST(N'2021-05-23 18:43:33.000' AS DateTime), CAST(N'2021-05-23 19:31:49.000' AS DateTime), 24, N'1', 0, 1, 96000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052352', 0, CAST(N'2021-05-23 18:43:35.000' AS DateTime), CAST(N'2021-05-23 18:43:35.000' AS DateTime), 33, N'1', 0, 2, 0)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052353', 274000, CAST(N'2021-05-23 18:43:36.000' AS DateTime), CAST(N'2021-05-23 19:31:27.000' AS DateTime), 5, N'1', 0, 1, 274000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052354', 139000, CAST(N'2021-05-23 18:43:37.000' AS DateTime), CAST(N'2021-05-23 19:31:28.000' AS DateTime), 10, N'1', 0, 1, 139000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052355', 192000, CAST(N'2021-05-23 18:43:38.000' AS DateTime), CAST(N'2021-05-23 19:31:30.000' AS DateTime), 15, N'1', 0, 1, 192000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052356', 30000, CAST(N'2021-05-23 18:43:39.000' AS DateTime), CAST(N'2021-05-23 19:31:41.000' AS DateTime), 23, N'1', 0, 1, 30000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052357', 69000, CAST(N'2021-05-23 18:43:41.000' AS DateTime), CAST(N'2021-05-23 19:31:42.000' AS DateTime), 28, N'1', 0, 1, 69000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052358', 207000, CAST(N'2021-05-23 18:43:42.000' AS DateTime), CAST(N'2021-05-23 19:31:35.000' AS DateTime), 8, N'1', 0, 1, 207000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052359', 138000, CAST(N'2021-05-23 18:43:43.000' AS DateTime), CAST(N'2021-05-23 19:31:32.000' AS DateTime), 14, N'1', 0, 1, 138000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202105236', 150000, CAST(N'2021-05-23 16:00:38.000' AS DateTime), CAST(N'2021-05-23 16:07:13.000' AS DateTime), 0, N'1', 0, 1, 150000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052360', 168000, CAST(N'2021-05-23 18:43:44.000' AS DateTime), CAST(N'2021-05-23 19:31:23.000' AS DateTime), 2, N'1', 0, 1, 168000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052361', 192000, CAST(N'2021-05-23 18:43:46.000' AS DateTime), CAST(N'2021-05-23 19:31:36.000' AS DateTime), 13, N'1', 0, 1, 192000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052362', 120000, CAST(N'2021-05-23 18:43:47.000' AS DateTime), CAST(N'2021-05-23 19:31:33.000' AS DateTime), 9, N'1', 0, 1, 120000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052363', 466000, CAST(N'2021-05-23 18:43:48.000' AS DateTime), CAST(N'2021-05-23 19:31:26.000' AS DateTime), 4, N'1', 0, 1, 466000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052364', 363000, CAST(N'2021-05-23 18:43:49.000' AS DateTime), CAST(N'2021-05-23 19:31:24.000' AS DateTime), 3, N'1', 0, 1, 363000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052365', 69000, CAST(N'2021-05-23 18:43:50.000' AS DateTime), CAST(N'2021-05-23 19:31:37.000' AS DateTime), 18, N'1', 0, 1, 69000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052366', 30000, CAST(N'2021-05-23 18:43:52.000' AS DateTime), CAST(N'2021-05-23 19:31:39.000' AS DateTime), 21, N'1', 0, 1, 30000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052367', 331000, CAST(N'2021-05-23 19:32:00.000' AS DateTime), CAST(N'2021-05-23 19:53:02.000' AS DateTime), 4, N'1', 0, 1, 331000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052368', 388000, CAST(N'2021-05-23 19:32:20.000' AS DateTime), CAST(N'2021-05-23 19:53:05.000' AS DateTime), 8, N'1', 0, 1, 388000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202105237', 150000, CAST(N'2021-05-23 16:00:39.000' AS DateTime), CAST(N'2021-05-23 16:07:12.000' AS DateTime), 0, N'1', 0, 1, 150000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202105238', 130000, CAST(N'2021-05-23 16:00:39.000' AS DateTime), CAST(N'2021-05-23 16:07:11.000' AS DateTime), 0, N'1', 0, 1, 130000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202105239', 102000, CAST(N'2021-05-23 16:00:40.000' AS DateTime), CAST(N'2021-05-23 16:07:09.000' AS DateTime), 0, N'1', 0, 1, 102000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202105241', 234000, CAST(N'2021-05-24 18:54:20.000' AS DateTime), CAST(N'2021-05-24 19:48:18.000' AS DateTime), 4, N'1', 0, 1, 234000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052410', 330000, CAST(N'2021-05-24 18:54:30.000' AS DateTime), CAST(N'2021-05-24 19:48:26.000' AS DateTime), 15, N'1', 0, 1, 330000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052411', 138000, CAST(N'2021-05-24 18:54:31.000' AS DateTime), CAST(N'2021-05-24 19:48:20.000' AS DateTime), 10, N'1', 0, 1, 138000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052412', 420000, CAST(N'2021-05-24 18:54:33.000' AS DateTime), CAST(N'2021-05-24 19:48:35.000' AS DateTime), 26, N'1', 0, 1, 420000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052413', 30000, CAST(N'2021-05-24 18:54:35.000' AS DateTime), CAST(N'2021-05-24 19:03:59.000' AS DateTime), 0, N'1', 0, 1, 30000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052414', 145000, CAST(N'2021-05-24 18:54:36.000' AS DateTime), CAST(N'2021-05-24 19:04:07.000' AS DateTime), 0, N'1', 0, 1, 145000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052415', 15000, CAST(N'2021-05-24 18:54:36.000' AS DateTime), CAST(N'2021-05-24 19:04:07.000' AS DateTime), 0, N'1', 0, 1, 15000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052416', 40000, CAST(N'2021-05-24 18:54:37.000' AS DateTime), CAST(N'2021-05-24 19:04:06.000' AS DateTime), 0, N'1', 0, 1, 40000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052417', 40000, CAST(N'2021-05-24 18:54:37.000' AS DateTime), CAST(N'2021-05-24 19:04:05.000' AS DateTime), 0, N'1', 0, 1, 40000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052418', 50000, CAST(N'2021-05-24 18:54:38.000' AS DateTime), CAST(N'2021-05-24 19:04:05.000' AS DateTime), 0, N'1', 0, 1, 50000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052419', 96000, CAST(N'2021-05-24 18:54:39.000' AS DateTime), CAST(N'2021-05-24 19:04:04.000' AS DateTime), 0, N'1', 0, 1, 96000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202105242', 192000, CAST(N'2021-05-24 18:54:21.000' AS DateTime), CAST(N'2021-05-24 19:48:21.000' AS DateTime), 9, N'1', 0, 1, 192000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052420', 40000, CAST(N'2021-05-24 18:54:39.000' AS DateTime), CAST(N'2021-05-24 19:04:04.000' AS DateTime), 0, N'1', 0, 1, 40000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052421', 120000, CAST(N'2021-05-24 18:54:40.000' AS DateTime), CAST(N'2021-05-24 19:04:03.000' AS DateTime), 0, N'1', 0, 1, 120000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052422', 40000, CAST(N'2021-05-24 18:54:40.000' AS DateTime), CAST(N'2021-05-24 19:04:02.000' AS DateTime), 0, N'1', 0, 1, 40000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052423', 69000, CAST(N'2021-05-24 18:54:41.000' AS DateTime), CAST(N'2021-05-24 19:04:02.000' AS DateTime), 0, N'1', 0, 1, 69000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052424', 96000, CAST(N'2021-05-24 18:54:41.000' AS DateTime), CAST(N'2021-05-24 19:04:01.000' AS DateTime), 0, N'1', 0, 1, 96000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052425', 70000, CAST(N'2021-05-24 18:54:42.000' AS DateTime), CAST(N'2021-05-24 19:04:00.000' AS DateTime), 0, N'1', 0, 1, 70000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052426', 50000, CAST(N'2021-05-24 18:54:42.000' AS DateTime), CAST(N'2021-05-24 19:04:00.000' AS DateTime), 0, N'1', 0, 1, 50000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021052427', 69000, CAST(N'2021-05-24 18:54:43.000' AS DateTime), CAST(N'2021-05-24 19:03:59.000' AS DateTime), 0, N'1', 0, 1, 69000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202105243', 207000, CAST(N'2021-05-24 18:54:22.000' AS DateTime), CAST(N'2021-05-24 19:48:23.000' AS DateTime), 8, N'1', 0, 1, 207000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202105244', 660000, CAST(N'2021-05-24 18:54:23.000' AS DateTime), CAST(N'2021-05-24 19:48:30.000' AS DateTime), 13, N'1', 0, 1, 660000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202105245', 732000, CAST(N'2021-05-24 18:54:24.000' AS DateTime), CAST(N'2021-05-24 19:48:24.000' AS DateTime), 14, N'1', 0, 1, 732000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202105246', 290000, CAST(N'2021-05-24 18:54:25.000' AS DateTime), CAST(N'2021-05-24 19:48:27.000' AS DateTime), 21, N'1', 0, 1, 290000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202105247', 280000, CAST(N'2021-05-24 18:54:27.000' AS DateTime), CAST(N'2021-05-24 19:48:28.000' AS DateTime), 18, N'1', 0, 1, 280000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202105248', 45000, CAST(N'2021-05-24 18:54:28.000' AS DateTime), CAST(N'2021-05-24 19:48:33.000' AS DateTime), 17, N'1', 0, 1, 45000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202105249', 290000, CAST(N'2021-05-24 18:54:29.000' AS DateTime), CAST(N'2021-05-24 19:48:31.000' AS DateTime), 12, N'1', 0, 1, 290000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202106011', 0, CAST(N'2021-06-01 10:20:19.000' AS DateTime), CAST(N'2021-06-01 10:20:19.000' AS DateTime), 5, N'1', 0, 2, 0)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060110', 126000, CAST(N'2021-06-01 17:38:24.000' AS DateTime), CAST(N'2021-06-01 18:05:19.000' AS DateTime), 0, N'1', 0, 1, 126000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060111', 69000, CAST(N'2021-06-01 17:39:29.000' AS DateTime), CAST(N'2021-06-01 17:58:26.000' AS DateTime), 0, N'1', 0, 1, 69000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060112', 0, CAST(N'2021-06-01 17:57:51.000' AS DateTime), CAST(N'2021-06-01 17:57:51.000' AS DateTime), 0, N'1', 0, 2, 0)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060113', 0, CAST(N'2021-06-01 18:03:34.000' AS DateTime), CAST(N'2021-06-01 18:03:34.000' AS DateTime), 0, N'1', 0, 2, 0)
GO
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060114', 99000, CAST(N'2021-06-01 18:04:26.000' AS DateTime), CAST(N'2021-06-01 18:05:13.000' AS DateTime), 0, N'1', 0, 1, 99000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060115', 0, CAST(N'2021-06-01 18:06:25.000' AS DateTime), CAST(N'2021-06-01 18:06:25.000' AS DateTime), 0, N'1', 0, 2, 0)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060116', 0, CAST(N'2021-06-01 18:06:32.000' AS DateTime), CAST(N'2021-06-01 18:06:32.000' AS DateTime), 0, N'1', 0, 2, 0)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060117', 20000, CAST(N'2021-06-01 18:06:33.000' AS DateTime), CAST(N'2021-06-01 18:06:56.000' AS DateTime), 0, N'1', 15, 1, 17000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060118', 0, CAST(N'2021-06-01 18:08:35.000' AS DateTime), CAST(N'2021-06-01 18:08:35.000' AS DateTime), 0, N'1', 0, 2, 0)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060119', 192000, CAST(N'2021-06-01 18:08:50.000' AS DateTime), CAST(N'2021-06-01 18:09:30.000' AS DateTime), 0, N'1', 0, 1, 192000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202106012', 365000, CAST(N'2021-06-01 10:21:16.000' AS DateTime), CAST(N'2021-06-01 16:08:27.000' AS DateTime), 2, N'1', 15, 1, 310000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060120', 192000, CAST(N'2021-06-01 18:08:52.000' AS DateTime), CAST(N'2021-06-01 18:09:01.000' AS DateTime), 0, N'1', 0, 1, 192000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060121', 0, CAST(N'2021-06-01 18:11:14.000' AS DateTime), CAST(N'2021-06-01 18:11:21.000' AS DateTime), 0, N'1', 0, 1, 0)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060122', 0, CAST(N'2021-06-01 18:12:31.000' AS DateTime), CAST(N'2021-06-01 18:12:31.000' AS DateTime), 0, N'1', 0, 2, 0)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060123', 0, CAST(N'2021-06-01 18:12:33.000' AS DateTime), CAST(N'2021-06-01 18:12:33.000' AS DateTime), 0, N'1', 0, 2, 0)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060124', 192000, CAST(N'2021-06-01 18:18:01.000' AS DateTime), CAST(N'2021-06-01 21:01:25.000' AS DateTime), 0, N'1', 0, 1, 192000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060125', 0, CAST(N'2021-06-01 18:18:02.000' AS DateTime), CAST(N'2021-06-01 18:18:02.000' AS DateTime), 0, N'1', 0, 2, 0)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060126', 90000, CAST(N'2021-06-01 18:22:40.000' AS DateTime), CAST(N'2021-06-01 18:23:05.000' AS DateTime), 0, N'1', 15, 1, 76000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060127', 192000, CAST(N'2021-06-01 18:24:28.000' AS DateTime), CAST(N'2021-06-01 18:24:34.000' AS DateTime), 0, N'1', 0, 1, 192000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060128', 80000, CAST(N'2021-06-01 18:25:13.000' AS DateTime), CAST(N'2021-06-01 18:25:21.000' AS DateTime), 0, N'1', 0, 1, 80000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060129', 0, CAST(N'2021-06-01 18:25:36.000' AS DateTime), CAST(N'2021-06-01 18:25:36.000' AS DateTime), 0, N'1', 0, 2, 0)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202106013', 282000, CAST(N'2021-06-01 12:53:18.000' AS DateTime), CAST(N'2021-06-01 16:07:57.000' AS DateTime), 3, N'1', 0, 1, 282000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060130', 126000, CAST(N'2021-06-01 18:27:05.000' AS DateTime), CAST(N'2021-06-01 18:27:30.000' AS DateTime), 0, N'1', 0, 1, 126000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060131', 136000, CAST(N'2021-06-01 18:28:44.000' AS DateTime), CAST(N'2021-06-01 18:28:48.000' AS DateTime), 0, N'1', 0, 1, 136000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060132', 136000, CAST(N'2021-06-01 21:00:47.000' AS DateTime), CAST(N'2021-06-01 21:01:10.000' AS DateTime), 2, N'1', 0, 1, 136000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060133', 192000, CAST(N'2021-06-01 21:01:07.000' AS DateTime), CAST(N'2021-06-01 21:01:36.000' AS DateTime), 9, N'1', 0, 1, 192000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060134', 96000, CAST(N'2021-06-01 21:01:14.000' AS DateTime), CAST(N'2021-06-01 21:01:29.000' AS DateTime), 0, N'1', 0, 1, 96000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060135', 110000, CAST(N'2021-06-01 21:01:58.000' AS DateTime), CAST(N'2021-06-01 21:06:49.000' AS DateTime), 3, N'1', 0, 1, 110000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060136', 80000, CAST(N'2021-06-01 21:01:59.000' AS DateTime), CAST(N'2021-06-01 21:02:04.000' AS DateTime), 9, N'1', 0, 1, 80000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060137', 96000, CAST(N'2021-06-01 21:02:00.000' AS DateTime), CAST(N'2021-06-01 21:12:29.000' AS DateTime), 0, N'1', 0, 1, 96000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060138', 60000, CAST(N'2021-06-01 21:02:01.000' AS DateTime), CAST(N'2021-06-01 21:12:21.000' AS DateTime), 0, N'1', 0, 1, 60000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060139', 60000, CAST(N'2021-06-01 21:03:23.000' AS DateTime), CAST(N'2021-06-01 21:03:26.000' AS DateTime), 9, N'1', 0, 1, 60000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202106014', 0, CAST(N'2021-06-01 13:56:46.000' AS DateTime), CAST(N'2021-06-01 13:56:46.000' AS DateTime), 13, N'1', 0, 2, 0)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060140', 99000, CAST(N'2021-06-01 21:05:06.000' AS DateTime), CAST(N'2021-06-01 21:05:16.000' AS DateTime), 14, N'1', 0, 1, 99000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060141', 90000, CAST(N'2021-06-01 21:06:31.000' AS DateTime), CAST(N'2021-06-01 21:06:39.000' AS DateTime), 4, N'1', 0, 1, 90000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060143', 99000, CAST(N'2021-06-01 21:28:46.000' AS DateTime), CAST(N'2021-06-01 21:29:03.000' AS DateTime), 5, N'1', 0, 1, 99000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202106015', 544000, CAST(N'2021-06-01 15:01:53.000' AS DateTime), CAST(N'2021-06-01 20:57:50.000' AS DateTime), 12, N'1', 0, 1, 544000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202106016', 139000, CAST(N'2021-06-01 17:05:02.000' AS DateTime), CAST(N'2021-06-01 20:57:43.000' AS DateTime), 8, N'1', 0, 1, 139000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202106017', 0, CAST(N'2021-06-01 17:27:16.000' AS DateTime), CAST(N'2021-06-01 17:27:16.000' AS DateTime), 0, N'1', 0, 2, 0)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202106018', 99000, CAST(N'2021-06-01 17:35:55.000' AS DateTime), CAST(N'2021-06-01 17:53:33.000' AS DateTime), 0, N'1', 0, 1, 99000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202106019', 0, CAST(N'2021-06-01 17:37:40.000' AS DateTime), CAST(N'2021-06-01 17:37:40.000' AS DateTime), 0, N'1', 0, 2, 0)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202106021', 90000, CAST(N'2021-06-02 01:26:45.000' AS DateTime), CAST(N'2021-06-02 01:26:53.000' AS DateTime), 5, N'1', 0, 1, 90000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202106022', 206000, CAST(N'2021-06-02 02:47:04.000' AS DateTime), CAST(N'2021-06-02 05:48:43.000' AS DateTime), 7, N'1', 0, 1, 206000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202106023', 0, CAST(N'2021-06-02 02:47:27.000' AS DateTime), CAST(N'2021-06-02 02:47:27.000' AS DateTime), 0, N'1', 0, 2, 0)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202106024', 368000, CAST(N'2021-06-02 02:48:22.000' AS DateTime), CAST(N'2021-06-02 05:48:56.000' AS DateTime), 0, N'1', 0, 1, 368000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202106025', 229000, CAST(N'2021-06-02 03:54:13.000' AS DateTime), CAST(N'2021-06-02 05:22:51.000' AS DateTime), 8, N'1', 0, 1, 229000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202106026', 0, CAST(N'2021-06-02 06:29:37.000' AS DateTime), CAST(N'2021-06-02 06:29:37.000' AS DateTime), 1, N'1', 0, 2, 0)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202106027', 0, CAST(N'2021-06-02 06:29:39.000' AS DateTime), CAST(N'2021-06-02 06:29:39.000' AS DateTime), 9, N'1', 0, 2, 0)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202106028', 136000, CAST(N'2021-06-02 07:05:01.000' AS DateTime), CAST(N'2021-06-02 07:05:28.000' AS DateTime), 0, N'1', 0, 1, 136000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202106029', 0, CAST(N'2021-06-02 07:07:30.000' AS DateTime), CAST(N'2021-06-02 07:07:30.000' AS DateTime), 7, N'1', 0, 2, 0)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202106031', 232000, CAST(N'2021-06-03 12:40:39.000' AS DateTime), CAST(N'2021-06-03 12:40:44.000' AS DateTime), 5, N'2', 0, 1, 232000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202106032', 167000, CAST(N'2021-06-03 13:14:00.000' AS DateTime), CAST(N'2021-06-03 13:14:19.000' AS DateTime), 5, N'1', 0, 1, 167000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202106033', 0, CAST(N'2021-06-03 13:19:17.000' AS DateTime), CAST(N'2021-06-03 13:19:17.000' AS DateTime), 0, N'1', 0, 2, 0)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202106034', 0, CAST(N'2021-06-03 13:20:01.000' AS DateTime), CAST(N'2021-06-03 13:20:01.000' AS DateTime), 0, N'1', 0, 2, 0)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202106035', 0, CAST(N'2021-06-03 19:49:43.000' AS DateTime), CAST(N'2021-06-03 19:49:43.000' AS DateTime), 5, N'1', 0, 2, 0)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202106036', 0, CAST(N'2021-06-03 19:49:47.000' AS DateTime), CAST(N'2021-06-03 19:49:47.000' AS DateTime), 0, N'1', 0, 2, 0)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202106037', 0, CAST(N'2021-06-03 19:49:47.000' AS DateTime), CAST(N'2021-06-03 19:49:47.000' AS DateTime), 0, N'1', 0, 2, 0)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202106041', 0, CAST(N'2021-06-04 14:35:45.000' AS DateTime), CAST(N'2021-06-04 14:35:45.000' AS DateTime), 3, N'1', 0, 2, 0)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060410', 0, CAST(N'2021-06-04 14:52:34.000' AS DateTime), CAST(N'2021-06-04 14:52:34.000' AS DateTime), 4, N'1', 0, 2, 0)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060411', 352000, CAST(N'2021-06-04 14:54:07.000' AS DateTime), CAST(N'2021-06-04 14:56:26.000' AS DateTime), 4, N'1', 5, 1, 334000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060412', 0, CAST(N'2021-06-04 14:55:42.000' AS DateTime), CAST(N'2021-06-04 14:55:42.000' AS DateTime), 8, N'1', 0, 2, 0)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060413', 0, CAST(N'2021-06-04 14:55:43.000' AS DateTime), CAST(N'2021-06-04 14:55:43.000' AS DateTime), 10, N'1', 0, 2, 0)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060414', 0, CAST(N'2021-06-04 14:56:39.000' AS DateTime), CAST(N'2021-06-04 14:56:39.000' AS DateTime), 14, N'1', 0, 2, 0)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060415', 169000, CAST(N'2021-06-04 14:56:47.000' AS DateTime), CAST(N'2021-06-04 14:57:12.000' AS DateTime), 0, N'1', 0, 1, 169000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060416', 0, CAST(N'2021-06-04 14:57:15.000' AS DateTime), CAST(N'2021-06-04 14:57:15.000' AS DateTime), 0, N'1', 0, 2, 0)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060417', 0, CAST(N'2021-06-04 14:57:16.000' AS DateTime), CAST(N'2021-06-04 14:57:16.000' AS DateTime), 0, N'1', 0, 2, 0)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060418', 195000, CAST(N'2021-06-04 15:01:18.000' AS DateTime), CAST(N'2021-06-04 15:05:44.000' AS DateTime), 0, N'1', 0, 1, 195000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060419', 99000, CAST(N'2021-06-04 15:01:20.000' AS DateTime), CAST(N'2021-06-04 15:07:45.000' AS DateTime), 0, N'1', 0, 1, 99000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202106042', 0, CAST(N'2021-06-04 14:39:21.000' AS DateTime), CAST(N'2021-06-04 14:39:21.000' AS DateTime), 6, N'1', 0, 2, 0)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060420', 99000, CAST(N'2021-06-04 15:01:20.000' AS DateTime), CAST(N'2021-06-04 15:06:57.000' AS DateTime), 0, N'1', 0, 1, 99000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060421', 192000, CAST(N'2021-06-04 15:01:22.000' AS DateTime), CAST(N'2021-06-04 15:07:34.000' AS DateTime), 0, N'1', 0, 1, 192000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060422', 99000, CAST(N'2021-06-04 15:07:52.000' AS DateTime), CAST(N'2021-06-04 15:07:56.000' AS DateTime), 4, N'1', 0, 1, 99000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060423', 257000, CAST(N'2021-06-04 15:09:48.000' AS DateTime), CAST(N'2021-06-04 15:12:14.000' AS DateTime), 2, N'1', 5, 1, 244000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060424', 0, CAST(N'2021-06-04 15:12:41.000' AS DateTime), CAST(N'2021-06-04 15:12:41.000' AS DateTime), 0, N'1', 0, 2, 0)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060425', 362000, CAST(N'2021-06-04 15:12:43.000' AS DateTime), CAST(N'2021-06-04 15:13:25.000' AS DateTime), 0, N'1', 0, 1, 362000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060426', 0, CAST(N'2021-06-04 15:33:37.000' AS DateTime), CAST(N'2021-06-04 15:33:37.000' AS DateTime), 3, N'1', 0, 2, 0)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060427', 0, CAST(N'2021-06-04 15:35:24.000' AS DateTime), CAST(N'2021-06-04 15:35:24.000' AS DateTime), 2, N'1', 0, 2, 0)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060428', 210000, CAST(N'2021-06-04 15:37:47.000' AS DateTime), CAST(N'2021-06-04 15:40:17.000' AS DateTime), 5, N'1', 0, 1, 210000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'2021060429', 262000, CAST(N'2021-06-04 15:40:43.000' AS DateTime), CAST(N'2021-06-04 15:41:09.000' AS DateTime), 0, N'1', 0, 1, 262000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202106043', 0, CAST(N'2021-06-04 14:39:28.000' AS DateTime), CAST(N'2021-06-04 14:39:28.000' AS DateTime), 8, N'1', 0, 2, 0)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202106044', 192000, CAST(N'2021-06-04 14:39:29.000' AS DateTime), CAST(N'2021-06-04 14:40:07.000' AS DateTime), 14, N'1', 5, 1, 182000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202106045', 165000, CAST(N'2021-06-04 14:40:31.000' AS DateTime), CAST(N'2021-06-04 14:40:50.000' AS DateTime), 0, N'1', 15, 1, 140000)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202106046', 0, CAST(N'2021-06-04 14:40:53.000' AS DateTime), CAST(N'2021-06-04 14:40:53.000' AS DateTime), 0, N'1', 0, 2, 0)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202106047', 0, CAST(N'2021-06-04 14:40:54.000' AS DateTime), CAST(N'2021-06-04 14:40:54.000' AS DateTime), 0, N'1', 0, 2, 0)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202106048', 0, CAST(N'2021-06-04 14:46:07.000' AS DateTime), CAST(N'2021-06-04 14:46:07.000' AS DateTime), 0, N'1', 0, 2, 0)
INSERT [dbo].[hoadon] ([idhoadon], [tongtien], [checkin], [checkout], [soban], [idnv], [giamgia], [dathanhtoan], [thuctra]) VALUES (N'202106049', 0, CAST(N'2021-06-04 14:52:07.000' AS DateTime), CAST(N'2021-06-04 14:52:07.000' AS DateTime), 8, N'1', 0, 2, 0)
INSERT [dbo].[loai] ([idloai], [tenloai]) VALUES (1, N'Lẩu')
INSERT [dbo].[loai] ([idloai], [tenloai]) VALUES (2, N'Kimbap')
INSERT [dbo].[loai] ([idloai], [tenloai]) VALUES (3, N'Mì cay')
INSERT [dbo].[loai] ([idloai], [tenloai]) VALUES (4, N'Bánh Gạo')
INSERT [dbo].[loai] ([idloai], [tenloai]) VALUES (5, N'Combo')
INSERT [dbo].[loai] ([idloai], [tenloai]) VALUES (6, N'Nước uống')
INSERT [dbo].[loai] ([idloai], [tenloai]) VALUES (9, N'Thêm')
INSERT [dbo].[loai] ([idloai], [tenloai]) VALUES (10, N'Bún các loại')
INSERT [dbo].[loaiban] ([idloaiban], [tenloai]) VALUES (1, N'Bàn bệt couple')
INSERT [dbo].[loaiban] ([idloaiban], [tenloai]) VALUES (2, N'Bàn bệt nhóm')
INSERT [dbo].[loaiban] ([idloaiban], [tenloai]) VALUES (3, N'Bàn cao couple')
INSERT [dbo].[loaiban] ([idloaiban], [tenloai]) VALUES (4, N'Bàn cao nhóm')
INSERT [dbo].[loaiban] ([idloaiban], [tenloai]) VALUES (7, N'Bàn Gia Đình')
INSERT [dbo].[loaiban] ([idloaiban], [tenloai]) VALUES (8, N'Bàn tròn thấp')
INSERT [dbo].[loaiban] ([idloaiban], [tenloai]) VALUES (5, N'Bàn vừa couple')
INSERT [dbo].[loaiban] ([idloaiban], [tenloai]) VALUES (6, N'Bàn vừa nhóm')
INSERT [dbo].[taikhoan] ([idnv], [pass], [nameDP], [loai], [ban]) VALUES (N'0399', N'1', N'Hoàng Khang', 0, 1)
INSERT [dbo].[taikhoan] ([idnv], [pass], [nameDP], [loai], [ban]) VALUES (N'1', N'1', N'Tên c?a tôi', 1, 0)
INSERT [dbo].[taikhoan] ([idnv], [pass], [nameDP], [loai], [ban]) VALUES (N'2', N'2', N'2', 0, 0)
INSERT [dbo].[taikhoan] ([idnv], [pass], [nameDP], [loai], [ban]) VALUES (N'3', N'3', N'3', 0, 0)
INSERT [dbo].[taikhoan] ([idnv], [pass], [nameDP], [loai], [ban]) VALUES (N'admin', N'1', N'Khang', 1, 0)
INSERT [dbo].[taikhoan] ([idnv], [pass], [nameDP], [loai], [ban]) VALUES (N'hello', N'1', N'Lang ld', 0, 0)
INSERT [dbo].[thucdon] ([id], [ten], [gia], [ngungban], [loai]) VALUES (1, N'Lẩu Thái size M', 69000, 0, 1)
INSERT [dbo].[thucdon] ([id], [ten], [gia], [ngungban], [loai]) VALUES (2, N'Lẩu Thái size L', 96000, 0, 1)
INSERT [dbo].[thucdon] ([id], [ten], [gia], [ngungban], [loai]) VALUES (3, N'Lẩu KimChi size M', 69000, 0, 1)
INSERT [dbo].[thucdon] ([id], [ten], [gia], [ngungban], [loai]) VALUES (4, N'Lẩu KimChi size L', 96000, 0, 1)
INSERT [dbo].[thucdon] ([id], [ten], [gia], [ngungban], [loai]) VALUES (5, N'Kimbap cuộn Trà Ếch', 30000, 0, 2)
INSERT [dbo].[thucdon] ([id], [ten], [gia], [ngungban], [loai]) VALUES (6, N'Kimbap cuộn Hàn Quốc', 30000, 0, 2)
INSERT [dbo].[thucdon] ([id], [ten], [gia], [ngungban], [loai]) VALUES (7, N'Kimbap cuộn đặc biệt', 40000, 0, 2)
INSERT [dbo].[thucdon] ([id], [ten], [gia], [ngungban], [loai]) VALUES (8, N'Mì Cay Bò size M', 40000, 0, 3)
INSERT [dbo].[thucdon] ([id], [ten], [gia], [ngungban], [loai]) VALUES (9, N'Mì Cay Bò size L', 40000, 0, 3)
INSERT [dbo].[thucdon] ([id], [ten], [gia], [ngungban], [loai]) VALUES (10, N'Mì Cay hải sản size M', 40000, 0, 3)
INSERT [dbo].[thucdon] ([id], [ten], [gia], [ngungban], [loai]) VALUES (11, N'Mì Cay hải sản size L', 40000, 0, 3)
INSERT [dbo].[thucdon] ([id], [ten], [gia], [ngungban], [loai]) VALUES (12, N'Mì Cay thập cẩm size M', 40000, 0, 3)
INSERT [dbo].[thucdon] ([id], [ten], [gia], [ngungban], [loai]) VALUES (13, N'Mì Cay thập cẩm size L', 40000, 0, 3)
INSERT [dbo].[thucdon] ([id], [ten], [gia], [ngungban], [loai]) VALUES (14, N'Bánh gạo phô mai Hàn quốc', 30000, 0, 4)
INSERT [dbo].[thucdon] ([id], [ten], [gia], [ngungban], [loai]) VALUES (15, N'Bánh gạo sốt cay', 30000, 0, 4)
INSERT [dbo].[thucdon] ([id], [ten], [gia], [ngungban], [loai]) VALUES (16, N'Bánh gạo gà phô mai', 40000, 0, 4)
INSERT [dbo].[thucdon] ([id], [ten], [gia], [ngungban], [loai]) VALUES (17, N'Bánh gạo sốt đặc biệt', 50000, 0, 4)
INSERT [dbo].[thucdon] ([id], [ten], [gia], [ngungban], [loai]) VALUES (18, N'Combo lẩu thái siêu khổng lồ', 145000, 0, 5)
INSERT [dbo].[thucdon] ([id], [ten], [gia], [ngungban], [loai]) VALUES (19, N'Combo lẩu Thái Bình Dương', 180000, 0, 5)
INSERT [dbo].[thucdon] ([id], [ten], [gia], [ngungban], [loai]) VALUES (21, N'Combo Sinh viên', 120000, 0, 5)
INSERT [dbo].[thucdon] ([id], [ten], [gia], [ngungban], [loai]) VALUES (22, N'Combo Ăn vặt siêu phê 2 người', 70000, 0, 5)
INSERT [dbo].[thucdon] ([id], [ten], [gia], [ngungban], [loai]) VALUES (23, N'Combo Ăn vặt siêu phê 4 người', 140000, 0, 5)
INSERT [dbo].[thucdon] ([id], [ten], [gia], [ngungban], [loai]) VALUES (24, N'Mì gói thêm', 4000, 0, 9)
INSERT [dbo].[thucdon] ([id], [ten], [gia], [ngungban], [loai]) VALUES (25, N'Bún thêm', 4000, 0, 9)
INSERT [dbo].[thucdon] ([id], [ten], [gia], [ngungban], [loai]) VALUES (26, N'Rau thêm', 5000, 0, 9)
INSERT [dbo].[thucdon] ([id], [ten], [gia], [ngungban], [loai]) VALUES (27, N'Bò thêm', 8000, 0, 9)
INSERT [dbo].[thucdon] ([id], [ten], [gia], [ngungban], [loai]) VALUES (28, N'Chả cá thêm', 8000, 0, 9)
INSERT [dbo].[thucdon] ([id], [ten], [gia], [ngungban], [loai]) VALUES (29, N'Thịt heo 3 chỉ thêm', 15000, 0, 9)
INSERT [dbo].[thucdon] ([id], [ten], [gia], [ngungban], [loai]) VALUES (30, N'Bò 3 chỉ thêm', 15000, 0, 9)
INSERT [dbo].[thucdon] ([id], [ten], [gia], [ngungban], [loai]) VALUES (31, N'Tôm thêm', 15000, 0, 9)
INSERT [dbo].[thucdon] ([id], [ten], [gia], [ngungban], [loai]) VALUES (32, N'Tàu hủ thêm', 5000, 0, 9)
INSERT [dbo].[thucdon] ([id], [ten], [gia], [ngungban], [loai]) VALUES (33, N'Pepsi', 10000, 0, 6)
INSERT [dbo].[thucdon] ([id], [ten], [gia], [ngungban], [loai]) VALUES (34, N'Sting', 10000, 0, 6)
INSERT [dbo].[thucdon] ([id], [ten], [gia], [ngungban], [loai]) VALUES (35, N'Coca', 10000, 0, 6)
INSERT [dbo].[thucdon] ([id], [ten], [gia], [ngungban], [loai]) VALUES (36, N'Sprite', 10000, 0, 6)
INSERT [dbo].[thucdon] ([id], [ten], [gia], [ngungban], [loai]) VALUES (37, N'Bún1', 10000, 0, 10)
INSERT [dbo].[thucdon] ([id], [ten], [gia], [ngungban], [loai]) VALUES (38, N'Bún2', 20000, 0, 10)
INSERT [dbo].[thucdon] ([id], [ten], [gia], [ngungban], [loai]) VALUES (39, N'Bún 3', 30000, 0, 10)
INSERT [dbo].[thucdon] ([id], [ten], [gia], [ngungban], [loai]) VALUES (40, N'Bún 4', 30000, 1, 10)
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__loaiban__07A2ED85308B65D6]    Script Date: 6/4/2021 3:56:55 PM ******/
ALTER TABLE [dbo].[loaiban] ADD UNIQUE NONCLUSTERED 
(
	[tenloai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__thucdon__DC107AB1569452F7]    Script Date: 6/4/2021 3:56:55 PM ******/
ALTER TABLE [dbo].[thucdon] ADD UNIQUE NONCLUSTERED 
(
	[ten] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ban]  WITH CHECK ADD FOREIGN KEY([loaiban])
REFERENCES [dbo].[loaiban] ([idloaiban])
GO
ALTER TABLE [dbo].[dshd]  WITH CHECK ADD FOREIGN KEY([idhoadon])
REFERENCES [dbo].[hoadon] ([idhoadon])
GO
ALTER TABLE [dbo].[dshd]  WITH CHECK ADD FOREIGN KEY([idmon])
REFERENCES [dbo].[thucdon] ([id])
GO
ALTER TABLE [dbo].[hoadon]  WITH CHECK ADD FOREIGN KEY([idnv])
REFERENCES [dbo].[taikhoan] ([idnv])
GO
ALTER TABLE [dbo].[thucdon]  WITH CHECK ADD FOREIGN KEY([loai])
REFERENCES [dbo].[loai] ([idloai])
GO
USE [master]
GO
ALTER DATABASE [QuanlyQuanan] SET  READ_WRITE 
GO
