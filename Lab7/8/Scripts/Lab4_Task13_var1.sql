Use universitatea
Go

SELECT d.Disciplina
FROM discipline as d
WHERE d.Id_Disciplina IN
	(SELECT st_r.Id_Disciplina
	FROM studenti_reusita as st_r
	WHERE st_r.Id_Student =
		(SELECT st.Id_Student
		FROM studenti as st
		WHERE st.Nume_Student = 'Florea' and st.Prenume_Student = 'Ioan'))