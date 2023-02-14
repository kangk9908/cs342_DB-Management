USE [master]
GO
/****** Object:  Database [sheep]    Script Date: 2/13/2023 9:01:14 PM ******/
CREATE DATABASE [sheep]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'sheep', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\sheep.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'sheep_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\sheep_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [sheep] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [sheep].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [sheep] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [sheep] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [sheep] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [sheep] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [sheep] SET ARITHABORT OFF 
GO
ALTER DATABASE [sheep] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [sheep] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [sheep] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [sheep] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [sheep] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [sheep] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [sheep] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [sheep] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [sheep] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [sheep] SET  ENABLE_BROKER 
GO
ALTER DATABASE [sheep] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [sheep] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [sheep] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [sheep] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [sheep] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [sheep] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [sheep] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [sheep] SET RECOVERY FULL 
GO
ALTER DATABASE [sheep] SET  MULTI_USER 
GO
ALTER DATABASE [sheep] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [sheep] SET DB_CHAINING OFF 
GO
ALTER DATABASE [sheep] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [sheep] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [sheep] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [sheep] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'sheep', N'ON'
GO
ALTER DATABASE [sheep] SET QUERY_STORE = OFF
GO
USE [sheep]
GO
/****** Object:  Schema [ActiveHerd]    Script Date: 2/13/2023 9:01:14 PM ******/
CREATE SCHEMA [ActiveHerd]
GO
/****** Object:  Table [ActiveHerd].[breed]    Script Date: 2/13/2023 9:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ActiveHerd].[breed](
	[BreedCategory] [char](20) NOT NULL,
	[BreedDescription] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[BreedCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ActiveHerd].[injectionList]    Script Date: 2/13/2023 9:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ActiveHerd].[injectionList](
	[InjectionType] [char](20) NOT NULL,
	[injectionDescription] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[InjectionType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ActiveHerd].[sheep]    Script Date: 2/13/2023 9:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ActiveHerd].[sheep](
	[IdNumber] [int] NOT NULL,
	[SheepName] [char](30) NULL,
	[BreedCategory] [char](20) NULL,
	[Gender] [char](1) NULL,
	[ShepherdId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ActiveHerd].[sheepShots]    Script Date: 2/13/2023 9:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ActiveHerd].[sheepShots](
	[IdNumber] [int] NOT NULL,
	[ShotType] [char](20) NULL,
	[ShotDate] [date] NULL,
	[InjectionType] [char](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [ActiveHerd].[shepherd]    Script Date: 2/13/2023 9:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ActiveHerd].[shepherd](
	[ShepherdID] [int] NOT NULL,
	[LastName] [varchar](20) NULL,
	[FirstName] [varchar](20) NULL,
	[ShepherdCertification] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ShepherdID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ActiveHerd].[shotList]    Script Date: 2/13/2023 9:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ActiveHerd].[shotList](
	[ShotType] [char](20) NOT NULL,
	[shotDescription] [varchar](100) NULL,
	[dayCycle] [char](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[ShotType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [ActiveHerd].[sheep]  WITH CHECK ADD  CONSTRAINT [FK_breed] FOREIGN KEY([BreedCategory])
REFERENCES [ActiveHerd].[breed] ([BreedCategory])
GO
ALTER TABLE [ActiveHerd].[sheep] CHECK CONSTRAINT [FK_breed]
GO
ALTER TABLE [ActiveHerd].[sheep]  WITH CHECK ADD  CONSTRAINT [FK_ShepherdID] FOREIGN KEY([ShepherdId])
REFERENCES [ActiveHerd].[shepherd] ([ShepherdID])
GO
ALTER TABLE [ActiveHerd].[sheep] CHECK CONSTRAINT [FK_ShepherdID]
GO
ALTER TABLE [ActiveHerd].[sheepShots]  WITH CHECK ADD  CONSTRAINT [FK_injectionType] FOREIGN KEY([InjectionType])
REFERENCES [ActiveHerd].[injectionList] ([InjectionType])
GO
ALTER TABLE [ActiveHerd].[sheepShots] CHECK CONSTRAINT [FK_injectionType]
GO
ALTER TABLE [ActiveHerd].[sheepShots]  WITH CHECK ADD  CONSTRAINT [FK_sheepShotType] FOREIGN KEY([ShotType])
REFERENCES [ActiveHerd].[shotList] ([ShotType])
GO
ALTER TABLE [ActiveHerd].[sheepShots] CHECK CONSTRAINT [FK_sheepShotType]
GO
USE [master]
GO
ALTER DATABASE [sheep] SET  READ_WRITE 
GO