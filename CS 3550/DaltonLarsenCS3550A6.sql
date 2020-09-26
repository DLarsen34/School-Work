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
	movieID nvarchar(20) NOT NULL,
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
INSERT INTO PbUser
VALUES 
	('PB0000001', 'Drew', 'Weidman', 'SQLRules', '8016267025', NULL, 'A', 'P', 'N', 0.00, 'DLarsen', GETDATE()),
	('PB0000021', 'Spencer', 'Hilton', 'CSRocks!', '8016266098', '8016265500', 'C', 'P', 'N', 0.00, 'DLarsen', GETDATE()),
	('PB0000027', 'Josh', 'Jensen', 'AndroidIsKing', '8016266323', '8016266000', 'C', 'S', 'N', 0.00, 'DLarsen', GETDATE()),
	('PB0000101', 'Waldo', 'Wildcat', 'GoWildcats!', '8016266001', '8016268080', 'C', 'S', 'N', 0.00, 'DLarsen', GETDATE()),
	('PB0000232', 'Dalton', 'Larsen', 'Tonyromo9!', '8016451523', NULL, 'A', 'P', 'N', 0.00, 'DLarsen', GETDATE()),
	('PB0000345', 'Dallas', 'Herrera', 'LADodgers66', '8019562765', NULL, 'C', 'S', 'N', 0.00, 'DLarsen', GETDATE());

INSERT INTO PbMovie
VALUES
	('TRGRT', 'True Grit', 'DLarsen', GETDATE()),
	('SonKElder', 'The Sons of Katie Elder', 'DLarsen', GETDATE()),
	('Avngrs', 'The Avengers', 'DLarsen', GETDATE()),
	('GrtstShwman', 'Greatest Showman', 'DLarsen', GETDATE()),
	('XMEN', 'X-Men', 'DLarsen', GETDATE()),
	('Incrdbles2', 'Incredibles 2', 'DLarsen', GETDATE()),
	('Deadpl', 'Deadpool', 'DLarsen', GETDATE()),
	('StrWrsIVNwHp', 'Star Wars: Episode IV - New Hope', 'DLarsen', GETDATE());

INSERT INTO PbQuestion
VALUES
	('What is the name of the highschool you attended?', 'DLarsen', GETDATE()),
	('What is your mothers maiden name?', 'DLarsen', GETDATE()),
	('What is the name of the first pet you owned?', 'DLarsen', GETDATE()),
	('What city were you born in?', 'DLarsen', GETDATE()),
	('What is the name of your youngest brother?', 'DLarsen', GETDATE()),
	('What is the name of your youngest sister?', 'DLarsen', GETDATE());

INSERT INTO PbUserQuestion
VALUES
	((SELECT pbUser_id FROM PbUser WHERE userFirstName = 'Drew' AND userLastName = 'Weidman'),
	(SELECT pbQuestion_id FROM PbQuestion WHERE Question = 'What is the name of the highschool you attended?'), 'Midland', 'DLarsen', GETDATE());

INSERT INTO PbUserQuestion
VALUES
	((SELECT pbUser_id FROM PbUser WHERE userFirstName = 'Drew' AND userLastName = 'Weidman'),
	(SELECT pbQuestion_id FROM PbQuestion WHERE Question = 'What city were you born in?'), 'Tremonton', 'DLarsen', GETDATE());

INSERT INTO PbUserQuestion
VALUES
	((SELECT pbUser_id FROM PbUser WHERE userFirstName = 'Spencer' AND userLastName = 'Hilton'),
	(SELECT pbQuestion_id FROM PbQuestion WHERE Question = 'What is the name of your youngest brother?'), 'Trent', 'DLarsen', GETDATE());
 
INSERT INTO PbUserQuestion
VALUES
	((SELECT pbUser_id FROM PbUser WHERE userFirstName = 'Spencer' AND userLastName = 'Hilton'),
	(SELECT pbQuestion_id FROM PbQuestion WHERE Question = 'What is the name of the first pet you owned?'), 'Buddy', 'DLarsen', GETDATE());

INSERT INTO PbUserQuestion
VALUES
	((SELECT pbUser_id FROM PbUser WHERE userFirstName = 'Josh' AND userLastName = 'Jensen'),
	(SELECT pbQuestion_id FROM PbQuestion WHERE Question = 'What is the name of the first pet you owned?'), 'Buddy', 'DLarsen', GETDATE());

