USE [master]
GO
/****** Object:  Database [Shopee]    Script Date: 2024/7/25 下午 01:51:42 ******/
CREATE DATABASE [Shopee]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'shopee1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\shopee1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'shopee1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\shopee1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Shopee] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Shopee].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Shopee] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Shopee] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Shopee] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Shopee] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Shopee] SET ARITHABORT OFF 
GO
ALTER DATABASE [Shopee] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Shopee] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Shopee] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Shopee] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Shopee] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Shopee] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Shopee] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Shopee] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Shopee] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Shopee] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Shopee] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Shopee] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Shopee] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Shopee] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Shopee] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Shopee] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Shopee] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Shopee] SET RECOVERY FULL 
GO
ALTER DATABASE [Shopee] SET  MULTI_USER 
GO
ALTER DATABASE [Shopee] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Shopee] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Shopee] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Shopee] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Shopee] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Shopee] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Shopee', N'ON'
GO
ALTER DATABASE [Shopee] SET QUERY_STORE = ON
GO
ALTER DATABASE [Shopee] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Shopee]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2024/7/25 下午 01:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] NOT NULL,
	[CategoryName] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chat]    Script Date: 2024/7/25 下午 01:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chat](
	[ChatId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[ShopId] [int] NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[SentTime] [datetime] NOT NULL,
 CONSTRAINT [PK__Chat__A9FBE7C6D3DEACCA] PRIMARY KEY CLUSTERED 
(
	[ChatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coupons]    Script Date: 2024/7/25 下午 01:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupons](
	[CustomerId] [int] NOT NULL,
	[VipCoupon] [int] NULL,
	[ShopeeCoupon] [int] NULL,
	[ShopCoupon] [int] NULL,
	[ElectronicCoupon] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 2024/7/25 下午 01:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] NOT NULL,
	[CustomerName] [nvarchar](255) NOT NULL,
	[Address] [nvarchar](255) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[Email] [nvarchar](255) NULL,
	[BirthDate] [date] NULL,
	[VipLevel] [int] NULL,
	[Password] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2024/7/25 下午 01:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ShopId] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[Quantity] [smallint] NOT NULL,
	[Discount] [decimal](18, 0) NOT NULL,
	[PaymentMethod] [int] NOT NULL,
	[OrderStatus] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDescription]    Script Date: 2024/7/25 下午 01:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDescription](
	[ProductId] [int] NOT NULL,
	[ProductImage] [nvarchar](max) NOT NULL,
	[ProductVideo] [varbinary](max) NULL,
	[ProductSpecification] [nvarchar](50) NULL,
	[ProductSize] [nvarchar](max) NULL,
	[ProductMaterial] [nvarchar](50) NULL,
	[ProductCondition] [nvarchar](50) NULL,
	[ShipArea] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2024/7/25 下午 01:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](255) NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[ShopId] [int] NOT NULL,
	[QuantityInStock] [int] NULL,
	[AddTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 2024/7/25 下午 01:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[ReviewId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[ReviewScore] [int] NOT NULL,
	[ReviewTxt] [nvarchar](max) NOT NULL,
	[ReviewImage] [nvarchar](max) NULL,
	[ReviewVideo] [nvarchar](max) NULL,
	[ReviewTime] [datetime] NOT NULL,
 CONSTRAINT [PK__Reviews__74BC79CE9F49FC06] PRIMARY KEY CLUSTERED 
(
	[ReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipping]    Script Date: 2024/7/25 下午 01:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping](
	[PackageNumber] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[ShippingDate] [datetime] NOT NULL,
	[ShippingMethod] [nvarchar](50) NULL,
	[ShippingFreight] [money] NULL,
	[DeliveryAddress] [nvarchar](50) NULL,
	[SendStatus] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PackageNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 2024/7/25 下午 01:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCart](
	[ProductId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[QuantityInCart] [int] NULL,
	[SpecificationInCart] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shops]    Script Date: 2024/7/25 下午 01:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shops](
	[ShopId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[ShopName] [nvarchar](255) NULL,
	[ShopDescription] [nvarchar](max) NULL,
	[LastOnlineTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ShopId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Chat]  WITH CHECK ADD  CONSTRAINT [FK_Chat_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Chat] CHECK CONSTRAINT [FK_Chat_Customers]
GO
ALTER TABLE [dbo].[Chat]  WITH CHECK ADD  CONSTRAINT [FK_Chat_Shops] FOREIGN KEY([ShopId])
REFERENCES [dbo].[Shops] ([ShopId])
GO
ALTER TABLE [dbo].[Chat] CHECK CONSTRAINT [FK_Chat_Shops]
GO
ALTER TABLE [dbo].[Coupons]  WITH CHECK ADD  CONSTRAINT [FK_Coupons_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Coupons] CHECK CONSTRAINT [FK_Coupons_Customers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Shops] FOREIGN KEY([ShopId])
REFERENCES [dbo].[Shops] ([ShopId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Shops]
GO
ALTER TABLE [dbo].[ProductDescription]  WITH CHECK ADD  CONSTRAINT [FK_ProductDescription_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[ProductDescription] CHECK CONSTRAINT [FK_ProductDescription_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Shops] FOREIGN KEY([ShopId])
REFERENCES [dbo].[Shops] ([ShopId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Shops]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Customers]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Products]
GO
ALTER TABLE [dbo].[Shipping]  WITH CHECK ADD  CONSTRAINT [FK_Shipping_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Shipping] CHECK CONSTRAINT [FK_Shipping_Orders]
GO
ALTER TABLE [dbo].[ShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCart_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[ShoppingCart] CHECK CONSTRAINT [FK_ShoppingCart_Customers]
GO
ALTER TABLE [dbo].[ShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCart_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[ShoppingCart] CHECK CONSTRAINT [FK_ShoppingCart_Products]
GO
ALTER TABLE [dbo].[Shops]  WITH CHECK ADD  CONSTRAINT [FK_Shops_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Shops] CHECK CONSTRAINT [FK_Shops_Customers]
GO
USE [master]
GO
ALTER DATABASE [Shopee] SET  READ_WRITE 
GO
