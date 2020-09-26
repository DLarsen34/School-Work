---- PurpleBoxDVD Creation Script
---- CS 3550 Spring 2019
---- Dalton Larsen
-------------------------------------------------------------------

USE Master;

----------------
IF EXISTS (SELECT * FROM sys.sysdatabases WHERE name = 'PurpleBoxDVD')
DROP DATABASE PurpleBoxDVD;

-----------------------------------------------------------------------

-- Create the database
-- File path where the SQL server installation is found
-- on my computer
------------------------------------------------------------------------

CREATE DATABASE [PurpleBoxDVD]
	ON Primary
(NAME = N'PurpleBoxDVD', FILENAME = 
N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PurpleBoxDVD.mdf',
SIZE = 5120KB, FILEGROWTH = 1024KB)
LOG ON(NAME = N'PurpleBoxDVD_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PurpleBoxDVD_Log.ldf',
SIZE = 2048KB, FILEGROWTH = 10%);

GO



--------------------------------------------------------------
--Attach to the correct database
--------------------------------------------------------------
USE PurpleBoxDVD;

--------------------------------------------------------------
--Drop Tables if they already exist
--------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.tables WHERE name = N'PbUser')
	DROP TABLE PbUser;

IF EXISTS (SELECT * FROM sys.tables WHERE name = N'PbUserQuestion')
	DROP TABLE PbUserQuestion;

IF EXISTS (SELECT * FROM sys.tables WHERE name = N'PbQuestion')
	DROP TABLE PbQuestion;

IF EXISTS (SELECT * FROM sys.tables WHERE name = N'PbMovieRental')
	DROP TABLE PbMovieRental;
	
IF EXISTS (SELECT * FROM sys.tables WHERE name = N'PbMovieReservation')
	DROP TABLE PbMovieReservation;

IF EXISTS (SELECT * FROM sys.tables WHERE name = N'PbMovieItem')
	DROP TABLE PbMovieItem;

IF EXISTS (SELECT * FROM sys.tables WHERE name = N'PbMovie')
	DROP TABLE PbMovie;

IF EXISTS (SELECT * FROM sys.tables WHERE name = N'PbMovieGenre')
	DROP TABLE PbMovieGenre;

IF EXISTS (SELECT * FROM sys.tables WHERE name = N'PbGenre')
	DROP TABLE PbGenre;

IF EXISTS (SELECT * FROM sys.tables WHERE name = N'PbMovieDirector')
	DROP TABLE PbMovieDirector;

IF EXISTS (SELECT * FROM sys.tables WHERE name = N'PbDirector')
	DROP TABLE PbDirector;

IF EXISTS (SELECT * FROM sys.tables WHERE name = N'PbMovieKeyword')
	DROP TABLE PbMovieKeyword;

IF EXISTS (SELECT * FROM sys.tables WHERE name = N'PbKeyword')
	DROP TABLE PbKeyword;

IF EXISTS (SELECT * FROM sys.tables WHERE name = N'PbMovieActor')
	DROP TABLE PbMovieActor;

IF EXISTS (SELECT * FROM sys.tables WHERE name = N'PbActor')
	DROP TABLE PbActor;
--------------------------------------------------------------
--Create TABLES
--------------------------------------------------------------
CREATE TABLE PbUser (
	pbUser_id int NOT NULL IDENTITY(1,1),
	userID nvarchar(9) NOT NULL,
	userFirstName nvarchar(25) NOT NULL,
	userLastName nvarchar(50) NOT NULL,
	userPassword nvarchar(255) NOT NULL,
	userPhoneNumber nvarchar(10) NOT NULL,
	userPhoneNumber2 nvarchar(10),
	userType nvarchar(1) NOT NULL,
	customerType nvarchar(1) NOT NULL,
	banStatus nvarchar(1) NOT NULL,
	fees money NOT NULL,
	lastUpdatedBy nvarchar(25) NOT NULL,
	lastUpdatedDate dateTime2 NOT NULL
);

CREATE TABLE PbUserQuestion (
	pbUser_id int NOT NULL,
	pbQuestion_id int NOT NULL,
	Answer nvarchar(255) NOT NULL,
	lastUpdatedBy nvarchar(25) NOT NULL,
	lastUpdatedDate dateTime2 NOT NULL
);

