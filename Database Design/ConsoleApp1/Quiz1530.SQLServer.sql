CREATE SCHEMA ORMModel1
GO

GO


CREATE TABLE ORMModel1.Moon
(
	moonName nvarchar(20) NOT NULL,
	mass decimal(19,0),
	planetName nvarchar(20),
	CONSTRAINT Moon_PK PRIMARY KEY(moonName)
)
GO


CREATE VIEW ORMModel1.Moon_UC (mass)
WITH SCHEMABINDING
AS
	SELECT mass
	FROM 
		ORMModel1.Moon
	WHERE mass IS NOT NULL
GO


CREATE UNIQUE CLUSTERED INDEX Moon_UCIndex ON ORMModel1.Moon_UC(mass)
GO


CREATE TABLE ORMModel1.Planet
(
	planetName nvarchar(20) NOT NULL,
	mass decimal(19,0),
	hasADistanceStarName nvarchar(20),
	orbitsStarName nvarchar(20),
	CONSTRAINT Planet_PK PRIMARY KEY(planetName)
)
GO


CREATE VIEW ORMModel1.Planet_UC (mass)
WITH SCHEMABINDING
AS
	SELECT mass
	FROM 
		ORMModel1.Planet
	WHERE mass IS NOT NULL
GO


CREATE UNIQUE CLUSTERED INDEX Planet_UCIndex ON ORMModel1.Planet_UC(mass)
GO


CREATE TABLE ORMModel1.Star
(
	starName nvarchar(20) NOT NULL,
	blackholeId int,
	CONSTRAINT Star_PK PRIMARY KEY(starName)
)
GO


CREATE TABLE ORMModel1.Abidstar
(
	abidstarName nvarchar(20) NOT NULL,
	CONSTRAINT Abidstar_PK PRIMARY KEY(abidstarName)
)
GO


CREATE TABLE ORMModel1.Ruckerstar
(
	ruckerstarName nvarchar(20) NOT NULL,
	CONSTRAINT Ruckerstar_PK PRIMARY KEY(ruckerstarName)
)
GO


CREATE TABLE ORMModel1.Blackhole
(
	blackholeId int IDENTITY (1, 1) NOT NULL,
	CONSTRAINT Blackhole_PK PRIMARY KEY(blackholeId)
)
GO


ALTER TABLE ORMModel1.Moon ADD CONSTRAINT Moon_FK FOREIGN KEY (planetName) REFERENCES ORMModel1.Planet (planetName) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


ALTER TABLE ORMModel1.Planet ADD CONSTRAINT Planet_FK1 FOREIGN KEY (orbitsStarName) REFERENCES ORMModel1.Star (starName) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


ALTER TABLE ORMModel1.Planet ADD CONSTRAINT Planet_FK2 FOREIGN KEY (hasADistanceStarName) REFERENCES ORMModel1.Star (starName) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


ALTER TABLE ORMModel1.Star ADD CONSTRAINT Star_FK FOREIGN KEY (blackholeId) REFERENCES ORMModel1.Blackhole (blackholeId) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


ALTER TABLE ORMModel1.Abidstar ADD CONSTRAINT Abidstar_FK FOREIGN KEY (abidstarName) REFERENCES ORMModel1.Star (starName) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


ALTER TABLE ORMModel1.Ruckerstar ADD CONSTRAINT Ruckerstar_FK FOREIGN KEY (ruckerstarName) REFERENCES ORMModel1.Star (starName) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


GO