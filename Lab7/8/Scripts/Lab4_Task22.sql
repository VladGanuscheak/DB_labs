Use universitatea
Go

SELECT Nume_Profesor, Prenume_Profesor, COUNT(DISTINCT Id_Disciplina) as 'Nr. de Discipline'
FROM profesori as p INNER JOIN studenti_reusita as st_r
	ON p.Id_Profesor = st_r.Id_Profesor
GROUP BY Nume_Profesor, Prenume_Profesor