Use universitatea
Go

-- 37.
SELECT final.Disciplina , ROUND(final.[AVG] * 100, 0) / 100 as 'Nota medie Examen'
FROM (SELECT TOP(1) d.Id_Disciplina, d.Disciplina, AVG(CAST(st_r.Nota as float)) as 'AVG'
	FROM studenti.studenti_reusita as st_r INNER JOIN plan_studii.discipline as d
		ON st_r.Id_Disciplina = d.Id_Disciplina
	WHERE st_r.Tip_Evaluare = 'Examen'
	GROUP BY d.Id_Disciplina, d.Disciplina
	ORDER BY [AVG] DESC) as final