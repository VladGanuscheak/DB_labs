Use universitatea
Go

-- 10.
SELECT st.Nume_Student, st.Prenume_Student
    FROM studenti.studenti as st
    WHERE st.Id_Student IN
    	(SELECT st_r.Id_Student
    	FROM studenti.studenti_reusita as st_r
    	WHERE st_r.Nota < 8 and st_r.Nota > 4 and st_r.Tip_Evaluare = 'Examen' and
    		st_r.Id_Disciplina IN
    		(SELECT d.Id_Disciplina
    		FROM plan_studii.discipline as d
    		WHERE d.Disciplina = 'Baze de date'))