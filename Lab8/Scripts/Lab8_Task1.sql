Use universitatea
Go

DROP VIEW IF EXISTS dbo.lab8_task1

Go

CREATE VIEW lab8_task1 AS
SELECT DISTINCT Disciplina, Nume_Profesor, Prenume_Profesor
    FROM (discipline as d INNER JOIN studenti_reusita as st_r
    	ON d.Id_Disciplina = st_r.Id_Disciplina)
    	INNER JOIN profesori as p
    	ON p.Id_Profesor = st_r.Id_Profesor

GO

SELECT * 
FROM lab8_task1
ORDER BY Nume_Profesor DESC, Prenume_Profesor DESC;