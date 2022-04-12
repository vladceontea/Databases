INSERT INTO Pantheon
VALUES (001, 'Greeak');

UPDATE Pantheon
SET PantheonName = 'Greek'
WHERE PantheonId = 001;

INSERT INTO Pantheon  
VALUES (002,'Egyptian'), (003, 'Norse'), (004, 'Maya'), (005, 'Roman'), (006, 'Chinese'), (007, 'Yoruba');

UPDATE Pantheon
SET PantheonName = 'African'
WHERE PantheonId = 007

DELETE FROM Pantheon
WHERE Pantheon.PantheonId>005 AND Pantheon.PantheonId < 008;

INSERT INTO Deity
VALUES
(105, 'Apollo', 001, null, 101)

INSERT INTO Deity
VALUES
(117, 'Apollo', 001, null, 101)

UPDATE Deity
SET MotherId = 105
WHERE DeityId = 117

DELETE FROM Deity
WHERE Deity.DeityName = 'Apollo'

INSERT INTO Deity
VALUES
(101, 'Zeus', 001, null, null),
(102, 'Hera', 001, null, null),
(103, 'Ares', 001, 102, 101),
(104, 'Athena', 001, null, 101),
(105, 'Artemis',001,  null, 101),
(106, 'Hephaestus',001,  102, 101),
(107, 'Ra', 002, null, null),
(108, 'Geb', 002, null, null),
(109, 'Nut', 002, null, null),
(110, 'Isis', 002 , 109, 108),
(111, 'Chaac', 004, null, null),
(112, 'Odin', 003, null, null),
(113, 'Thor', 003, null, 112),
(114, 'Bellona', 005, null, null),
(115, 'Janus', 005, null, null),
(116, 'Horus', 002, 110, null);


INSERT INTO Region
VALUES
(201, 'Crete', 'Greece'),
(202, 'Epirus', 'Greece'),
(203, 'Attica', 'Greece'),
(204, 'Upper Egypt', 'Egypt'),
(205, 'Lower Egypt', 'Egypt'),
(206, 'Yucatan', 'Mexico'),
(207, 'Latium', 'Italy'),
(208, 'Skane', 'Sweden'),
(209, 'Lombardy', 'Italy'),
(210, 'Austlandet', 'Norway');


INSERT INTO Temple
VALUES
(301, 234, 'BC', 'Destroyed', 'Heraklion', 201),
(302, 600, 'BC', 'Destroyed', 'Corcyra', 202),
(303, 430, 'BC', 'Standing', 'Athens', 203),
(304, 510, 'BC', 'Destroyed', 'Delphi', 203),
(305, 100, 'AD', 'Standing', 'Athens', 202),
(306, 57, 'BC', 'Standing', 'Edfu', 204),
(307, 40, 'BC', 'Standing', 'Kom Ombo', 204),
(308, 10, 'AD', 'Destroyed', 'Dendur', 205),
(309, 1000, 'AD', 'Destroyed', 'Uppsala', 208),
(310, 765, 'AD', 'Destroyed', 'Ose', 210),
(311, 68, 'AD', 'Destroyed', 'Rome', 207);

INSERT INTO Deity_Temple
VALUES
(101, 305),
(102, 302),
(102, 305),
(104, 303),
(105, 302),
(106, 304),
(116, 306),
(116, 307),
(110, 308),
(112, 309),
(112, 310),
(113, 310),
(115, 311);

INSERT INTO Symbol
VALUES
(401, 'Sky', 'Cosmic'),
(402, 'Sun', 'Cosmic'),
(403, 'Forest' , 'Nature'),
(404, 'Lightning', 'Cosmic'),
(405, 'Magic', 'Abstract'),
(406, 'Rain', 'Cosmic'),
(407, 'War', 'Social'),
(408, 'Time', 'Abstract'),
(409, 'Fire', 'Elemental'),
(410, 'Water', 'Elemental'),
(411, 'Family', 'Social'),
(412, 'Protection', 'Abstract'),
(413, 'Earth', 'Elemental');

INSERT INTO Deity_Symbol
VALUES
(101, 401),
(101, 404),
(102, 411),
(102, 412),
(103, 407),
(104, 407),
(104, 412),
(106, 408),
(107, 402),
(107, 413),
(107, 401),
(108, 413),
(109, 401),
(110, 405),
(110, 412),
(111, 406),
(112, 401),
(113, 404),
(114, 407),
(115, 408),
(116, 412),
(116, 401);


