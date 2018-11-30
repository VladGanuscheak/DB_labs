Use universitatea
Go

-- 10.
SELECT Nume_Student, Prenume_Student
    FROM (studenti.studenti as st INNER JOIN studenti.studenti_reusita as st_r
    	ON st.Id_Student = st_r.Id_Student)
    	INNER JOIN plan_studii.discipline as d
    	ON st_r.Id_Disciplina = d.Id_Disciplina
    	WHERE Disciplina = 'Baze de date' and Nota < 8 and Nota > 4 and Tip_Evaluare = 'Examen'