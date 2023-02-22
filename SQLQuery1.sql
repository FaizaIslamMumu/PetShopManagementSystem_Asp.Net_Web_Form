CREATE DATABASE petDB
GO
USE petDB
GO

CREATE TABLE petTypes
(
	typeid INT IDENTITY NOT NULL PRIMARY KEY,
	PetsType NVARCHAR(50) NOT NULL,
	housing NVARCHAR(40) NOT NULL
)
GO
SELECT * FROM petTypes
GO
CREATE TABLE pets
(
	petId INT IDENTITY PRIMARY KEY NOT NULL,
	typeId INT REFERENCES PetTypes(typeid) NOT NULL,
	colorDescription NVARCHAR(50) NOT NULL,
	sellUnitDescription NVARCHAR(50) NOT NULL,
	price MONEY NOT NULL,
	picture NVARCHAR(200) NOT NULL
)
GO
CREATE TABLE catinfo
(
	catId INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	catName VARCHAR(50) NOT NULL,
	petTypeId INT REFERENCES petTypes(typeid),
	CatGender BIT NULL,
	catImage  IMAGE NULL
)
GO
SELECT * FROM cat
GO
INSERT INTO cat  (catName) VALUES ('Bengal cat')
Go

CREATE TABLE DogInfo
(
	DogId INT IDENTITY(2,2) PRIMARY KEY NOT NULL,
	DogName VARCHAR(50) NOT NULL,
	DogGender BIT NULL,
	categoryID INT REFERENCES Category(categoryID) NOT NULL, 
	DogImage NVARCHAR NULL
)
GO
SELECT * FROM DogInfo
GO


CREATE TABLE BirdInfo
(
	BirdId INT IDENTITY(3,3) PRIMARY KEY NOT NULL,
	BirdName VARCHAR(50) NOT NULL,
	petTypeId INT REFERENCES petTypes(typeid),
	BirdGender BIT  NULL,
	BirdImage NVARCHAR(200) NULL
)
GO
SELECT * FROM BirdInfo
GO
INSERT INTO BirdInfo  (BirdName) VALUES ('Bazrigar')
Go

CREATE TABLE Foods
(
	foodId INT IDENTITY(3,3) PRIMARY KEY NOT NULL,
	foodName VARCHAR(50) NOT NULL,
	petTypeId INT REFERENCES petTypes(typeid),
	foodImage NVARCHAR(200) NULL
)
GO
CREATE TABLE AccessoriesInfo
(
	AccessoriesId INT IDENTITY(5,5) PRIMARY KEY NOT NULL,
	petTypeId INT REFERENCES petTypes(typeid),
	AccessoriesName VARCHAR(50) NOT NULL,
	
)
GO
SELECT * FROM AccessoriesInfo
GO
INSERT INTO AccessoriesInfo(AccessoriesName) VALUES ('Bag')
Go

CREATE TABLE Category
(
	categoryID INT IDENTITY PRIMARY KEY NOT NULL,
	categoryName VARCHAR(50) NOT NULL

)
GO
SELECT * FROM Category 
INSERT INTO Category VALUES('Pets'),('Food'),('Accessories')




