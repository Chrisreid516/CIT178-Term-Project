CREATE DATABASE ArtistInfo;

GO 
USE ArtistInfo;
CREATE TABLE Artist (
	ArtistID int NOT NULL,
	ArtistName varchar(50) NOT NULL,
	ManagerID int NOT NULL,
	YearFormed varchar(4),
	GenreID int NOT NULL,
	Active varchar(10),
	ProducerID int NOT NULL,
	EngineerID int NOT NULL,
	NumberGrammyWins varchar(3),
	NetWorth money,
	PRIMARY KEY(ArtistID)
);
GO
CREATE TABLE Manager (
	ManagerID int NOT NULL,
	FName varchar(20) NOT NULL, 
	LName varchar(30) NOT NULL,
	PRIMARY KEY(ManagerID)
);
GO
CREATE TABLE BandMember (
	MemberID int NOT NULL,
	ArtistID int NOT NULL,
	FName varchar(20) NOT NULL, 
	LName varchar(30) NOT NULL,
	Instrument varchar(50),
	Living varchar(10),
	PRIMARY KEY(MemberID)	
);
GO
CREATE TABLE Producer (
	ProducerID int NOT NULL,
	FName varchar(20) NOT NULL, 
	LName varchar(30) NOT NULL,
	GenreID int NOT NULL,
	PRIMARY KEY(ProducerID)
);
GO
CREATE TABLE Genre (
	GenreID int NOT NULL,
	GenreName varchar(30) NOT NULL,
	PRIMARY KEY(GenreID)	
);
GO
CREATE TABLE LiveEngineer (
	EngineerID int NOT NULL,
	FName varchar(20) NOT NULL, 
	LName varchar(30) NOT NULL,
	PRIMARY KEY(EngineerID)
);