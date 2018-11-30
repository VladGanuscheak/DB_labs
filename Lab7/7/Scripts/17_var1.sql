Use universitatea
Go

-- 17.
SELECT DISTINCT pr.Nume_Profesor, pr.Prenume_Profesor
    FROM cadre_didactice.profesori as pr
    	CROSS JOIN
    	studenti.studenti as st
    WHERE EXISTS
    	(SELECT st_r.Id_Disciplina
    	FROM studenti.studenti_reusita as st_r
    	WHERE st.Id_Student = 100
    		and pr.Id_Profesor = st_r.Id_Profesor
    		and st.Id_Student = st_r.Id_Student
    	)