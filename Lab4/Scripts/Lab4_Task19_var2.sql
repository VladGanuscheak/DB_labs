Use universitatea
Go

SELECT DISTINCT Nume_Profesor, Prenume_Profesor
FROM (profesori as pr INNER JOIN studenti_reusita as st_r
	ON pr.Id_Profesor = st_r.Id_Profesor) INNER JOIN studenti as st
	ON st.Id_Student = st_r.Id_Student
WHERE st.Nume_Student LIKE 'Cosovanu' and st_r.Nota < 5