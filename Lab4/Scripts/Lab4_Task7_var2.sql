Use universitatea
Go

SELECT DISTINCT Cod_Grupa
FROM (grupe as g INNER JOIN studenti_reusita as st_r
	ON g.Id_Grupa = st_r.Id_Grupa) INNER JOIN studenti as st
		ON st_r.Id_Student = st.Id_Student
	WHERE Adresa_Postala_Student LIKE '%31 August%'