Use universitatea
Go

-- 3.
SELECT DISTINCT Disciplina, Nume_Profesor, Prenume_Profesor
    FROM plan_studii.discipline as dis, cadre_didactice.profesori as prof, studenti.studenti_reusita as st
    WHERE dis.Id_Disciplina = st.Id_Disciplina
          and prof.Id_Profesor = st.Id_Profesor
    ORDER BY prof.Nume_Profesor DESC, prof.Prenume_Profesor DESC