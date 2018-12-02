Use universitatea
Go

SELECT Nume_Student, Prenume_Student, Disciplina
FROM (studenti as st INNER JOIN studenti_reusita as st_r
	ON st.Id_Student = st_r.Id_Student) INNER JOIN discipline as d
	ON d.Id_Disciplina = st_r.Id_Disciplina
WHERE Nota > 8 and Tip_Evaluare = 'Examen'