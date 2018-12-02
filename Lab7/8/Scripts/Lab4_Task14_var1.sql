Use universitatea
Go

SELECT st.Nume_Student, st.Prenume_Student, d.Disciplina
FROM studenti as st, discipline as d
WHERE st.Id_Student IN 
	(SELECT st_r.Id_Student
	FROM studenti_reusita as st_r
	WHERE st_r.Nota > 8 and st_r.Tip_Evaluare = 'Examen'
		and d.Id_Disciplina = st_r.Id_Disciplina)
