Use universitatea
Go

DROP FUNCTION IF EXISTS BEST_MARK;
Go

CREATE FUNCTION BEST_MARK(@TOP_QUANTITY INT, @DISCIPLINA VARCHAR(60), @TIP_EVALUARE VARCHAR(60))
RETURNS TABLE
WITH ENCRYPTION
AS
RETURN
	(SELECT TOP(@TOP_QUANTITY) st_r.Id_Student, st.Nume_Student + ' ' + st.Prenume_Student AS 'FIO', st_r.Nota
	FROM (studenti AS st INNER JOIN studenti_reusita AS st_r
		ON st.Id_Student = st_r.Id_Student) INNER JOIN discipline AS d
		ON d.Id_Disciplina = st_R.Id_Disciplina
	WHERE @DISCIPLINA = d.Disciplina AND @TIP_EVALUARE = st_r.Tip_Evaluare
	ORDER BY st_r.Nota DESC, st_r.Id_Student, st.Nume_Student, st.Prenume_Student);