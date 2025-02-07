CREATE DATABASE FLARE;
USE FLARE;

CREATE TABLE User (
    UserID INT PRIMARY KEY,
    Username VARCHAR(255),
    Email VARCHAR(255),
    Password VARCHAR(255)
);

CREATE TABLE Artist (
    ArtistID INT PRIMARY KEY,
    Name VARCHAR(255),
    Genre VARCHAR(255)
);

CREATE TABLE Album (
    AlbumID INT PRIMARY KEY,
    Title VARCHAR(255),
    ArtistID INT,
    Genre VARCHAR(255),
    ReleaseDate DATE,
    FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID)
);

CREATE TABLE Track (
    TrackID INT PRIMARY KEY,
    Title VARCHAR(255),
    ArtistID INT,
    AlbumID INT,
    Duration TIME,
    ReleaseDate DATE,
    FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID),
    FOREIGN KEY (AlbumID) REFERENCES Album(AlbumID)
);

CREATE TABLE Playlist (
    PlaylistID INT PRIMARY KEY,
    UserID INT,
    Title VARCHAR(255),
    CreationDate DATE,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

CREATE TABLE PlaylistTracks (
	PlaylistTrackID INT PRIMARY KEY,
    PlaylistID INT,
    TrackID INT
);

CREATE TABLE Likes (
    LikeID INT PRIMARY KEY,
    UserID INT,
    TrackID INT,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (TrackID) REFERENCES Track(TrackID)
);

CREATE TABLE PremiumFeature (
    Premium_Feature_ID INT PRIMARY KEY,
    Name VARCHAR(255)
);

CREATE TABLE SubscriptionPlan (
    Subscription_Plan_ID INT PRIMARY KEY,
    Name VARCHAR(255),
    Price DECIMAL(10,2),
    Description TEXT
);

CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY,
    User_ID INT,
    Amount DECIMAL(10,2),
    Date DATE,
    Method VARCHAR(50),
    FOREIGN KEY (User_ID) REFERENCES User(UserID)
);

-- DATA INSERTION OF USERS --
INSERT INTO User (UserID, Username, Email, Password) VALUES (1, 'john_doe', 'john.doe@example.com', 'password123');
INSERT INTO User (UserID, Username, Email, Password) VALUES (2, 'jane_smith', 'jane.smith@example.com', 'password456');
INSERT INTO User (UserID, Username, Email, Password) VALUES (3, 'alice_wonderland', 'alice@wonderland.com', 'password789');
INSERT INTO User (UserID, Username, Email, Password) VALUES (4, 'bob_marley', 'bob@marley.com', 'password000');
INSERT INTO User (UserID, Username, Email, Password) VALUES (5, 'eva_green', 'eva@green.com', 'password999');
INSERT INTO User (UserID, Username, Email, Password) VALUES (6, 'charlie_chaplin', 'charlie@chaplin.com', 'password888');

-- DATA INSERTION OF ARTISTS --
INSERT INTO Artist (ArtistID, Name, Genre) VALUES (1, 'The Beatles', 'Rock');
INSERT INTO Artist (ArtistID, Name, Genre) VALUES (2, 'Bob Dylan', 'Folk');
INSERT INTO Artist (ArtistID, Name, Genre) VALUES (3, 'Michael Jackson', 'Pop');
INSERT INTO Artist (ArtistID, Name, Genre) VALUES (4, 'Queen', 'Rock');
INSERT INTO Artist (ArtistID, Name, Genre) VALUES (5, 'Taylor Swift', 'Pop');
INSERT INTO Artist (ArtistID, Name, Genre) VALUES (6, 'Led Zeppelin', 'Rock');

