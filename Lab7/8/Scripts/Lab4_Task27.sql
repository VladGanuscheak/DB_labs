Use universitatea
Go

SELECT DISTINCT st.Id_Student, st.Nume_Student, st.Prenume_Student
FROM (studenti as st INNER JOIN studenti_reusita as stud_r
	ON st.Id_Student = stud_r.Id_Student) INNER JOIN profesori as prof
	ON stud_r.Id_Profesor = prof.Id_Profesor
WHERE prof.Prenume_Profesor = 'Ion'
GROUP BY st.Id_Student,  st.Nume_Student, st.Prenume_Student
HAVING COUNT(DISTINCT stud_r.Id_Disciplina) = 

	(SELECT COUNT(DISTINCT st_r.Id_Disciplina)
	FROM studenti_reusita as st_r INNER JOIN profesori as pr
		ON pr.Id_Profesor = st_r.Id_Profesor
	WHERE pr.Prenume_Profesor = 'Ion'
	GROUP BY pr.Id_Profesor)