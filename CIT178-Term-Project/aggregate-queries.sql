/*USE ArtistInfo;
SELECT Artist.ArtistName, COUNT(BandMember.MemberID) AS [Members Per Band]
FROM BandMember JOIN Artist ON BandMember.ArtistID = Artist.ArtistID
GROUP BY Artist.ArtistName; 

USE ArtistInfo;
SELECT COUNT(ArtistID) AS [Number of Artists], 
		SUM(NetWorth) AS [Total Net Worth] 
FROM Artist;

USE ArtistInfo;
SELECT COUNT(ArtistID) AS [Number of Artists], 
		AVG(NetWorth) AS [Average Net Worth Between All Artists] 
FROM Artist;

USE ArtistInfo;
SELECT MIN(NetWorth) / 1000000 AS [Smallest Net Worth in Millions],
		MAX(NetWorth) / 1000000 AS [Largest Net Worth in Millions] 
FROM Artist;*/


