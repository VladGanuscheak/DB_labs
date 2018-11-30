Use universitatea
Go

-- 28.
SELECT st.Id_Student, Nume_Student, st.Prenume_Student
FROM (studenti.studenti as st INNER JOIN studenti.studenti_reusita as st_r
	ON st.Id_Student = st_r.Id_Student) INNER JOIN cadre_didactice.profesori as pr
	ON st_r.Id_Profesor = pr.Id_Profesor
WHERE pr.Adresa_Postala_Profesor LIKE '%44%'
GROUP BY st.Id_Student, Nume_Student, st.Prenume_Student
HAVING COUNT(DISTINCT pr.Id_Profesor) = 

	(SELECT COUNT(DISTINCT p.Id_Profesor)
	FROM cadre_didactice.profesori as p
	WHERE p.Adresa_Postala_Profesor LIKE '%44%')