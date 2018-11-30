Use universitatea
Go

-- 23.
SELECT Disciplina  --, AVG(CAST(Nota as float)) as 'Nota medie pt. Examen'
FROM (studenti.studenti as st INNER JOIN studenti.studenti_reusita as st_r
	ON st.Id_Student = st_r.Id_Student) INNER JOIN plan_studii.discipline as d
	ON d.Id_Disciplina = st_r.Id_Disciplina
WHERE Tip_Evaluare = 'Examen'
GROUP BY Disciplina
HAVING AVG(CAST(Nota as float)) > 7
ORDER BY Disciplina DESC