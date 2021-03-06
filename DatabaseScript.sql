USE [master]
GO
/****** Object:  Database [PeopleAppDB]    Script Date: 11.03.2022 05:43:14 ******/
CREATE DATABASE [PeopleAppDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PeopleAppDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PeopleAppDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PeopleAppDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PeopleAppDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PeopleAppDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PeopleAppDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PeopleAppDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PeopleAppDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PeopleAppDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PeopleAppDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PeopleAppDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [PeopleAppDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PeopleAppDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PeopleAppDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PeopleAppDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PeopleAppDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PeopleAppDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PeopleAppDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PeopleAppDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PeopleAppDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PeopleAppDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PeopleAppDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PeopleAppDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PeopleAppDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PeopleAppDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PeopleAppDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PeopleAppDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PeopleAppDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PeopleAppDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PeopleAppDB] SET  MULTI_USER 
GO
ALTER DATABASE [PeopleAppDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PeopleAppDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PeopleAppDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PeopleAppDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PeopleAppDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PeopleAppDB] SET QUERY_STORE = OFF
GO
USE [PeopleAppDB]
GO
/****** Object:  Table [dbo].[EducationStatuses]    Script Date: 11.03.2022 05:43:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EducationStatuses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[educationName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_EducationStatuses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jobs]    Script Date: 11.03.2022 05:43:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[jobName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Jobs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[People]    Script Date: 11.03.2022 05:43:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](max) NULL,
	[last_name] [nvarchar](max) NULL,
	[email] [nvarchar](max) NULL,
	[birthdate] [datetime] NULL,
	[job] [int] NULL,
	[education_status] [int] NULL,
 CONSTRAINT [PK_People] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[EducationStatuses] ON 

INSERT [dbo].[EducationStatuses] ([id], [educationName]) VALUES (1, N'İlkokul')
INSERT [dbo].[EducationStatuses] ([id], [educationName]) VALUES (2, N'Ortaokul')
INSERT [dbo].[EducationStatuses] ([id], [educationName]) VALUES (3, N'Lise')
INSERT [dbo].[EducationStatuses] ([id], [educationName]) VALUES (4, N'Lisans')
INSERT [dbo].[EducationStatuses] ([id], [educationName]) VALUES (5, N'Yüksek Lisans')
INSERT [dbo].[EducationStatuses] ([id], [educationName]) VALUES (6, N'Doktora ve Üstü')
SET IDENTITY_INSERT [dbo].[EducationStatuses] OFF
GO
SET IDENTITY_INSERT [dbo].[Jobs] ON 

INSERT [dbo].[Jobs] ([id], [jobName]) VALUES (1, N'Staff Accountant IV')
INSERT [dbo].[Jobs] ([id], [jobName]) VALUES (2, N'Developer I')
INSERT [dbo].[Jobs] ([id], [jobName]) VALUES (3, N'Software Engineer IV')
INSERT [dbo].[Jobs] ([id], [jobName]) VALUES (4, N'Senior Cost Accountant')
INSERT [dbo].[Jobs] ([id], [jobName]) VALUES (5, N'Civil Engineer')
INSERT [dbo].[Jobs] ([id], [jobName]) VALUES (6, N'Dental Hygienist')
INSERT [dbo].[Jobs] ([id], [jobName]) VALUES (7, N'Software Test Engineer I')
INSERT [dbo].[Jobs] ([id], [jobName]) VALUES (8, N'Senior Developer')
INSERT [dbo].[Jobs] ([id], [jobName]) VALUES (9, N'Paralegal')
INSERT [dbo].[Jobs] ([id], [jobName]) VALUES (10, N'Computer Systems Analyst III')
INSERT [dbo].[Jobs] ([id], [jobName]) VALUES (11, N'Electrical Engineer')
INSERT [dbo].[Jobs] ([id], [jobName]) VALUES (12, N'Accounting Assistant III')
INSERT [dbo].[Jobs] ([id], [jobName]) VALUES (13, N'Tax Accountant')
INSERT [dbo].[Jobs] ([id], [jobName]) VALUES (14, N'Junior Executive')
INSERT [dbo].[Jobs] ([id], [jobName]) VALUES (15, N'Geologist III')
INSERT [dbo].[Jobs] ([id], [jobName]) VALUES (16, N'Senior Sales Associate')
INSERT [dbo].[Jobs] ([id], [jobName]) VALUES (17, N'Executive Secretary')
INSERT [dbo].[Jobs] ([id], [jobName]) VALUES (18, N'Administrative Officer')
INSERT [dbo].[Jobs] ([id], [jobName]) VALUES (19, N'Biostatistician III')
INSERT [dbo].[Jobs] ([id], [jobName]) VALUES (20, N'Operator')
INSERT [dbo].[Jobs] ([id], [jobName]) VALUES (21, N'Administrative Assistant III')
INSERT [dbo].[Jobs] ([id], [jobName]) VALUES (22, N'Software Consultant')
INSERT [dbo].[Jobs] ([id], [jobName]) VALUES (23, N'Nuclear Power Engineer')
INSERT [dbo].[Jobs] ([id], [jobName]) VALUES (24, N'GIS Technical Architect')
INSERT [dbo].[Jobs] ([id], [jobName]) VALUES (25, N'Human Resources Manager')
SET IDENTITY_INSERT [dbo].[Jobs] OFF
GO
SET IDENTITY_INSERT [dbo].[People] ON 

INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (1, N'Stormie', N'Dundon', N'sdundon0@tinyurl.com', CAST(N'1992-02-19T08:00:00.000' AS DateTime), 6, 3)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (2, N'Nataline', N'Skirrow', N'nskirrow1@1688.com', CAST(N'1992-01-22T00:00:00.000' AS DateTime), 29, 8)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (3, N'Baillie', N'Ravenscroft', N'bravenscroft2@ed.gov', CAST(N'1988-04-24T00:00:00.000' AS DateTime), 18, 3)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (4, N'Charley', N'McCarl', N'cmccarl3@yelp.com', CAST(N'1976-02-28T00:00:00.000' AS DateTime), 20, 3)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (5, N'Anthea', N'Peschet', N'apeschet4@admin.ch', CAST(N'1991-02-06T00:00:00.000' AS DateTime), 7, 7)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (6, N'Agna', N'Cardenoza', N'acardenoza5@npr.org', CAST(N'1998-04-11T00:00:00.000' AS DateTime), 14, 1)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (7, N'Louisette', N'Ivory', N'livory6@ezinearticles.com', CAST(N'1997-05-11T00:00:00.000' AS DateTime), 7, 4)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (8, N'Matelda', N'Poluzzi', N'mpoluzzi7@cnn.com', CAST(N'1993-08-26T00:00:00.000' AS DateTime), 17, 4)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (9, N'Brander', N'Dooler', N'bdooler8@creativecommons.org', CAST(N'1972-12-09T00:00:00.000' AS DateTime), 11, 6)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (10, N'Cathrin', N'Fisher', N'cfisher9@booking.com', CAST(N'2005-02-14T00:00:00.000' AS DateTime), 28, 2)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (11, N'Jeremias', N'Gier', N'jgiera@1688.com', CAST(N'1988-05-24T00:00:00.000' AS DateTime), 17, 2)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (12, N'Elroy', N'Clutterham', N'eclutterhamb@house.gov', CAST(N'1973-11-10T00:00:00.000' AS DateTime), 23, 10)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (13, N'Karia', N'Mineghelli', N'kmineghellic@aol.com', CAST(N'1996-11-04T00:00:00.000' AS DateTime), 2, 7)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (14, N'Stefania', N'Langrish', N'slangrishd@pcworld.com', CAST(N'1974-05-12T00:00:00.000' AS DateTime), 21, 7)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (15, N'Fania', N'McCabe', N'fmccabee@livejournal.com', CAST(N'2005-08-26T00:00:00.000' AS DateTime), 24, 5)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (16, N'Rosene', N'Causon', N'rcausonf@so-net.ne.jp', CAST(N'1996-03-23T00:00:00.000' AS DateTime), 11, 5)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (17, N'Garrik', N'Giorgiutti', N'ggiorgiuttig@psu.edu', CAST(N'1998-06-30T00:00:00.000' AS DateTime), 11, 9)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (18, N'Linet', N'Fitchew', N'lfitchewh@marriott.com', CAST(N'2005-02-04T00:00:00.000' AS DateTime), 22, 9)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (19, N'Spencer', N'Dunkerly', N'sdunkerlyi@ehow.com', CAST(N'1976-10-11T00:00:00.000' AS DateTime), 17, 3)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (20, N'Tybi', N'Viney', N'tvineyj@quantcast.com', CAST(N'1999-08-09T00:00:00.000' AS DateTime), 14, 6)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (21, N'Matilda', N'Sapseed', N'msapseedk@answers.com', CAST(N'2005-04-10T00:00:00.000' AS DateTime), 27, 8)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (22, N'Joannes', N'Steane', N'jsteanel@berkeley.edu', CAST(N'1982-08-01T00:00:00.000' AS DateTime), 6, 4)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (23, N'Cora', N'Bass', N'cbassm@zimbio.com', CAST(N'2001-11-13T00:00:00.000' AS DateTime), 1, 8)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (24, N'Tasia', N'Brann', N'tbrannn@cnet.com', CAST(N'1987-07-12T00:00:00.000' AS DateTime), 28, 9)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (25, N'Cord', N'Roscrigg', N'croscriggo@last.fm', CAST(N'1992-09-09T00:00:00.000' AS DateTime), 26, 3)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (26, N'Beverlee', N'Matyushonok', N'bmatyushonokp@printfriendly.com', CAST(N'1989-07-24T00:00:00.000' AS DateTime), 5, 9)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (27, N'Andris', N'Baume', N'abaumeq@bing.com', CAST(N'1996-12-20T00:00:00.000' AS DateTime), 28, 8)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (28, N'Merrie', N'Bear', N'mbearr@vistaprint.com', CAST(N'1979-04-05T00:00:00.000' AS DateTime), 5, 3)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (29, N'Amery', N'Dearnaley', N'adearnaleys@cdc.gov', CAST(N'1973-04-17T00:00:00.000' AS DateTime), 29, 7)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (30, N'Mollie', N'Garrould', N'mgarrouldt@si.edu', CAST(N'2001-12-06T00:00:00.000' AS DateTime), 2, 3)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (31, N'Olenolin', N'Murrhardt', N'omurrhardtu@cbc.ca', CAST(N'1986-03-14T00:00:00.000' AS DateTime), 16, 9)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (32, N'Madelyn', N'Stitson', N'mstitsonv@cmu.edu', CAST(N'1982-09-29T00:00:00.000' AS DateTime), 14, 10)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (33, N'Ophelie', N'Ferrick', N'oferrickw@cpanel.net', CAST(N'1979-07-13T00:00:00.000' AS DateTime), 3, 4)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (34, N'Deirdre', N'Mackieson', N'dmackiesonx@google.co.uk', CAST(N'1980-01-20T00:00:00.000' AS DateTime), 28, 10)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (35, N'Caralie', N'Bumpus', N'cbumpusy@cargocollective.com', CAST(N'1991-09-28T00:00:00.000' AS DateTime), 7, 8)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (36, N'Emory', N'Lasty', N'elastyz@google.pl', CAST(N'1984-02-04T00:00:00.000' AS DateTime), 29, 6)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (37, N'Wendell', N'Juschke', N'wjuschke10@angelfire.com', CAST(N'1987-09-28T00:00:00.000' AS DateTime), 1, 5)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (38, N'Isaiah', N'Stanney', N'istanney11@google.ca', CAST(N'1991-08-18T00:00:00.000' AS DateTime), 11, 6)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (39, N'Chandler', N'Beadel', N'cbeadel12@yolasite.com', CAST(N'2000-01-22T00:00:00.000' AS DateTime), 18, 4)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (40, N'Mac', N'Catherine', N'mcatherine13@soundcloud.com', CAST(N'2001-03-29T00:00:00.000' AS DateTime), 22, 8)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (41, N'Ninon', N'Watkins', N'nwatkins14@skype.com', CAST(N'1978-02-25T00:00:00.000' AS DateTime), 21, 8)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (42, N'Jamie', N'Enbury', N'jenbury15@nationalgeographic.com', CAST(N'1997-03-29T00:00:00.000' AS DateTime), 19, 4)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (43, N'Evvie', N'Monelle', N'emonelle16@dailymotion.com', CAST(N'2002-01-23T00:00:00.000' AS DateTime), 7, 5)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (44, N'Glenine', N'Kasparski', N'gkasparski17@wikia.com', CAST(N'1995-09-08T00:00:00.000' AS DateTime), 25, 7)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (45, N'Elaine', N'Gascoyne', N'egascoyne18@aboutads.info', CAST(N'1993-08-22T00:00:00.000' AS DateTime), 15, 10)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (46, N'Josh', N'Spera', N'jspera19@seattletimes.com', CAST(N'2003-03-26T00:00:00.000' AS DateTime), 29, 8)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (47, N'Melonie', N'Townend', N'mtownend1a@zdnet.com', CAST(N'2001-06-10T00:00:00.000' AS DateTime), 19, 4)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (48, N'Gerhard', N'Caddock', N'gcaddock1b@angelfire.com', CAST(N'1993-07-23T00:00:00.000' AS DateTime), 17, 5)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (49, N'Bertina', N'Garmanson', N'bgarmanson1c@cyberchimps.com', CAST(N'1994-09-01T00:00:00.000' AS DateTime), 16, 4)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (50, N'Vitoria', N'Colquite', N'vcolquite1d@sun.com', CAST(N'1996-10-24T00:00:00.000' AS DateTime), 29, 10)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (51, N'Luke', N'Rebichon', N'lrebichon1e@51.la', CAST(N'1994-10-24T00:00:00.000' AS DateTime), 18, 6)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (52, N'Zarah', N'Dutnall', N'zdutnall1f@state.tx.us', CAST(N'1978-11-11T00:00:00.000' AS DateTime), 24, 9)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (53, N'Margareta', N'Ielden', N'mielden1g@elpais.com', CAST(N'1995-07-17T00:00:00.000' AS DateTime), 21, 8)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (54, N'Selma', N'Nutman', N'snutman1h@twitter.com', CAST(N'1979-02-03T00:00:00.000' AS DateTime), 28, 6)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (55, N'Bennett', N'Skerman', N'bskerman1i@nba.com', CAST(N'1990-08-02T00:00:00.000' AS DateTime), 19, 7)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (56, N'Byran', N'Winnard', N'bwinnard1j@csmonitor.com', CAST(N'1997-11-27T00:00:00.000' AS DateTime), 4, 9)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (57, N'Paolina', N'Goade', N'pgoade1k@bloglovin.com', CAST(N'1981-10-11T00:00:00.000' AS DateTime), 19, 8)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (58, N'Norman', N'Lehrer', N'nlehrer1l@wordpress.com', CAST(N'1982-05-05T00:00:00.000' AS DateTime), 21, 8)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (59, N'Guenna', N'O''Glassane', N'goglassane1m@paypal.com', CAST(N'1983-10-08T00:00:00.000' AS DateTime), 15, 3)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (60, N'Jewell', N'Iacopetti', N'jiacopetti1n@bluehost.com', CAST(N'1973-01-01T00:00:00.000' AS DateTime), 1, 6)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (80, N'Enes Can', N'Uyar   ', N'uyar.enescan@gmail.com', CAST(N'1996-05-07T11:00:00.000' AS DateTime), 7, 4)
INSERT [dbo].[People] ([id], [first_name], [last_name], [email], [birthdate], [job], [education_status]) VALUES (86, N'Baillie', N'Uyar', N'education@bb.com.tr', CAST(N'1990-01-26T22:00:00.000' AS DateTime), 3, 6)
SET IDENTITY_INSERT [dbo].[People] OFF
GO
USE [master]
GO
ALTER DATABASE [PeopleAppDB] SET  READ_WRITE 
GO
