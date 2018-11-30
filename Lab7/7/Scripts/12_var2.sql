Use universitatea
Go

-- 12.
SELECT DISTINCT Nume_Student, Prenume_Student, Disciplina, Tip_Evaluare, Nota, substring(CONVERT(VARCHAR(8), Data_Evaluare), 0, 5) as Anul
    FROM (studenti.studenti as st INNER JOIN studenti.studenti_reusita as st_r
	    ON st.Id_Student = st_r.Id_Student) INNER JOIN plan_studii.discipline as d
		ON st_r.Id_Disciplina = d.Id_Disciplina
    WHERE Prenume_Student = 'Alex'