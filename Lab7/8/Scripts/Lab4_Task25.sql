Use universitatea
Go

SELECT g.Cod_Grupa, COUNT(DISTINCT st_r.Id_Student) as 'Nr. Students'
FROM studenti_reusita as st_r INNER JOIN grupe as g
	ON g.Id_Grupa = st_r.Id_Grupa
GROUP BY g.Cod_Grupa
HAVING COUNT(DISTINCT st_r.Id_Student) > 24
