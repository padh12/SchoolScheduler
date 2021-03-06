USE [master]
GO
/****** Object:  Database [TimeTable]    Script Date: 12/17/2014 11:26:06 ******/
CREATE DATABASE [TimeTable] ON  PRIMARY 
( NAME = N'TimeTable', FILENAME = N'D:\Dharsith Softech\DATA\TimeTable.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TimeTable_log', FILENAME = N'D:\Dharsith Softech\DATA\TimeTable_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TimeTable] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TimeTable].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TimeTable] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [TimeTable] SET ANSI_NULLS OFF
GO
ALTER DATABASE [TimeTable] SET ANSI_PADDING OFF
GO
ALTER DATABASE [TimeTable] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [TimeTable] SET ARITHABORT OFF
GO
ALTER DATABASE [TimeTable] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [TimeTable] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [TimeTable] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [TimeTable] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [TimeTable] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [TimeTable] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [TimeTable] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [TimeTable] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [TimeTable] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [TimeTable] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [TimeTable] SET  DISABLE_BROKER
GO
ALTER DATABASE [TimeTable] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [TimeTable] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [TimeTable] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [TimeTable] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [TimeTable] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [TimeTable] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [TimeTable] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [TimeTable] SET  READ_WRITE
GO
ALTER DATABASE [TimeTable] SET RECOVERY SIMPLE
GO
ALTER DATABASE [TimeTable] SET  MULTI_USER
GO
ALTER DATABASE [TimeTable] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [TimeTable] SET DB_CHAINING OFF
GO
USE [TimeTable]
GO
/****** Object:  Table [dbo].[TeachvsSubdet]    Script Date: 12/17/2014 11:26:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeachvsSubdet](
	[SubjectId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeachvsSub]    Script Date: 12/17/2014 11:26:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeachvsSub](
	[TeachId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeachMst]    Script Date: 12/17/2014 11:26:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeachMst](
	[TeacherId] [int] NULL,
	[TeachFirstName] [nvarchar](50) NULL,
	[TeachLastName] [nvarchar](50) NULL,
	[ShortName] [nvarchar](50) NULL,
	[Gender] [bit] NULL,
	[Address] [nvarchar](50) NULL,
	[PhoneNo] [nvarchar](50) NULL,
	[MobileNo] [nvarchar](50) NULL,
	[Mailid] [nvarchar](50) NULL,
	[Maxperiodperday] [tinyint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubjectMst]    Script Date: 12/17/2014 11:26:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectMst](
	[SubjectID] [int] NULL,
	[SubjectName] [nvarchar](50) NULL,
	[SubjectCode] [nvarchar](50) NULL,
	[Priority] [tinyint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClassVsSubMst]    Script Date: 12/17/2014 11:26:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassVsSubMst](
	[ClassId] [int] NULL,
	[SubjectId] [int] NULL,
	[NoofPeriods] [tinyint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClassMst]    Script Date: 12/17/2014 11:26:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassMst](
	[ClassId] [int] NULL,
	[ShortName] [tinyint] NULL,
	[ClassName] [tinyint] NULL,
	[NoofDivision] [tinyint] NULL,
	[ClassType] [tinyint] NULL,
	[SchoolId] [int] NULL
) ON [PRIMARY]
GO
