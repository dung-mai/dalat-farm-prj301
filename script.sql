USE [master]
GO
/****** Object:  Database [PRJ301_SE1625]    Script Date: 7/15/2022 2:34:37 PM ******/
CREATE DATABASE [PRJ301_SE1625]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRJ301_SE1625', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.DUNG\MSSQL\DATA\PRJ301_SE1625.mdf' , SIZE = 65536KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRJ301_SE1625_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.DUNG\MSSQL\DATA\PRJ301_SE1625_log.ldf' , SIZE = 196608KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PRJ301_SE1625] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRJ301_SE1625].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRJ301_SE1625] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRJ301_SE1625] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRJ301_SE1625] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRJ301_SE1625] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRJ301_SE1625] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRJ301_SE1625] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRJ301_SE1625] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRJ301_SE1625] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRJ301_SE1625] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRJ301_SE1625] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRJ301_SE1625] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRJ301_SE1625] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRJ301_SE1625] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRJ301_SE1625] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRJ301_SE1625] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PRJ301_SE1625] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRJ301_SE1625] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRJ301_SE1625] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRJ301_SE1625] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRJ301_SE1625] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRJ301_SE1625] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRJ301_SE1625] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRJ301_SE1625] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PRJ301_SE1625] SET  MULTI_USER 
GO
ALTER DATABASE [PRJ301_SE1625] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRJ301_SE1625] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRJ301_SE1625] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRJ301_SE1625] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRJ301_SE1625] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRJ301_SE1625] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PRJ301_SE1625] SET QUERY_STORE = OFF
GO
USE [PRJ301_SE1625]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/15/2022 2:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[userid] [varchar](150) NOT NULL,
	[password] [varchar](150) NOT NULL,
	[displayname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart_Item_HE163263]    Script Date: 7/15/2022 2:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart_Item_HE163263](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[product_id] [int] NULL,
	[quantity] [int] NULL,
	[created_at] [datetime] NULL,
	[modified_at] [datetime] NULL,
 CONSTRAINT [PK_Cart_Item_HE163263] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 7/15/2022 2:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[ctitle] [varchar](150) NOT NULL,
	[userid] [varchar](150) NOT NULL,
	[tid] [int] NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coupon_HE163263]    Script Date: 7/15/2022 2:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupon_HE163263](
	[coupon_id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](20) NOT NULL,
	[description] [nvarchar](250) NULL,
	[is_activated] [bit] NULL,
	[valid_from] [datetime] NULL,
	[expired_date] [datetime] NULL,
	[created_by] [int] NULL,
	[created_at] [datetime] NULL,
	[updated_by] [int] NULL,
	[updated_at] [datetime] NULL,
	[discount_amount] [decimal](18, 0) NULL,
	[category_id] [int] NULL,
	[supplier_id] [int] NULL,
 CONSTRAINT [PK_Coupon_HE163263] PRIMARY KEY CLUSTERED 
(
	[coupon_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feature_HE163263]    Script Date: 7/15/2022 2:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature_HE163263](
	[feature_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[code] [nvarchar](250) NULL,
 CONSTRAINT [PK_Feature_HE163263] PRIMARY KEY CLUSTERED 
(
	[feature_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback_HE163263]    Script Date: 7/15/2022 2:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback_HE163263](
	[feedback_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](30) NULL,
	[last_name] [nvarchar](30) NULL,
	[email] [nvarchar](150) NULL,
	[phone_number] [varchar](20) NULL,
	[subject] [nvarchar](200) NULL,
	[detail] [nvarchar](500) NULL,
 CONSTRAINT [PK_Feedback_HE163263] PRIMARY KEY CLUSTERED 
(
	[feedback_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Galery_HE163263]    Script Date: 7/15/2022 2:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Galery_HE163263](
	[image_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[thumbnail] [nvarchar](500) NULL,
 CONSTRAINT [PK_Galery_HE163263] PRIMARY KEY CLUSTERED 
(
	[image_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice_HE163263]    Script Date: 7/15/2022 2:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice_HE163263](
	[invoice_id] [int] IDENTITY(1,1) NOT NULL,
	[status] [bit] NULL,
	[supplier_id] [int] NULL,
 CONSTRAINT [PK_Invoice_HE163263] PRIMARY KEY CLUSTERED 
(
	[invoice_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoiceDetail_HE163263]    Script Date: 7/15/2022 2:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceDetail_HE163263](
	[invoice_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[product_name] [nvarchar](100) NULL,
	[quantity] [int] NULL,
	[unitPrice] [decimal](18, 0) NULL,
 CONSTRAINT [PK_InvoiceDetail_HE163263] PRIMARY KEY CLUSTERED 
(
	[invoice_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail_HE163263]    Script Date: 7/15/2022 2:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail_HE163263](
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[product_name] [nvarchar](100) NULL,
	[price] [decimal](18, 0) NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetail_HE163263] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders_HE163263]    Script Date: 7/15/2022 2:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders_HE163263](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[order_code] [varchar](30) NULL,
	[order_date] [datetime] NULL,
	[status] [smallint] NULL,
	[deliveryDate] [datetime] NULL,
	[total] [int] NULL,
	[fullname] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[phone_number] [varchar](20) NULL,
	[address] [nvarchar](500) NULL,
	[payment_method] [nvarchar](50) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post_Category_HE163263]    Script Date: 7/15/2022 2:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post_Category_HE163263](
	[cate_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[status] [bit] NULL,
	[parentId] [int] NULL,
	[created_by] [int] NULL,
	[created_date] [datetime] NULL,
	[updated_by] [int] NULL,
	[updated_date] [datetime] NULL,
 CONSTRAINT [PK_Post_Category_HE163263] PRIMARY KEY CLUSTERED 
(
	[cate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post_HE163263]    Script Date: 7/15/2022 2:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post_HE163263](
	[post_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NOT NULL,
	[title] [nvarchar](350) NULL,
	[status] [bit] NULL,
	[thumbnail] [varchar](250) NULL,
	[description] [nvarchar](500) NULL,
	[detail] [ntext] NULL,
	[tags] [nvarchar](250) NULL,
	[viewcount] [int] NULL,
	[cate_id] [int] NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[updated_by] [int] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_Post_HE163263] PRIMARY KEY CLUSTERED 
(
	[post_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostComment_HE163263]    Script Date: 7/15/2022 2:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostComment_HE163263](
	[comment_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[status] [bit] NULL,
	[title] [nvarchar](200) NULL,
	[detail] [nvarchar](500) NULL,
	[post_id] [int] NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[updated_by] [int] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_PostComment_HE163263] PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostTag_HE163263]    Script Date: 7/15/2022 2:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostTag_HE163263](
	[post_id] [int] NOT NULL,
	[tag_id] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PostTag_HE163263] PRIMARY KEY CLUSTERED 
(
	[post_id] ASC,
	[tag_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory_HE163263]    Script Date: 7/15/2022 2:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory_HE163263](
	[cate_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[parentId] [int] NULL,
	[status] [bit] NULL,
	[created_by] [int] NULL,
	[created_at] [datetime] NULL,
	[updated_by] [int] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_ProductCategory_HE163263] PRIMARY KEY CLUSTERED 
(
	[cate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductReview_HE163263]    Script Date: 7/15/2022 2:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductReview_HE163263](
	[review_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[name] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[title] [nvarchar](200) NULL,
	[detail] [nvarchar](500) NULL,
	[rating] [smallint] NULL,
	[product_id] [int] NULL,
	[created_at] [datetime] NULL,
 CONSTRAINT [PK_ProductReview_HE163263] PRIMARY KEY CLUSTERED 
(
	[review_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products_HE163263]    Script Date: 7/15/2022 2:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products_HE163263](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NOT NULL,
	[status] [bit] NULL,
	[quantity] [int] NULL,
	[unit] [varchar](20) NULL,
	[unitprice] [int] NULL,
	[promotion_price] [int] NULL,
	[thumbnail] [varchar](250) NULL,
	[detail] [ntext] NULL,
	[rating] [float] NULL,
	[tags] [nvarchar](250) NULL,
	[viewcount] [int] NULL,
	[hot] [datetime] NULL,
	[cate_id] [int] NULL,
	[supplier_id] [int] NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[updated_by] [int] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_Products_HE163263] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTag_HE163263]    Script Date: 7/15/2022 2:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTag_HE163263](
	[product_id] [int] NOT NULL,
	[tag_id] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProductTag_HE163263] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC,
	[tag_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Feature_HE163263]    Script Date: 7/15/2022 2:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Feature_HE163263](
	[feature_id] [int] NOT NULL,
	[role_id] [int] NOT NULL,
	[licensed] [bit] NULL,
 CONSTRAINT [PK_Role_Feature_HE163263] PRIMARY KEY CLUSTERED 
(
	[feature_id] ASC,
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_HE163263]    Script Date: 7/15/2022 2:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_HE163263](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](200) NULL,
 CONSTRAINT [PK_Role_HE163263] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SendEmail]    Script Date: 7/15/2022 2:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SendEmail](
	[e_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[title] [nvarchar](200) NULL,
	[message] [ntext] NULL,
	[created_at] [datetime] NULL,
 CONSTRAINT [PK_SendEmail] PRIMARY KEY CLUSTERED 
(
	[e_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 7/15/2022 2:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[sid] [int] NOT NULL,
	[name] [varchar](150) NOT NULL,
	[gender] [bit] NOT NULL,
	[dob] [date] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers_HE163263]    Script Date: 7/15/2022 2:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers_HE163263](
	[supplier_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](150) NULL,
	[email] [nvarchar](150) NULL,
	[phone] [varchar](20) NULL,
	[address] [nvarchar](250) NULL,
 CONSTRAINT [PK_Supplier_HE163263] PRIMARY KEY CLUSTERED 
(
	[supplier_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag_HE163263]    Script Date: 7/15/2022 2:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag_HE163263](
	[tag_id] [nvarchar](50) NOT NULL,
	[name] [nvarchar](250) NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[tag_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Thread]    Script Date: 7/15/2022 2:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Thread](
	[tid] [int] NOT NULL,
	[tcontent] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Thread] PRIMARY KEY CLUSTERED 
(
	[tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Address_HE163263]    Script Date: 7/15/2022 2:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Address_HE163263](
	[address_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[customer_name] [nvarchar](50) NULL,
	[address] [nvarchar](500) NULL,
	[phone_number] [varchar](20) NULL,
	[default] [bit] NULL,
 CONSTRAINT [PK_User_Address_HE163263] PRIMARY KEY CLUSTERED 
(
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_FavoriteItem_HE163263]    Script Date: 7/15/2022 2:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_FavoriteItem_HE163263](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[product_id] [int] NULL,
	[add_at] [datetime] NOT NULL,
 CONSTRAINT [PK_User_FavoriteItem_HE163263] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_HE163263]    Script Date: 7/15/2022 2:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_HE163263](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](30) NULL,
	[last_name] [nvarchar](30) NULL,
	[email] [varchar](150) NULL,
	[phone_number] [varchar](20) NULL,
	[address] [nvarchar](300) NULL,
	[password] [char](64) NULL,
	[external_login] [bit] NULL,
	[external_id] [varchar](150) NULL,
	[avatar] [nvarchar](500) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[verified] [bit] NULL,
	[active] [bit] NULL,
 CONSTRAINT [PK_User_HE163263] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Role_HE163263]    Script Date: 7/15/2022 2:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Role_HE163263](
	[user_id] [int] NOT NULL,
	[role_id] [int] NOT NULL,
	[licensed] [bit] NULL,
 CONSTRAINT [PK_User_Role] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Token]    Script Date: 7/15/2022 2:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Token](
	[token_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[token_string] [varchar](100) NULL,
	[created_date] [datetime] NULL,
 CONSTRAINT [PK_User_Token] PRIMARY KEY CLUSTERED 
(
	[token_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cart_Item_HE163263] ADD  CONSTRAINT [DF_Cart_Item_HE163263_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Coupon_HE163263] ADD  CONSTRAINT [DF_Coupon_HE163263_is_activated]  DEFAULT ((1)) FOR [is_activated]
GO
ALTER TABLE [dbo].[Coupon_HE163263] ADD  CONSTRAINT [DF_Coupon_HE163263_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Coupon_HE163263] ADD  CONSTRAINT [DF_Coupon_HE163263_discount_amount]  DEFAULT ((0)) FOR [discount_amount]
GO
ALTER TABLE [dbo].[Invoice_HE163263] ADD  CONSTRAINT [DF_Invoice_HE163263_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[OrderDetail_HE163263] ADD  CONSTRAINT [DF_OrderDetail_HE163263_quantity]  DEFAULT ((0)) FOR [quantity]
GO
ALTER TABLE [dbo].[Orders_HE163263] ADD  CONSTRAINT [DF_Orders_HE163263_order_date]  DEFAULT (getdate()) FOR [order_date]
GO
ALTER TABLE [dbo].[Orders_HE163263] ADD  CONSTRAINT [DF_Orders_HE163263_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Orders_HE163263] ADD  CONSTRAINT [DF_Orders_HE163263_discount]  DEFAULT ((0)) FOR [total]
GO
ALTER TABLE [dbo].[Post_Category_HE163263] ADD  CONSTRAINT [DF_Post_Category_HE163263_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Post_HE163263] ADD  CONSTRAINT [DF_Post_HE163263_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[PostComment_HE163263] ADD  CONSTRAINT [DF_PostComment_HE163263_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[ProductCategory_HE163263] ADD  CONSTRAINT [DF_ProductCategory_HE163263_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[ProductCategory_HE163263] ADD  CONSTRAINT [DF_ProductCategory_HE163263_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[ProductReview_HE163263] ADD  CONSTRAINT [DF_ProductReview_HE163263_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Products_HE163263] ADD  CONSTRAINT [DF_Products_HE163263_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Products_HE163263] ADD  CONSTRAINT [DF_Products_HE163263_quantity]  DEFAULT ((0)) FOR [quantity]
GO
ALTER TABLE [dbo].[Products_HE163263] ADD  CONSTRAINT [DF_Products_HE163263_unitprice]  DEFAULT ((0)) FOR [unitprice]
GO
ALTER TABLE [dbo].[Products_HE163263] ADD  CONSTRAINT [DF_Products_HE163263_promotion_price]  DEFAULT ((0)) FOR [promotion_price]
GO
ALTER TABLE [dbo].[Products_HE163263] ADD  CONSTRAINT [DF_Products_HE163263_viewcount]  DEFAULT ((0)) FOR [viewcount]
GO
ALTER TABLE [dbo].[Products_HE163263] ADD  CONSTRAINT [DF_Products_HE163263_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Role_Feature_HE163263] ADD  CONSTRAINT [DF_Role_Feature_HE163263_licensed]  DEFAULT ((1)) FOR [licensed]
GO
ALTER TABLE [dbo].[SendEmail] ADD  CONSTRAINT [DF_SendEmail_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[User_Address_HE163263] ADD  CONSTRAINT [DF_User_Address_HE163263_default]  DEFAULT ((1)) FOR [default]
GO
ALTER TABLE [dbo].[User_HE163263] ADD  CONSTRAINT [DF_User_HE163263_external_login]  DEFAULT ((0)) FOR [external_login]
GO
ALTER TABLE [dbo].[User_HE163263] ADD  CONSTRAINT [DF_User_HE163263_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[User_HE163263] ADD  CONSTRAINT [DF_User_HE163263_status]  DEFAULT ((0)) FOR [verified]
GO
ALTER TABLE [dbo].[User_HE163263] ADD  CONSTRAINT [DF_User_HE163263_is_active]  DEFAULT ((1)) FOR [active]
GO
ALTER TABLE [dbo].[User_Role_HE163263] ADD  CONSTRAINT [DF_User_Role_licensed]  DEFAULT ((1)) FOR [licensed]
GO
ALTER TABLE [dbo].[User_Token] ADD  CONSTRAINT [DF_User_Token_created_date]  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[Cart_Item_HE163263]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Item_HE163263_Products_HE163263] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products_HE163263] ([product_id])
GO
ALTER TABLE [dbo].[Cart_Item_HE163263] CHECK CONSTRAINT [FK_Cart_Item_HE163263_Products_HE163263]
GO
ALTER TABLE [dbo].[Cart_Item_HE163263]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Item_HE163263_User_HE163263] FOREIGN KEY([user_id])
REFERENCES [dbo].[User_HE163263] ([user_id])
GO
ALTER TABLE [dbo].[Cart_Item_HE163263] CHECK CONSTRAINT [FK_Cart_Item_HE163263_User_HE163263]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Account] FOREIGN KEY([userid])
REFERENCES [dbo].[Account] ([userid])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Account]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Thread] FOREIGN KEY([tid])
REFERENCES [dbo].[Thread] ([tid])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Thread]
GO
ALTER TABLE [dbo].[Galery_HE163263]  WITH CHECK ADD  CONSTRAINT [FK_Galery_HE163263_Products_HE163263] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products_HE163263] ([product_id])
GO
ALTER TABLE [dbo].[Galery_HE163263] CHECK CONSTRAINT [FK_Galery_HE163263_Products_HE163263]
GO
ALTER TABLE [dbo].[Invoice_HE163263]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_HE163263_Suppliers_HE163263] FOREIGN KEY([supplier_id])
REFERENCES [dbo].[Suppliers_HE163263] ([supplier_id])
GO
ALTER TABLE [dbo].[Invoice_HE163263] CHECK CONSTRAINT [FK_Invoice_HE163263_Suppliers_HE163263]
GO
ALTER TABLE [dbo].[InvoiceDetail_HE163263]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceDetail_HE163263_Invoice_HE163263] FOREIGN KEY([invoice_id])
REFERENCES [dbo].[Invoice_HE163263] ([invoice_id])
GO
ALTER TABLE [dbo].[InvoiceDetail_HE163263] CHECK CONSTRAINT [FK_InvoiceDetail_HE163263_Invoice_HE163263]
GO
ALTER TABLE [dbo].[InvoiceDetail_HE163263]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceDetail_HE163263_Products_HE163263] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products_HE163263] ([product_id])
GO
ALTER TABLE [dbo].[InvoiceDetail_HE163263] CHECK CONSTRAINT [FK_InvoiceDetail_HE163263_Products_HE163263]
GO
ALTER TABLE [dbo].[OrderDetail_HE163263]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_HE163263_Orders_HE163263] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders_HE163263] ([order_id])
GO
ALTER TABLE [dbo].[OrderDetail_HE163263] CHECK CONSTRAINT [FK_OrderDetail_HE163263_Orders_HE163263]
GO
ALTER TABLE [dbo].[OrderDetail_HE163263]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_HE163263_Products_HE163263] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products_HE163263] ([product_id])
GO
ALTER TABLE [dbo].[OrderDetail_HE163263] CHECK CONSTRAINT [FK_OrderDetail_HE163263_Products_HE163263]
GO
ALTER TABLE [dbo].[Post_HE163263]  WITH CHECK ADD  CONSTRAINT [FK_Post_HE163263_Post_Category_HE163263] FOREIGN KEY([cate_id])
REFERENCES [dbo].[Post_Category_HE163263] ([cate_id])
GO
ALTER TABLE [dbo].[Post_HE163263] CHECK CONSTRAINT [FK_Post_HE163263_Post_Category_HE163263]
GO
ALTER TABLE [dbo].[PostComment_HE163263]  WITH CHECK ADD  CONSTRAINT [FK_PostComment_HE163263_Post_HE163263] FOREIGN KEY([post_id])
REFERENCES [dbo].[Post_HE163263] ([post_id])
GO
ALTER TABLE [dbo].[PostComment_HE163263] CHECK CONSTRAINT [FK_PostComment_HE163263_Post_HE163263]
GO
ALTER TABLE [dbo].[PostTag_HE163263]  WITH CHECK ADD  CONSTRAINT [FK_PostTag_HE163263_Post_HE163263] FOREIGN KEY([post_id])
REFERENCES [dbo].[Post_HE163263] ([post_id])
GO
ALTER TABLE [dbo].[PostTag_HE163263] CHECK CONSTRAINT [FK_PostTag_HE163263_Post_HE163263]
GO
ALTER TABLE [dbo].[PostTag_HE163263]  WITH CHECK ADD  CONSTRAINT [FK_PostTag_HE163263_Tag_HE163263] FOREIGN KEY([tag_id])
REFERENCES [dbo].[Tag_HE163263] ([tag_id])
GO
ALTER TABLE [dbo].[PostTag_HE163263] CHECK CONSTRAINT [FK_PostTag_HE163263_Tag_HE163263]
GO
ALTER TABLE [dbo].[ProductReview_HE163263]  WITH CHECK ADD  CONSTRAINT [FK_ProductReview_HE163263_Products_HE163263] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products_HE163263] ([product_id])
GO
ALTER TABLE [dbo].[ProductReview_HE163263] CHECK CONSTRAINT [FK_ProductReview_HE163263_Products_HE163263]
GO
ALTER TABLE [dbo].[Products_HE163263]  WITH CHECK ADD  CONSTRAINT [FK_Products_HE163263_ProductCategory_HE163263] FOREIGN KEY([cate_id])
REFERENCES [dbo].[ProductCategory_HE163263] ([cate_id])
GO
ALTER TABLE [dbo].[Products_HE163263] CHECK CONSTRAINT [FK_Products_HE163263_ProductCategory_HE163263]
GO
ALTER TABLE [dbo].[Products_HE163263]  WITH CHECK ADD  CONSTRAINT [FK_Products_HE163263_Suppliers_HE163263] FOREIGN KEY([supplier_id])
REFERENCES [dbo].[Suppliers_HE163263] ([supplier_id])
GO
ALTER TABLE [dbo].[Products_HE163263] CHECK CONSTRAINT [FK_Products_HE163263_Suppliers_HE163263]
GO
ALTER TABLE [dbo].[ProductTag_HE163263]  WITH CHECK ADD  CONSTRAINT [FK_ProductTag_HE163263_Products_HE163263] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products_HE163263] ([product_id])
GO
ALTER TABLE [dbo].[ProductTag_HE163263] CHECK CONSTRAINT [FK_ProductTag_HE163263_Products_HE163263]
GO
ALTER TABLE [dbo].[ProductTag_HE163263]  WITH CHECK ADD  CONSTRAINT [FK_ProductTag_HE163263_Tag_HE163263] FOREIGN KEY([tag_id])
REFERENCES [dbo].[Tag_HE163263] ([tag_id])
GO
ALTER TABLE [dbo].[ProductTag_HE163263] CHECK CONSTRAINT [FK_ProductTag_HE163263_Tag_HE163263]
GO
ALTER TABLE [dbo].[Role_Feature_HE163263]  WITH CHECK ADD  CONSTRAINT [FK_Role_Feature_HE163263_Feature_HE163263] FOREIGN KEY([feature_id])
REFERENCES [dbo].[Feature_HE163263] ([feature_id])
GO
ALTER TABLE [dbo].[Role_Feature_HE163263] CHECK CONSTRAINT [FK_Role_Feature_HE163263_Feature_HE163263]
GO
ALTER TABLE [dbo].[Role_Feature_HE163263]  WITH CHECK ADD  CONSTRAINT [FK_Role_Feature_HE163263_Role_HE163263] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role_HE163263] ([role_id])
GO
ALTER TABLE [dbo].[Role_Feature_HE163263] CHECK CONSTRAINT [FK_Role_Feature_HE163263_Role_HE163263]
GO
ALTER TABLE [dbo].[User_Address_HE163263]  WITH CHECK ADD  CONSTRAINT [FK_User_Address_HE163263_User_HE163263] FOREIGN KEY([user_id])
REFERENCES [dbo].[User_HE163263] ([user_id])
GO
ALTER TABLE [dbo].[User_Address_HE163263] CHECK CONSTRAINT [FK_User_Address_HE163263_User_HE163263]
GO
ALTER TABLE [dbo].[User_FavoriteItem_HE163263]  WITH CHECK ADD  CONSTRAINT [FK_User_FavoriteItem_HE163263_Products_HE163263] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products_HE163263] ([product_id])
GO
ALTER TABLE [dbo].[User_FavoriteItem_HE163263] CHECK CONSTRAINT [FK_User_FavoriteItem_HE163263_Products_HE163263]
GO
ALTER TABLE [dbo].[User_FavoriteItem_HE163263]  WITH CHECK ADD  CONSTRAINT [FK_User_FavoriteItem_HE163263_User_HE163263] FOREIGN KEY([user_id])
REFERENCES [dbo].[User_HE163263] ([user_id])
GO
ALTER TABLE [dbo].[User_FavoriteItem_HE163263] CHECK CONSTRAINT [FK_User_FavoriteItem_HE163263_User_HE163263]
GO
ALTER TABLE [dbo].[User_Role_HE163263]  WITH CHECK ADD  CONSTRAINT [FK_User_Role_Role_HE163263] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role_HE163263] ([role_id])
GO
ALTER TABLE [dbo].[User_Role_HE163263] CHECK CONSTRAINT [FK_User_Role_Role_HE163263]
GO
ALTER TABLE [dbo].[User_Role_HE163263]  WITH CHECK ADD  CONSTRAINT [FK_User_Role_User_HE163263] FOREIGN KEY([user_id])
REFERENCES [dbo].[User_HE163263] ([user_id])
GO
ALTER TABLE [dbo].[User_Role_HE163263] CHECK CONSTRAINT [FK_User_Role_User_HE163263]
GO
USE [master]
GO
ALTER DATABASE [PRJ301_SE1625] SET  READ_WRITE 
GO
