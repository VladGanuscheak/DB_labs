Use universitatea
Go

-- 24.
SELECT Disciplina, COUNT(DISTINCT pr.Id_Profesor)
FROM (plan_studii.discipline as d INNER JOIN studenti.studenti_reusita as st_r
	ON d.Id_Disciplina = st_r.Id_Disciplina) INNER JOIN cadre_didactice.profesori as pr
	ON pr.Id_Profesor = st_r.Id_Profesor
GROUP BY Disciplina
HAVING COUNT(DISTINCT pr.Id_Profesor) > 1