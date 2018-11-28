Use universitatea
Go

ALTER TABLE grupe
	ADD Sef_grupa INT NOT NULL CONSTRAINT def_negative1 DEFAULT(-1), 
		Prof_Indrumator INT NOT NULL CONSTRAINT def_negative2 DEFAULT(-1);


UPDATE grupe
	SET Sef_grupa = -1
WHERE Sef_grupa > -1;

DECLARE @ITERATOR INT = 0, @grupeSize INT = 0;

SELECT @grupeSize = COUNT(grupe.Id_Grupa)
FROM grupe;

WHILE(@ITERATOR < @grupeSize)
BEGIN

	DECLARE @ID_GRUPA INT = 0;
	SELECT TOP(@ITERATOR + 1) @ID_GRUPA = grupe.Id_Grupa
	FROM grupe;

	UPDATE grupe
	SET Sef_grupa = 
		(SELECT TOP(1) final.Id_Student
		FROM (SELECT st_r.Id_Student
			FROM studenti_reusita as st_r
			WHERE st_r.Id_Grupa = @ID_GRUPA 
			GROUP BY st_r.Id_Student, st_r.Id_Grupa
			HAVING st_r.Id_Student NOT IN
				(SELECT g.Sef_grupa
				FROM grupe as g)
			AND AVG(CAST(st_r.Nota as float)) = 
				(SELECT max(tmp.MAXI)
				FROM (SELECT AVG(CAST(stude_r.Nota as float)) as 'MAXI', stude_r.Id_Student
						FROM studenti_reusita as stude_r
						WHERE stude_r.Id_Grupa = @ID_GRUPA
						GROUP BY stude_r.Id_Student) as tmp
				)
			) as final
		)
	WHERE grupe.Sef_grupa < 0 and grupe.Id_Grupa = @ID_GRUPA;


	UPDATE grupe
	SET Prof_Indrumator = 
		(SELECT TOP(1) final.Id_Profesor
		FROM (SELECT st_r.Id_Profesor
			FROM studenti_reusita as st_r
			WHERE st_r.Id_Grupa = @ID_GRUPA 
			GROUP BY st_r.Id_Profesor
			HAVING st_r.Id_Profesor NOT IN
				(SELECT g.Prof_Indrumator
				FROM grupe as g)
			AND COUNT(st_r.Id_Disciplina) = 
				(SELECT max(tmp.MAXI)
				FROM (SELECT COUNT(stude_r.Id_Disciplina) as 'MAXI', stude_r.Id_Profesor
						FROM studenti_reusita as stude_r
						WHERE stude_r.Id_Grupa = @ID_GRUPA
						GROUP BY stude_r.Id_Profesor) as tmp
				)
			) as final
		)
	WHERE grupe.Prof_Indrumator < 0 and grupe.Id_Grupa = @ID_GRUPA;


	SET @ITERATOR = @ITERATOR + 1;

END
