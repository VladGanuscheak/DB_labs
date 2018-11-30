Use universitatea
Go

-- 22.
SELECT Nume_Profesor, Prenume_Profesor, COUNT(DISTINCT Id_Disciplina) as 'Nr. de Discipline'
    FROM cadre_didactice.profesori as p INNER JOIN studenti.studenti_reusita as st_r
    	ON p.Id_Profesor = st_r.Id_Profesor
    GROUP BY Nume_Profesor, Prenume_Profesor