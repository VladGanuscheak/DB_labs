Use universitatea
Go

SELECT DISTINCT tmp.Id_Student
FROM (SELECT DISTINCT st.Id_Student, d.Id_Disciplina
	FROM (studenti as st INNER JOIN studenti_reusita as st_r
		ON st.Id_Student = st_r.Id_Student) INNER JOIN discipline as d
		ON st_r.Id_Disciplina = d.Id_Disciplina
	WHERE st_r.Nota < 5) as tmp
WHERE NOT EXISTS
	(SELECT st_r.Id_Student, d.Id_Disciplina
	FROM studenti_reusita as st_r INNER JOIN discipline as d
		ON st_r.Id_Disciplina = d.Id_Disciplina
	WHERE tmp.Id_Student = st_r.Id_Student and st_r.Nota > 4
	GROUP BY st_r.Id_Student, d.Id_Disciplina
	HAVING COUNT(st_r.Id_Student) = 4)