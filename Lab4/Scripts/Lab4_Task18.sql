Use universitatea
Go

SELECT DISTINCT Nume_Profesor, Prenume_Profesor
FROM profesori as p INNER JOIN studenti_reusita as st_r
	ON p.Id_Profesor = st_r.Id_Profesor
WHERE NOT EXISTS
	(SELECT st_r1.Id_Profesor
	FROM studenti_reusita as st_r1 INNER JOIN discipline as d
		ON st_r1.Id_Disciplina = d.Id_Disciplina
	WHERE st_r.Id_Disciplina = st_r1.Id_Disciplina and d.Nr_ore_plan_disciplina >= 60)