-- DATA INSERTION OF ALBUMS --
INSERT INTO Album (AlbumID, Title, ArtistID, Genre, ReleaseDate) VALUES (1, 'Abbey Road', 1, 'Rock', '1969-09-26');
INSERT INTO Album (AlbumID, Title, ArtistID, Genre, ReleaseDate) VALUES (2, 'Freewheelin\' Bob Dylan', 2, 'Folk', '1963-05-21');
INSERT INTO Album (AlbumID, Title, ArtistID, Genre, ReleaseDate) VALUES (3, 'Thriller', 3, 'Pop', '1982-11-30');
INSERT INTO Album (AlbumID, Title, ArtistID, Genre, ReleaseDate) VALUES (4, 'A Night at the Opera', 4, 'Rock', '1975-11-21');
INSERT INTO Album (AlbumID, Title, ArtistID, Genre, ReleaseDate) VALUES (5, '1989', 5, 'Pop', '1989-10-27');
INSERT INTO Album (AlbumID, Title, ArtistID, Genre, ReleaseDate) VALUES (6, 'Led Zeppelin IV', 6, 'Rock', '1971-11-08');
INSERT INTO Album (AlbumID, Title, ArtistID, Genre, ReleaseDate) VALUES (7, 'Sgt. Peppers Lonely Hearts Club Band', 1, 'Rock', '1967-06-01');
INSERT INTO Album (AlbumID, Title, ArtistID, Genre, ReleaseDate) VALUES (8, 'Highway 61 Revisited', 2, 'Folk', '1965-08-30');
INSERT INTO Album (AlbumID, Title, ArtistID, Genre, ReleaseDate) VALUES (9, 'Bad', 3, 'Pop', '1987-08-31');
INSERT INTO Album (AlbumID, Title, ArtistID, Genre, ReleaseDate) VALUES (10, 'A Kind of Magic', 4, 'Rock', '1986-03-10');
INSERT INTO Album (AlbumID, Title, ArtistID, Genre, ReleaseDate) VALUES (11, 'Lover', 5, 'Pop', '2019-08-23');
INSERT INTO Album (AlbumID, Title, ArtistID, Genre, ReleaseDate) VALUES (12, 'Physical Graffiti', 6, 'Rock', '1975-02-25');
INSERT INTO Album (AlbumID, Title, ArtistID, Genre, ReleaseDate) VALUES (13, 'Rubber Soul', 1, 'Rock', '1965-12-03');
INSERT INTO Album (AlbumID, Title, ArtistID, Genre, ReleaseDate) VALUES (14, 'Bringing It All Back Home', 2, 'Folk', '1965-01-21');
INSERT INTO Album (AlbumID, Title, ArtistID, Genre, ReleaseDate) VALUES (15, 'Off the Wall', 3, 'Pop', '1979-08-23');

