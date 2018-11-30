Use universitatea
Go

-- 36.
SELECT *
FROM (SELECT s.Nume_Student as 'NUME', s.Prenume_Student as 'PRENUME', tmp2.ANS as Town, tmp2.N as 'Nr. of Citizens' , 'STUDENT' as WORK
	FROM studenti.studenti as s,
		(SELECT tmp.ANS, (SELECT COUNT(st1.Id_Student)
						FROM studenti.studenti as st1
						WHERE st1.Adresa_Postala_Student LIKE tmp.ANS + '%')
						+
						(SELECT  COUNT(p1.Id_Profesor)
						FROM cadre_didactice.profesori as p1
						WHERE p1.Adresa_Postala_Profesor LIKE tmp.ANS + '%') as N
		FROM (SELECT st.Adresa_Postala_Student as _ADDRESS, SUBSTRING(st.Adresa_Postala_Student, 0, 11) as ANS
			FROM studenti.studenti as st
			GROUP BY st.Adresa_Postala_Student
			HAVING st.Adresa_Postala_Student LIKE SUBSTRING(st.Adresa_Postala_Student, 0, 11) + '%'

			UNION

			SELECT p.Adresa_Postala_Profesor as _ADDRESS, SUBSTRING(p.Adresa_Postala_Profesor, 0, 11) as ANS
			FROM cadre_didactice.profesori as p
			GROUP BY p.Adresa_Postala_Profesor
			HAVING p.Adresa_Postala_Profesor LIKE SUBSTRING(p.Adresa_Postala_Profesor, 0, 11) + '%') as tmp
		GROUP BY tmp.ANS) as tmp2
	WHERE s.Adresa_Postala_Student LIKE tmp2.ANS + '%'

	UNION

	SELECT prof.Nume_Profesor as 'NUME', prof.Prenume_Profesor as 'PRENUME', tmp2.ANS as Town, tmp2.N as 'Nr. of Citizens', 'PROFESOR' as WORK
	FROM cadre_didactice.profesori as prof,
		(SELECT tmp.ANS, (SELECT COUNT(st1.Id_Student)
						FROM studenti.studenti as st1
						WHERE st1.Adresa_Postala_Student LIKE tmp.ANS + '%')
						+
						(SELECT  COUNT(p1.Id_Profesor)
						FROM cadre_didactice.profesori as p1
						WHERE p1.Adresa_Postala_Profesor LIKE tmp.ANS + '%') as N
		FROM (SELECT st.Adresa_Postala_Student as _ADDRESS, SUBSTRING(st.Adresa_Postala_Student, 0, 11) as ANS
			FROM studenti.studenti as st
			GROUP BY st.Adresa_Postala_Student
			HAVING st.Adresa_Postala_Student LIKE SUBSTRING(st.Adresa_Postala_Student, 0, 11) + '%'

			UNION

			SELECT p.Adresa_Postala_Profesor as _ADDRESS, SUBSTRING(p.Adresa_Postala_Profesor, 0, 11) as ANS
			FROM cadre_didactice.profesori as p
			GROUP BY p.Adresa_Postala_Profesor
			HAVING p.Adresa_Postala_Profesor LIKE SUBSTRING(p.Adresa_Postala_Profesor, 0, 11) + '%') as tmp
		GROUP BY tmp.ANS) as tmp2
	WHERE prof.Adresa_Postala_Profesor LIKE tmp2.ANS + '%') as final
ORDER BY final.[Nr. of Citizens] DESC