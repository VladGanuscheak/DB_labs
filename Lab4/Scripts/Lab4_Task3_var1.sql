Use universitatea
Go

SELECT DISTINCT Disciplina, Nume_Profesor, Prenume_Profesor
FROM discipline as dis, profesori as prof, studenti_reusita as st
WHERE dis.Id_Disciplina = st.Id_Disciplina
     and prof.Id_Profesor = st.Id_Profesor
ORDER BY prof.Nume_Profesor DESC, prof.Prenume_Profesor DESC