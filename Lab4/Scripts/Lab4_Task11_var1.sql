Use universitatea
Go

SELECT p.Nume_Profesor, p.Prenume_Profesor
FROM profesori as p
WHERE p.Id_Profesor IN
	(SELECT st_r.Id_Profesor
	FROM studenti_reusita as st_r
	WHERE st_r.Tip_Evaluare LIKE 'Reusita%' and st_r.Id_Disciplina IN 
		(SELECT d.Id_Disciplina
		FROM discipline as d
		WHERE d.Disciplina LIKE '%Baze de date%')
and st_r.Nota < 5 and st_r.Data_Evaluare LIKE '2018%')