Use universitatea
Go

SELECT DISTINCT st.Id_Student, st.Nume_Student, st.Prenume_Student
FROM studenti as st INNER JOIN studenti_reusita as st_r
	ON st.Id_Student = st_r.Id_Student
WHERE Tip_Evaluare = 'Examen' and st_r.Nota < ALL
	(SELECT stud_r.Nota
	FROM studenti_reusita as stud_r
	WHERE stud_r.Id_Student = 100 and Tip_Evaluare = 'Examen')