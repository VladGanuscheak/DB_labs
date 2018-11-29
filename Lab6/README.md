# Tasks

![Task part 1](Task1.png)

![Task part 2](Task2.png)

![Task part 3](Task3.png)

# Solutions

**1.** [Code:](Scripts/Lab6_Task1.sql)
```SQL
Use universitatea
Go

UPDATE profesori
SET Adresa_Postala_Profesor = 'mun. Chisinau'
WHERE Adresa_Postala_Profesor IS NULL
```
![IMG_LAB6_TASK1](Images/Lab6_Task1.png)

**2.** [Code:](Scripts/Lab6_Task2.sql)
```SQL
Use universitatea
Go

ALTER TABLE grupe
	ADD CONSTRAINT unique_field UNIQUE(Cod_Grupa)    
```
![IMG_LAB6_TASK1](Images/Lab6_Task2.png)

**3.** [Code:](Scripts/Lab6_Task3.sql)
```SQL
Use universitatea
Go

ALTER TABLE grupe
	ADD Sef_grupa INT NOT NULL CONSTRAINT def_negative1 DEFAULT(-1), 
		Prof_Indrumator INT NOT NULL CONSTRAINT def_negative2 DEFAULT(-1);


UPDATE grupe
	SET Sef_grupa = -1
WHERE Sef_grupa > -1;

DECLARE @ITERATOR INT = 0, @grupeSize INT = 0;

SELECT @grupeSize = COUNT(grupe.Id_Grupa)
FROM grupe;

WHILE(@ITERATOR < @grupeSize)
BEGIN

	DECLARE @ID_GRUPA INT = 0;
	SELECT TOP(@ITERATOR + 1) @ID_GRUPA = grupe.Id_Grupa
	FROM grupe;

	UPDATE grupe
	SET Sef_grupa = 
		(SELECT TOP(1) final.Id_Student
		FROM (SELECT st_r.Id_Student
			FROM studenti_reusita as st_r
			WHERE st_r.Id_Grupa = @ID_GRUPA 
			GROUP BY st_r.Id_Student, st_r.Id_Grupa
			HAVING st_r.Id_Student NOT IN
				(SELECT g.Sef_grupa
				FROM grupe as g)
			AND AVG(CAST(st_r.Nota as float)) = 
				(SELECT max(tmp.MAXI)
				FROM (SELECT AVG(CAST(stude_r.Nota as float)) as 'MAXI', stude_r.Id_Student
						FROM studenti_reusita as stude_r
						WHERE stude_r.Id_Grupa = @ID_GRUPA
						GROUP BY stude_r.Id_Student) as tmp
				)
			) as final
		)
	WHERE grupe.Sef_grupa < 0 and grupe.Id_Grupa = @ID_GRUPA;


	UPDATE grupe
	SET Prof_Indrumator = 
		(SELECT TOP(1) final.Id_Profesor
		FROM (SELECT st_r.Id_Profesor
			FROM studenti_reusita as st_r
			WHERE st_r.Id_Grupa = @ID_GRUPA 
			GROUP BY st_r.Id_Profesor
			HAVING st_r.Id_Profesor NOT IN
				(SELECT g.Prof_Indrumator
				FROM grupe as g)
			AND COUNT(st_r.Id_Disciplina) = 
				(SELECT max(tmp.MAXI)
				FROM (SELECT COUNT(stude_r.Id_Disciplina) as 'MAXI', stude_r.Id_Profesor
						FROM studenti_reusita as stude_r
						WHERE stude_r.Id_Grupa = @ID_GRUPA
						GROUP BY stude_r.Id_Profesor) as tmp
				)
			) as final
		)
	WHERE grupe.Prof_Indrumator < 0 and grupe.Id_Grupa = @ID_GRUPA;


	SET @ITERATOR = @ITERATOR + 1;

END
```
![IMG_LAB6_TASK3](Images/Lab6_Task3.png)

**4.** [Code:](Scripts/Lab6_Task4.sql)
```SQL
Use universitatea
Go

UPDATE studenti_reusita
SET Nota = Nota + 1
WHERE Nota < 10 and Id_Student IN
	(SELECT g.Sef_grupa
	FROM grupe as g)   
```
![IMG_LAB6_TASK4](Images/Lab6_Task4.png)