INSERT INTO PbUserQuestion
VALUES
	((SELECT pbUser_id FROM PbUser WHERE userFirstName = 'Josh' AND userLastName = 'Jensen'),
	(SELECT pbQuestion_id FROM PbQuestion WHERE Question = 'What is the name of your youngest sister?'), 'Sandra', 'DLarsen', GETDATE());

INSERT INTO PbUserQuestion
VALUES
	((SELECT pbUser_id FROM PbUser WHERE userFirstName = 'Waldo' AND userLastName = 'Wildcat'),
	(SELECT pbQuestion_id FROM PbQuestion WHERE Question = 'What is your mothers maiden name?'), 'Smith', 'DLarsen', GETDATE());

INSERT INTO PbUserQuestion
VALUES
	((SELECT pbUser_id FROM PbUser WHERE userFirstName = 'Waldo' AND userLastName = 'Wildcat'),
	(SELECT pbQuestion_id FROM PbQuestion WHERE Question = 'What city were you born in?'), 'Frisco', 'DLarsen', GETDATE());

INSERT INTO PbUserQuestion
VALUES
	((SELECT pbUser_id FROM PbUser WHERE userFirstName = 'Dalton' AND userLastName = 'Larsen'),
	(SELECT pbQuestion_id FROM PbQuestion WHERE Question = 'What is the name of the highschool you attended?'), 'Box Elder', 'DLarsen', GETDATE());

INSERT INTO PbUserQuestion
VALUES
	((SELECT pbUser_id FROM PbUser WHERE userFirstName = 'Dalton' AND userLastName = 'Larsen'),
	(SELECT pbQuestion_id FROM PbQuestion WHERE Question = 'What is the name of the first pet you owned?'), 'Rusty', 'DLarsen', GETDATE());

INSERT INTO PbUserQuestion
VALUES
	((SELECT pbUser_id FROM PbUser WHERE userFirstName = 'Dallas' AND userLastName = 'Herrera'),
	(SELECT pbQuestion_id FROM PbQuestion WHERE Question = 'What is the name of your youngest brother?'), 'Trey', 'DLarsen', GETDATE());

INSERT INTO PbUserQuestion
VALUES
	((SELECT pbUser_id FROM PbUser WHERE userFirstName = 'Dallas' AND userLastName = 'Herrera'),
	(SELECT pbQuestion_id FROM PbQuestion WHERE Question = 'What is the name of your youngest sister?'), 'Destinee', 'DLarsen', GETDATE());

INSERT INTO PbMovieItem
VALUES
		((SELECT pbMovie_id FROM PbMovie WHERE Title = 'True Grit'), '1', 'D', 'DLarsen', GETDATE());

INSERT INTO PbMovieItem
VALUES
		((SELECT pbMovie_id FROM PbMovie WHERE Title = 'True Grit'), '2', 'D', 'DLarsen', GETDATE());

INSERT INTO PbMovieItem
VALUES
		((SELECT pbMovie_id FROM PbMovie WHERE Title = 'True Grit'), '1', 'B', 'DLarsen', GETDATE());

INSERT INTO PbMovieItem
VALUES
		((SELECT pbMovie_id FROM PbMovie WHERE Title = 'True Grit'), '2', 'B', 'DLarsen', GETDATE());

INSERT INTO PbMovieItem
VALUES
		((SELECT pbMovie_id FROM PbMovie WHERE Title = 'The Sons of Katie Elder'), '1', 'D', 'DLarsen', GETDATE());

INSERT INTO PbMovieItem
VALUES
		((SELECT pbMovie_id FROM PbMovie WHERE Title = 'The Sons of Katie Elder'), '2', 'D', 'DLarsen', GETDATE());

INSERT INTO PbMovieItem
VALUES
		((SELECT pbMovie_id FROM PbMovie WHERE Title = 'The Sons of Katie Elder'), '1', 'B', 'DLarsen', GETDATE());

INSERT INTO PbMovieItem
VALUES
		((SELECT pbMovie_id FROM PbMovie WHERE Title = 'The Sons of Katie Elder'), '2', 'B', 'DLarsen', GETDATE());

INSERT INTO PbMovieItem
VALUES
		((SELECT pbMovie_id FROM PbMovie WHERE Title = 'The Avengers'), '1', 'D', 'DLarsen', GETDATE());

INSERT INTO PbMovieItem
VALUES
		((SELECT pbMovie_id FROM PbMovie WHERE Title = 'The Avengers'), '2', 'D', 'DLarsen', GETDATE());

INSERT INTO PbMovieItem
VALUES
		((SELECT pbMovie_id FROM PbMovie WHERE Title = 'The Avengers'), '1', 'B', 'DLarsen', GETDATE());

