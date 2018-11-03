Use universitatea
Go

SELECT DISTINCT st.Id_Student, Nume_Student, Prenume_Student
FROM studenti as st INNER JOIN studenti_reusita as st_r
ON st.Id_Student = st_r.Id_Student
WHERE Data_Evaluare LIKE '%2018%' and Tip_Evaluare = 'Examen'