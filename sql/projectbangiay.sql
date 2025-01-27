USE [master]
GO
/****** Object:  Database [projectbangiay]    Script Date: 17/04/2024 2:45:40 CH ******/
CREATE DATABASE [projectbangiay]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'projectbangiay', FILENAME = N'D:\hoc\DBI202\MSSQL16.SQLEXPRESS\MSSQL\DATA\projectbangiay.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'projectbangiay_log', FILENAME = N'D:\hoc\DBI202\MSSQL16.SQLEXPRESS\MSSQL\DATA\projectbangiay_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [projectbangiay] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [projectbangiay].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [projectbangiay] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [projectbangiay] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [projectbangiay] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [projectbangiay] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [projectbangiay] SET ARITHABORT OFF 
GO
ALTER DATABASE [projectbangiay] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [projectbangiay] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [projectbangiay] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [projectbangiay] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [projectbangiay] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [projectbangiay] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [projectbangiay] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [projectbangiay] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [projectbangiay] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [projectbangiay] SET  DISABLE_BROKER 
GO
ALTER DATABASE [projectbangiay] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [projectbangiay] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [projectbangiay] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [projectbangiay] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [projectbangiay] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [projectbangiay] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [projectbangiay] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [projectbangiay] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [projectbangiay] SET  MULTI_USER 
GO
ALTER DATABASE [projectbangiay] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [projectbangiay] SET DB_CHAINING OFF 
GO
ALTER DATABASE [projectbangiay] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [projectbangiay] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [projectbangiay] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [projectbangiay] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [projectbangiay] SET QUERY_STORE = ON
GO
ALTER DATABASE [projectbangiay] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [projectbangiay]
GO
/****** Object:  Table [dbo].[account]    Script Date: 17/04/2024 2:45:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[email] [varchar](255) NULL,
	[phonenumber] [varchar](13) NULL,
	[address] [nvarchar](255) NULL,
	[password] [varchar](32) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[role_id] [int] NULL,
	[deleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[brand]    Script Date: 17/04/2024 2:45:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brand](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 17/04/2024 2:45:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 17/04/2024 2:45:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dateOrder] [date] NULL,
	[total] [money] NULL,
	[aid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderdetail]    Script Date: 17/04/2024 2:45:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderdetail](
	[oid] [int] NOT NULL,
	[pid] [int] NOT NULL,
	[quantity] [int] NULL,
	[price] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[oid] ASC,
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 17/04/2024 2:45:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[c_id] [int] NULL,
	[b_id] [int] NULL,
	[title] [varchar](255) NULL,
	[price] [decimal](10, 2) NULL,
	[image] [varchar](255) NULL,
	[description] [nvarchar](255) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted] [bit] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 17/04/2024 2:45:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[account] ON 

INSERT [dbo].[account] ([id], [name], [email], [phonenumber], [address], [password], [username], [role_id], [deleted]) VALUES (1, N'Viet Hoang', N'HoangTHVHE173225@fpt.edu.vn', N'', N'', N'admin123', N'admin', 1, 0)
INSERT [dbo].[account] ([id], [name], [email], [phonenumber], [address], [password], [username], [role_id], [deleted]) VALUES (2, NULL, NULL, NULL, NULL, N'12345678', N'user1', 2, 0)
INSERT [dbo].[account] ([id], [name], [email], [phonenumber], [address], [password], [username], [role_id], [deleted]) VALUES (9, N'Tran huu viet hoang', N'hoangtran654@gmail.com', N'0943561200', N'vinh-nghe an', N'123', N'hoang', 2, 0)
INSERT [dbo].[account] ([id], [name], [email], [phonenumber], [address], [password], [username], [role_id], [deleted]) VALUES (10, N'', N'', N'', N'', N'12345678', N'user2', 2, 0)
INSERT [dbo].[account] ([id], [name], [email], [phonenumber], [address], [password], [username], [role_id], [deleted]) VALUES (11, NULL, NULL, NULL, NULL, N'123', N'user3', 2, 0)
INSERT [dbo].[account] ([id], [name], [email], [phonenumber], [address], [password], [username], [role_id], [deleted]) VALUES (12, N'', N'', N'', N'', N'123', N'user4', 2, 0)
SET IDENTITY_INSERT [dbo].[account] OFF
GO
SET IDENTITY_INSERT [dbo].[brand] ON 

INSERT [dbo].[brand] ([id], [name]) VALUES (1, N'Nike')
INSERT [dbo].[brand] ([id], [name]) VALUES (2, N'Adidas')
INSERT [dbo].[brand] ([id], [name]) VALUES (3, N'Puma')
INSERT [dbo].[brand] ([id], [name]) VALUES (4, N'Vans')
INSERT [dbo].[brand] ([id], [name]) VALUES (5, N'Jordan')
SET IDENTITY_INSERT [dbo].[brand] OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([id], [name]) VALUES (1, N'Sneakers')
INSERT [dbo].[category] ([id], [name]) VALUES (2, N'Boots')
INSERT [dbo].[category] ([id], [name]) VALUES (3, N'Loafers')
INSERT [dbo].[category] ([id], [name]) VALUES (4, N'Sandals')
INSERT [dbo].[category] ([id], [name]) VALUES (5, N'Flip-flops')
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[order] ON 

INSERT [dbo].[order] ([id], [dateOrder], [total], [aid]) VALUES (1, CAST(N'2024-03-08' AS Date), 320000.0000, 9)
INSERT [dbo].[order] ([id], [dateOrder], [total], [aid]) VALUES (2, CAST(N'2024-03-12' AS Date), 650000.0000, 10)
INSERT [dbo].[order] ([id], [dateOrder], [total], [aid]) VALUES (3, CAST(N'2024-03-12' AS Date), 650000.0000, 10)
INSERT [dbo].[order] ([id], [dateOrder], [total], [aid]) VALUES (4, CAST(N'2024-03-12' AS Date), 600000.0000, 10)
INSERT [dbo].[order] ([id], [dateOrder], [total], [aid]) VALUES (12, CAST(N'2024-03-12' AS Date), 1040000.0000, 2)
INSERT [dbo].[order] ([id], [dateOrder], [total], [aid]) VALUES (13, CAST(N'2024-03-12' AS Date), 710000.0000, 9)
INSERT [dbo].[order] ([id], [dateOrder], [total], [aid]) VALUES (14, CAST(N'2024-03-12' AS Date), 1250000.0000, 9)
INSERT [dbo].[order] ([id], [dateOrder], [total], [aid]) VALUES (15, CAST(N'2024-03-12' AS Date), 1260000.0000, 9)
INSERT [dbo].[order] ([id], [dateOrder], [total], [aid]) VALUES (16, CAST(N'2024-03-12' AS Date), 1220000.0000, 9)
INSERT [dbo].[order] ([id], [dateOrder], [total], [aid]) VALUES (17, CAST(N'2024-03-12' AS Date), 510000.0000, 1)
INSERT [dbo].[order] ([id], [dateOrder], [total], [aid]) VALUES (18, CAST(N'2024-03-19' AS Date), 300000.0000, 9)
SET IDENTITY_INSERT [dbo].[order] OFF
GO
INSERT [dbo].[orderdetail] ([oid], [pid], [quantity], [price]) VALUES (1, 1, 1, 121000.0000)
INSERT [dbo].[orderdetail] ([oid], [pid], [quantity], [price]) VALUES (1, 2, 1, 231000.0000)
INSERT [dbo].[orderdetail] ([oid], [pid], [quantity], [price]) VALUES (2, 4, 1, 165000.0000)
INSERT [dbo].[orderdetail] ([oid], [pid], [quantity], [price]) VALUES (2, 5, 1, 275000.0000)
INSERT [dbo].[orderdetail] ([oid], [pid], [quantity], [price]) VALUES (2, 10, 1, 275000.0000)
INSERT [dbo].[orderdetail] ([oid], [pid], [quantity], [price]) VALUES (3, 12, 1, 275000.0000)
INSERT [dbo].[orderdetail] ([oid], [pid], [quantity], [price]) VALUES (3, 20, 1, 440000.0000)
INSERT [dbo].[orderdetail] ([oid], [pid], [quantity], [price]) VALUES (4, 6, 1, 385000.0000)
INSERT [dbo].[orderdetail] ([oid], [pid], [quantity], [price]) VALUES (4, 12, 1, 275000.0000)
INSERT [dbo].[orderdetail] ([oid], [pid], [quantity], [price]) VALUES (12, 3, 1, 330000.0000)
INSERT [dbo].[orderdetail] ([oid], [pid], [quantity], [price]) VALUES (12, 13, 1, 132000.0000)
INSERT [dbo].[orderdetail] ([oid], [pid], [quantity], [price]) VALUES (12, 14, 1, 242000.0000)
INSERT [dbo].[orderdetail] ([oid], [pid], [quantity], [price]) VALUES (12, 16, 1, 440000.0000)
INSERT [dbo].[orderdetail] ([oid], [pid], [quantity], [price]) VALUES (13, 2, 1, 231000.0000)
INSERT [dbo].[orderdetail] ([oid], [pid], [quantity], [price]) VALUES (13, 8, 1, 275000.0000)
INSERT [dbo].[orderdetail] ([oid], [pid], [quantity], [price]) VALUES (13, 12, 1, 275000.0000)
INSERT [dbo].[orderdetail] ([oid], [pid], [quantity], [price]) VALUES (14, 6, 3, 385000.0000)
INSERT [dbo].[orderdetail] ([oid], [pid], [quantity], [price]) VALUES (14, 7, 1, 220000.0000)
INSERT [dbo].[orderdetail] ([oid], [pid], [quantity], [price]) VALUES (15, 1, 1, 594000.0000)
INSERT [dbo].[orderdetail] ([oid], [pid], [quantity], [price]) VALUES (15, 3, 1, 330000.0000)
INSERT [dbo].[orderdetail] ([oid], [pid], [quantity], [price]) VALUES (15, 17, 1, 462000.0000)
INSERT [dbo].[orderdetail] ([oid], [pid], [quantity], [price]) VALUES (16, 2, 2, 231000.0000)
INSERT [dbo].[orderdetail] ([oid], [pid], [quantity], [price]) VALUES (16, 20, 2, 440000.0000)
INSERT [dbo].[orderdetail] ([oid], [pid], [quantity], [price]) VALUES (17, 2, 1, 231000.0000)
INSERT [dbo].[orderdetail] ([oid], [pid], [quantity], [price]) VALUES (17, 3, 1, 330000.0000)
INSERT [dbo].[orderdetail] ([oid], [pid], [quantity], [price]) VALUES (18, 4, 2, 165000.0000)
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (1, 2, 2, N'boots-adidas-1', CAST(200000.00 AS Decimal(10, 2)), N'images/boots-adidas-1.jpg', N'giay qua dep', CAST(N'2024-02-15T17:52:21.737' AS DateTime), CAST(N'2024-03-19T00:38:38.950' AS DateTime), 0, 98)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (2, 2, 2, N'boots-adidas-2', CAST(210000.00 AS Decimal(10, 2)), N'images/boots-adidas-2.jpg', N'giay qua dep', CAST(N'2024-02-11T16:30:45.347' AS DateTime), CAST(N'2024-03-19T00:38:43.063' AS DateTime), 0, 95)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (3, 2, 2, N'boots-adidas-3', CAST(300000.00 AS Decimal(10, 2)), N'images/boots-adidas-3.jpg', N'giay qua dep', CAST(N'2024-02-11T16:30:45.347' AS DateTime), CAST(N'2024-03-19T00:38:47.330' AS DateTime), 0, 97)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (4, 2, 1, N'boots-nike-1', CAST(150000.00 AS Decimal(10, 2)), N'images/boots-nike-1.jpg', N'giay qua dep', CAST(N'2024-02-11T16:30:45.347' AS DateTime), CAST(N'2024-03-19T00:38:55.290' AS DateTime), 0, 97)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (5, 2, 1, N'boots-nike-2', CAST(250000.00 AS Decimal(10, 2)), N'images/boots-nike-2.jpg', N'giay qua dep', CAST(N'2024-02-11T16:30:45.347' AS DateTime), CAST(N'2024-03-19T00:39:09.587' AS DateTime), 0, 99)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (6, 2, 1, N'boots-nike-3', CAST(350000.00 AS Decimal(10, 2)), N'images/boots-nike-3.jpg', N'giay qua dep', CAST(N'2024-02-11T16:30:45.347' AS DateTime), CAST(N'2024-03-19T00:39:15.327' AS DateTime), 0, 96)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (7, 2, 3, N'boots-puma-1', CAST(200000.00 AS Decimal(10, 2)), N'images/boots-puma-1.jpg', N'giay qua dep', CAST(N'2024-02-11T16:30:45.347' AS DateTime), CAST(N'2024-03-19T00:39:22.410' AS DateTime), 0, 99)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (8, 2, 3, N'boots-puma-2', CAST(250000.00 AS Decimal(10, 2)), N'images/boots-puma-2.jpg', N'giay qua dep', CAST(N'2024-02-11T16:30:45.347' AS DateTime), CAST(N'2024-03-19T00:39:27.443' AS DateTime), 0, 99)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (9, 2, 3, N'boots-puma-3', CAST(300000.00 AS Decimal(10, 2)), N'images/boots-puma-3.jpg', N'giay qua dep', CAST(N'2024-02-11T16:30:45.347' AS DateTime), CAST(N'2024-03-19T00:39:32.273' AS DateTime), 0, 100)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (10, 2, 4, N'boots-vans-1', CAST(250000.00 AS Decimal(10, 2)), N'images/boots-vans-1.jpg', N'giay dep vai l', CAST(N'2024-02-11T16:30:45.347' AS DateTime), NULL, 0, 99)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (11, 2, 4, N'boots-vans-2', CAST(250000.00 AS Decimal(10, 2)), N'images/boots-vans-2.jpg', N'giay dep vai l', CAST(N'2024-02-11T16:30:45.347' AS DateTime), NULL, 0, 100)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (12, 2, 4, N'boots-vans-3', CAST(250000.00 AS Decimal(10, 2)), N'images/boots-vans-3.jpg', N'giay dep vai l', CAST(N'2024-02-11T16:30:45.347' AS DateTime), NULL, 0, 97)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (13, 3, 2, N'Loafers-adidas-1', CAST(120000.00 AS Decimal(10, 2)), N'images/Loafers-adidas-1.jpg', N'giay dep vai c', CAST(N'2024-02-11T16:30:45.347' AS DateTime), NULL, 0, 99)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (14, 3, 2, N'Loafers-adidas-2', CAST(220000.00 AS Decimal(10, 2)), N'images/Loafers-adidas-2.jpg', N'giay dep vai c', CAST(N'2024-02-11T16:30:45.347' AS DateTime), NULL, 0, 99)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (15, 3, 2, N'Loafers-adidas-3', CAST(320000.00 AS Decimal(10, 2)), N'images/Loafers-adidas-3.jpg', N'giay dep vai c', CAST(N'2024-02-11T16:30:45.347' AS DateTime), NULL, 0, 100)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (16, 3, 5, N'Loafers-jordan-1', CAST(400000.00 AS Decimal(10, 2)), N'images/Loafers-jordan-1.jpg', N'giay dep vai c', CAST(N'2024-02-11T16:30:45.347' AS DateTime), NULL, 0, 99)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (17, 3, 5, N'Loafers-jordan-2', CAST(420000.00 AS Decimal(10, 2)), N'images/Loafers-jordan-2.jpg', N'giay dep vai c', CAST(N'2024-02-11T16:30:45.347' AS DateTime), NULL, 0, 99)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (18, 3, 1, N'Loafers-nike-1', CAST(300000.00 AS Decimal(10, 2)), N'images/Loafers-nike-1.jpg', N'giay dep vai c', CAST(N'2024-02-11T16:30:45.347' AS DateTime), NULL, 0, 100)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (19, 3, 1, N'Loafers-nike-2', CAST(350000.00 AS Decimal(10, 2)), N'images/Loafers-nike-2.jpg', N'giay dep vai c', CAST(N'2024-02-11T16:30:45.347' AS DateTime), NULL, 0, 100)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (20, 3, 1, N'Loafers-adidas-3', CAST(400000.00 AS Decimal(10, 2)), N'images/Loafers-nike-3.jpg', N'giay dep vai c', CAST(N'2024-02-11T16:30:45.347' AS DateTime), NULL, 0, 97)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (21, 3, 3, N'Loafers-puma-1', CAST(150000.00 AS Decimal(10, 2)), N'images/Loafers-puma-3.jpg', N'giay dep vai c', CAST(N'2024-02-11T16:30:45.347' AS DateTime), NULL, 0, 100)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (22, 3, 3, N'Loafers-puma-2', CAST(200000.00 AS Decimal(10, 2)), N'images/Loafers-puma-3.jpg', N'giay dep vai c', CAST(N'2024-02-11T16:30:45.347' AS DateTime), NULL, 0, 100)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (23, 3, 3, N'Loafers-adidas-3', CAST(250000.00 AS Decimal(10, 2)), N'images/Loafers-puma-3.jpg', N'giay dep vai c', CAST(N'2024-02-11T16:30:45.347' AS DateTime), NULL, 0, 100)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (24, 3, 4, N'Loafers-vans-1', CAST(180000.00 AS Decimal(10, 2)), N'images/Loafers-vans-1.jpg', N'giay dep vai c', CAST(N'2024-02-11T16:30:45.347' AS DateTime), NULL, 0, 100)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (25, 3, 4, N'Loafers-vans-2', CAST(320000.00 AS Decimal(10, 2)), N'images/Loafers-vans-2.jpg', N'giay dep vai c', CAST(N'2024-02-11T16:30:45.347' AS DateTime), NULL, 0, 100)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (26, 1, 2, N'sneaker-adidas-1', CAST(200000.00 AS Decimal(10, 2)), N'images/sneaker-adidas-1.jpg', N'giay dep the ?', CAST(N'2024-02-11T16:30:45.347' AS DateTime), NULL, 0, 100)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (27, 1, 2, N'sneaker-adidas-2', CAST(210000.00 AS Decimal(10, 2)), N'images/sneaker-adidas-2.jpg', N'giay dep the ?', CAST(N'2024-02-11T16:30:45.347' AS DateTime), NULL, 0, 100)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (28, 1, 2, N'sneaker-adidas-3', CAST(220000.00 AS Decimal(10, 2)), N'images/sneaker-adidas-3.jpg', N'giay dep the ?', CAST(N'2024-02-11T16:30:45.347' AS DateTime), NULL, 0, 100)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (29, 1, 2, N'sneaker-adidas-4', CAST(230000.00 AS Decimal(10, 2)), N'images/sneaker-adidas-4.jpg', N'giay dep the ?', CAST(N'2024-02-11T16:30:45.347' AS DateTime), NULL, 0, 100)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (30, 1, 2, N'sneaker-adidas-5', CAST(240000.00 AS Decimal(10, 2)), N'images/sneaker-adidas-5.jpg', N'giay dep the ?', CAST(N'2024-02-11T16:30:45.347' AS DateTime), NULL, 0, 100)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (31, 1, 5, N'sneaker-jordan-1', CAST(400000.00 AS Decimal(10, 2)), N'images/sneaker-jordan-1.png', N'giay dep the ?', CAST(N'2024-02-11T16:30:45.347' AS DateTime), NULL, 0, 100)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (32, 1, 5, N'sneaker-jordan-2', CAST(500000.00 AS Decimal(10, 2)), N'images/sneaker-jordan-2.jpg', N'giay dep the ?', CAST(N'2024-02-11T16:30:45.347' AS DateTime), NULL, 0, 100)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (33, 1, 5, N'sneaker-jordan-3', CAST(600000.00 AS Decimal(10, 2)), N'images/sneaker-jordan-3.png', N'giay dep the ?', CAST(N'2024-02-11T16:30:45.347' AS DateTime), NULL, 0, 100)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (34, 1, 1, N'sneaker-nike-1', CAST(300000.00 AS Decimal(10, 2)), N'images/sneaker-nike-1.jpg', N'giay dep the ?', CAST(N'2024-02-11T16:30:45.347' AS DateTime), NULL, 0, 100)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (35, 1, 1, N'sneaker-nike-2', CAST(320000.00 AS Decimal(10, 2)), N'images/sneaker-nike-2.jpg', N'giay dep the ?', CAST(N'2024-02-11T16:30:45.347' AS DateTime), NULL, 0, 100)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (36, 1, 1, N'sneaker-nike-3', CAST(340000.00 AS Decimal(10, 2)), N'images/sneaker-nike-3.jpg', N'giay dep the ?', CAST(N'2024-02-11T16:30:45.347' AS DateTime), NULL, 0, 100)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (37, 1, 1, N'sneaker-nike-4', CAST(360000.00 AS Decimal(10, 2)), N'images/sneaker-nike-4.jpg', N'giay dep the ?', CAST(N'2024-02-11T16:30:45.347' AS DateTime), NULL, 0, 100)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (38, 1, 1, N'sneaker-nike-5', CAST(380000.00 AS Decimal(10, 2)), N'images/sneaker-nike-5.jpg', N'giay dep the ?', CAST(N'2024-02-11T16:30:45.347' AS DateTime), NULL, 0, 100)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (39, 1, 3, N'sneaker-puma-1', CAST(160000.00 AS Decimal(10, 2)), N'images/sneaker-puma-1.jpg', N'giay dep the ?', CAST(N'2024-02-11T16:30:45.347' AS DateTime), NULL, 0, 100)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (40, 1, 3, N'sneaker-puma-2', CAST(200000.00 AS Decimal(10, 2)), N'images/sneaker-puma-2.jpg', N'giay dep the ?', CAST(N'2024-02-11T16:30:45.347' AS DateTime), NULL, 0, 100)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (41, 1, 3, N'sneaker-puma-3', CAST(300000.00 AS Decimal(10, 2)), N'images/sneaker-puma-3.jpg', N'giay dep the ?', CAST(N'2024-02-11T16:30:45.347' AS DateTime), NULL, 0, 100)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (42, 1, 3, N'sneaker-puma-4', CAST(340000.00 AS Decimal(10, 2)), N'images/sneaker-puma-4.jpg', N'giay dep the ?', CAST(N'2024-02-11T16:30:45.347' AS DateTime), NULL, 0, 100)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (43, 1, 3, N'sneaker-puma-5', CAST(380000.00 AS Decimal(10, 2)), N'images/sneaker-puma-5.jpg', N'giay dep the ?', CAST(N'2024-02-11T16:30:45.347' AS DateTime), NULL, 0, 100)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (44, 1, 4, N'sneaker-vans-1', CAST(250000.00 AS Decimal(10, 2)), N'images/sneaker-vans-1.jpg', N'giay dep the ?', CAST(N'2024-02-11T16:30:45.347' AS DateTime), NULL, 0, 100)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (45, 1, 4, N'sneaker-vans-2', CAST(300000.00 AS Decimal(10, 2)), N'images/sneaker-vans-2.jpg', N'giay dep the ?', CAST(N'2024-02-11T16:30:45.347' AS DateTime), NULL, 0, 100)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (46, 1, 4, N'sneaker-vans-3', CAST(330000.00 AS Decimal(10, 2)), N'images/sneaker-vans-3.jpg', N'giay dep the ?', CAST(N'2024-02-11T16:30:45.347' AS DateTime), CAST(N'2024-02-25T21:14:40.963' AS DateTime), 0, 100)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (53, 2, 2, N'hoang', CAST(1200000.00 AS Decimal(10, 2)), N'images/logo-jordan.png', NULL, CAST(N'2024-03-09T20:51:46.770' AS DateTime), NULL, 1, 100)
INSERT [dbo].[product] ([id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [updated_at], [deleted], [quantity]) VALUES (54, 1, 1, N'abcd', CAST(1200000.00 AS Decimal(10, 2)), N'images/Loafers-nike-1.jpg', NULL, CAST(N'2024-03-12T14:46:51.733' AS DateTime), NULL, 0, 100)
SET IDENTITY_INSERT [dbo].[product] OFF
GO
SET IDENTITY_INSERT [dbo].[roles] ON 

INSERT [dbo].[roles] ([id], [name]) VALUES (1, N'admin')
INSERT [dbo].[roles] ([id], [name]) VALUES (2, N'user')
SET IDENTITY_INSERT [dbo].[roles] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__account__F3DBC5726BEB5DCA]    Script Date: 17/04/2024 2:45:40 CH ******/
ALTER TABLE [dbo].[account] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[account] ADD  DEFAULT (NULL) FOR [name]
GO
ALTER TABLE [dbo].[account] ADD  DEFAULT (NULL) FOR [email]
GO
ALTER TABLE [dbo].[account] ADD  DEFAULT (NULL) FOR [phonenumber]
GO
ALTER TABLE [dbo].[account] ADD  DEFAULT (NULL) FOR [address]
GO
ALTER TABLE [dbo].[account] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[order] ADD  DEFAULT (getdate()) FOR [dateOrder]
GO
ALTER TABLE [dbo].[product] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[product] ADD  DEFAULT (NULL) FOR [updated_at]
GO
ALTER TABLE [dbo].[product] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[product] ADD  DEFAULT ((100)) FOR [quantity]
GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD FOREIGN KEY([aid])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[orderdetail]  WITH CHECK ADD FOREIGN KEY([oid])
REFERENCES [dbo].[order] ([id])
GO
ALTER TABLE [dbo].[orderdetail]  WITH CHECK ADD FOREIGN KEY([pid])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([b_id])
REFERENCES [dbo].[brand] ([id])
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([c_id])
REFERENCES [dbo].[category] ([id])
GO
USE [master]
GO
ALTER DATABASE [projectbangiay] SET  READ_WRITE 
GO
