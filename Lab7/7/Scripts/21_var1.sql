Use universitatea
Go

-- 21.
SELECT Nume_Student, Prenume_Student, COUNT(Nota) as 'Numarul de note'
    FROM studenti.studenti as st INNER JOIN studenti.studenti_reusita as st_r
    	ON st.Id_Student = st_r.Id_Student
    GROUP BY Nume_Student, Prenume_Student