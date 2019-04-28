/* Final Project Procedures

-- Retrieves and displays data
USE ArtistInfo;
GO
CREATE PROC spBandMember
AS
SELECT * FROM BandMember
ORDER BY LName;
GO

EXEC spBandMember;
  
-- Takes an input parameter
USE ArtistInfo;
GO
CREATE PROC spGetBandMember
	@MemberID int
AS
BEGIN
	SELECT * FROM BandMember
	WHERE MemberID = @MemberID;
END
GO
EXEC spGetBandMember 1 

-- Takes one input parameter and returns three output parameters
USE ArtistInfo;
GO
CREATE PROC spBandMemberInstrument
	@MemberID int,
	@FName nvarchar(20) OUTPUT,
	@LName nvarchar(30) OUTPUT,
	@Instrument nvarchar(50) OUTPUT 
AS
SELECT @FName = FName, @LName = LName, @Instrument = Instrument
FROM BandMember 
WHERE MemberID = @MemberID;
GO 

-- Run the procedure
DECLARE @FName nvarchar(20);
DECLARE @LName nvarchar(30);
DECLARE @Instrument nvarchar(50);
EXEC spBandMemberInstrument 3, @FName OUTPUT, @LName OUTPUT, @Instrument OUTPUT;
SELECT @FName AS 'First Name', @LName AS 'Last Name', @Instrument AS 'Instrument'; 

-- Stored procedure that has a return value 
USE ArtistInfo;
GO
CREATE PROC spArtistCount
AS
DECLARE @ArtistCount int;
SELECT @ArtistCount = COUNT(*)
FROM Artist
RETURN @ArtistCount;
GO

DECLARE @ArtistCount int;
EXEC @ArtistCount = spArtistCount;
PRINT 'There are ' + CONVERT(varchar, @ArtistCount) + ' artists in your database';
GO

Final Project User Defined Functions 

-- creates the function
USE ArtistInfo;
GO
CREATE FUNCTION fnGetGenre
    (@GenreName nvarchar(30) = '%')
    RETURNS nvarchar(30)
BEGIN
    RETURN (SELECT GenreName FROM Genre WHERE GenreName Like @GenreName);
END; 

-- uses the function
GO
SELECT GenreID, GenreName FROM Genre 
WHERE GenreName = dbo.fnGetGenre('Rock%'); 

USE ArtistInfo;
GO
CREATE FUNCTION fnProducer
	(@LName nvarchar(30) = '%')
	RETURNS table
RETURN
	(SELECT * FROM Producer WHERE LName LIKE @LName);
GO
SELECT * FROM dbo.fnProducer('%n%'); 

Final Project Triggers

-- create archive table by copying artist table without any rows
USE ArtistInfo;
GO
SELECT * INTO ArtistArchive
FROM Artist
WHERE 1=0;  
 
-- update artistarchive table and add activity column for status
ALTER TABLE ArtistArchive
ADD Activity varchar(50);
GO 

-- create insert trigger
CREATE TRIGGER ArtistArchive_INSERT ON Artist
	AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @ArtistID int
	DECLARE @ArtistName varchar(50)
	DECLARE @ManagerID int
	DECLARE @YearFormed varchar(4)
	DECLARE @GenreID int
	DECLARE @Active varchar(10)
	DECLARE @ProducerID int
	DECLARE @EngineerID int
	DECLARE @NumberGrammyWins varchar(3)
	DECLARE @NetWorth money

    SELECT @ArtistID =INSERTED.ArtistID, @ArtistName = INSERTED.ArtistName, @ManagerID = INSERTED.ManagerID,
	@YearFormed = INSERTED.YearFormed, @GenreID = INSERTED.GenreID, @Active = INSERTED.Active, @ProducerID = INSERTED.ProducerID, 
	@EngineerID = INSERTED.EngineerID, @NumberGrammyWins = INSERTED.NumberGrammyWins, @NetWorth = INSERTED.NetWorth
	FROM INSERTED

    INSERT INTO ArtistArchive VALUES(@ArtistID,@ArtistName, @ManagerID,@YearFormed, @GenreID, @Active, @ProducerID, 
	@EngineerID, @NumberGrammyWins, @NetWorth, 'Inserted' )
END
GO

-- add row into artist to test insert trigger
INSERT INTO Artist VALUES(7,'Test Artist',1,'2019',1,'n',1,1,'100',20000000);
GO

-- view data in artist archive
SELECT * FROM ArtistArchive;
GO 

-- create delete trigger
CREATE TRIGGER ArtistArchive_Delete ON Artist
	AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @ArtistID int
	DECLARE @ArtistName varchar(50)
	DECLARE @ManagerID int
	DECLARE @YearFormed varchar(4)
	DECLARE @GenreID int
	DECLARE @Active varchar(10)
	DECLARE @ProducerID int
	DECLARE @EngineerID int
	DECLARE @NumberGrammyWins varchar(3)
	DECLARE @NetWorth money

    SELECT @ArtistID =DELETED.ArtistID, @ArtistName = DELETED.ArtistName, @ManagerID = DELETED.ManagerID,
	@YearFormed = DELETED.YearFormed, @GenreID = DELETED.GenreID, @Active = DELETED.Active, @ProducerID = DELETED.ProducerID, 
	@EngineerID = DELETED.EngineerID, @NumberGrammyWins = DELETED.NumberGrammyWins, @NetWorth = DELETED.NetWorth
	FROM DELETED

    INSERT INTO ArtistArchive VALUES(@ArtistID,@ArtistName, @ManagerID,@YearFormed, @GenreID, @Active, @ProducerID, 
	@EngineerID, @NumberGrammyWins, @NetWorth, 'Deleted' )
END
GO 

-- delete row from customer to test delete trigger
DELETE FROM Artist WHERE ArtistID = 7;
GO

-- view data in customer archive
SELECT * FROM ArtistArchive;
GO 

-- create update trigger
CREATE TRIGGER ArtistArchive_Update ON Artist
	AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @ArtistID int
	DECLARE @ArtistName varchar(50)
	DECLARE @ManagerID int
	DECLARE @YearFormed varchar(4)
	DECLARE @GenreID int
	DECLARE @Active varchar(10)
	DECLARE @ProducerID int
	DECLARE @EngineerID int
	DECLARE @NumberGrammyWins varchar(3)
	DECLARE @NetWorth money

    SELECT @ArtistID =INSERTED.ArtistID, @ArtistName = INSERTED.ArtistName, @ManagerID = INSERTED.ManagerID,
	@YearFormed = INSERTED.YearFormed, @GenreID = INSERTED.GenreID, @Active = INSERTED.Active, @ProducerID = INSERTED.ProducerID, 
	@EngineerID = INSERTED.EngineerID, @NumberGrammyWins = INSERTED.NumberGrammyWins, @NetWorth = INSERTED.NetWorth
	FROM INSERTED

	-- Since all the data is being written to the archive table, there is no need to identify what was changed
    INSERT INTO ArtistArchive VALUES(@ArtistID,@ArtistName, @ManagerID,@YearFormed, @GenreID, @Active, @ProducerID, 
	@EngineerID, @NumberGrammyWins, @NetWorth, 'Updated')
END
GO

-- insert a new row and then update the row (this will test the insert and update triggers)
INSERT INTO Artist VALUES(7,'Test Artist',1,'2019',1,'n',1,1,'100',20000000);
GO
UPDATE Artist 
SET ArtistName = 'Fake Artist'
WHERE ArtistID = 7;
GO

-- view data in artist archive
SELECT * FROM ArtistArchive; */