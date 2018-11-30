Use universitatea
Go

-- 20.
SELECT COUNT(Nota) as Successfull
    FROM plan_studii.discipline as d INNER JOIN studenti.studenti_reusita as st_r
    	ON d.Id_Disciplina = st_r.Id_Disciplina
    WHERE d.Disciplina = 'Baze de date' and st_r.Tip_Evaluare = 'Testul 2' and st_r.Nota > 4