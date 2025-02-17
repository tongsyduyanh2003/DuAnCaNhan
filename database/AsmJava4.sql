USE [master]
GO
/****** Object:  Database [asmjava4]    Script Date: 12/6/2023 11:26:46 AM ******/
CREATE DATABASE [asmjava4]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'asmjava4', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\asmjava4.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'asmjava4_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\asmjava4_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [asmjava4] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [asmjava4].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [asmjava4] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [asmjava4] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [asmjava4] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [asmjava4] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [asmjava4] SET ARITHABORT OFF 
GO
ALTER DATABASE [asmjava4] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [asmjava4] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [asmjava4] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [asmjava4] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [asmjava4] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [asmjava4] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [asmjava4] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [asmjava4] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [asmjava4] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [asmjava4] SET  ENABLE_BROKER 
GO
ALTER DATABASE [asmjava4] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [asmjava4] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [asmjava4] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [asmjava4] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [asmjava4] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [asmjava4] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [asmjava4] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [asmjava4] SET RECOVERY FULL 
GO
ALTER DATABASE [asmjava4] SET  MULTI_USER 
GO
ALTER DATABASE [asmjava4] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [asmjava4] SET DB_CHAINING OFF 
GO
ALTER DATABASE [asmjava4] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [asmjava4] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [asmjava4] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [asmjava4] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'asmjava4', N'ON'
GO
ALTER DATABASE [asmjava4] SET QUERY_STORE = ON
GO
ALTER DATABASE [asmjava4] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [asmjava4]
GO
/****** Object:  Table [dbo].[history]    Script Date: 12/6/2023 11:26:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[history](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[videoId] [int] NULL,
	[viewedDate] [datetime] NOT NULL,
	[isLiked] [bit] NOT NULL,
	[likedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 12/6/2023 11:26:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](10) NOT NULL,
	[password] [varchar](10) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[isAdmin] [bit] NOT NULL,
	[isActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[video]    Script Date: 12/6/2023 11:26:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[video](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[href] [varchar](50) NOT NULL,
	[poster] [varchar](255) NULL,
	[views] [int] NOT NULL,
	[description] [nvarchar](255) NOT NULL,
	[shares] [int] NOT NULL,
	[isActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[href] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[history] ADD  DEFAULT (getdate()) FOR [viewedDate]
GO
ALTER TABLE [dbo].[history] ADD  DEFAULT ((0)) FOR [isLiked]
GO
ALTER TABLE [dbo].[user] ADD  DEFAULT ((0)) FOR [isAdmin]
GO
ALTER TABLE [dbo].[user] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[video] ADD  DEFAULT ((0)) FOR [views]
GO
ALTER TABLE [dbo].[video] ADD  DEFAULT ((0)) FOR [shares]
GO
ALTER TABLE [dbo].[video] ADD  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[history]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[history]  WITH CHECK ADD FOREIGN KEY([videoId])
REFERENCES [dbo].[video] ([id])
GO
/****** Object:  StoredProcedure [dbo].[sp_selectUsersLikedVideoByHref]    Script Date: 12/6/2023 11:26:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_selectUsersLikedVideoByHref](@videoHref varchar(50))
as begin 
		SELECT u.id,u.[password], u.isAdmin,u.isActive, u.username, u.email
		from video v LEFT JOIN history h ON h.videoId = v.id LEFT JOIN [user] u ON u.id = h.userId
		WHERE
        v.href = @videoHref AND u.isActive = 1 AND
        v.isActive = 1 AND h.isLiked = 1
END
GO
USE [master]
GO
ALTER DATABASE [asmjava4] SET  READ_WRITE 
GO
