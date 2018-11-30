Use universitatea
Go

-- 26.
SELECT st.Nume_Student as NUME, st.Prenume_Student as PRENUME, st.Adresa_Postala_Student as ADRESA, 'STUDENT' as WORK
    FROM studenti.studenti as st
    WHERE st.Adresa_Postala_Student LIKE '%31 August%'

    UNION

    SELECT pr.Nume_Profesor as NUME, pr.Prenume_Profesor as PRENUME, pr.Adresa_Postala_Profesor as ADRESA, 'PROFESOR' as WORK
    FROM cadre_didactice.profesori as pr
    WHERE pr.Adresa_Postala_Profesor LIKE '%31 August%'  -- LIKE '%44%'