INSERT INTO PbMovieItem
VALUES
		((SELECT pbMovie_id FROM PbMovie WHERE Title = 'The Avengers'), '2', 'B', 'DLarsen', GETDATE());

INSERT INTO PbMovieItem
VALUES
		((SELECT pbMovie_id FROM PbMovie WHERE Title = 'Greatest Showman'), '1', 'D', 'DLarsen', GETDATE());

INSERT INTO PbMovieItem
VALUES
		((SELECT pbMovie_id FROM PbMovie WHERE Title = 'Greatest Showman'), '2', 'D', 'DLarsen', GETDATE());

INSERT INTO PbMovieItem
VALUES
		((SELECT pbMovie_id FROM PbMovie WHERE Title = 'Greatest Showman'), '1', 'B', 'DLarsen', GETDATE());

INSERT INTO PbMovieItem
VALUES
		((SELECT pbMovie_id FROM PbMovie WHERE Title = 'Greatest Showman'), '2', 'B', 'DLarsen', GETDATE());


INSERT INTO PbMovieItem
VALUES
		((SELECT pbMovie_id FROM PbMovie WHERE Title = 'X-Men'), '1', 'D', 'DLarsen', GETDATE());

INSERT INTO PbMovieItem
VALUES
		((SELECT pbMovie_id FROM PbMovie WHERE Title = 'X-Men'), '2', 'D', 'DLarsen', GETDATE());

INSERT INTO PbMovieItem
VALUES
		((SELECT pbMovie_id FROM PbMovie WHERE Title = 'X-Men'), '1', 'B', 'DLarsen', GETDATE());

INSERT INTO PbMovieItem
VALUES
		((SELECT pbMovie_id FROM PbMovie WHERE Title = 'X-Men'), '2', 'B', 'DLarsen', GETDATE());

INSERT INTO PbMovieItem
VALUES
		((SELECT pbMovie_id FROM PbMovie WHERE Title = 'Incredibles 2'), '1', 'D', 'DLarsen', GETDATE());

INSERT INTO PbMovieItem
VALUES
		((SELECT pbMovie_id FROM PbMovie WHERE Title = 'Incredibles 2'), '2', 'D', 'DLarsen', GETDATE());

INSERT INTO PbMovieItem
VALUES
		((SELECT pbMovie_id FROM PbMovie WHERE Title = 'Incredibles 2'), '1', 'B', 'DLarsen', GETDATE());

INSERT INTO PbMovieItem
VALUES
		((SELECT pbMovie_id FROM PbMovie WHERE Title = 'Incredibles 2'), '2', 'B', 'DLarsen', GETDATE());

INSERT INTO PbMovieItem
VALUES
		((SELECT pbMovie_id FROM PbMovie WHERE Title = 'Deadpool'), '1', 'D', 'DLarsen', GETDATE());

INSERT INTO PbMovieItem
VALUES
		((SELECT pbMovie_id FROM PbMovie WHERE Title = 'Deadpool'), '2', 'D', 'DLarsen', GETDATE());

INSERT INTO PbMovieItem
VALUES
		((SELECT pbMovie_id FROM PbMovie WHERE Title = 'Deadpool'), '1', 'B', 'DLarsen', GETDATE());

INSERT INTO PbMovieItem
VALUES
		((SELECT pbMovie_id FROM PbMovie WHERE Title = 'Deadpool'), '2', 'B', 'DLarsen', GETDATE());

INSERT INTO PbMovieItem
VALUES
		((SELECT pbMovie_id FROM PbMovie WHERE Title = 'Star Wars: Episode IV - New Hope'), '1', 'D', 'DLarsen', GETDATE());

INSERT INTO PbMovieItem
VALUES
		((SELECT pbMovie_id FROM PbMovie WHERE Title = 'Star Wars: Episode IV - New Hope'), '2', 'D', 'DLarsen', GETDATE());

INSERT INTO PbMovieItem
VALUES
		((SELECT pbMovie_id FROM PbMovie WHERE Title = 'Star Wars: Episode IV - New Hope'), '1', 'B', 'DLarsen', GETDATE());

INSERT INTO PbMovieItem
VALUES
		((SELECT pbMovie_id FROM PbMovie WHERE Title = 'Star Wars: Episode IV - New Hope'), '2', 'B', 'DLarsen', GETDATE());

