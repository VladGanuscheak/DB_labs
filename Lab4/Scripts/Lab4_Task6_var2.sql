Use universitatea
Go

SELECT TOP 5 Nume_Student, Prenume_Student
FROM studenti as st INNER JOIN studenti_reusita as st_r
	ON st.Id_Student = st_r.Id_Student
WHERE Tip_Evaluare LIKE '%2' and st_r.Id_Disciplina = 
	(SELECT d.Id_Disciplina
	FROM discipline as d 
	WHERE d.Disciplina = 'Baze de date')
ORDER BY Nota DESC