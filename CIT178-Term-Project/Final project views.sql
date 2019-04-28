/* Final Project Views 

USE ArtistInfo;
GO

-- View #1

-- updatable view --
CREATE VIEW CurrentBandMembers
AS
SELECT MemberID, ArtistID, FName + ' ' + LName AS FullName, Instrument, Living
FROM BandMember;
GO

--original data--
SELECT * FROM CurrentBandMembers;
GO

-- updating price --

GO
UPDATE CurrentBandMembers
SET Instrument = 'Vocals and Rhythm Guitar'
WHERE MemberID=1;
GO

-- displaying new data--

SELECT * FROM CurrentBandMembers;

--  View #2  

--  creating view --
GO
CREATE VIEW HighMoneyMakers
AS
SELECT ArtistID, ArtistName, NetWorth
FROM Artist
WHERE NetWorth > 800000000;
GO

-- using the view to display the data --
SELECT * FROM HighMoneyMakers;

-- View #3 

-- creating view --
GO
CREATE VIEW PopBands
AS
SELECT ArtistID, ArtistName, Artist.GenreID, GenreName  
FROM Artist
JOIN Genre ON Artist.GenreID = Genre.GenreID 
WHERE GenreName = 'Pop';
GO

-- using the view to display the data --
SELECT * FROM PopBands;

-- View #4 

-- creating view --
GO
CREATE VIEW ProducerGenre
AS
SELECT FName + ' ' + LName AS Producer, GenreName 
FROM Producer
JOIN Genre ON Producer.GenreID = Genre.GenreID;
GO

-- using the view to display the data --
SELECT * FROM ProducerGenre;  */