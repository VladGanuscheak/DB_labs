Use universitatea
Go

DROP PROCEDURE IF EXISTS LAB4_Q4;

Go

CREATE PROCEDURE LAB4_Q4 
	@LENGTH INT = 1
AS
	SELECT Disciplina
    FROM discipline
    WHERE LEN(Disciplina) > @LENGTH;