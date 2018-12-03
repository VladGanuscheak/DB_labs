--INSERT INTO [dbo].[check_1] (Nume_Student, Prenume_Student)
--VALUES ('Apostol', 'ION')

SELECT *
FROM [dbo].[check_1];

UPDATE [dbo].[check_1]
SET Nume_Student = 'Grigore'
WHERE Prenume_Student = 'Ionut';

SELECT *
FROM [dbo].[check_1];

--DELETE [dbo].[check_1]
--WHERE Nume_Student = 'Grigore';