INSERT INTO PbActor
VALUES
	('John', 'Wayne', 'DLarsen', GETDATE()),
	('Glen', 'Campbell', 'DLarsen', GETDATE()),
	('Dean', 'Martin', 'DLarsen', GETDATE()),
	('Robert', 'Downey Jr.', 'DLarsen', GETDATE()),
	('Chris', 'Evans', 'DLarsen', GETDATE()),
	('Hugh', 'Jackman', 'DLarsen', GETDATE()),
	('Michelle', 'Williams', 'DLarsen', GETDATE()),
	('Patrick', 'Stewart', 'DLarsen', GETDATE()),
	('Craig T.', 'Nelson', 'DLarsen', GETDATE()),
	('Holly', 'Hunter', 'DLarsen', GETDATE()),
	('Ryan', 'Reynolds', 'DLarsen', GETDATE()),
	('Morena', 'Baccarin', 'DLarsen', GETDATE()),
	('Mark', 'Hamill', 'DLarsen', GETDATE()),
	('Carrie', 'Fisher', 'DLarsen', GETDATE());

INSERT INTO PbDirector
VALUES
	('Henry', 'Hathaway', 'DLarsen', GETDATE()),
	('Joss', 'Whedon', 'DLarsen', GETDATE()),
	('Michael', 'Gracey', 'DLarsen', GETDATE()),
	('Bryan', 'Singer', 'DLarsen', GETDATE()),
	('Brad', 'Bird', 'DLarsen', GETDATE()),
	('Tim', 'Miller', 'DLarsen', GETDATE()),
	('George', 'Lucas', 'DLarsen', GETDATE());

INSERT INTO PbGenre
VALUES
	('Adventure', 'Event of series that happens outside the course of ordinary life, accompanied by danger or physical action', 'DLarsen', GETDATE()),
	('Drama', 'Relies on emotional and relational development of realistic charachters', 'DLarsen', GETDATE()),
	('Western', 'Stories set primarily in the latter half of the 19th century in the old west', 'DLarsen', GETDATE()),
	('Action', 'Series of challenges which typically include violence, extended fighting, physical feats, and frantic chases', 'DLarsen', GETDATE()),
	('Sci-Fi', 'Speculative fiction, typically dealing with imaginatice conepts', 'DLarsen', GETDATE()),
	('Biography', 'Detailed description of a persons life, involes more than just basic facts about the individual', 'DLarsen', GETDATE()),
	('Musical', 'Often involves movies that are all music, or movies that have the characters sing more often than not', 'DLarsen', GETDATE()),
	('Animation', 'Films with individual drawings, paintings, or illustrations are photographed frame by frame', 'DLarsen', GETDATE()),
	('Comedy', 'Films where the main emphasis is humour, designed to make the audience laugh', 'DLarsen', GETDATE()),
	('Fantasy', 'Films set in fictional universes often never refernecing the real world', 'DLarsen', GETDATE());


INSERT INTO PbKeyword
VALUES
	('Rooster Cogburn', 'DLarsen', GETDATE()),
	('US Marshal', 'DLarsen', GETDATE()),
	('Oscar Award Winner', 'DLarsen', GETDATE()),
	('Gun Fighter', 'DLarsen', GETDATE()),
	('Family', 'DLarsen', GETDATE()),
	('Captain America', 'DLarsen', GETDATE()),
	('Iron Man', 'DLarsen', GETDATE()),
	('Thor', 'DLarsen', GETDATE()),
	('Circus', 'DLarsen', GETDATE()),
	('Barnum', 'DLarsen', GETDATE()),
	('Singing', 'DLarsen', GETDATE()),
	('Million Dreams', 'DLarsen', GETDATE()),
	('Wolverine', 'DLarsen', GETDATE()),
	('Mutants', 'DLarsen', GETDATE()),
	('Elastigirl', 'DLarsen', GETDATE()),
	('Dash', 'DLarsen', GETDATE()),
	('Jack Jack', 'DLarsen', GETDATE()),
	('Mercinary', 'DLarsen', GETDATE()),
	('Morbid', 'DLarsen', GETDATE()),
	('Healing Power', 'DLarsen', GETDATE()),
	('Jedi Knight', 'DLarsen', GETDATE()),
	('Darth Vader', 'DLarsen', GETDATE()),
	('Yoda', 'DLarsen', GETDATE());

-------------------------------------
--MovieActors
-------------------------------------

INSERT INTO PbMovieActor
VALUES 
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'True Grit'),
	(SELECT pbActor_id FROM PbActor WHERE actorFirstName = 'John' AND actorLastName = 'Wayne'), 'DLarsen', GETDATE());

