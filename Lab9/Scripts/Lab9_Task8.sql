Use universitatea
Go

DROP FUNCTION IF EXISTS STUDENT_STATS;

Go
CREATE FUNCTION STUDENT_STATS(@FULL_NAME VARCHAR(120))
RETURNS TABLE
WITH ENCRYPTION
AS
RETURN (SELECT s.Id_Student, s.Nume_Student + ' ' + s.Prenume_Student AS 'NAME', d.Disciplina, st_r.Nota, st_r.Data_Evaluare
		FROM (studenti_reusita as st_r INNER JOIN studenti as s
			ON st_r.Id_Student = s.Id_Student) INNER JOIN discipline as d
			ON d.Id_Disciplina = st_r.Id_Disciplina
		WHERE s.Nume_Student + ' ' + s.Prenume_Student LIKE @FULL_NAME and Tip_Evaluare LIKE 'Reusita%'
		GROUP BY s.Id_Student, s.Nume_Student, s.Prenume_Student, d.Disciplina, st_r.Nota, st_r.Data_Evaluare);
