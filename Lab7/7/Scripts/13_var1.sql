Use universitatea
Go

-- 13.
SELECT d.Disciplina
    FROM plan_studii.discipline as d
    WHERE d.Id_Disciplina IN
	    (SELECT st_r.Id_Disciplina
	    FROM studenti.studenti_reusita as st_r
	    WHERE st_r.Id_Student =
		    (SELECT st.Id_Student
		    FROM studenti.studenti as st
		    WHERE st.Nume_Student = 'Florea' and st.Prenume_Student = 'Ioan')
		)