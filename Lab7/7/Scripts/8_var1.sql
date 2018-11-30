Use universitatea
Go

-- 8.
SELECT Id_Student, Nume_Student, Prenume_Student
    FROM studenti.studenti
    WHERE Id_Student IN
    	(SELECT st_r.Id_Student
    	FROM studenti.studenti_reusita as st_r
    	WHERE st_r.Data_Evaluare LIKE '%2018%' and st_r.Tip_Evaluare = 'Examen')