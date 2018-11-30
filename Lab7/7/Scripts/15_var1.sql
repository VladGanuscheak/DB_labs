Use universitatea
Go

-- 15.
SELECT st.Nume_Student, st.Prenume_Student
FROM (studenti.studenti as st INNER JOIN studenti.studenti_reusita as st_r
	ON st.Id_Student = st_r.Id_Student) INNER JOIN cadre_didactice.profesori as pr
	ON pr.Id_Profesor = st_r.Id_Profesor
WHERE st_r.Tip_Evaluare = 'Examen' and DATEPART(YEAR, st_r.Data_Evaluare) = 2018 and pr.Prenume_Profesor LIKE 'Ion'

INTERSECT

SELECT st.Nume_Student, st.Prenume_Student
FROM (studenti.studenti as st INNER JOIN studenti.studenti_reusita as st_r
	ON st.Id_Student = st_r.Id_Student) INNER JOIN cadre_didactice.profesori as pr
	ON pr.Id_Profesor = st_r.Id_Profesor
WHERE st_r.Tip_Evaluare = 'Examen' and DATEPART(YEAR, st_r.Data_Evaluare) = 2018 and pr.Prenume_Profesor LIKE 'Gabriel'