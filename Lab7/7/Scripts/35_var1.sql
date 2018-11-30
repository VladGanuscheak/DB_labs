Use universitatea
Go

-- 35.
SELECT di.Disciplina, ROUND(tmp.AVG * 100, 0) / 100 as 'Average Note'
FROM (SELECT d.Id_Disciplina, AVG(CAST(st_r.Nota as float)) as 'AVG'
	FROM studenti.studenti_reusita as st_r INNER JOIN plan_studii.discipline as d
		ON st_r.Id_Disciplina = d.Id_Disciplina
	WHERE st_r.Tip_Evaluare LIKE '%Reusita%'
	GROUP BY d.Id_Disciplina) as tmp INNER JOIN plan_studii.discipline as di
	ON tmp.Id_Disciplina = di.Id_Disciplina
WHERE tmp.AVG > 7