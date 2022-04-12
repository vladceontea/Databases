CREATE TABLE Ta
(aid INT PRIMARY KEY,
a2 INT UNIQUE,
a3 VARCHAR(50))

CREATE TABLE Tb
(bid INT PRIMARY KEY,
b2 INT)

CREATE TABLE Tc
(cid INT PRIMARY KEY,
aid INT REFERENCES Ta(aid),
bid INT REFERENCES Tb(bid))

EXEC uspINSERTGENERIC @TableName = 'Ta', @RowCount = 15

EXEC uspINSERTGENERIC @TableName = 'Tb', @RowCount = 15

EXEC uspINSERTGENERIC @TableName = 'Tc', @RowCount = 15

EXEC uspDELETEALL @TableName = 'Tc'

EXEC uspDELETEALL @TableName = 'Ta'

EXEC uspDELETEALL @TableName = 'Tb'


--clustered index seek
SELECT * FROM Ta
WHERE aid>5

--clustered index scan
SELECT * FROM Ta

--nonclustered index seek
SELECT a2 FROM Ta
WHERE a2 < 90

--key lookup
SELECT * FROM Ta
WHERE a3 = 'b' and a2 = 2

--nonclustered scan (only when the nonclustered index is cerated)
SELECT a2 FROM Ta
WHERE a3 = 'b'


CREATE NONCLUSTERED INDEX [IDX_a2_a3] ON Ta(a2, a3)

DROP INDEX [IDX_a2_a3] ON Ta


INSERT INTO Ta VALUES
(1,2, 'b'),
(2,3, 'b'),
(3,4, 'b'),
(5,5, 'b'),
(6,28, 'b'),
(8,29, 'b'),
(9,20, 'b'),
(10,90, 'b'),
(11,24, 'b'),
(23, 56, 'a')

INSERT INTO Tc VALUES
(1,1,55),
(2, 2, 15),
(3, 3, 3),
(4, 5, 80),
(8, 8, 34)

SELECT * FROM Tb
WHERE b2 = 10

CREATE NONCLUSTERED INDEX Tb_Index
ON Tb(b2)

DROP INDEX Tb_Index ON Tb

SELECT Tb.b2 FROM Tb
INNER JOIN Tc ON Tb.bid=Tc.cid