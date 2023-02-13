-- Kun Kang (2301131)
-- for CS342 Database Management
-- Professor Patrick Bailey
-- DDL & Modification Lab

--step 2
CREATE DATABASE sheep;
GO

--step 3
USE sheep;
GO

--step 4
CREATE SCHEMA ActiveHerd

--step 6
CREATE TABLE [ActiveHerd].sheep (
	IdNumber INT NOT NULL PRIMARY KEY,
	SheepName CHAR(30),
	BreedCategory CHAR(1),
	Gender CHAR(1),
	ShepherdId INT
);

CREATE TABLE [ActiveHerd].breed (
	BreedCategory CHAR(20) NOT NULL PRIMARY KEY,
	BreedDescription VARCHAR(50)
);

CREATE TABLE [ActiveHerd].sheepShots (
	IdNumber INT NOT NULL PRIMARY KEY,
	ShotType CHAR(20),
	ShotDate DATE
);

CREATE TABLE [ActiveHerd].shotList (
	ShotType CHAR(20) NOT NULL PRIMARY KEY,
	shotDescription VARCHAR(50),
	dayCycle CHAR(30)
);

CREATE TABLE [ActiveHerd].injectionList (
	InjectionType CHAR(20) NOT NULL PRIMARY KEY,
	injectionDescription VARCHAR(50)
);

CREATE TABLE [ActiveHerd].shepherd (
	ShepherdID INT NOT NULL PRIMARY KEY,
	LastName VARCHAR(20),
	FirstName VARCHAR(20),
	ShepherdCertification char(1) NOT NULL
);