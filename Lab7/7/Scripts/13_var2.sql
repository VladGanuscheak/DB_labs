Use universitatea
Go

-- 13.
SELECT curr_st.Id_Student, d.Disciplina
    FROM studenti.studenti as curr_st, plan_studii.discipline as d
    WHERE curr_st.Nume_Student = 'Florea' and curr_st.Prenume_Student = 'Ioan'
    and curr_st.Id_Student IN 
		(SELECT st_r.Id_Student
		FROM studenti.studenti_reusita as st_r
		WHERE d.Id_Disciplina = st_r.Id_Disciplina)