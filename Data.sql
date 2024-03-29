USE [master]
GO
/****** Object:  Database [CarRental]    Script Date: 3/12/2019 9:34:55 PM ******/
CREATE DATABASE [CarRental]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CarRental', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\CarRental.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CarRental_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\CarRental_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CarRental] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CarRental].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CarRental] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CarRental] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CarRental] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CarRental] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CarRental] SET ARITHABORT OFF 
GO
ALTER DATABASE [CarRental] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CarRental] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CarRental] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CarRental] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CarRental] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CarRental] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CarRental] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CarRental] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CarRental] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CarRental] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CarRental] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CarRental] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CarRental] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CarRental] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CarRental] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CarRental] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CarRental] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CarRental] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CarRental] SET  MULTI_USER 
GO
ALTER DATABASE [CarRental] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CarRental] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CarRental] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CarRental] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CarRental] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CarRental] SET QUERY_STORE = OFF
GO
USE [CarRental]
GO
/****** Object:  Table [dbo].[Branches]    Script Date: 3/12/2019 9:34:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branches](
	[BranchID] [int] NOT NULL,
	[Address] [nchar](50) NOT NULL,
	[Location] [nchar](50) NOT NULL,
	[BranchName] [nchar](30) NOT NULL,
 CONSTRAINT [PK_Branches] PRIMARY KEY CLUSTERED 
(
	[BranchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarDetails]    Script Date: 3/12/2019 9:34:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarDetails](
	[CarID] [int] NOT NULL,
	[CarNumber] [int] NOT NULL,
	[CarType] [nchar](10) NOT NULL,
	[Kilometer] [int] NOT NULL,
	[Proper] [nchar](20) NOT NULL,
	[Vacant] [nchar](20) NOT NULL,
	[BranchID] [int] NOT NULL,
 CONSTRAINT [PK_CarDetails] PRIMARY KEY CLUSTERED 
(
	[CarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cars]    Script Date: 3/12/2019 9:34:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[CarID] [int] IDENTITY(6,1) NOT NULL,
	[Manufacturer] [nchar](20) NOT NULL,
	[Model] [nchar](20) NOT NULL,
	[DayPrice] [int] NOT NULL,
	[LateDayPrice] [int] NOT NULL,
	[ProductionYear] [int] NULL,
	[Gear] [nchar](20) NOT NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_Cars] PRIMARY KEY CLUSTERED 
(
	[CarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rentals]    Script Date: 3/12/2019 9:34:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rentals](
	[RentalID] [int] IDENTITY(6,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CarID] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[TrueEndDate] [date] NULL,
 CONSTRAINT [PK_Rentals] PRIMARY KEY CLUSTERED 
(
	[RentalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/12/2019 9:34:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(6,1) NOT NULL,
	[FullName] [nchar](50) NOT NULL,
	[UserName] [nchar](10) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[Gender] [nchar](10) NOT NULL,
	[Email] [nchar](50) NOT NULL,
	[Password] [nchar](20) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Branches] ([BranchID], [Address], [Location], [BranchName]) VALUES (1, N'Ben David 3                                       ', N'Jerusalem                                         ', N'Rent A Car                    ')
INSERT [dbo].[Branches] ([BranchID], [Address], [Location], [BranchName]) VALUES (2, N'Koshkosha 8                                       ', N'Tel Aviv                                          ', N'Car Masters                   ')
INSERT [dbo].[Branches] ([BranchID], [Address], [Location], [BranchName]) VALUES (3, N'Gav Ronen 8                                       ', N'Beer Sheva                                        ', N'Car For Mahar                 ')
INSERT [dbo].[CarDetails] ([CarID], [CarNumber], [CarType], [Kilometer], [Proper], [Vacant], [BranchID]) VALUES (1, 123456789, N'Luczure   ', 12000, N'Yes                 ', N'Yes                 ', 1)
INSERT [dbo].[CarDetails] ([CarID], [CarNumber], [CarType], [Kilometer], [Proper], [Vacant], [BranchID]) VALUES (2, 987654321, N'Family    ', 48000, N'Yes                 ', N'No                  ', 3)
INSERT [dbo].[CarDetails] ([CarID], [CarNumber], [CarType], [Kilometer], [Proper], [Vacant], [BranchID]) VALUES (3, 947382745, N'Mini      ', 56000, N'Yes                 ', N'No                  ', 2)
INSERT [dbo].[CarDetails] ([CarID], [CarNumber], [CarType], [Kilometer], [Proper], [Vacant], [BranchID]) VALUES (4, 324876956, N'Luczure   ', 34000, N'Yes                 ', N'No                  ', 2)
INSERT [dbo].[CarDetails] ([CarID], [CarNumber], [CarType], [Kilometer], [Proper], [Vacant], [BranchID]) VALUES (5, 486739485, N'Family    ', 60000, N'Yes                 ', N'Yes                 ', 1)
SET IDENTITY_INSERT [dbo].[Cars] ON 

INSERT [dbo].[Cars] ([CarID], [Manufacturer], [Model], [DayPrice], [LateDayPrice], [ProductionYear], [Gear], [Image]) VALUES (1, N'Mercedes            ', N'pm12                ', 300, 500, 2017, N'Auto                ', N'/assets/images/mercedes.jpg')
INSERT [dbo].[Cars] ([CarID], [Manufacturer], [Model], [DayPrice], [LateDayPrice], [ProductionYear], [Gear], [Image]) VALUES (2, N'Mazda               ', N'2                   ', 400, 800, 2016, N'Auto                ', N'/assets/images/mazda.jpg')
INSERT [dbo].[Cars] ([CarID], [Manufacturer], [Model], [DayPrice], [LateDayPrice], [ProductionYear], [Gear], [Image]) VALUES (3, N'Shevrolet           ', N'ER540               ', 300, 600, 2015, N'Manual              ', N'/assets/images/Chevrolet.jpg')
INSERT [dbo].[Cars] ([CarID], [Manufacturer], [Model], [DayPrice], [LateDayPrice], [ProductionYear], [Gear], [Image]) VALUES (4, N'BMW                 ', N'B200                ', 350, 500, 2019, N'Auto                ', N'/assets/images/BMW.jpg')
INSERT [dbo].[Cars] ([CarID], [Manufacturer], [Model], [DayPrice], [LateDayPrice], [ProductionYear], [Gear], [Image]) VALUES (5, N'Volvo               ', N'Dr332               ', 250, 400, 2017, N'Manual              ', N'/assets/images/Volvo.jpg')
SET IDENTITY_INSERT [dbo].[Cars] OFF
SET IDENTITY_INSERT [dbo].[Rentals] ON 

INSERT [dbo].[Rentals] ([RentalID], [UserID], [CarID], [StartDate], [EndDate], [TrueEndDate]) VALUES (1, 1, 1, CAST(N'2018-08-02' AS Date), CAST(N'2018-09-12' AS Date), CAST(N'2018-09-12' AS Date))
INSERT [dbo].[Rentals] ([RentalID], [UserID], [CarID], [StartDate], [EndDate], [TrueEndDate]) VALUES (2, 2, 2, CAST(N'2018-01-02' AS Date), CAST(N'2018-02-12' AS Date), CAST(N'2018-02-14' AS Date))
INSERT [dbo].[Rentals] ([RentalID], [UserID], [CarID], [StartDate], [EndDate], [TrueEndDate]) VALUES (3, 3, 3, CAST(N'2017-04-02' AS Date), CAST(N'2018-04-12' AS Date), CAST(N'2018-04-12' AS Date))
INSERT [dbo].[Rentals] ([RentalID], [UserID], [CarID], [StartDate], [EndDate], [TrueEndDate]) VALUES (4, 4, 4, CAST(N'2017-04-02' AS Date), CAST(N'2017-05-12' AS Date), CAST(N'2017-06-12' AS Date))
INSERT [dbo].[Rentals] ([RentalID], [UserID], [CarID], [StartDate], [EndDate], [TrueEndDate]) VALUES (5, 5, 5, CAST(N'2019-05-02' AS Date), CAST(N'2019-05-12' AS Date), CAST(N'2019-05-12' AS Date))
INSERT [dbo].[Rentals] ([RentalID], [UserID], [CarID], [StartDate], [EndDate], [TrueEndDate]) VALUES (8, 4, 1, CAST(N'2018-08-02' AS Date), CAST(N'2018-09-12' AS Date), NULL)
INSERT [dbo].[Rentals] ([RentalID], [UserID], [CarID], [StartDate], [EndDate], [TrueEndDate]) VALUES (10, 3, 1, CAST(N'2018-08-02' AS Date), CAST(N'2018-09-12' AS Date), NULL)
INSERT [dbo].[Rentals] ([RentalID], [UserID], [CarID], [StartDate], [EndDate], [TrueEndDate]) VALUES (11, 3, 1, CAST(N'2018-08-02' AS Date), CAST(N'2018-09-12' AS Date), NULL)
INSERT [dbo].[Rentals] ([RentalID], [UserID], [CarID], [StartDate], [EndDate], [TrueEndDate]) VALUES (12, 3, 5, CAST(N'2018-08-02' AS Date), CAST(N'2018-09-12' AS Date), NULL)
INSERT [dbo].[Rentals] ([RentalID], [UserID], [CarID], [StartDate], [EndDate], [TrueEndDate]) VALUES (13, 3, 3, CAST(N'2019-02-27' AS Date), CAST(N'2019-03-28' AS Date), NULL)
INSERT [dbo].[Rentals] ([RentalID], [UserID], [CarID], [StartDate], [EndDate], [TrueEndDate]) VALUES (14, 2, 3, CAST(N'1111-11-11' AS Date), CAST(N'2222-02-22' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Rentals] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [FullName], [UserName], [BirthDate], [Gender], [Email], [Password]) VALUES (1, N'Itay Flaysher                                     ', N'ItayFx    ', CAST(N'1997-03-22' AS Date), N'Male      ', N'ItayF3x@Gmail.com                                 ', N'galisawsome         ')
INSERT [dbo].[Users] ([UserID], [FullName], [UserName], [BirthDate], [Gender], [Email], [Password]) VALUES (2, N'Gal Nitzan                                        ', N'galnitzan ', CAST(N'1994-11-30' AS Date), N'Male      ', N'galnitz@Gmail.com                                 ', N'itayisawsome        ')
INSERT [dbo].[Users] ([UserID], [FullName], [UserName], [BirthDate], [Gender], [Email], [Password]) VALUES (3, N'Dror Kalki                                        ', N'drormeleh ', CAST(N'1974-04-12' AS Date), N'Male      ', N'drormemi@Gmail.com                                ', N'drorisbest          ')
INSERT [dbo].[Users] ([UserID], [FullName], [UserName], [BirthDate], [Gender], [Email], [Password]) VALUES (4, N'Michal Romen                                      ', N'michal123 ', CAST(N'1984-04-10' AS Date), N'Female    ', N'Michalik@Gmail.com                                ', N'michalpassword      ')
INSERT [dbo].[Users] ([UserID], [FullName], [UserName], [BirthDate], [Gender], [Email], [Password]) VALUES (5, N'Niko Belic                                        ', N'nikokill  ', CAST(N'1999-02-10' AS Date), N'Male      ', N'nikokingo@Gmail.com                               ', N'nikoheretokill      ')
INSERT [dbo].[Users] ([UserID], [FullName], [UserName], [BirthDate], [Gender], [Email], [Password]) VALUES (6, N'Asd rashid                                        ', N'Asdasd    ', CAST(N'2019-04-03' AS Date), N'Male      ', N'asd@asd.com                                       ', N'Asd123              ')
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Index [IX_Cars]    Script Date: 3/12/2019 9:34:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_Cars] ON [dbo].[Cars]
(
	[CarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CarDetails]  WITH CHECK ADD  CONSTRAINT [FK_CarDetails_Branches] FOREIGN KEY([BranchID])
REFERENCES [dbo].[Branches] ([BranchID])
GO
ALTER TABLE [dbo].[CarDetails] CHECK CONSTRAINT [FK_CarDetails_Branches]
GO
ALTER TABLE [dbo].[CarDetails]  WITH CHECK ADD  CONSTRAINT [FK_CarDetails_Cars] FOREIGN KEY([CarID])
REFERENCES [dbo].[Cars] ([CarID])
GO
ALTER TABLE [dbo].[CarDetails] CHECK CONSTRAINT [FK_CarDetails_Cars]
GO
ALTER TABLE [dbo].[Rentals]  WITH CHECK ADD  CONSTRAINT [FK_Rentals_CarDetails] FOREIGN KEY([CarID])
REFERENCES [dbo].[CarDetails] ([CarID])
GO
ALTER TABLE [dbo].[Rentals] CHECK CONSTRAINT [FK_Rentals_CarDetails]
GO
ALTER TABLE [dbo].[Rentals]  WITH CHECK ADD  CONSTRAINT [FK_Rentals_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Rentals] CHECK CONSTRAINT [FK_Rentals_Users]
GO
USE [master]
GO
ALTER DATABASE [CarRental] SET  READ_WRITE 
GO
