Use universitatea
Go

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

DECLARE @tmp CURSOR;

SET @tmp = CURSOR FOR 
	SELECT p.Id_Profesor
	FROM cadre_didactice.profesori as p;

DECLARE @Id_profesor INT;
OPEN @tmp FETCH NEXT 
	FROM @tmp INTO @Id_profesor;

WHILE @@FETCH_STATUS = 0
BEGIN
    DECLARE @adresa_postala VARCHAR(255);
    DECLARE @localitatea VARCHAR(255);
    DECLARE @adresa1 VARCHAR(255);
    DECLARE @adresa2 VARCHAR(255);

    DECLARE @street INT;
    DECLARE @house INT;


    SELECT @adresa_postala = p.Adresa_Postala_Profesor
	FROM cadre_didactice.profesori as p
	WHERE p.Id_Profesor = @Id_profesor;

    SET @street = CHARINDEX('bd.', @adresa_postala);
    if (@street = 0) SET @street = CHARINDEX('str.', @adresa_postala);
    if (@street = 0) SET @street = 255;

    SET @house = PATINDEX('%[0-9]%', @adresa_postala);
    if (@house = 0) SET @house = 255;
    
    SET @localitatea = SUBSTRING(@adresa_postala, 0, @street - 2);
    SET @adresa1 = SUBSTRING(@adresa_postala, @street, IIF (@house - @street - 1 >= 0 , @house - @street - 2, 0));
    SET @adresa2 = SUBSTRING(@adresa_postala, @house, 255 - @house);

    if (@localitatea LIKE '') SET @localitatea = NULL;
    if (@adresa1 LIKE '') SET @adresa1 = NULL;
    if (@adresa2 LIKE '') SET @adresa2 = NULL;

    INSERT INTO profesori_new
    SELECT
        p.Id_Profesor,
        p.Nume_Profesor,
        p.Prenume_Profesor,
        @localitatea AS Localitatea,
        @adresa1 AS Adresa_1,
        @adresa2 AS Adresa_2
    FROM cadre_didactice.profesori as p
    WHERE p.Id_Profesor = @Id_profesor;

    FETCH NEXT FROM @tmp INTO @Id_profesor;
END;