INSERT INTO PbMovieActor
VALUES 
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'True Grit'),
	(SELECT pbActor_id FROM PbActor WHERE actorFirstName = 'Glen' AND actorLastName = 'Campbell'), 'DLarsen', GETDATE());

INSERT INTO PbMovieActor
VALUES 
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'The Sons of Katie Elder'),
	(SELECT pbActor_id FROM PbActor WHERE actorFirstName = 'John' AND actorLastName = 'Wayne'), 'DLarsen', GETDATE());

INSERT INTO PbMovieActor
VALUES 
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'The Sons of Katie Elder'),
	(SELECT pbActor_id FROM PbActor WHERE actorFirstName = 'Dean' AND actorLastName = 'Martin'), 'DLarsen', GETDATE());

INSERT INTO PbMovieActor
VALUES 
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'The Avengers'),
	(SELECT pbActor_id FROM PbActor WHERE actorFirstName = 'Robert' AND actorLastName = 'Downey Jr.'), 'DLarsen', GETDATE());

INSERT INTO PbMovieActor
VALUES 
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'The Avengers'),
	(SELECT pbActor_id FROM PbActor WHERE actorFirstName = 'Chris' AND actorLastName = 'Evans'), 'DLarsen', GETDATE());

INSERT INTO PbMovieActor
VALUES 
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'Greatest Showman'),
	(SELECT pbActor_id FROM PbActor WHERE actorFirstName = 'Hugh' AND actorLastName = 'Jackman'), 'DLarsen', GETDATE());

INSERT INTO PbMovieActor
VALUES 
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'Greatest Showman'),
	(SELECT pbActor_id FROM PbActor WHERE actorFirstName = 'Michelle' AND actorLastName = 'Williams'), 'DLarsen', GETDATE());

INSERT INTO PbMovieActor
VALUES 
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'X-Men'),
	(SELECT pbActor_id FROM PbActor WHERE actorFirstName = 'Patrick' AND actorLastName = 'Stewart'), 'DLarsen', GETDATE());

INSERT INTO PbMovieActor
VALUES 
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'X-Men'),
	(SELECT pbActor_id FROM PbActor WHERE actorFirstName = 'Hugh' AND actorLastName = 'Jackman'), 'DLarsen', GETDATE());

INSERT INTO PbMovieActor
VALUES 
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'Incredibles 2'),
	(SELECT pbActor_id FROM PbActor WHERE actorFirstName = 'Craig T.' AND actorLastName = 'Nelson'), 'DLarsen', GETDATE());

INSERT INTO PbMovieActor
VALUES 
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'Incredibles 2'),
	(SELECT pbActor_id FROM PbActor WHERE actorFirstName = 'Holly' AND actorLastName = 'Hunter'), 'DLarsen', GETDATE());

INSERT INTO PbMovieActor
VALUES 
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'Deadpool'),
	(SELECT pbActor_id FROM PbActor WHERE actorFirstName = 'Ryan' AND actorLastName = 'Reynolds'), 'DLarsen', GETDATE());

INSERT INTO PbMovieActor
VALUES 
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'Deadpool'),
	(SELECT pbActor_id FROM PbActor WHERE actorFirstName = 'Morena' AND actorLastName = 'Baccarin'), 'DLarsen', GETDATE());

INSERT INTO PbMovieActor
VALUES 
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'Star Wars: Episode IV - New Hope'),
	(SELECT pbActor_id FROM PbActor WHERE actorFirstName = 'Mark' AND actorLastName = 'Hamill'), 'DLarsen', GETDATE());

INSERT INTO PbMovieActor
VALUES 
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'Star Wars: Episode IV - New Hope'),
	(SELECT pbActor_id FROM PbActor WHERE actorFirstName = 'Carrie' AND actorLastName = 'Fisher'), 'DLarsen', GETDATE());

--------------------------------------------
--MovieDirectors
--------------------------------------------
INSERT INTO PbMovieDirector
VALUES 
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'True Grit'),
	(SELECT pbDirector_id FROM PbDirector WHERE directorFirstName = 'Henry' AND directorLastName = 'Hathaway'), 'DLarsen', GETDATE());

INSERT INTO PbMovieDirector
VALUES 
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'The Sons of Katie Elder'),
	(SELECT pbDirector_id FROM PbDirector WHERE directorFirstName = 'Henry' AND directorLastName = 'Hathaway'), 'DLarsen', GETDATE());

INSERT INTO PbMovieDirector
VALUES 
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'The Avengers'),
	(SELECT pbDirector_id FROM PbDirector WHERE directorFirstName = 'Joss' AND directorLastName = 'Whedon'), 'DLarsen', GETDATE());

