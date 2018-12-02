Use universitatea
Go

SELECT st.Id_Student, Nume_Student, st.Prenume_Student
FROM (studenti as st INNER JOIN studenti_reusita as st_r
	ON st.Id_Student = st_r.Id_Student) INNER JOIN profesori as pr
	ON st_r.Id_Profesor = pr.Id_Profesor
WHERE pr.Adresa_Postala_Profesor LIKE '%44%'
GROUP BY st.Id_Student, Nume_Student, st.Prenume_Student
HAVING COUNT(DISTINCT pr.Id_Profesor) = 

	(SELECT COUNT(DISTINCT p.Id_Profesor)
	FROM profesori as p
	WHERE p.Adresa_Postala_Profesor LIKE '%44%')