**5.** [Code:](Scripts/Lab6_Task5.sql)
```SQL
DROP TABLE IF EXISTS profesori_new;

CREATE TABLE profesori_new
(
    Id_Profesor INT PRIMARY KEY CLUSTERED,
    Nume_Profesor VARCHAR(60) NOT NULL,
    Prenume_Profesor VARCHAR(60) NOT NULL,
    Localitatea VARCHAR(255) DEFAULT 'mun.Chisinau',
    Adresa_1 VARCHAR(255),
    Adresa_2 VARCHAR(255),
);

DECLARE @cursor CURSOR;
DECLARE @id_prof INT;

SET @cursor = CURSOR FOR SELECT Id_Profesor FROM profesori;

OPEN @cursor FETCH NEXT FROM @cursor INTO @id_prof;
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Local Vars
    DECLARE @adresa_postala VARCHAR(255);

    DECLARE @localitatea VARCHAR(255);
    DECLARE @adresa_1 VARCHAR(255);
    DECLARE @adresa_2 VARCHAR(255);

    DECLARE @street_index INT;
    DECLARE @house_nb_index INT;


    SELECT @adresa_postala = Adresa_Postala_Profesor FROM profesori WHERE Id_Profesor = @id_prof;

    SET @street_index = CHARINDEX('bd.', @adresa_postala);
    if (@street_index = 0)
        SET @street_index = CHARINDEX('str.', @adresa_postala);
    if (@street_index = 0)
        SET @street_index = 255;

    SET @house_nb_index = PATINDEX('%[0-9]%', @adresa_postala);
    if (@house_nb_index = 0)
        SET @house_nb_index = 255;
    
    SET @localitatea = SUBSTRING(@adresa_postala, 0, @street_index - 2);
    SET @adresa_1 = SUBSTRING(@adresa_postala, @street_index, @house_nb_index - @street_index);
    SET @adresa_2 = SUBSTRING(@adresa_postala, @house_nb_index, 255 - @house_nb_index);

    -- Remove ', ' at the end, if found. Very confusing, but it works.
    SET @adresa_1 = SUBSTRING(@adresa_1, 0, LEN(@adresa_1))

    -- Transform to null if empty.
    if (@localitatea LIKE '')
        SET @localitatea = NULL;
    if (@adresa_1 LIKE '')
        SET @adresa_1 = NULL;
    if (@adresa_2 LIKE '')
        SET @adresa_2 = NULL;

    INSERT INTO profesori_new
    SELECT
        Id_Profesor,
        Nume_Profesor,
        Prenume_Profesor,
        @localitatea AS Localitatea,
        @adresa_1 AS Adresa_1,
        @adresa_2 AS Adresa_2
    FROM profesori
    WHERE Id_Profesor = @id_prof;

    FETCH NEXT FROM @cursor INTO @id_prof;
END; 
```
![IMG_LAB6_TASK5](Images/Lab6_Task5.png)

**6.** [Code:](Scripts/Lab6_Task6.sql)
```SQL
Use universitatea
Go

DROP TABLE IF EXISTS orarul;

CREATE TABLE orarul (
	Id_Disciplina INT NOT NULL,
	Id_Profesor INT,
	Id_Grupa SMALLINT,
	Zi CHAR(2) DEFAULT('Mo'),
	Ora TIME DEFAULT('08:00'),
	Auditoriu INT DEFAULT('101'),
	Bloc CHAR(1) NOT NULL DEFAULT('B'),
	PRIMARY KEY (Id_Grupa, Zi, Ora, Auditoriu)
);

INSERT INTO orarul (Id_Grupa, Id_Disciplina, Id_Profesor, Ora, Auditoriu)
VALUES  (1, 107, 101, '08:00', 202),
		(1, 108, 101, '11:30', 501),
		(1, 119, 117, '13:00', 501);

		-- 7

	DECLARE @ID_INF171 SMALLINT = -1;

 SELECT @ID_INF171 = g.Id_Grupa
 FROM grupe as g
 WHERE g.Cod_Grupa = 'INF171';
```
![IMG_LAB6_TASK6](Images/Lab6_Task6.png)

**7.** [Code:](Scripts/Lab6_Task7.sql)
```SQL
Use universitatea
Go

 DECLARE @ID_INF171 SMALLINT = -1;

 SELECT @ID_INF171 = g.Id_Grupa
 FROM grupe as g
 WHERE g.Cod_Grupa = 'INF171';


 -- #1 lecture
 DECLARE @ID_BIVOL_ION INT = -1;

 SELECT @ID_BIVOL_ION = p.Id_Profesor
 FROM profesori as p
 WHERE p.Nume_Profesor = 'Bivol' and p.Prenume_Profesor = 'Ion';

 DECLARE @ID_STRUCTURI_DE_DATE_SI_ALGORITMI INT = -1;

 SELECT @ID_STRUCTURI_DE_DATE_SI_ALGORITMI = d.Id_Disciplina
 FROM discipline as d
 WHERE d.Disciplina LIKE 'Structuri%'

 -- #2 lecture
 DECLARE @ID_PROGRAME_APLICATIVE INT = -1;
 
 SELECT @ID_PROGRAME_APLICATIVE = d.Id_Disciplina
 FROM discipline as d
 WHERE d.Disciplina = 'Programe aplicative'
 
 DECLARE @ID_MIRCEA_SORIN INT = -1;
 
 SELECT @ID_MIRCEA_SORIN = p.Id_Profesor
 FROM profesori as p
 WHERE p.Nume_Profesor = 'Mircea' and p.Prenume_Profesor = 'Sorin';

 -- #3 lecture
 DECLARE @ID_BAZE_DE_DATE INT = -1;
 
 SELECT @ID_BAZE_DE_DATE = d.Id_Disciplina
 FROM discipline as d
 WHERE d.Disciplina = 'Baze de date'
 
 DECLARE @ID_MICU_ELENA INT = -1;

 SELECT @ID_MICU_ELENA = p.Id_Profesor
 FROM profesori as p
 WHERE p.Nume_Profesor = 'Micu' and p.Prenume_Profesor = 'Elena';

-- INSERTING VALUES
 INSERT INTO orarul (Id_Grupa, Id_Disciplina, Id_Profesor, Ora)
 VALUES (@ID_INF171, @ID_STRUCTURI_DE_DATE_SI_ALGORITMI, @ID_BIVOL_ION, '08:00'),
		(@ID_INF171, @ID_PROGRAME_APLICATIVE, @ID_MIRCEA_SORIN, '11:30'),
		(@ID_INF171, @ID_BAZE_DE_DATE, @ID_MICU_ELENA, '13:00'); 
```
![IMG_LAB6_TASK7](Images/Lab6_Task7.png)