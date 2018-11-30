Use universitatea
Go

-- 18.
SELECT DISTINCT Nume_Profesor, Prenume_Profesor
    FROM cadre_didactice.profesori as p INNER JOIN studenti.studenti_reusita as st_r
    	ON p.Id_Profesor = st_r.Id_Profesor
    WHERE NOT EXISTS
    	(SELECT st_r1.Id_Profesor
    	FROM studenti.studenti_reusita as st_r1 INNER JOIN plan_studii.discipline as d
    		ON st_r1.Id_Disciplina = d.Id_Disciplina
    	WHERE st_r.Id_Disciplina = st_r1.Id_Disciplina and d.Nr_ore_plan_disciplina >= 60)