INSERT INTO PbMovieDirector
VALUES 
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'Greatest Showman'),
	(SELECT pbDirector_id FROM PbDirector WHERE directorFirstName = 'Michael' AND directorLastName = 'Gracey'), 'DLarsen', GETDATE());

INSERT INTO PbMovieDirector
VALUES 
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'X-Men'),
	(SELECT pbDirector_id FROM PbDirector WHERE directorFirstName = 'Bryan' AND directorLastName = 'Singer'), 'DLarsen', GETDATE());

INSERT INTO PbMovieDirector
VALUES 
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'Incredibles 2'),
	(SELECT pbDirector_id FROM PbDirector WHERE directorFirstName = 'Brad' AND directorLastName = 'Bird'), 'DLarsen', GETDATE());

INSERT INTO PbMovieDirector
VALUES 
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'Deadpool'),
	(SELECT pbDirector_id FROM PbDirector WHERE directorFirstName = 'Tim' AND directorLastName = 'Miller'), 'DLarsen', GETDATE());

INSERT INTO PbMovieDirector
VALUES 
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'Star Wars: Episode IV - New Hope'),
	(SELECT pbDirector_id FROM PbDirector WHERE directorFirstName = 'George' AND directorLastName = 'Lucas'), 'DLarsen', GETDATE());

----------------------------------------
--MovieKeywords
----------------------------------------
INSERT INTO PbMovieKeyword
VALUES
	((SELECT pbKeyword_id FROM PbKeyword WHERE Keyword = 'Rooster Cogburn'),
	(SELECT pbMovie_id FROM PbMovie WHERE Title = 'True Grit'), 'DLarsen', GETDATE());

INSERT INTO PbMovieKeyword
VALUES
	((SELECT pbKeyword_id FROM PbKeyword WHERE Keyword = 'US Marshal'),
	(SELECT pbMovie_id FROM PbMovie WHERE Title = 'True Grit'), 'DLarsen', GETDATE());

INSERT INTO PbMovieKeyword
VALUES
	((SELECT pbKeyword_id FROM PbKeyword WHERE Keyword = 'Oscar Award Winner'),
	(SELECT pbMovie_id FROM PbMovie WHERE Title = 'True Grit'), 'DLarsen', GETDATE());

INSERT INTO PbMovieKeyword
VALUES
	((SELECT pbKeyword_id FROM PbKeyword WHERE Keyword = 'Gun Fighter'),
	(SELECT pbMovie_id FROM PbMovie WHERE Title = 'The Sons of Katie Elder'), 'DLarsen', GETDATE());

INSERT INTO PbMovieKeyword
VALUES
	((SELECT pbKeyword_id FROM PbKeyword WHERE Keyword = 'Family'),
	(SELECT pbMovie_id FROM PbMovie WHERE Title = 'The Sons of Katie Elder'), 'DLarsen', GETDATE());

INSERT INTO PbMovieKeyword
VALUES
	((SELECT pbKeyword_id FROM PbKeyword WHERE Keyword = 'Captain America'),
	(SELECT pbMovie_id FROM PbMovie WHERE Title = 'The Avengers'), 'DLarsen', GETDATE());

INSERT INTO PbMovieKeyword
VALUES
	((SELECT pbKeyword_id FROM PbKeyword WHERE Keyword = 'Iron Man'),
	(SELECT pbMovie_id FROM PbMovie WHERE Title = 'The Avengers'), 'DLarsen', GETDATE());

INSERT INTO PbMovieKeyword
VALUES
	((SELECT pbKeyword_id FROM PbKeyword WHERE Keyword = 'Thor'),
	(SELECT pbMovie_id FROM PbMovie WHERE Title = 'The Avengers'), 'DLarsen', GETDATE());

INSERT INTO PbMovieKeyword
VALUES
	((SELECT pbKeyword_id FROM PbKeyword WHERE Keyword = 'Circus'),
	(SELECT pbMovie_id FROM PbMovie WHERE Title = 'Greatest Showman'), 'DLarsen', GETDATE());

INSERT INTO PbMovieKeyword
VALUES
	((SELECT pbKeyword_id FROM PbKeyword WHERE Keyword = 'Barnum'),
	(SELECT pbMovie_id FROM PbMovie WHERE Title = 'Greatest Showman'), 'DLarsen', GETDATE());

INSERT INTO PbMovieKeyword
VALUES
	((SELECT pbKeyword_id FROM PbKeyword WHERE Keyword = 'Singing'),
	(SELECT pbMovie_id FROM PbMovie WHERE Title = 'Greatest Showman'), 'DLarsen', GETDATE());

