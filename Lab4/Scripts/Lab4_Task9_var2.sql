Use universitatea
Go

SELECT DISTINCT Nume_Student, Prenume_Student, Adresa_Postala_Student, Id_Disciplina
FROM studenti as st INNER JOIN studenti_reusita as st_r
ON st.Id_Student = st_r.Id_Student
WHERE Nota > 8 and Data_Evaluare LIKE '2018%'
ORDER BY Nume_Student ASC, Prenume_Student ASC