CREATE TABLE PbQuestion (
	pbQuestion_id int NOT NULL IDENTITY(1,1),
	Question nvarchar(255) NOT NULL,
	lastUpdatedBy nvarchar(25) NOT NULL,
	lastUpdatedDate dateTime2 NOT NULL
);

CREATE TABLE PbMovieRental (
	pbUser_id int NOT NULL,
	pbMovieItem_id int NOT NULL,
	rentalDate dateTime2 NOT NULL,
	returnDate dateTime2,
	dueDate dateTime2 NOT NULL,
	lastUpdatedBy nvarchar(25) NOT NULL,
	lastUpdatedDate dateTime2 NOT NULL
);

CREATE TABLE PbMovieReservation (
	pbMovie_id int NOT NULL,
	pbUser_id int NOT NULL,
	reservationDate dateTime2 NOT NULL,
	movieType nvarchar(1) NOT NULL,
	reservationStatus nvarchar(1) NOT NULL,
	lastUpdatedBy nvarchar(25) NOT NULL,
	lastUpdatedDate dateTime2 NOT NULL
);

CREATE TABLE PbMovieItem (
	pbMovieItem_id int NOT NULL IDENTITY(1,1),
	pbMovie_id int NOT NULL,
	copyNumber int NOT NULL,
	movieType nvarchar(1) NOT NULL,
	lastUpdatedBy nvarchar(25) NOT NULL,
	lastUpdatedDate dateTime2 NOT NULL
);

CREATE TABLE PbMovie (
	pbMovie_id int NOT NULL IDENTITY(1,1),
	movieID nvarchar(10) NOT NULL,
	Title nvarchar(255) NOT NULL,
	lastUpdatedBY nvarchar(25) NOT NULL,
	lastUpdatedDate dateTime2 NOT NULL
);

CREATE TABLE PbMovieGenre (
	pbMovie_id int NOT NULL,
	pbGenre_id int NOT NULL,
	lastUpdatedBy nvarchar(25) NOT NULL,
	lastUpdatedDate dateTime2 NOT NULL
);

CREATE TABLE PbGenre (
	pbGenre_id int NOT NULL IDENTITY(1,1),
	genre nvarchar(25) NOT NULL,
	genreDescription nvarchar(255) NOT NULL,
	lastUpdatedBy nvarchar(25) NOT NULL,
	lastUpdatedDate dateTime2 NOT NULL
);

CREATE TABLE PbMovieDirector (
	pbMovie_id int NOT NULL,
	pbDirector_id int NOT NULL,
	lastUpdatedBy nvarchar(25) NOT NULL,
	lastUpdatedDate dateTime2 NOT NULL
);

CREATE TABLE PbDirector (
	pbDirector_id int NOT NULL IDENTITY(1,1),
	directorFirstName nvarchar(25) NOT NULL,
	directorLastName nvarchar(50) NOT NULL,
	lastUpdatedBy nvarchar(25) NOT NULL,
	lastUpdatedDate dateTime2 NOT NULL
);

CREATE TABLE PbMovieKeyword (
	pbKeyword_id int NOT NULL,
	pbMovie_id int NOT NULL,
	lastUpdatedBy nvarchar(25) NOT NULL,
	lastUpdatedDate dateTime2 NOT NULL
);

CREATE TABLE PbKeyword (
	pbKeyword_id int NOT NULL IDENTITY(1,1),
	Keyword nvarchar(25) NOT NULL,
	lastUpdatedBy nvarchar(25) NOT NULL,
	lastUpdatedDate dateTime2 NOT NULL
);

CREATE TABLE PbMovieActor (
	pbMovie_id int NOT NULL,
	pbActor_id int NOT NULL,
	lastUpdatedBy nvarchar(25) NOT NULL,
	lastUpdatedDate dateTime2 NOT NULL
);

CREATE TABLE PbActor(
	pbActor_id int NOT NULL IDENTITY(1,1),
	actorFirstName nvarchar(25) NOT NULL,
	actorLastName nvarchar(50) NOT NULL,
	lastUpdatedBy nvarchar(25) NOT NULL,
	lastUpdatedDate dateTime2 NOT NULL
);

----------------------------------------------------------------
----Create Primary Keys
----------------------------------------------------------------
ALTER TABLE PbUser
	ADD CONSTRAINT PK_PbUser_PbUser_id PRIMARY KEY CLUSTERED (pbUser_id);

ALTER TABLE PbUserQuestion
	ADD CONSTRAINT PK_PbUserQuestion_PbUser_id_pbQuestion_id PRIMARY KEY CLUSTERED (pbUser_id, pbQuestion_id);

