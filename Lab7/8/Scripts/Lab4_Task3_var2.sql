Use universitatea
Go

SELECT DISTINCT Disciplina, Nume_Profesor, Prenume_Profesor
FROM (discipline as d INNER JOIN studenti_reusita as st_r
	ON d.Id_Disciplina = st_r.Id_Disciplina)
	INNER JOIN profesori as p
	ON p.Id_Profesor = st_r.Id_Profesor
ORDER BY Nume_Profesor DESC, Prenume_Profesor DESC