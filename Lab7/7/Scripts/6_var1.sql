Use universitatea
Go

-- 6.
SELECT TOP 5 Nume_Student, Prenume_Student
    FROM (studenti.studenti as st INNER JOIN studenti.studenti_reusita as st_r
    	ON st.Id_Student = st_r.Id_Student)
    	INNER JOIN plan_studii.discipline as d
    	ON st_r.Id_Disciplina = d.Id_Disciplina
    WHERE Tip_Evaluare LIKE '%2' and Disciplina = 'Baze de date'
    ORDER BY Nota DESC