Use universitatea
Go

INSERT INTO [dbo].[lab8_task1] (Disciplina, Nume_Profesor, Prenume_Profesor)
VALUES ('TIDPP', 'Grecu', 'Vasile');

SELECT *
FROM [dbo].[lab8_task1] as tmp
WHERE tmp.Disciplina LIKE 'TIDPP'