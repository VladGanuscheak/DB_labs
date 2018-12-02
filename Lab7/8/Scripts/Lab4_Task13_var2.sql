Use universitatea
Go

SELECT curr_st.Id_Student, d.Disciplina
FROM studenti as curr_st, discipline as d
WHERE curr_st.Nume_Student = 'Florea' and curr_st.Prenume_Student = 'Ioan'
	and curr_st.Id_Student IN 
		(SELECT st_r.Id_Student
		FROM studenti_reusita as st_r
		WHERE d.Id_Disciplina = st_r.Id_Disciplina)