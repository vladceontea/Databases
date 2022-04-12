CREATE TABLE Pantheon
(PantheonId INT PRIMARY KEY,
PantheonName VARCHAR(50))

CREATE TABLE Deity
(DeityId INT PRIMARY KEY,
DeityName VARCHAR(50),
FatherId INT REFERENCES Deity(DeityId),
MotherId INT REFERENCES Deity(DeityId),
PantheonId INT REFERENCES Pantheon(PantheonId) NOT NULL)

CREATE TABLE Symbol
(SymbolId INT PRIMARY KEY,
SymbolName VARCHAR(50),
Type VARCHAR(50))

CREATE TABLE Deity_Symbol
(DeityId INT REFERENCES Deity(DeityId),
SymbolId INT REFERENCES Symbol(SymbolId),
PRIMARY KEY(DeityId, SymbolId))

CREATE TABLE Region
(RegionId INT PRIMARY KEY,
RegionName VARCHAR(50),
ModernCountry VARCHAR(50))

CREATE TABLE Temple
(TempleId INT PRIMARY KEY,
TempleYearDate INT,
TempleYearEra VARCHAR(50),
Status VARCHAR(50),
TempleLocation VARCHAR(50),
RegionId INT REFERENCES Region(RegionId))

CREATE TABLE Deity_Temple
(DeityId INT REFERENCES Deity(DeityId),
TempleId INT REFERENCES Temple(TempleId),
--DedicationDate INT,
PRIMARY KEY (DeityId, TempleId))

CREATE TABLE Book
(BookId INT PRIMARY KEY,
BookAuthor VARCHAR(50),
BookDateYear INT,
BookDateEra VARCHAR(50),
BookLanguage VARCHAR(50))

CREATE TABLE Story
(StoryId INT PRIMARY KEY,
StoryTitle VARCHAR(50),
StoryStatus VARCHAR(50),
BookId INT REFERENCES Book(BookId))


CREATE TABLE Deity_Story
(DeityId INT REFERENCES Deity(DeityId),
StoryId INT REFERENCES Story(StoryId),
PRIMARY KEY(DeityId, StoryId))