Use universitatea
Go

SELECT final.Disciplina, final.[Fail %]
FROM (SELECT d.Id_Disciplina, d.Disciplina,
										ROUND((SELECT CAST(COUNT(d1.Id_Disciplina) as float)
				FROM discipline as d1 INNER JOIN studenti_reusita as st_r1
					ON d1.Id_Disciplina = st_r1.Id_Disciplina
				WHERE d.Id_Disciplina = st_r1.Id_Disciplina and st_r1.Nota < 5 and st_r1.Tip_Evaluare LIKE 'Reusita%')  / (SELECT CAST(COUNT(d2.Id_Disciplina) as float)
																				FROM discipline as d2 INNER JOIN studenti_reusita as st_r2
																					ON d2.Id_Disciplina = st_r2.Id_Disciplina
																				WHERE d.Id_Disciplina = st_r2.Id_Disciplina and st_r2.Tip_Evaluare LIKE 'Reusita%') * 10000, 0) / 100 as 'Fail %'
FROM discipline as d INNER JOIN studenti_reusita as st_r
	ON d.Id_Disciplina = st_r.Id_Disciplina
WHERE st_r.Tip_Evaluare LIKE 'Reusita%'
GROUP BY d.Id_Disciplina, d.Disciplina
HAVING 
			(SELECT CAST(COUNT(d1.Id_Disciplina) as float)
			FROM discipline as d1 INNER JOIN studenti_reusita as st_r1
				ON d1.Id_Disciplina = st_r1.Id_Disciplina
			WHERE d.Id_Disciplina = st_r1.Id_Disciplina and st_r1.Nota < 5 and st_r1.Tip_Evaluare LIKE 'Reusita%')  / (SELECT CAST(COUNT(d2.Id_Disciplina) as float)
																			FROM discipline as d2 INNER JOIN studenti_reusita as st_r2
																				ON d2.Id_Disciplina = st_r2.Id_Disciplina
																			WHERE d.Id_Disciplina = st_r2.Id_Disciplina and st_r2.Tip_Evaluare LIKE 'Reusita%') > 0.05) as final
ORDER BY final.[Fail %] DESC