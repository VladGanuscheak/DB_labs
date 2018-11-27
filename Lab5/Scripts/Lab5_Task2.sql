Use universitatea
Go

DECLARE @NOTA INT = 0, @IND INT = 0, @FOUND INT = 0, @NAME NVARCHAR(20) = '';


WHILE (@FOUND < 10)
BEGIN
	
	SELECT TOP(@IND + 1) @NOTA = st_r.Nota, @NAME = st.Nume_Student + ' ' + st.Prenume_Student
	FROM (studenti as st INNER JOIN studenti_reusita as st_r
		ON st.Id_Student = st_r.Id_Student) INNER JOIN discipline as d
		ON st_r.Id_Disciplina = d.Id_Disciplina
	WHERE D.Disciplina = 'Baze de date' and st_r.Tip_Evaluare LIKE 'Testul 1';

	IF (@NOTA <> 6 and @NOTA <> 8)
	BEGIN
		SELECT @NAME;
		SET @FOUND = @FOUND + 1;
	END; 
	SET @IND = @IND + 1;
END;
