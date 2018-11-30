Use universitatea
Go

-- 17.
SELECT DISTINCT Nume_Profesor, Prenume_Profesor
    FROM (cadre_didactice.profesori as pr INNER JOIN studenti.studenti_reusita as st_r
    	ON pr.Id_Profesor = st_r.Id_Profesor) INNER JOIN studenti.studenti as st
    	ON st_r.Id_Student = st.Id_Student
    WHERE st.Id_Student = 100