Use universitatea
Go

DROP TRIGGER IF EXISTS [studenti].[_CIB171_PROTECTOR_];
Go

CREATE TRIGGER _CIB171_PROTECTOR_ ON studenti.studenti_reusita
AFTER UPDATE, DELETE
AS
	DECLARE @NOTA_VECHE INT;  
		SELECT @NOTA_VECHE = d.Nota
		FROM deleted AS d INNER JOIN grupe AS g
		ON d.Id_Grupa = g.Id_Grupa
		WHERE Cod_Grupa LIKE 'CIB171';
	

	DECLARE @NOTA_NOUA INT;
		SELECT @NOTA_NOUA = i.Nota
		FROM inserted AS i INNER JOIN grupe AS g
		ON i.Id_Grupa = g.Id_Grupa
		WHERE Cod_Grupa LIKE 'CIB171';
	
	DECLARE @DATA_VECHE DATE;
		SELECT @DATA_VECHE = d.Data_Evaluare
		FROM deleted AS d INNER JOIN grupe AS g
		ON d.Id_Grupa = g.Id_Grupa
		WHERE Cod_Grupa LIKE 'CIB171';

	DECLARE @DATA_NOUA DATE; 
		SELECT @DATA_NOUA = i.Data_Evaluare
		FROM inserted AS i INNER JOIN grupe AS g
		ON i.Id_Grupa = g.Id_Grupa
		WHERE Cod_Grupa LIKE 'CIB171';
	

	IF @NOTA_NOUA IS NULL
		BEGIN
		ROLLBACK TRANSACTION;
		RAISERROR('You can NOT delete tupples of CIB171 students!', 16, 1);
		END;
	IF @NOTA_NOUA < @NOTA_VECHE
		BEGIN
		ROLLBACK TRANSACTION;
		RAISERROR('You ONLY can INCREASE CIB171 student''s notes!', 16, 1);
		END;
	IF @DATA_VECHE != @DATA_NOUA
		BEGIN
		ROLLBACK TRANSACTION;
		RAISERROR('You can NOT change DATE of the CIB171''s exams!', 16, 1);
		END;

