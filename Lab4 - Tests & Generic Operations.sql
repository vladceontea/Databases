if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestRunTables_Tables]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)

ALTER TABLE [TestRunTables] DROP CONSTRAINT FK_TestRunTables_Tables

GO



if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestTables_Tables]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)

ALTER TABLE [TestTables] DROP CONSTRAINT FK_TestTables_Tables

GO



if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestRunTables_TestRuns]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)

ALTER TABLE [TestRunTables] DROP CONSTRAINT FK_TestRunTables_TestRuns

GO



if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestRunViews_TestRuns]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)

ALTER TABLE [TestRunViews] DROP CONSTRAINT FK_TestRunViews_TestRuns

GO



if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestTables_Tests]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)

ALTER TABLE [TestTables] DROP CONSTRAINT FK_TestTables_Tests

GO



if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestViews_Tests]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)

ALTER TABLE [TestViews] DROP CONSTRAINT FK_TestViews_Tests

GO



if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestRunViews_Views]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)

ALTER TABLE [TestRunViews] DROP CONSTRAINT FK_TestRunViews_Views

GO



if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestViews_Views]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)

ALTER TABLE [TestViews] DROP CONSTRAINT FK_TestViews_Views

GO



if exists (select * from dbo.sysobjects where id = object_id(N'[Tables]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)

drop table [Tables]

GO



if exists (select * from dbo.sysobjects where id = object_id(N'[TestRunTables]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)

drop table [TestRunTables]

GO



if exists (select * from dbo.sysobjects where id = object_id(N'[TestRunViews]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)

drop table [TestRunViews]

GO



if exists (select * from dbo.sysobjects where id = object_id(N'[TestRuns]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)

drop table [TestRuns]

GO



if exists (select * from dbo.sysobjects where id = object_id(N'[TestTables]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)

drop table [TestTables]

GO



if exists (select * from dbo.sysobjects where id = object_id(N'[TestViews]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)

drop table [TestViews]

GO



if exists (select * from dbo.sysobjects where id = object_id(N'[Tests]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)

drop table [Tests]

GO



if exists (select * from dbo.sysobjects where id = object_id(N'[Views]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)

drop table [Views]

GO



CREATE TABLE [Tables] (

	[TableID] [int] IDENTITY (1, 1) NOT NULL ,

	[Name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 

) ON [PRIMARY]

GO



CREATE TABLE [TestRunTables] (

	[TestRunID] [int] NOT NULL ,

	[TableID] [int] NOT NULL ,

	[StartAt] [datetime] NOT NULL ,

	[EndAt] [datetime] NOT NULL 

) ON [PRIMARY]

GO



CREATE TABLE [TestRunViews] (

	[TestRunID] [int] NOT NULL ,

	[ViewID] [int] NOT NULL ,

	[StartAt] [datetime] NOT NULL ,

	[EndAt] [datetime] NOT NULL 

) ON [PRIMARY]

GO



CREATE TABLE [TestRuns] (

	[TestRunID] [int] IDENTITY (1, 1) NOT NULL ,

	[Description] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,

	[StartAt] [datetime] NULL ,

	[EndAt] [datetime] NULL 

) ON [PRIMARY]

GO



CREATE TABLE [TestTables] (

	[TestID] [int] NOT NULL ,

	[TableID] [int] NOT NULL ,

	[NoOfRows] [int] NOT NULL ,

	[Position] [int] NOT NULL 

) ON [PRIMARY]

GO



CREATE TABLE [TestViews] (

	[TestID] [int] NOT NULL ,

	[ViewID] [int] NOT NULL 

) ON [PRIMARY]

GO



CREATE TABLE [Tests] (

	[TestID] [int] IDENTITY (1, 1) NOT NULL ,

	[Name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 

) ON [PRIMARY]

GO



CREATE TABLE [Views] (

	[ViewID] [int] IDENTITY (1, 1) NOT NULL ,

	[Name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 

) ON [PRIMARY]

GO



ALTER TABLE [Tables] WITH NOCHECK ADD 

	CONSTRAINT [PK_Tables] PRIMARY KEY  CLUSTERED 

	(

		[TableID]

	)  ON [PRIMARY] 

GO



ALTER TABLE [TestRunTables] WITH NOCHECK ADD 

	CONSTRAINT [PK_TestRunTables] PRIMARY KEY  CLUSTERED 

	(

		[TestRunID],

		[TableID]

	)  ON [PRIMARY] 

GO



ALTER TABLE [TestRunViews] WITH NOCHECK ADD 

	CONSTRAINT [PK_TestRunViews] PRIMARY KEY  CLUSTERED 

	(

		[TestRunID],

		[ViewID]

	)  ON [PRIMARY] 

GO



ALTER TABLE [TestRuns] WITH NOCHECK ADD 

	CONSTRAINT [PK_TestRuns] PRIMARY KEY  CLUSTERED 

	(

		[TestRunID]

	)  ON [PRIMARY] 

GO



ALTER TABLE [TestTables] WITH NOCHECK ADD 

	CONSTRAINT [PK_TestTables] PRIMARY KEY  CLUSTERED 

	(

		[TestID],

		[TableID]

	)  ON [PRIMARY] 

GO



ALTER TABLE [TestViews] WITH NOCHECK ADD 

	CONSTRAINT [PK_TestViews] PRIMARY KEY  CLUSTERED 

	(

		[TestID],

		[ViewID]

	)  ON [PRIMARY] 

GO



ALTER TABLE [Tests] WITH NOCHECK ADD 

	CONSTRAINT [PK_Tests] PRIMARY KEY  CLUSTERED 

	(

		[TestID]

	)  ON [PRIMARY] 

GO



ALTER TABLE [Views] WITH NOCHECK ADD 

	CONSTRAINT [PK_Views] PRIMARY KEY  CLUSTERED 

	(

		[ViewID]

	)  ON [PRIMARY] 

GO



ALTER TABLE [TestRunTables] ADD 

	CONSTRAINT [FK_TestRunTables_Tables] FOREIGN KEY 

	(

		[TableID]

	) REFERENCES [Tables] (

		[TableID]

	) ON DELETE CASCADE  ON UPDATE CASCADE ,

	CONSTRAINT [FK_TestRunTables_TestRuns] FOREIGN KEY 

	(

		[TestRunID]

	) REFERENCES [TestRuns] (

		[TestRunID]

	) ON DELETE CASCADE  ON UPDATE CASCADE 

GO



ALTER TABLE [TestRunViews] ADD 

	CONSTRAINT [FK_TestRunViews_TestRuns] FOREIGN KEY 

	(

		[TestRunID]

	) REFERENCES [TestRuns] (

		[TestRunID]

	) ON DELETE CASCADE  ON UPDATE CASCADE ,

	CONSTRAINT [FK_TestRunViews_Views] FOREIGN KEY 

	(

		[ViewID]

	) REFERENCES [Views] (

		[ViewID]

	) ON DELETE CASCADE  ON UPDATE CASCADE 

GO



ALTER TABLE [TestTables] ADD 

	CONSTRAINT [FK_TestTables_Tables] FOREIGN KEY 

	(

		[TableID]

	) REFERENCES [Tables] (

		[TableID]

	) ON DELETE CASCADE  ON UPDATE CASCADE ,

	CONSTRAINT [FK_TestTables_Tests] FOREIGN KEY 

	(

		[TestID]

	) REFERENCES [Tests] (

		[TestID]

	) ON DELETE CASCADE  ON UPDATE CASCADE 

GO



ALTER TABLE [TestViews] ADD 

	CONSTRAINT [FK_TestViews_Tests] FOREIGN KEY 

	(

		[TestID]

	) REFERENCES [Tests] (

		[TestID]

	),

	CONSTRAINT [FK_TestViews_Views] FOREIGN KEY 

	(

		[ViewID]

	) REFERENCES [Views] (

		[ViewID]

	)

GO


CREATE VIEW SelectAllPantheons AS
SELECT *
FROM Pantheon

GO

CREATE VIEW PantheonsByNumberOfDeities AS
SELECT P.PantheonName, COUNT(P.PantheonId) AS Deity_Number
FROM Pantheon P, Deity D
WHERE P.PantheonId = D.PantheonId
GROUP BY P.PantheonName

GO
CREATE VIEW  DeitiesAndSymbols AS
SELECT D.DeityName, S.SymbolName
FROM Deity D
INNER JOIN Deity_Symbol DS ON D.DeityId = DS.DeityId
INNER JOIN Symbol S ON DS.SymbolId = S.SymbolId

GO

INSERT INTO Views VALUES
('SelectAllPantheons'),
('PantheonsByNumberOfDeities'),
('ZeusKidsInTroy'),
('DeitiesAndSymbols')

SELECT * FROM Tests

INSERT INTO Tests VALUES
('TestPan'),
('TestPanDeity'),
('TestDeitySymbol')

INSERT INTO Tables VALUES
('Deity'),
('Pantheon'),
('DeityStory'),
('Symbol'),
('Deity_Symbol')

INSERT INTO TestTables VALUES
(1, 2, 50, 1),
(2, 2, 10, 2),
(2, 1, 40, 1),
(3, 5, 100, 1),
(3, 4, 20, 2),
(3, 1, 40, 3),
(3, 2, 10, 4)

DELETE FROM TestTables


INSERT INTO TestViews VALUES
(1, 1),
(2, 2),
(2, 1),
(3, 4),
(3, 2)

SELECT * FROM Tables
SELECT * FROM TestTables
SELECT * FROM Tests

GO

CREATE OR ALTER PROC uspDELETEALL @TableName VARCHAR(50)
AS
	DECLARE @DelSt NVARCHAR(500)
	SET @DelSt = 'DELETE FROM ' + @TableName
	--PRINT @DelSt
	EXEC sp_executesql @DelSt
GO


CREATE OR ALTER PROC uspINSERTGENERIC @TableName VARCHAR(50), @RowCount INT
AS
	DECLARE @CurrentRow INT
	SET @CurrentRow = 0

	DECLARE @TableId INT
	SET @TableId = (SELECT object_id AS TABLE_ID
					FROM sys.objects 
					WHERE name = @TableName )

	WHILE @CurrentRow<@RowCount
	BEGIN
		
		BEGIN TRY

		DECLARE @MaxColCount INT, @CurrCol INT
		SET @CurrCol = 0
		SET @MaxColCount = (SELECT MAX(column_id) 
							FROM sys.columns
							WHERE object_id = @TableId)

		DECLARE @InsSt NVARCHAR(500)
		SET @InsSt = 'INSERT INTO ' + @TableName + ' VALUES('
		--PRINT @MaxColCount
		WHILE @CurrCol<@MaxColCount
		BEGIN

			IF @CurrCol > 0 
			BEGIN
				SET @InsSt = @InsSt + ','
			END

			DECLARE @ColType INT
			SET @ColType = (SELECT system_type_id
							FROM sys.columns
							WHERE object_id = @TableId AND column_id = @CurrCol+1)
			IF @ColType = 56
			BEGIN
				
				DECLARE @Value INT, @CanNull INT
				SET @CanNull = (SELECT is_nullable
								FROM sys.columns
								WHERE object_id = @TableId AND column_id = @CurrCol+1)
				--PRINT @CanNull
				IF @CanNull = 1
				BEGIN
					DECLARE @CHANCE REAL
					SET @CHANCE = RAND()
					IF @CHANCE > 0.9
					BEGIN
						SET @InsSt = @InsSt + 'null'
					END
					ELSE
					BEGIN
						SET @Value = (SELECT FLOOR(RAND()*(100+1)))
						SET @InsSt = @InsSt + CAST(@Value AS VARCHAR(50))
					END
					
				END
				ELSE
				BEGIN
					SET @Value = (SELECT FLOOR(RAND()*(100+1)))
					SET @InsSt = @InsSt + CAST(@Value AS VARCHAR(50))
				END
			END
			IF @ColType = 167
			BEGIN
				DECLARE @StrValue VARCHAR(50)
				SET @StrValue =  '''' + (SELECT CHAR(CAST(RAND()*26 AS INT)+97)) + ''''
				SET @InsSt = @InsSt + @StrValue
			END


			SET @CurrCol = @CurrCol+1

		END

		SET @InsSt = @InsSt + ')'
		PRINT @InsSt
		EXEC sp_executesql @InsSt

		SET @CurrentRow = @CurrentRow+1

		END TRY

		BEGIN CATCH

		END CATCH
	END

GO

CREATE OR ALTER PROC uspTestRun @TestName VARCHAR(50)
AS

	INSERT INTO TestRuns VALUES
	(null, null, null)
	DECLARE @TestId INT, @TestRunId INT
	SET @TestId = (SELECT Tests.TestID
					FROM Tests
					WHERE Tests.Name = @TestName)
	SET @TestRunId = (SELECT MAX(TestRuns.TestRunID)
					FROM TestRuns)
	
	DECLARE @StartTimeTotal DATETIME, @EndTimeTotal DATETIME

	DECLARE @CurrPos INT, @MaxPos INT
	SET @CurrPos = 0
	SET @MaxPos = (SELECT MAX(TestTables.Position)
					FROM TestTables
					WHERE TestTables.TestID = @TestId)

	SET @StartTimeTotal = GETDATE()

	DECLARE @Description VARCHAR(2000)
	
	--PRINT @CurrPos
	--PRINT @MaxPos

	SET @Description = 'Testing these features: '

	WHILE @CurrPos < @MaxPos
	BEGIN
			DECLARE @TableId INT, @TableNameLook VARCHAR(50)
			SET @TableId = (SELECT MAX(TestTables.TableID)
							FROM TestTables
							WHERE TestTables.Position = @CurrPos+1 AND TestTables.TestID = @TestId)
			--PRINT 'TableId is'+ CAST(@TableId AS VARCHAR(50))
			--PRINT 'CurrPos is' + CAST(@CurrPos AS VARCHAR(50))
			--PRINT 'MaxPos is' + CAST(@MaxPos AS VARCHAR(50))

			SET @TableNameLook = (SELECT Tables.Name
								  FROM Tables
								  WHERE Tables.TableID = @TableId)

			--PRINT @TableNameLook
			SET @Description = @Description + ' DELETE FROM ' + @TableNameLook
			PRINT @Description
			EXEC uspDELETEALL @TableName = @TableNameLook

			SET @CurrPos = @CurrPos+1
	END

	PRINT @Description

	WHILE @CurrPos > 0
		BEGIN

			DECLARE @TableId2 INT, @RowCount2 INT, @TableNameLook2 VARCHAR(50), @StartTimeInsert DATETIME, @EndTimeInsert DATETIME
			SET @TableId2 = (SELECT MAX(TestTables.TableID)
							FROM TestTables
							WHERE TestTables.Position = @CurrPos  AND TestTables.TestID = @TestId)
			SET @RowCount2 = (SELECT MAX(TestTables.NoOfRows)
							FROM TestTables
							WHERE TestTables.Position = @CurrPos  AND TestTables.TestID = @TestId)
			SET @TableNameLook2 = (SELECT Tables.Name
								  FROM Tables
								  WHERE Tables.TableID = @TableId2)

			--PRINT 'TestIs is' + CAST(@TestId AS VARCHAR(50))
			--PRINT 'INSERT CurrPos is' + CAST(@CurrPos AS VARCHAR(50))
			--PRINT 'TableId is'+ CAST(@TableId AS VARCHAR(50))
			SET @Description = @Description + ' INSERT INTO ' + @TableNameLook2 + ' '+  CAST(@RowCount2 AS VARCHAR(50))+ ' ROWS '
			
			SET @StartTimeInsert = GETDATE()
			EXEC uspINSERTGENERIC @TableName = @TableNameLook2, @RowCount = @RowCount2
			SET @EndTimeInsert = GETDATE()

			SET @CurrPos = @CurrPos-1
			INSERT INTO TestRunTables VALUES
			(@TestRunId, @TableId2, @StartTimeInsert, @EndTimeInsert)
	END

	DECLARE @CurrView INT
	SET @CurrView = (SELECT MAX(TestViews.ViewID)
					FROM TestViews
					WHERE TestViews.TestID = @TestId)
	
	PRInt @Description

	WHILE @CurrView > 0
	BEGIN
		IF @CurrView IN (SELECT TestViews.ViewID
						FROM TestViews
						WHERE TestViews.TestID = @TestId)
		BEGIN 
			DECLARE @StartTimeView DATETIME, @EndTimeView DATETIME, @ViewName VARCHAR(50)
			SET @ViewName = (SELECT Views.Name
							FROM Views
							WHERE Views.ViewID = @CurrView)

			DECLARE @RunView NVARCHAR(50)
			SET @RunView = ' SELECT * FROM ' + @ViewName
			SET @Description = @Description + @RunView
			SET @StartTimeView = GETDATE()
			EXEC sp_executesql @RunView
			SET @EndTimeView = GETDATE()
			INSERT INTO TestRunViews VALUES
			(@TestRunId, @CurrView, @StartTimeView, @EndTimeView)
		END

		SET @CurrView = @CurrView-1

	END

	SET @EndTimeTotal = GETDATE()

	UPDATE TestRuns
	SET StartAt = @StartTimeTotal
	WHERE TestRunID = @TestRunId

	UPDATE TestRuns
	SET EndAt = @EndTimeTotal
	WHERE TestRunID = @TestRunId
	PRInt @Description
	UPDATE TestRuns
	SET Description = @Description
	WHERE TestRunID = @TestRunId

	SELECT * FROM TestRunTables
	SELECT * FROM TestRunViews
	SELECT * FROM TestRuns

GO

EXEC uspTestRun @TestName = 'TestPanDeity'
EXEC uspTestRun @TestName = 'TestPan'
EXEC uspTestRun @TestName = 'TestDeitySymbol'