Use universitatea
Go

SELECT DISTINCT Nume_Profesor, Prenume_Profesor
FROM (profesori as p INNER JOIN studenti_reusita as st_r
	ON p.Id_Profesor = st_r.Id_Profesor) INNER JOIN discipline as d
		ON st_r.Id_Disciplina = d.Id_Disciplina
WHERE Disciplina = 'Baze de date' and Data_Evaluare LIKE '%2018%' and Nota < 5 and Tip_Evaluare LIKE 'Reusita%'		
