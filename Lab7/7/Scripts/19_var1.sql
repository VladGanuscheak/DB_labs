Use universitatea
Go

-- 19.
SELECT DISTINCT Nume_Profesor, Prenume_Profesor
    FROM cadre_didactice.profesori as pr INNER JOIN studenti.studenti_reusita as st_r
    	ON pr.Id_Profesor = st_r.Id_Profesor
    WHERE st_r.Nota < 5 and st_r.Id_Student IN
    	(SELECT st.Id_Student
    	FROM studenti.studenti as st
    	WHERE st.Nume_Student LIKE 'Cosovanu')