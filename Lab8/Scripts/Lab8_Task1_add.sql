Use universitatea
Go

DROP VIEW IF EXISTS dbo.lab8_task1_add;

Go
CREATE VIEW dbo.lab8_task1_add AS 
SELECT Disciplina
    FROM discipline
    WHERE LEN(Disciplina) > 20
Go
SELECT *
FROM dbo.lab8_task1_add;