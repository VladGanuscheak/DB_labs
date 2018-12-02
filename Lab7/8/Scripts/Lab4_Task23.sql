Use universitatea
Go

SELECT Disciplina  --, AVG(CAST(Nota as float)) as 'Nota medie pt. Examen'
FROM (studenti as st INNER JOIN studenti_reusita as st_r
	ON st.Id_Student = st_r.Id_Student) INNER JOIN discipline as d
	ON d.Id_Disciplina = st_r.Id_Disciplina
WHERE Tip_Evaluare = 'Examen'
GROUP BY Disciplina
HAVING AVG(CAST(Nota as float)) > 7
ORDER BY Disciplina DESC