INSERT INTO PbMovieKeyword
VALUES
	((SELECT pbKeyword_id FROM PbKeyword WHERE Keyword = 'Million Dreams'),
	(SELECT pbMovie_id FROM PbMovie WHERE Title = 'Greatest Showman'), 'DLarsen', GETDATE());

INSERT INTO PbMovieKeyword
VALUES
	((SELECT pbKeyword_id FROM PbKeyword WHERE Keyword = 'Wolverine'),
	(SELECT pbMovie_id FROM PbMovie WHERE Title = 'X-Men'), 'DLarsen', GETDATE());

INSERT INTO PbMovieKeyword
VALUES
	((SELECT pbKeyword_id FROM PbKeyword WHERE Keyword = 'Mutants'),
	(SELECT pbMovie_id FROM PbMovie WHERE Title = 'X-Men'), 'DLarsen', GETDATE());

INSERT INTO PbMovieKeyword
VALUES
	((SELECT pbKeyword_id FROM PbKeyword WHERE Keyword = 'Elastigirl'),
	(SELECT pbMovie_id FROM PbMovie WHERE Title = 'Incredibles 2'), 'DLarsen', GETDATE());

INSERT INTO PbMovieKeyword
VALUES
	((SELECT pbKeyword_id FROM PbKeyword WHERE Keyword = 'Dash'),
	(SELECT pbMovie_id FROM PbMovie WHERE Title = 'Incredibles 2'), 'DLarsen', GETDATE());

INSERT INTO PbMovieKeyword
VALUES
	((SELECT pbKeyword_id FROM PbKeyword WHERE Keyword = 'Jack Jack'),
	(SELECT pbMovie_id FROM PbMovie WHERE Title = 'Incredibles 2'), 'DLarsen', GETDATE());

INSERT INTO PbMovieKeyword
VALUES
	((SELECT pbKeyword_id FROM PbKeyword WHERE Keyword = 'Mercinary'),
	(SELECT pbMovie_id FROM PbMovie WHERE Title = 'Deadpool'), 'DLarsen', GETDATE());

INSERT INTO PbMovieKeyword
VALUES
	((SELECT pbKeyword_id FROM PbKeyword WHERE Keyword = 'Morbid'),
	(SELECT pbMovie_id FROM PbMovie WHERE Title = 'Deadpool'), 'DLarsen', GETDATE());

INSERT INTO PbMovieKeyword
VALUES
	((SELECT pbKeyword_id FROM PbKeyword WHERE Keyword = 'Healing Power'),
	(SELECT pbMovie_id FROM PbMovie WHERE Title = 'Deadpool'), 'DLarsen', GETDATE());

INSERT INTO PbMovieKeyword
VALUES
	((SELECT pbKeyword_id FROM PbKeyword WHERE Keyword = 'Jedi Knight'),
	(SELECT pbMovie_id FROM PbMovie WHERE Title = 'Star Wars: Episode IV - New Hope'), 'DLarsen', GETDATE());

INSERT INTO PbMovieKeyword
VALUES
	((SELECT pbKeyword_id FROM PbKeyword WHERE Keyword = 'Darth Vader'),
	(SELECT pbMovie_id FROM PbMovie WHERE Title = 'Star Wars: Episode IV - New Hope'), 'DLarsen', GETDATE());

INSERT INTO PbMovieKeyword
VALUES
	((SELECT pbKeyword_id FROM PbKeyword WHERE Keyword = 'Yoda'),
	(SELECT pbMovie_id FROM PbMovie WHERE Title = 'Star Wars: Episode IV - New Hope'), 'DLarsen', GETDATE());

--------------------------------
--MovieGenres
-------------------------------
INSERT INTO PbMovieGenre
VALUES
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'True Grit'),
	(SELECT pbGenre_id FROM PbGenre WHERE Genre = 'Adventure'), 'DLarsen', GETDATE());

INSERT INTO PbMovieGenre
VALUES
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'True Grit'),
	(SELECT pbGenre_id FROM PbGenre WHERE Genre = 'Drama'), 'DLarsen', GETDATE());

INSERT INTO PbMovieGenre
VALUES
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'True Grit'),
	(SELECT pbGenre_id FROM PbGenre WHERE Genre = 'Western'), 'DLarsen', GETDATE());

INSERT INTO PbMovieGenre
VALUES
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'The Sons of Katie Elder'),
	(SELECT pbGenre_id FROM PbGenre WHERE Genre = 'Western'), 'DLarsen', GETDATE());

