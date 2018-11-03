Use universitatea
Go

SELECT DISTINCT Nume_Student, Prenume_Student
FROM (SELECT DISTINCT d.Id_Disciplina, st.Nume_Student, st.Prenume_Student
	 FROM (studenti as st INNER JOIN studenti_reusita as st_r
  		ON st.Id_Student = st_r.Id_Student) INNER JOIN discipline as d
		ON st_r.Id_Disciplina = d.Id_Disciplina
	 WHERE st_r.Nota < 5
	 GROUP BY d.Id_Disciplina, st.Nume_Student, st.Prenume_Student
	 HAVING COUNT(st_r.Nota) > 2) as tmp