-- DATA INSERTION OF TRACKS --
INSERT INTO Track (TrackID, Title, ArtistID, AlbumID, Duration, ReleaseDate) VALUES (1, 'Come Together', 1, 5, '04:17', '1969-09-26');
INSERT INTO Track (TrackID, Title, ArtistID, AlbumID, Duration, ReleaseDate) VALUES (2, 'Something', 1, 3, '03:33', '1969-09-26');
INSERT INTO Track (TrackID, Title, ArtistID, AlbumID, Duration, ReleaseDate) VALUES (3, 'Maxwells Silver Hammer', 1, 12, '03:27', '1969-09-26');
INSERT INTO Track (TrackID, Title, ArtistID, AlbumID, Duration, ReleaseDate) VALUES (4, 'Oh! Darling', 1, 2, '03:40', '1969-09-26');
INSERT INTO Track (TrackID, Title, ArtistID, AlbumID, Duration, ReleaseDate) VALUES (5, 'Octopuss Garden', 1, 7, '02:51', '1969-09-26');
INSERT INTO Track (TrackID, Title, ArtistID, AlbumID, Duration, ReleaseDate) VALUES (6, 'I Want You (Shes So Heavy)', 1, 9, '07:45', '1969-09-26');
INSERT INTO Track (TrackID, Title, ArtistID, AlbumID, Duration, ReleaseDate) VALUES (7, 'Here Comes the Sun', 1, 11, '03:05', '1969-09-26');
INSERT INTO Track (TrackID, Title, ArtistID, AlbumID, Duration, ReleaseDate) VALUES (8, 'Because', 1, 4, '02:45', '1969-09-26');
INSERT INTO Track (TrackID, Title, ArtistID, AlbumID, Duration, ReleaseDate) VALUES (9, 'You Never Give Me Your Money', 1, 8, '04:35', '1969-09-26');
INSERT INTO Track (TrackID, Title, ArtistID, AlbumID, Duration, ReleaseDate) VALUES (10, 'Sun King', 1, 10, '02:26', '1969-09-26');
INSERT INTO Track (TrackID, Title, ArtistID, AlbumID, Duration, ReleaseDate) VALUES (11, 'Mean Mr. Mustard', 1, 6, '01:06', '1969-09-26');
INSERT INTO Track (TrackID, Title, ArtistID, AlbumID, Duration, ReleaseDate) VALUES (12, 'Polythene Pam', 1, 13, '01:27', '1969-09-26');
INSERT INTO Track (TrackID, Title, ArtistID, AlbumID, Duration, ReleaseDate) VALUES (13, 'She Came In Through the Bathroom Window', 1, 14, '02:13', '1969-09-26');
INSERT INTO Track (TrackID, Title, ArtistID, AlbumID, Duration, ReleaseDate) VALUES (14, 'Golden Slumbers', 1, 15, '01:37', '1969-09-26');
INSERT INTO Track (TrackID, Title, ArtistID, AlbumID, Duration, ReleaseDate) VALUES (15, 'Carry That Weight', 1, 1, '02:15', '1969-09-26');
INSERT INTO Track (TrackID, Title, ArtistID, AlbumID, Duration, ReleaseDate) VALUES (16, 'The End', 1, 3, '02:45', '1969-09-26');
INSERT INTO Track (TrackID, Title, ArtistID, AlbumID, Duration, ReleaseDate) VALUES (17, 'Blowin in the Wind', 2, 1, '03:56', '1963-05-21');
INSERT INTO Track (TrackID, Title, ArtistID, AlbumID, Duration, ReleaseDate) VALUES (18, 'A Hard Rains Gonna Fall', 2, 5, '07:00', '1963-05-21');
INSERT INTO Track (TrackID, Title, ArtistID, AlbumID, Duration, ReleaseDate) VALUES (19, 'Masters of War', 2, 12, '04:45', '1963-05-21');
INSERT INTO Track (TrackID, Title, ArtistID, AlbumID, Duration, ReleaseDate) VALUES (20, 'Dont Think Twice, Its Alright', 2, 7, '03:20', '1963-05-21');
INSERT INTO Track (TrackID, Title, ArtistID, AlbumID, Duration, ReleaseDate) VALUES (21, 'Bob Dylan', 2, 9, '02:45', '1963-05-21');
INSERT INTO Track (TrackID, Title, ArtistID, AlbumID, Duration, ReleaseDate) VALUES (22, 'Tight Connection', 2, 11, '03:30', '1963-05-21');
INSERT INTO Track (TrackID, Title, ArtistID, AlbumID, Duration, ReleaseDate) VALUES (23, 'Honey, Just Allow Me One More Chance', 2, 4, '02:50', '1963-05-21');
INSERT INTO Track (TrackID, Title, ArtistID, AlbumID, Duration, ReleaseDate) VALUES (24, 'Talkin World War III Blues', 2, 8, '06:30', '1963-05-21');
INSERT INTO Track (TrackID, Title, ArtistID, AlbumID, Duration, ReleaseDate) VALUES (25, 'Corrina, Corrina', 2, 10, '02:45', '1963-05-21');
INSERT INTO Track (TrackID, Title, ArtistID, AlbumID, Duration, ReleaseDate) VALUES (26, 'Billy the Kid', 2, 6, '02:40', '1963-05-21');
INSERT INTO Track (TrackID, Title, ArtistID, AlbumID, Duration, ReleaseDate) VALUES (27, 'Dont Think Twice, Its Alright', 2, 13, '03:20', '1963-05-21');
INSERT INTO Track (TrackID, Title, ArtistID, AlbumID, Duration, ReleaseDate) VALUES (28, 'The Times They Are A-Changin\'', 2, 15, '03:20', '1963-05-21');
INSERT INTO Track (TrackID, Title, ArtistID, AlbumID, Duration, ReleaseDate) VALUES (29, 'Boots of Spanish Leather', 2, 2, '03:10', '1963-05-21');
INSERT INTO Track (TrackID, Title, ArtistID, AlbumID, Duration, ReleaseDate) VALUES (30, 'Girl from North Country', 2, 3, '03:35', '1963-05-21');
INSERT INTO Track (TrackID, Title, ArtistID, AlbumID, Duration, ReleaseDate) VALUES (31, 'If I Had a Hammer', 2, 12, '03:15', '1963-05-21');
INSERT INTO Track (TrackID, Title, ArtistID, AlbumID, Duration, ReleaseDate) VALUES (32, 'The Lonesome Death of Hattie Carroll', 2, 7, '06:20', '1963-05-21');
INSERT INTO Track (TrackID, Title, ArtistID, AlbumID, Duration, ReleaseDate) VALUES (33, 'Freight Train Blues', 2, 9, '02:50', '1963-05-21');
INSERT INTO Track (TrackID, Title, ArtistID, AlbumID, Duration, ReleaseDate) VALUES (34, 'Frankie Lee and the Blues', 2, 11, '03:50', '1963-05-21');
INSERT INTO Track (TrackID, Title, ArtistID, AlbumID, Duration, ReleaseDate) VALUES (35, 'The Ballad of a Thin Man', 2, 4, '03:10', '1963-05-21');