INSERT INTO Book
VALUES
(501, 'Alexandru Mitru', 1960, 'AD', 'Romanian', 'Legendele Olimpului'),
(502, 'Edgar Parin', 1967, 'AD', 'English', 'Norse Gods and Giants'),
(503, 'Homer', 750, 'BC', 'Ancient Greek', 'Odyssey'),
(504, 'Virgil', 25, 'BC', 'Latin', 'Aeneid'),
(505, 'Richard Wilkinson', 2003, 'AD', 'English', 'The Complete Gods and Goddesses of Ancient Egypt'),
(506, 'Snorri Sturluson', 1220, 'AD', 'Old Norse', 'Prose Edda');

INSERT INTO Story
VALUES
(601, 'Ragnarok', 'Future', 506),
(602, 'Odin''s Eye', 'Past', 502),
(603, 'The Fishing Trip', 'Present', 506),
(604, 'The Theft of Fire', 'Present', 501),
(605, 'The Name of Athens', 'Past', 501),
(606, 'The Trojan War', 'Past', 503),
(607, 'The Labors of Hercules', 'Past', 501),
(608, 'The Search for Osiris', 'Past', 505),
(609, 'The Creation', 'Past', 505),
(610, 'Horus and Set', 'Future', 505);

INSERT INTO Deity_Story
VALUES
(112, 601),
(113, 601),
(112, 602),
(113, 603),
(101, 604),
(106, 604),
(104, 605),
(101, 606),
(102, 606),
(103, 606),
(104, 606),
(105, 606),
(101, 607),
(102, 607),
(110, 608),
(114, 608),
(116, 610),
(107, 609),
(108, 609),
(109, 609);


SELECT MAX(B.BookDateYear) AS LatestYear
FROM Book B
WHERE B.BookDateEra = 'AD'

SELECT DS.DeityId AS GodsInWarOrPeace
FROM Deity_Story DS
WHERE DS.StoryId = 606
UNION
SELECT DSY.DeityId
FROM Deity_Symbol DSY
WHERE DSY.SymbolId = 407 OR DSY.SymbolId = 412

SELECT B.BookDateYear AS YearBookInGreekOrYearTempleInGreeceBC
FROM Book B
WHERE B.BookLanguage = 'Ancient Greek' AND B.BookDateEra='BC'
UNION
SELECT T.TempleYearDate
FROM Temple T, Region R
WHERE T.RegionId = R.RegionId AND R.ModernCountry = 'Greece' AND T.TempleYearEra='BC'

SELECT D.DeityId AS DeityNoMotherAndTempleInItaly
FROM Deity D
WHERE D.MotherId is null
INTERSECT 
SELECT DT.DeityId
FROM Deity_Temple DT
WHERE DT.TempleId IN (SELECT T.TempleId
					  FROM Temple T
					  WHERE T.RegionId IN (SELECT  R.RegionId
										    FROM Region R
											WHERE R.ModernCountry = 'Italy'))

SELECT D.DeityName AS DeityNotGreekAndSymbolTypeElemental
FROM Deity D
WHERE D.PantheonId != 001
INTERSECT
SELECT D.DeityName
FROM Deity_Symbol DSY, Deity D
WHERE D.DeityId = DSY.DeityId AND DSY.SymbolId IN (SELECT S.SymbolID
												   FROM Symbol S
												   WHERE S.Type = 'Elemental') 


SELECT D.DeityName AS ZeusKidsInTroy
FROM Deity D
WHERE D.FatherId = 101
EXCEPT
SELECT D.DeityName
FROM Deity D
WHERE D.DeityId NOT IN (SELECT DS.DeityId
						FROM Deity_Story DS
						WHERE DS.StoryId = 606)


SELECT D.DeityName AS EgyptianGodsWithProtectionAsSymbol
FROM Deity D
WHERE D.PantheonId = 002
EXCEPT
SELECT D.DeityName
FROM Deity D
WHERE D.DeityId NOT IN (SELECT DS.DeityId
					    FROM Deity_Symbol DS
						WHERE EXISTS (SELECT *
									  FROM Symbol S
									  WHERE DS.SymbolId = S.SymbolId AND S.SymbolName = 'Protection'))


SELECT DISTINCT Deity.DeityName, Temple.TempleLocation, Region.RegionName FROM Deity
FULL JOIN Deity_Temple ON (Deity.DeityId = Deity_Temple.DeityId)
FULL JOIN Temple ON (Deity_Temple.TempleId = Temple.TempleId)
FULL JOIN Region ON (Temple.RegionId = Region.RegionId)

SELECT D.DeityName, S.SymbolName
FROM Deity D
INNER JOIN Deity_Symbol DS ON D.DeityId = DS.DeityId
INNER JOIN Symbol S ON DS.SymbolId = S.SymbolId AND S.Type = 'Cosmic'

SELECT DISTINCT Story.StoryTitle, Deity.DeityName, Temple.TempleLocation FROM Story
LEFT JOIN Deity_Story ON (Story.StoryId = Deity_Story.StoryId)
LEFT JOIN Deity ON (Deity_Story.DeityId = Deity.DeityId)
LEFT JOIN Deity_Temple ON (Deity.DeityId = Deity_Temple.DeityId)
LEFT JOIN Temple ON (Deity_Temple.TempleId = Temple.TempleId)

