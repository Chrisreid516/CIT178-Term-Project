/*USE ArtistInfo;

INSERT INTO Manager (ManagerID, FName, LName)
VALUES (1, 'Guy', 'Oseary'),
(2, 'Peter', 'Mensch'),
(3, 'Stuart', 'Camp'),
(4, 'Larry', 'Jacobson'),
(5, 'Jim', 'Beach'),
(999, 'Unknown', 'Unknown');

INSERT INTO Genre (GenreID, GenreName)
VALUES (1, 'Metal'),
(2, 'Rock'),
(3, 'Pop'),
(4, 'Pop/Rock'),
(5, 'Metal/Rock'),
(6, 'Classic Rock'),
(7, 'Various'),
(999, 'Unknown');

INSERT INTO LiveEngineer (EngineerID, FName, LName)
VALUES (1, 'Mick', 'Hughes'),
(2, 'Joe', 'Herlihy'),
(3, 'Chris', 'Marsh'),
(4, 'Bob', 'Strakele'),
(5, 'Andy', 'Meyer'),
(999, 'Unknown', 'Unknown');

INSERT INTO Producer (ProducerID, FName, LName, GenreID)
VALUES (1, 'Bob', 'Rock', 2),
(2, 'Brian', 'Eno', 4),
(3, 'Various Producers', 'Various Producers', 7),
(4, 'Jake', 'Gosling', 3),
(5, 'Self Produced', 'Self Produced', 7);

INSERT INTO Artist (ArtistID, ArtistName, ManagerID, YearFormed, GenreID, Active, ProducerID, EngineerID, NumberGrammyWins, NetWorth)
VALUES (1, 'Metallica', 2, '1981', 5, 'Yes', 1, 1, '9', 850000000),
(2, 'U2', 1, '1976', 4, 'Yes', 2, 2, '22', 900000000),
(3, 'Ed Sheeran', 3, '2004', 3, 'Yes', 4, 3, '4', 80000000), 
(4, 'Avenged Sevenfold', 4, '1999', 1, 'Yes', 5, 4, '0', 100000000),
(5, 'Queen', 5, '1970', 6, 'Yes', 3, 999, '0', 520000000),
(6, 'Madonna', 1, '1982', 3, 'Yes', 3, 5, '7', 590000000);

INSERT INTO BandMember (MemberID, ArtistID, FName, LName, Instrument, Living)
VALUES (1, 1, 'James', 'Hetfield', 'Vocals/Rhythm Guitar', 'Yes'),
(2, 1, 'Lars', 'Ulrich', 'Drums', 'Yes'),
(3, 1, 'Cliff', 'Burton', 'Bass Guitar', 'No'),
(4, 1, 'Kirk', 'Hammett', 'Lead Guitar', 'Yes'),
(5, 1, 'Jason', 'Newsted', 'Bass Guitar', 'Yes'),
(6, 1, 'Robert', 'Trujillo', 'Bass Guitar', 'Yes'),
(7, 2, 'Paul', 'Hewson', 'Vocals', 'Yes'),
(8, 2, 'David', 'Evans', 'Guitar', 'Yes'),
(9, 2, 'Adam', 'Clayton', 'Bass Guitar', 'Yes'),
(10, 2, 'Larry', 'Mullen Jr.', 'Drums', 'Yes');*/



