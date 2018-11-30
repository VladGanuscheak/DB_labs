Use universitatea
Go

-- 30.
SELECT COUNT(DISTINCT st_r.Id_Student) as 'Nr. Students', ROUND(AVG(CAST(st_r.Nota as float)) * 100, 0) / 100 as 'AVG'
FROM studenti.studenti_reusita as st_r INNER JOIN plan_studii.discipline as d
	ON st_r.Id_Disciplina = d.Id_Disciplina
WHERE  Tip_Evaluare LIKE 'Reusita%' and (YEAR(st_r.Data_Evaluare) = 2018 or YEAR(st_r.Data_Evaluare) = 2019)