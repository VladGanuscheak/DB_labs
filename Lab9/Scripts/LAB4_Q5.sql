Use universitatea
Go

DROP PROCEDURE IF EXISTS LAB4_Q5;

Go

CREATE PROCEDURE LAB4_Q5
	@NAME VARCHAR(50) = NULL
AS
	IF @NAME IS NOT NULL
		BEGIN
		SELECT *
		FROM studenti
		WHERE Nume_Student LIKE @NAME
		END
	ELSE BEGIN
		SELECT *
		FROM studenti
	END;