Use universitatea
Go

-- 16.
SELECT DISTINCT Disciplina, Nume_Student, Prenume_Student, pr.Id_Profesor, Nume_Profesor, Prenume_Profesor
    FROM ((studenti.studenti as st INNER JOIN studenti.studenti_reusita as st_r
    	ON st.Id_Student = st_r.Id_Student) INNER JOIN plan_studii.discipline as d
    	ON st_r.Id_Disciplina = d.Id_Disciplina) INNER JOIN cadre_didactice.profesori as pr
    	ON st_r.Id_Profesor = pr.Id_Profesor
    WHERE Nr_ore_plan_disciplina < 60
    ORDER BY pr.Id_Profesor ASC