SELECT *
FROM Story S RIGHT JOIN Book B ON S.BookId = B.BookId

SELECT R.RegionName AS RegionsNoTemple
FROM Region R
WHERE NOT EXISTS (SELECT *
			      FROM Temple T
				  WHERE T.RegionId = R.RegionId)
					

SELECT S.StoryTitle AS StoriesInBooksOlderThanADAverage
FROM (SELECT AVG(B.BookDateYear) AS AverageYearAD
	  FROM Book B
	  WHERE B.BookDateEra= 'AD') AS Books, Story S, Book B
	  WHERE S.BookId = B.BookId AND B.BookDateYear < Books.AverageYearAD


SELECT T.TempleLocation AS TemplesInFirstAlphabeticalRegion_Attica
FROM (SELECT MIN(R.RegionName) AS FirstAlphabeticalRegion
	  FROM Region R) AS Regions, Temple T, Region R
	  WHERE T.RegionId = R.RegionId AND R.RegionName = Regions.FirstAlphabeticalRegion

SELECT TOP 2 P.PantheonName, COUNT(P.PantheonId) AS Deity_Number
FROM Pantheon P, Deity D
WHERE P.PantheonId = D.PantheonId
GROUP BY P.PantheonName
HAVING COUNT(D.DeityId)>1
ORDER BY Deity_Number DESC

SELECT S.Type, COUNT(D.DeityId) AS SymbolTypeRespresentinMoreGodsThanSocial
FROM Symbol S, Deity_Symbol DS, Deity D
WHERE S.SymbolId = DS.SymbolId AND DS.DeityId = D.DeityId
GROUP BY S.Type
HAVING COUNT(D.DeityId) > (SELECT COUNT(D.DeityId) AS SymbolTypeRespresentinMoreGodsThanAverage
						   FROM Symbol S, Deity_Symbol DS, Deity D
						   WHERE S.SymbolId = DS.SymbolId AND DS.DeityId = D.DeityId AND S.Type='Social')

SELECT TOP 3 D.DeityName, COUNT(S.StoryId) AS StoriesIncludingThem
FROM Deity D, Deity_Story DS, Story S
WHERE D.DeityId = DS.DeityId AND DS.StoryId = S.StoryId
GROUP BY D.DeityName
ORDER BY StoriesIncludingThem DESC

SELECT R.ModernCountry, COUNT(DISTINCT R.RegionId) AS ModernCountriesLessTemplesThanGreece
FROM Temple T, Region R
GROUP BY R.ModernCountry
HAVING COUNT (DISTINCT R.RegionId) < (SELECT COUNT(R.RegionId)
									 FROM Region R
									 WHERE R.ModernCountry = 'Greece')

SELECT *
FROM Deity D
WHERE D.DeityName < ALL(SELECT D.DeityName
						FROM Deity D
						WHERE D.PantheonId = 002)

SELECT *
FROM Deity D
WHERE D.DeityName < (SELECT MIN(D.DeityName)
					FROM Deity D
					WHERE D.PantheonId = 002)

SELECT *
FROM Book B
WHERE B. BookDateEra = 'BC' AND B.BookDateYear = ANY(SELECT T.TempleYearDate
												   FROM Temple T
												   WHERE T.TempleYearEra = 'BC')

SELECT *
FROM Book B
WHERE B.BookDateEra = 'BC' AND B.BookDateYear IN(SELECT T.TempleYearDate
												   FROM Temple T
												   WHERE T.TempleYearEra = 'BC')

SELECT *
FROM Temple T
WHERE T.TempleLocation > ALL(SELECT T.TempleLocation
							 FROM Temple T
							 WHERE T.Status = 'Standing')

SELECT *
FROM Temple T
WHERE T.TempleLocation > (SELECT MAX(T.TempleLocation)
						  FROM Temple T
						  WHERE T.Status = 'Standing')

SELECT *
FROM Story S
WHERE S.StoryStatus = 'Past' AND S.BookId != ANY(SELECT B.BookId
												 FROM Book B
												 WHERE B.BookLanguage = 'Ancient Greek')

SELECT *
FROM Story S
WHERE S.StoryStatus = 'Past' AND S.BookId NOT IN(SELECT B.BookId
												 FROM Book B
												 WHERE B.BookLanguage = 'Ancient Greek')


SELECT MAX(B1.BookDateYear)+MAX(B2.BookDateYear) AS DiffBetweenNewestAndOldestBook
FROM Book B1, Book B2
WHERE B1.BookDateEra = 'AD' AND B2.BookDateEra = 'BC'