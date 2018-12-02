Use universitatea
Go

SELECT Disciplina, COUNT(DISTINCT pr.Id_Profesor)
FROM (discipline as d INNER JOIN studenti_reusita as st_r
	ON d.Id_Disciplina = st_r.Id_Disciplina) INNER JOIN profesori as pr
	ON pr.Id_Profesor = st_r.Id_Profesor
GROUP BY Disciplina
HAVING COUNT(DISTINCT pr.Id_Profesor) > 1