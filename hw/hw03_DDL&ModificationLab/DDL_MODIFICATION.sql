-- Kun Kang (2301131)
-- for CS342 Database Management
-- Professor Patrick Bailey
-- DDL & Modification Lab
DROP TABLE ActiveHerd.sheepShots
DROP TABLE ActiveHerd.shotList
DROP TABLE ActiveHerd.shepherd
DROP TABLE ActiveHerd.injectionList
DROP TABLE ActiveHerd.sheep
DROP TABLE ActiveHerd.breed
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
	BreedCategory CHAR(20),
	Gender CHAR(1),
	ShepherdId INT
);

CREATE TABLE [ActiveHerd].breed (
	BreedCategory CHAR(20) NOT NULL PRIMARY KEY,
	BreedDescription VARCHAR(100)
);

CREATE TABLE [ActiveHerd].sheepShots (
	IdNumber INT NOT NULL,
	ShotType CHAR(20),
	ShotDate DATE,
	InjectionType CHAR(20)
);

CREATE TABLE [ActiveHerd].shotList (
	ShotType CHAR(20) NOT NULL PRIMARY KEY,
	shotDescription VARCHAR(100),
	dayCycle CHAR(30)
);

CREATE TABLE [ActiveHerd].injectionList (
	InjectionType CHAR(20) NOT NULL PRIMARY KEY,
	injectionDescription VARCHAR(100)
);

CREATE TABLE [ActiveHerd].shepherd (
	ShepherdID INT NOT NULL PRIMARY KEY,
	LastName VARCHAR(20),
	FirstName VARCHAR(20),
	ShepherdCertification char(1) NOT NULL
);

--step 7
ALTER TABLE ActiveHerd.sheep
	ADD CONSTRAINT FK_breed FOREIGN KEY (BreedCategory) REFERENCES ActiveHerd.breed(BreedCategory)
ALTER TABLE ActiveHerd.sheep
	ADD CONSTRAINT FK_ShepherdID FOREIGN KEY (ShepherdId) REFERENCES ActiveHerd.shepherd(ShepherdId)

ALTER TABLE ActiveHerd.sheepShots
	ADD CONSTRAINT FK_sheepID FOREIGN KEY (IdNumber) REFERENCES ActiveHerd.sheep(IdNumber)
ALTER TABLE ActiveHerd.sheepShots
	ADD CONSTRAINT FK_sheepShotType FOREIGN KEY (ShotType) REFERENCES ActiveHerd.shotList(ShotType)
ALTER TABLE ActiveHerd.sheepShots
	ADD CONSTRAINT FK_injectionType FOREIGN KEY (InjectionType) REFERENCES ActiveHerd.InjectionList(InjectionType)

--step 8
INSERT INTO ActiveHerd.shotList(ShotType, shotDescription, dayCycle)
	VALUES ('deadshot',
		'This shot provides the injected subject one more chance of life upon untimely death.',
		'Once in a lifetime'),
		
		('mellojello',
		'This shot provides instant relief from any stress.', 
		'Every full moon'),
		
		('yellow fever',
		'This shot grants immunity from yellow fever',
		'Every 7 years')

INSERT INTO ActiveHerd.shepherd(ShepherdID, LastName, FirstName, ShepherdCertification)
	VALUES (1,
		'Kang',
		'Kun',
		'G'),

		(2,
		'Kung',
		'Kan',
		'A'),

		(3,
		'Kan',
		'Kung',
		'S')

INSERT INTO ActiveHerd.injectionList(InjectionType, injectionDescription)
	VALUES ('mad cow disease',
		'This shot prevents the subject from getting mad cow disease.'),
		
		('chicken pox',
		'This shot prevents the subject from getting chicken pox.'),
		
		('corona',
		'Oral Injection')

INSERT INTO ActiveHerd.sheep (IdNumber, SheepName, BreedCategory, Gender, ShepherdId)
	VALUES (1,
		'YoungKwang',
		'ghost renegade',
		'?',
		1),
		
		(2,
		'Gunjoo',
		'spicy jalapeno',
		'm',
		1),
		
		(3, 
		'Seongchan',
		'cow-ward',
		'm',
		2)

INSERT INTO ActiveHerd.breed (BreedCategory, BreedDescription)
	VALUES ('ghost renegade',
		'This species of cows are often spotted with golden spectacles.'),
		
		('spicy jalapeno',
		'This species of cows have delicate and naturally spicy meat.'),
		
		('cow-ward',
		'This species of cows are often to be the bravest.')

--step 9
INSERT INTO ActiveHerd.sheepShots (IdNumber,
	ShotType,
	ShotDate,
	InjectionType)
	SELECT baa.IdNumber,
		ouch.ShotType,
		GETDATE(),
		ouchie.InjectionType
	FROM ActiveHerd.sheep baa,
		ActiveHerd.shotList ouch,
		ActiveHerd.injectionList ouchie
	WHERE ouchie.injectionDescription = 'Oral Injection'

--step 10
UPDATE ActiveHerd.sheepShots
	SET ShotDate = '2023-02-03'

--step 11
SELECT * FROM ActiveHerd.breed
SELECT * FROM ActiveHerd.sheep
SELECT * FROM ActiveHerd.sheepShots
SELECT * FROM ActiveHerd.injectionList
SELECT * FROM ActiveHerd.shepherd
SELECT * FROM ActiveHerd.shotList

--step 12
--It is because the sheep table contains foreign keys that reference other tables
DELETE FROM ActiveHerd.sheep

--step 13
ALTER TABLE ActiveHerd.sheepShots
	DROP CONSTRAINT FK_sheepID
DELETE FROM ActiveHerd.sheep

--step 14
DELETE FROM ActiveHerd.shepherd

--step 16
DROP TABLE ActiveHerd.sheepShots
DROP TABLE ActiveHerd.shotList
DROP TABLE ActiveHerd.injectionList
DROP TABLE ActiveHerd.shepherd
DROP TABLE ActiveHerd.sheep
DROP TABLE ActiveHerd.breed

--step 17
USE master
ALTER DATABASE sheep SET SINGLE_USER WITH ROLLBACK IMMEDIATE
DROP DATABASE sheep;
GO