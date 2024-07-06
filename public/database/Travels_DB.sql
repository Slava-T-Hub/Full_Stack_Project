--CREATE DATABASE
CREATE DATABASE TravelDB;

USE TravelDB;
----------------------------------------------------------------
--CREATE TABLELS for community
CREATE TABLE Travels (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    Region NVARCHAR(50) NOT NULL,
    Country NVARCHAR(100),
    TypeOfTravel NVARCHAR(50) NOT NULL,
    Season NVARCHAR(50) NOT NULL,
    DescriptionOfTravel NVARCHAR(MAX),
    HowToGet NVARCHAR(MAX),
    WhereToStay NVARCHAR(MAX),
	TravelDate DATETIME2 DEFAULT GETDATE()
);

ALTER TABLE Travels
ADD TravelDate DATETIME2 DEFAULT GETDATE();


--CREATE PROCEDURES

--POST
CREATE PROCEDURE InsertTravelInfo
    @Name NVARCHAR(100),
    @Email NVARCHAR(100),
    @Region NVARCHAR(50),
    @Country NVARCHAR(100),
    @TypeOfTravel NVARCHAR(50),
    @Season NVARCHAR(50),
    @DescriptionOfTravel NVARCHAR(MAX),
    @HowToGet NVARCHAR(MAX),
    @WhereToStay NVARCHAR(MAX)
AS
BEGIN
    INSERT INTO Travels (Name, Email, Region, Country, TypeOfTravel, Season, DescriptionOfTravel, HowToGet, WhereToStay)
    VALUES (@Name, @Email, @Region, @Country, @TypeOfTravel, @Season, @DescriptionOfTravel, @HowToGet, @WhereToStay);
END;


--GET
CREATE PROCEDURE GetAllTravelInfo
AS
BEGIN
    SET NOCOUNT ON; 

    SELECT Name, Email, Region, Country, TypeOfTravel, Season, DescriptionOfTravel, HowToGet, WhereToStay
    FROM Travels
    ORDER BY Id DESC;  
END;

---------------------------------------------------------------------------------------------
--CREATE TABLELS for uploadTravels
CREATE TABLE UpTravelData (
   id INT PRIMARY KEY IDENTITY,
    photoUrl NVARCHAR(MAX),
    nameOfPlaceUp NVARCHAR(255),
    regionUp NVARCHAR(50),
    countryUp NVARCHAR(50),
    typeOfTravelUp NVARCHAR(50),
    seasonUp NVARCHAR(50),
    descriptionUp NVARCHAR(MAX),
    howToGetThereUp NVARCHAR(MAX),
    whereToStayForTheNightUp NVARCHAR(MAX)
	
);

ALTER TABLE UpTravelData
ADD UpTravelDate DATETIME2 DEFAULT GETDATE();

--Insert

CREATE PROCEDURE InsertUpTravelData
    @photoUrl NVARCHAR(MAX),
    @nameOfPlaceUp NVARCHAR(255),
    @regionUp NVARCHAR(50),
    @countryUp NVARCHAR(50),
    @typeOfTravelUp NVARCHAR(50),
    @seasonUp NVARCHAR(50),
    @descriptionUp NVARCHAR(MAX),
    @howToGetThereUp NVARCHAR(MAX),
    @whereToStayForTheNightUp NVARCHAR(MAX)
AS
BEGIN
    INSERT INTO UpTravelData (photoUrl, nameOfPlaceUp, regionUp, countryUp, typeOfTravelUp, seasonUp, descriptionUp, howToGetThereUp, whereToStayForTheNightUp)
    VALUES (@photoUrl, @nameOfPlaceUp, @regionUp, @countryUp, @typeOfTravelUp, @seasonUp, @descriptionUp, @howToGetThereUp, @whereToStayForTheNightUp);
END;
GO

--GET
CREATE PROCEDURE GetUpTravelDataHtmlById
    @id INT  
AS
BEGIN
    SET NOCOUNT ON;

    SELECT id, photoUrl, nameOfPlaceUp, regionUp, countryUp, typeOfTravelUp, seasonUp, descriptionUp, howToGetThereUp, whereToStayForTheNightUp
    FROM UpTravelData
    WHERE id = @id  
    ORDER BY Id DESC;  
END;



CREATE PROCEDURE GetUpTravelDataById
AS
BEGIN
    SET NOCOUNT ON; 

    SELECT id, photoUrl, nameOfPlaceUp, regionUp, countryUp, typeOfTravelUp, seasonUp, descriptionUp, howToGetThereUp, whereToStayForTheNightUp, UpTravelDate
    FROM UpTravelData
    ORDER BY Id DESC;  
END;

------------------------------------
CREATE PROCEDURE GetUpAsia
AS
BEGIN
    SET NOCOUNT ON; 

    SELECT id, photoUrl, nameOfPlaceUp, regionUp, countryUp, typeOfTravelUp, seasonUp, descriptionUp, howToGetThereUp, whereToStayForTheNightUp, UpTravelDate
    FROM UpTravelData
	WHERE regionUp = 'Asia'; 
END;



------------------------------------
--Update

CREATE PROCEDURE UpdateUpTravelData
    @id INT,
    @photoUrl NVARCHAR(MAX),
    @nameOfPlaceUp NVARCHAR(255),
    @regionUp NVARCHAR(50),
    @countryUp NVARCHAR(50),
    @typeOfTravelUp NVARCHAR(50),
    @seasonUp NVARCHAR(50),
    @descriptionUp NVARCHAR(MAX),
    @howToGetThereUp NVARCHAR(MAX),
    @whereToStayForTheNightUp NVARCHAR(MAX)
AS
BEGIN
    UPDATE UpTravelData
    SET photoUrl = @photoUrl,
        nameOfPlaceUp = @nameOfPlaceUp,
        regionUp = @regionUp,
        countryUp = @countryUp,
        typeOfTravelUp = @typeOfTravelUp,
        seasonUp = @seasonUp,
        descriptionUp = @descriptionUp,
        howToGetThereUp = @howToGetThereUp,
        whereToStayForTheNightUp = @whereToStayForTheNightUp
    WHERE id = @id;
END;
GO




--------------------------------------------------------------------
--------------------------------------------------------------------
--------------------------------------------------------------------
--------------------------------------------------------------------
SELECT * FROM Travels

SELECT * FROM UpTravelData

DELETE FROM Travels WHERE ID = 

DELETE FROM UpTravelData WHERE ID = 
--------------------------------------------------------------------
--------------------------------------------------------------------
--------------------------------------------------------------------
--------------------------------------------------------------------
UPDATE UpTravelData
SET regionUp = 'Asia'
WHERE id = 17;
