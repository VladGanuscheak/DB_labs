Use universitatea
Go

-- 11.
SELECT DISTINCT Nume_Profesor, Prenume_Profesor
    FROM (cadre_didactice.profesori as p INNER JOIN studenti.studenti_reusita as st_r
    	ON p.Id_Profesor = st_r.Id_Profesor) INNER JOIN plan_studii.discipline as d
    		ON st_r.Id_Disciplina = d.Id_Disciplina
    WHERE Disciplina = 'Baze de date' and Data_Evaluare LIKE '%2018%' and Nota < 5 and Tip_Evaluare LIKE 'Reusita%'