ALTER TABLE PbQuestion
	ADD CONSTRAINT PK_PbQuestion_PbQuestion_id PRIMARY KEY CLUSTERED (pbQuestion_id);

ALTER TABLE PbMovieRental
	ADD CONSTRAINT PK_PbMovieRental_PbUser_id_PbMovieItem_id_RentalDate PRIMARY KEY CLUSTERED (pbUser_id, pbMovieItem_id, rentalDate);

ALTER TABLE PbMovieReservation
	ADD CONSTRAINT PK_PbMovieReservation_PbMovie_id_PbUser_id_reservationDate_movieType PRIMARY KEY CLUSTERED (pbMovie_id, pbUser_id, reservationDate, movieType);

ALTER TABLE PbMovieItem
	ADD CONSTRAINT PK_PbMovieItem_PbMovieItem_id PRIMARY KEY CLUSTERED (pbMovieItem_id);

ALTER TABLE PbMovie
	ADD CONSTRAINT PK_PbMovie_pbMovie_id PRIMARY KEY CLUSTERED (pbMovie_id);

ALTER TABLE PbMovieGenre
	ADD CONSTRAINT PK_PbMovieGenre_PbMovie_id_PbGenre_id PRIMARY KEY CLUSTERED (pbMovie_id, pbGenre_id);

ALTER TABLE PbGenre
	ADD CONSTRAINT PK_PbGenre_PbGenre_id PRIMARY KEY CLUSTERED (pbGenre_id);

ALTER TABLE PbMovieDirector
	ADD CONSTRAINT PK_PbMovieDirector_PbMovie_id_pbDirecor_id PRIMARY KEY CLUSTERED (pbMovie_id, pbDirector_id);

ALTER TABLE PbDirector
	ADD CONSTRAINT PK_PbDirector_PbDirector_id PRIMARY KEY CLUSTERED (pbDirector_id);

ALTER TABLE PbMovieKeyword
	ADD CONSTRAINT PK_PbMovieKeyword_PbKeyword_id_PbMovie_id PRIMARY KEY CLUSTERED (pbKeyword_id, pbMovie_id);

ALTER TABLE PbKeyword
	ADD CONSTRAINT PK_PbKeyword_PbKeyword_id PRIMARY KEY CLUSTERED (pbKeyword_id);

ALTER TABLE PbMovieActor
	ADD CONSTRAINT PK_PbMovieActor_PbMovie_id_PbActor_id PRIMARY KEY CLUSTERED (pbMovie_id, pbActor_id);

ALTER TABLE PbActor
	ADD CONSTRAINT PK_PbActor_PbActor_id PRIMARY KEY CLUSTERED (pbActor_id);

----------------------------------------------------------------
----Create Foreign Keys
----------------------------------------------------------------
ALTER TABLE PbUserQuestion
	ADD CONSTRAINT FK_PbUserQuestion_PbUser_id FOREIGN KEY (pbUser_id) REFERENCES PbUser(pbUser_id);

ALTER TABLE PbUserQuestion
	ADD CONSTRAINT FK_PbUserQuestion_PbQuestion_id FOREIGN KEY (pbQuestion_id) REFERENCES PbQuestion(pbQuestion_id);

ALTER TABLE PbMovieRental
	ADD CONSTRAINT FK_PbMovieRental_PbUser_id FOREIGN KEY (pbUser_id) REFERENCES PbUser(pbUser_id);

ALTER TABLE PbMovieRental
	ADD CONSTRAINT FK_PbMovieRental_PbMovieItem_id FOREIGN KEY (pbMovieItem_id) REFERENCES PbMovieItem(pbMovieItem_id);

ALTER TABLE PbMovieReservation
	ADD CONSTRAINT FK_PbMovieReservation_PbMovie_id FOREIGN KEY (pbMovie_id) REFERENCES PbMovie(pbMovie_id);

ALTER TABLE PbMovieReservation
	ADD CONSTRAINT FK_PbMovieReservation_PbUser_id FOREIGN KEY (pbUser_id) REFERENCES PbUser(pbUser_id);

ALTER TABLE PbMovieItem
	ADD CONSTRAINT FK_PbMovieItem_PbMovie_id FOREIGN KEY (pbMovie_id) REFERENCES PbMovie(pbMovie_id);

