Use universitatea
Go

SELECT d.Disciplina, st.Nume_Student, st.Prenume_Student, pr.Id_Profesor, pr.Nume_Profesor, pr.Prenume_Profesor 
FROM discipline as d
	CROSS JOIN 
	studenti as st
	CROSS JOIN 
	profesori as pr
WHERE d.Nr_ore_plan_disciplina < 60 and
	EXISTS
	(SELECT st_r.Id_Student
	 FROM studenti_reusita as st_r
	 WHERE st_r.Id_Disciplina = d.Id_Disciplina and 
		st_r.Id_Student = st.Id_Student and
			st_r.Id_Profesor = pr.Id_Profesor)
ORDER BY pr.Id_Profesor ASC