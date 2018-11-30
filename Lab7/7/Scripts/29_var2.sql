Use universitatea
Go

-- 29.
SELECT DISTINCT st.Id_Student, st.Nume_Student, st.Prenume_Student
FROM studenti.studenti as st INNER JOIN studenti.studenti_reusita as st_r
	ON st.Id_Student = st_r.Id_Student
WHERE Tip_Evaluare = 'Examen' and st_r.Nota < 
	(SELECT min(stud_r.Nota) as minVal
	FROM studenti.studenti_reusita as stud_r
	WHERE stud_r.Id_Student = 100 and Tip_Evaluare = 'Examen')