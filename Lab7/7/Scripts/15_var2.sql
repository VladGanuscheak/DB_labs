Use universitatea
Go

-- 15.
SELECT DISTINCT Nume_Student, Prenume_Student
FROM (SELECT st.Id_Student, st.Nume_Student, st.Prenume_Student
	FROM (studenti.studenti as st INNER JOIN studenti.studenti_reusita as st_r
		ON st.Id_Student = st_r.Id_Student) INNER JOIN cadre_didactice.profesori as pr
		ON pr.Id_Profesor = st_r.Id_Profesor
	WHERE pr.Prenume_Profesor LIKE 'Ion'

	INTERSECT

	SELECT st.Id_Student, st.Nume_Student, st.Prenume_Student
	FROM (studenti.studenti as st INNER JOIN studenti.studenti_reusita as st_r
		ON st.Id_Student = st_r.Id_Student) INNER JOIN cadre_didactice.profesori as pr
		ON pr.Id_Profesor = st_r.Id_Profesor
	WHERE pr.Prenume_Profesor LIKE 'Gabriel') AS tmp INNER JOIN studenti.studenti_reusita as reus
	ON tmp.Id_Student = reus.Id_Student
WHERE Tip_Evaluare = 'Examen' and DATEPART(YEAR, Data_Evaluare) = 2018