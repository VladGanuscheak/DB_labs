Use universitatea
Go

SELECT DISTINCT st.Nume_Student, st.Prenume_Student, st.Adresa_Postala_Student, st_r.Id_Disciplina  
FROM studenti as st, studenti_reusita as st_r
WHERE st.Id_Student = st_r.Id_Student and st_r.Nota > 8 and st_r.Data_Evaluare LIKE '2018%'
ORDER BY st.Nume_Student ASC, st.Prenume_Student ASC