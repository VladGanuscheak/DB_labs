Use universitatea
Go

SELECT Id_Student, Nume_Student, Prenume_Student
FROM studenti
WHERE Id_Student IN
	(SELECT st_r.Id_Student
	FROM studenti_reusita as st_r
	WHERE st_r.Data_Evaluare LIKE '%2018%' and st_r.Tip_Evaluare = 'Examen')