ALTER TABLE PbMovieGenre
	ADD CONSTRAINT FK_PbMovieGenre_PbMovie_id FOREIGN KEY (pbMovie_id) REFERENCES PbMovie(pbMovie_id);

ALTER TABLE PbMovieGenre
	ADD CONSTRAINT FK_PbMovieGenre_PbGenre_id FOREIGN KEY (pbGenre_id) REFERENCES PbGenre(pbGenre_id);
	
ALTER TABLE PbMovieDirector
	ADD CONSTRAINT FK_PbMovieDirector_PbMovie_id FOREIGN KEY (pbMovie_id) REFERENCES PbMovie(pbMovie_id);
	
ALTER TABLE PbMovieDirector
	ADD CONSTRAINT FK_PbMovieDirector_PbDirector_id FOREIGN KEY (pbDirector_id) REFERENCES PbDirector(pbDirector_id);

ALTER TABLE PbMovieKeyword
	ADD CONSTRAINT FK_PbMovieKeyword_PbKeyword_id FOREIGN KEY (pbKeyword_id) REFERENCES PbKeyword(pbKeyword_id);

ALTER TABLE PbMovieKeyword
	ADD CONSTRAINT FK_PbMovieKeyword_PbMovie_id FOREIGN KEY (pbMovie_id) REFERENCES PbMovie(pbMovie_id);

ALTER TABLE PbMovieActor
	ADD CONSTRAINT FK_PbMovieActor_PbMovie_id FOREIGN KEY (pbMovie_id) REFERENCES PbMovie(pbMovie_id);

ALTER TABLE PbMovieActor
	ADD CONSTRAINT FK_PbMovieActor_PbActor_id FOREIGN KEY (pbActor_id) REFERENCES PbActor(pbActor_id);

----------------------------------------------------------------
----Create Alternate Keys
----------------------------------------------------------------
ALTER TABLE PbUser
	ADD CONSTRAINT AK_PbUser_userID UNIQUE (userID);

ALTER TABLE PbQuestion
	ADD CONSTRAINT AK_PbQuestion_Question UNIQUE (Question);

ALTER TABLE PbMovieItem
	ADD CONSTRAINT AK_PbMovieItem_pbMovieID_copyNumber_movieType UNIQUE (pbMovie_id, copyNumber, movieType);

ALTER TABLE PbMovie
	ADD CONSTRAINT AK_PbMovie_movieID UNIQUE (movieID);

ALTER TABLE PbGenre
	ADD CONSTRAINT AK_PbGenre_genre UNIQUE (genre);

ALTER TABLE PbDirector
	ADD CONSTRAINT AK_PbDirector_directorFirstName_directorLastName UNIQUE (directorFirstName, directorLastName);

ALTER TABLE PbKeyword
	ADD CONSTRAINT AK_PbKeyword_Keyword UNIQUE (Keyword);

ALTER TABLE PbActor
	ADD CONSTRAINT AK_PbActor_actorFirstName_actorLastName UNIQUE (actorFirstName, actorLastName);

----------------------------------------------------
--Add constriaints
----------------------------------------------------
ALTER TABLE PbUser
	ADD CONSTRAINT CK_PbUser_customerType CHECK (customerType = 'P' OR customerType = 'S');

ALTER TABLE PbUser
	ADD CONSTRAINT CK_PbUser_userPhoneNumber CHECK (userPhoneNumber LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]');

ALTER TABLE PbUser
	ADD CONSTRAINT CK_PbUser_userID CHECK (userID LIKE 'PB[0-9][0-9][0-9][0-9][0-9][0-9][0-9]');

ALTER TABLE PbUser
	ADD CONSTRAINT CK_PbUser_userType CHECK (userType = 'A' OR userType = 'C');

ALTER TABLE PbUser
	ADD CONSTRAINT CK_PbUser_banStatus CHECK (banStatus = 'N' OR banStatus = 'B');

ALTER TABLE PbMovieItem
	ADD CONSTRAINT CK_PbMovieItem_movieType CHECK (movieType = 'B' OR movieType = 'D');

ALTER TABLE PbMovieReservation
	ADD CONSTRAINT CK_PbMovieReservation_movieType CHECK (movieType = 'B' OR movieType = 'D');

ALTER TABLE PbMovieReservation
	ADD CONSTRAINT CK_PbMovieReservation_reservationStatus CHECK (reservationStatus = 'P' OR reservationStatus = 'C');

----------------------------------------------------
--Insert the data--
----------------------------------------------------
