CREATE OR ALTER PROC uspADDTABLE
AS 
	CREATE TABLE MagicalObjects
	(ObjectId INT NOT NULL,
	 ObjectName VARCHAR(50) NOT NULL,
	 ObjectOwner INT);
GO

CREATE OR ALTER PROC ruspADDTABLE
AS
	DROP TABLE MagicalObjects;
GO

CREATE OR ALTER PROCEDURE uspADDPRIMARY
AS 
	ALTER TABLE MagicalObjects
	ADD CONSTRAINT PK_ObjectId PRIMARY KEY (ObjectId);
GO

CREATE OR ALTER PROCEDURE ruspADDPRIMARY
AS 
	ALTER TABLE MagicalObjects
	DROP CONSTRAINT PK_ObjectId;
GO


CREATE OR ALTER PROC uspADDFOREIGN
AS 
	ALTER TABLE MagicalObjects
	ADD CONSTRAINT FK_ObjectOwner FOREIGN KEY (ObjectOwner) REFERENCES Deity(DeityId);
GO

CREATE OR ALTER PROC ruspADDFOREIGN
AS 
	ALTER TABLE MagicalObjects
	DROP CONSTRAINT FK_ObjectOwner;
GO

CREATE OR ALTER PROC uspADDCOLUMN
AS
	ALTER TABLE MagicalObjects
	ADD ObjectFame INT;
GO

CREATE OR ALTER PROC ruspADDCOLUMN
AS 
	ALTER TABLE MagicalObjects
	DROP COLUMN ObjectFame;
GO

CREATE OR ALTER PROC uspADDDEFAULTVALUE
AS 
	ALTER TABLE MagicalObjects
	ADD CONSTRAINT DF_ObjectFame
	DEFAULT 1000 FOR ObjectFame;
GO

CREATE OR ALTER PROC ruspADDDEFAULTVALUE
AS 
	ALTER TABLE MagicalObjects
	DROP CONSTRAINT DF_ObjectFame;
GO

CREATE OR ALTER PROC uspMODIFYCOLUMNTYPE
AS
	ALTER TABLE MagicalObjects
	ALTER COLUMN ObjectFame BIGINT;
GO

CREATE OR ALTER PROC ruspMODIFYCOLUMNTYPE
AS
	ALTER TABLE MagicalObjects
	ALTER COLUMN ObjectFame INT;
GO

CREATE OR ALTER PROC uspCANDIDATEKEY
AS
	ALTER TABLE MagicalObjects
	ADD CONSTRAINT UQ_ObjectName UNIQUE(ObjectName);
GO


CREATE OR ALTER PROC ruspCANDIDATEKEY
AS
	ALTER TABLE MagicalObjects
	DROP CONSTRAINT UQ_ObjectName;
GO

CREATE TABLE DBVersion
(CurrVer INT DEFAULT 0)

INSERT INTO DBVersion
VALUES
(0)

SELECT* 
FROM DBVersion

GO

CREATE TABLE VersionCommands
(uspName VARCHAR(50),
ruspName VARCHAR(50),
targetV INT PRIMARY KEY)

INSERT INTO VersionCommands
VALUES
('uspADDTABLE', 'ruspADDTABLE', 1),
('uspADDPRIMARY', 'ruspADDPRIMARY', 2),
('uspADDFOREIGN', 'ruspADDFOREIGN', 3),
('uspADDCOLUMN','ruspADDCOLUMN',4),
('uspMODIFYCOLUMNTYPE', 'ruspMODIFYCOLUMNTYPE', 5),
('uspADDDEFAULTVALUE', 'ruspADDDEFAULTVALUE', 6),
('uspCANDIDATEKEY', 'ruspCANDIDATEKEY', 7)

GO

SELECT* 
FROM VersionCommands

GO

CREATE OR ALTER PROC uspChangeVersion @NewVer INT
AS
	DECLARE @CurrVer INT
	SELECT @CurrVer = min(CurrVer)
	FROM DBVersion

	DECLARE @Command VARCHAR(50)

	WHILE (@CurrVer<@NewVer)
	BEGIN
		SET @CurrVer = @CurrVer+1
		SELECT @Command = uspName
		FROM VersionCommands WHERE @CurrVer = targetV

		EXEC(@Command)
	END

	WHILE (@CurrVer>@NewVer)
	BEGIN
		SELECT @Command = ruspName
		FROM VersionCommands WHERE @CurrVer = targetV
		SET @CurrVer = @CurrVer-1

		EXEC(@Command)
	END

	UPDATE DBVersion
	SET CurrVer = @NewVer

GO

EXEC uspChangeVersion @NewVer = 0

sp_help 'MagicalObjects'



