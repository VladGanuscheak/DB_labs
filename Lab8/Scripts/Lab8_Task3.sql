Use universitatea
Go

DROP VIEW IF EXISTS dbo.lab8_task1_add;

Go
CREATE VIEW dbo.lab8_task1_add WITH SCHEMABINDING AS 
SELECT Disciplina
    FROM discipline
    WHERE LEN(Disciplina) > 20
	WITH CHECK OPTION
Go
SELECT *
FROM dbo.lab8_task1_add;
Go
ALTER TABLE Disciplina 
	DROP COLUMN discipline;
Go
UPDATE dbo.lab8_task1_add
	SET Disciplina = 'UNKNOWN'
WHERE Disciplina LIKE 'B%';
