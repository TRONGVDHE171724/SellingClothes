USE [master]
GO
/****** Object:  Database [MyShop]    Script Date: 6/25/2024 12:19:23 PM ******/
CREATE DATABASE [MyShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\MyShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MyShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\MyShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MyShop] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MyShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MyShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyShop] SET RECOVERY FULL 
GO
ALTER DATABASE [MyShop] SET  MULTI_USER 
GO
ALTER DATABASE [MyShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MyShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MyShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MyShop', N'ON'
GO
ALTER DATABASE [MyShop] SET QUERY_STORE = ON
GO
ALTER DATABASE [MyShop] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MyShop]
GO
/****** Object:  Table [dbo].[bill]    Script Date: 6/25/2024 12:19:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill](
	[bill_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NOT NULL,
	[total] [money] NOT NULL,
	[payment] [varchar](250) NOT NULL,
	[address] [ntext] NOT NULL,
	[date] [date] NOT NULL,
	[phone] [bigint] NOT NULL,
 CONSTRAINT [PK_bill] PRIMARY KEY CLUSTERED 
(
	[bill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bill_detail]    Script Date: 6/25/2024 12:19:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill_detail](
	[detail_id] [bigint] IDENTITY(1,1) NOT NULL,
	[bill_id] [bigint] NOT NULL,
	[product_id] [varchar](100) NOT NULL,
	[quantity] [int] NOT NULL,
	[size] [nchar](10) NOT NULL,
	[color] [nvarchar](150) NOT NULL,
	[price] [money] NOT NULL,
 CONSTRAINT [PK_bill_detail] PRIMARY KEY CLUSTERED 
(
	[detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart]    Script Date: 6/25/2024 12:19:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart](
	[cart_id] [bigint] NOT NULL,
	[product_id] [varchar](100) NOT NULL,
	[product_name] [varchar](255) NOT NULL,
	[product_img] [varchar](255) NOT NULL,
	[product_price] [float] NOT NULL,
	[total] [float] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_cart] PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 6/25/2024 12:19:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 6/25/2024 12:19:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[product_id] [varchar](100) NOT NULL,
	[category_id] [int] NOT NULL,
	[product_name] [nvarchar](max) NOT NULL,
	[product_price] [money] NOT NULL,
	[product_describe] [nvarchar](max) NOT NULL,
	[quantity] [int] NOT NULL,
	[img] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_color]    Script Date: 6/25/2024 12:19:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_color](
	[product_id] [varchar](100) NOT NULL,
	[color] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_size]    Script Date: 6/25/2024 12:19:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_size](
	[product_id] [varchar](100) NOT NULL,
	[size] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 6/25/2024 12:19:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](200) NULL,
	[user_email] [varchar](255) NOT NULL,
	[user_pass] [nvarchar](255) NOT NULL,
	[isAdmin] [nvarchar](50) NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[bill]  WITH CHECK ADD  CONSTRAINT [FK_bill_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[bill] CHECK CONSTRAINT [FK_bill_users]
GO
ALTER TABLE [dbo].[bill_detail]  WITH CHECK ADD  CONSTRAINT [FK_bill_detail_bill] FOREIGN KEY([bill_id])
REFERENCES [dbo].[bill] ([bill_id])
GO
ALTER TABLE [dbo].[bill_detail] CHECK CONSTRAINT [FK_bill_detail_bill]
GO
ALTER TABLE [dbo].[bill_detail]  WITH CHECK ADD  CONSTRAINT [FK_bill_detail_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[bill_detail] CHECK CONSTRAINT [FK_bill_detail_product]
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD  CONSTRAINT [FK_cart_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[cart] CHECK CONSTRAINT [FK_cart_product]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([category_id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_category]
GO
ALTER TABLE [dbo].[product_color]  WITH CHECK ADD  CONSTRAINT [FK_product_color_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[product_color] CHECK CONSTRAINT [FK_product_color_product]
GO
ALTER TABLE [dbo].[product_size]  WITH CHECK ADD  CONSTRAINT [FK_product_size_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[product_size] CHECK CONSTRAINT [FK_product_size_product]
GO
USE [master]
GO
ALTER DATABASE [MyShop] SET  READ_WRITE 
GO
