use universitatea
Go

SELECT tmp.Id_Student
FROM (SELECT st.Id_Student, d.Id_Disciplina
	FROM (studenti as st INNER JOIN studenti_reusita as st_r
		ON st.Id_Student = st_r.Id_Student) INNER JOIN discipline as d
		ON st_r.Id_Disciplina = d.Id_Disciplina
	WHERE st_r.Nota < 5 and st_r.Tip_Evaluare LIKE 'Reusita%'
	GROUP BY st.Id_Student, d.Id_Disciplina) as tmp
WHERE NOT EXISTS
	(SELECT stud_r.Id_Student
	FROM studenti_reusita as stud_r
	WHERE tmp.Id_Student = stud_r.Id_Student and stud_r.Tip_Evaluare LIKE 'Reusita%' and stud_r.Nota > 4)