Use universitatea
Go

-- 38.
SELECT final.Disciplina, ROUND(final.AVG * 100, 0) / 100 as 'Average Note'
FROM (SELECT d.Id_Disciplina, d.Disciplina, AVG(CAST(st_r.Nota as float)) as 'AVG'
	FROM plan_studii.discipline as d INNER JOIN studenti.studenti_reusita as st_r
		ON d.Id_Disciplina = st_r.Id_Disciplina
	GROUP BY d.Id_Disciplina, d.Disciplina
	HAVING AVG(CAST(st_r.Nota as float)) >
		(SELECT AVG(CAST(st_r1.Nota as float))
		FROM plan_studii.discipline as di INNER JOIN studenti.studenti_reusita as st_r1
			ON di.Id_Disciplina = st_r1.Id_Disciplina
		WHERE di.Disciplina = 'Baze de date')) as final