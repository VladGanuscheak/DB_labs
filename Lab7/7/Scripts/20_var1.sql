Use universitatea
Go

-- 20.
SELECT COUNT(st_r.Id_Student) as Successfull
    FROM studenti.studenti_reusita as st_r
    WHERE st_r.Nota > 4 and st_r.Nota IS NOT NULL and st_r.Tip_Evaluare = 'Testul 2' and st_r.Data_Evaluare LIKE '%2017%' and st_r.Id_Disciplina IN
    	(SELECT d.Id_Disciplina
    	FROM plan_studii.discipline as d
    	WHERE d.Disciplina = 'Baze de date')