INSERT INTO Playlist (PlaylistID, UserID, Title, CreationDate) VALUES (1, 1, 'My Favorite Songs', '2023-01-01');
INSERT INTO Playlist (PlaylistID, UserID, Title, CreationDate) VALUES (2, 1, 'Workout Music', '2023-02-01');
INSERT INTO Playlist (PlaylistID, UserID, Title, CreationDate) VALUES (3, 2, 'Chill Vibes', '2023-03-01');
INSERT INTO Playlist (PlaylistID, UserID, Title, CreationDate) VALUES (4, 2, 'Party Anthems', '2023-04-01');
INSERT INTO Playlist (PlaylistID, UserID, Title, CreationDate) VALUES (5, 3, 'Pop Hits', '2023-05-01');
INSERT INTO Playlist (PlaylistID, UserID, Title, CreationDate) VALUES (6, 3, 'Classic Rock', '2023-06-01');
INSERT INTO Playlist (PlaylistID, UserID, Title, CreationDate) VALUES (7, 4, 'Country Music', '2023-07-01');
INSERT INTO Playlist (PlaylistID, UserID, Title, CreationDate) VALUES (8, 4, 'Reggae Beats', '2023-08-01');
INSERT INTO Playlist (PlaylistID, UserID, Title, CreationDate) VALUES (9, 5, 'Hip Hop Classics', '2023-09-01');
INSERT INTO Playlist (PlaylistID, UserID, Title, CreationDate) VALUES (10, 5, 'Indie Rock', '2023-10-01');

INSERT INTO PlaylistTracks (PlaylistTrackID, PlaylistID, TrackID) VALUES (1, 1, 7);
INSERT INTO PlaylistTracks (PlaylistTrackID, PlaylistID, TrackID) VALUES (2, 1, 31);
INSERT INTO PlaylistTracks (PlaylistTrackID, PlaylistID, TrackID) VALUES (3, 1, 27);
INSERT INTO PlaylistTracks (PlaylistTrackID, PlaylistID, TrackID) VALUES (4, 2, 1);
INSERT INTO PlaylistTracks (PlaylistTrackID, PlaylistID, TrackID) VALUES (5, 2, 7);
INSERT INTO PlaylistTracks (PlaylistTrackID, PlaylistID, TrackID) VALUES (6, 3, 9);
INSERT INTO PlaylistTracks (PlaylistTrackID, PlaylistID, TrackID) VALUES (7, 4, 7);
INSERT INTO PlaylistTracks (PlaylistTrackID, PlaylistID, TrackID) VALUES (8, 6, 23);

