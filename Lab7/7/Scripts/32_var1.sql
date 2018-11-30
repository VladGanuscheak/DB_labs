Use universitatea
Go

-- 32.
SELECT g.Cod_Grupa, st.Nume_Student, st.Prenume_Student, ROUND(AVG(CAST(st_r.Nota as float)) * 100, 0) / 100 as 'Final Note'
FROM (studenti.studenti as st INNER JOIN studenti.studenti_reusita as st_r
	ON st.Id_Student = st_r.Id_Student) INNER JOIN grupe as g
	ON st_r.Id_Grupa = g.Id_Grupa
WHERE Tip_Evaluare LIKE 'Reusita%'
GROUP BY g.Cod_Grupa, st.Nume_Student, st.Prenume_Student