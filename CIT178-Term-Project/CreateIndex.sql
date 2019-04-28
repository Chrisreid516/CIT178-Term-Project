USE ArtistInfo;
GO
CREATE INDEX idx_Engineer ON Artist(EngineerID);
GO
CREATE INDEX idx_Genre ON Artist(GenreID);
GO
CREATE INDEX idx_Manager ON Artist(ManagerID);
GO
CREATE INDEX idx_Producer ON Artist(ProducerID);
GO
CREATE INDEX idx_Artist ON BandMember(ArtistID);
GO
CREATE INDEX idx_Genre ON Producer(GenreID);