-- DATA INSERTION OF LIKES --
INSERT INTO Likes (LikeID, UserID, TrackID) VALUES (1, 1, 1);
INSERT INTO Likes (LikeID, UserID, TrackID) VALUES (2, 1, 2);
INSERT INTO Likes (LikeID, UserID, TrackID) VALUES (3, 1, 3);
INSERT INTO Likes (LikeID, UserID, TrackID) VALUES (4, 1, 4);
INSERT INTO Likes (LikeID, UserID, TrackID) VALUES (5, 1, 5);
INSERT INTO Likes (LikeID, UserID, TrackID) VALUES (6, 2, 6);
INSERT INTO Likes (LikeID, UserID, TrackID) VALUES (7, 2, 7);
INSERT INTO Likes (LikeID, UserID, TrackID) VALUES (8, 2, 8);
INSERT INTO Likes (LikeID, UserID, TrackID) VALUES (9, 2, 9);
INSERT INTO Likes (LikeID, UserID, TrackID) VALUES (10, 2, 10);
INSERT INTO Likes (LikeID, UserID, TrackID) VALUES (11, 3, 11);
INSERT INTO Likes (LikeID, UserID, TrackID) VALUES (12, 3, 12);
INSERT INTO Likes (LikeID, UserID, TrackID) VALUES (13, 3, 13);
INSERT INTO Likes (LikeID, UserID, TrackID) VALUES (14, 3, 14);
INSERT INTO Likes (LikeID, UserID, TrackID) VALUES (15, 3, 15);
INSERT INTO Likes (LikeID, UserID, TrackID) VALUES (16, 4, 16);
INSERT INTO Likes (LikeID, UserID, TrackID) VALUES (17, 4, 17);
INSERT INTO Likes (LikeID, UserID, TrackID) VALUES (18, 4, 18);
INSERT INTO Likes (LikeID, UserID, TrackID) VALUES (19, 4, 19);
INSERT INTO Likes (LikeID, UserID, TrackID) VALUES (20, 4, 20);

-- DATA INSERTION OF PREMIUM FEATURES --
INSERT INTO PremiumFeature (Premium_Feature_ID, Name) VALUES (1, 'High-Quality Audio Streaming');
INSERT INTO PremiumFeature (Premium_Feature_ID, Name) VALUES (2, 'Ad-Free Listening');
INSERT INTO PremiumFeature (Premium_Feature_ID, Name) VALUES (3, 'Offline Downloads');
INSERT INTO PremiumFeature (Premium_Feature_ID, Name) VALUES (4, 'Exclusive Content');

-- DATA INSERTION OF SUBSCRIPTION PLANS --
INSERT INTO SubscriptionPlan (Subscription_Plan_ID, Name, Price, Description) VALUES (1, 'Basic', 4.99, 'Basic features with ads.');
INSERT INTO SubscriptionPlan (Subscription_Plan_ID, Name, Price, Description) VALUES (2, 'Standard', 9.99, 'Standard features with ad-free listening.');
INSERT INTO SubscriptionPlan (Subscription_Plan_ID, Name, Price, Description) VALUES (3, 'Premium', 14.99, 'All premium features with high-quality audio and exclusive content.');

-- DATA INSERTION OF PAYMENTS --
INSERT INTO Payment (Payment_ID, User_ID, Amount, Date, Method) VALUES (1, 1, 9.99, '2023-11-01', 'Credit Card');
INSERT INTO Payment (Payment_ID, User_ID, Amount, Date, Method) VALUES (2, 2, 14.99, '2023-12-01', 'PayPal');
INSERT INTO Payment (Payment_ID, User_ID, Amount, Date, Method) VALUES (3, 3, 4.99, '2024-01-01', 'Debit Card');
INSERT INTO Payment (Payment_ID, User_ID, Amount, Date, Method) VALUES (4, 4, 9.99, '2024-02-01', 'Apple Pay');



--  Query to show the album and the artist who made it-- 
SELECT album.Title, artist.Name, album.Genre, album.ReleaseDate
FROM Album AS album
INNER JOIN Artist AS artistID
ON album.ArtistID = artist.ArtistID;

-- Query to show which subscription a user bought -- 
SELECT u.Username, d.Amount, d.Method, d.Name, d.Description
FROM( 	
		SELECT p.User_ID, p.Payment_ID, p.Amount, p.Method, s.Name, s.Description 
		FROM Payment AS p 
		INNER JOIN SubscriptionPlan AS s ON s.Price = p.Amount
	) AS d
INNER JOIN User AS u
ON d.User_ID = u.UserID;

-- QUERY TO VIEW THE LIKED SONGS OF A PARTICULAR USER --
SELECT t.Title FROM Track AS t
INNER JOIN (
	SELECT l.UserID, l.TrackID
	FROM Likes AS l
	WHERE l.UserID = 1
) AS d
WHERE t.TrackID = d.TrackID;