INSERT INTO PbMovieGenre
VALUES
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'The Avengers'),
	(SELECT pbGenre_id FROM PbGenre WHERE Genre = 'Adventure'), 'DLarsen', GETDATE());

INSERT INTO PbMovieGenre
VALUES
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'The Avengers'),
	(SELECT pbGenre_id FROM PbGenre WHERE Genre = 'Action'), 'DLarsen', GETDATE());

INSERT INTO PbMovieGenre
VALUES
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'The Avengers'),
	(SELECT pbGenre_id FROM PbGenre WHERE Genre = 'Sci-Fi'), 'DLarsen', GETDATE());

INSERT INTO PbMovieGenre
VALUES
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'Greatest Showman'),
	(SELECT pbGenre_id FROM PbGenre WHERE Genre = 'Biography'), 'DLarsen', GETDATE());

INSERT INTO PbMovieGenre
VALUES
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'Greatest Showman'),
	(SELECT pbGenre_id FROM PbGenre WHERE Genre = 'Drama'), 'DLarsen', GETDATE());

INSERT INTO PbMovieGenre
VALUES
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'Greatest Showman'),
	(SELECT pbGenre_id FROM PbGenre WHERE Genre = 'Musical'), 'DLarsen', GETDATE());

INSERT INTO PbMovieGenre
VALUES
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'X-Men'),
	(SELECT pbGenre_id FROM PbGenre WHERE Genre = 'Adventure'), 'DLarsen', GETDATE());

INSERT INTO PbMovieGenre
VALUES
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'X-Men'),
	(SELECT pbGenre_id FROM PbGenre WHERE Genre = 'Action'), 'DLarsen', GETDATE());

INSERT INTO PbMovieGenre
VALUES
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'X-Men'),
	(SELECT pbGenre_id FROM PbGenre WHERE Genre = 'Sci-Fi'), 'DLarsen', GETDATE());

INSERT INTO PbMovieGenre
VALUES
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'Incredibles 2'),
	(SELECT pbGenre_id FROM PbGenre WHERE Genre = 'Adventure'), 'DLarsen', GETDATE());


INSERT INTO PbMovieGenre
VALUES
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'Incredibles 2'),
	(SELECT pbGenre_id FROM PbGenre WHERE Genre = 'Action'), 'DLarsen', GETDATE());

INSERT INTO PbMovieGenre
VALUES
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'Incredibles 2'),
	(SELECT pbGenre_id FROM PbGenre WHERE Genre = 'Animation'), 'DLarsen', GETDATE());

INSERT INTO PbMovieGenre
VALUES
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'Deadpool'),
	(SELECT pbGenre_id FROM PbGenre WHERE Genre = 'Action'), 'DLarsen', GETDATE());

INSERT INTO PbMovieGenre
VALUES
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'Deadpool'),
	(SELECT pbGenre_id FROM PbGenre WHERE Genre = 'Adventure'), 'DLarsen', GETDATE());

INSERT INTO PbMovieGenre
VALUES
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'Deadpool'),
	(SELECT pbGenre_id FROM PbGenre WHERE Genre = 'Comedy'), 'DLarsen', GETDATE());

INSERT INTO PbMovieGenre
VALUES
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'Star Wars: Episode IV - New Hope'),
	(SELECT pbGenre_id FROM PbGenre WHERE Genre = 'Action'), 'DLarsen', GETDATE());

INSERT INTO PbMovieGenre
VALUES
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'Star Wars: Episode IV - New Hope'),
	(SELECT pbGenre_id FROM PbGenre WHERE Genre = 'Adventure'), 'DLarsen', GETDATE());

INSERT INTO PbMovieGenre
VALUES
	((SELECT pbMovie_id FROM PbMovie WHERE Title = 'Star Wars: Episode IV - New Hope'),
	(SELECT pbGenre_id FROM PbGenre WHERE Genre = 'Fantasy'), 'DLarsen', GETDATE());
	
SELECT *
FROM PbActor;

SELECT *
FROM PbDirector;

SELECT *
FROM PbGenre;

SELECT *
FROM PbKeyword;

SELECT *
FROM PbMovie;

SELECT *
FROM PbMovieActor;

SELECT *
FROM PbMovieDirector;

SELECT *
FROM PbMovieGenre;

SELECT *
FROM PbMovieItem;

SELECT *
FROM PbMovieKeyword;

SELECT *
FROM PbQuestion;

SELECT *
FROM PbUser;

SELECT *
FROM PbUserQuestion;