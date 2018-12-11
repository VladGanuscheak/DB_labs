DROP TRIGGER IF EXISTS [plan_studii].[new_registry]
GO

CREATE TRIGGER new_registry ON plan_studii.orarul
AFTER UPDATE
AS
	DECLARE @AUDITORIU_VECHI INT = 
								(SELECT deleted.Auditoriu
								FROM deleted)
	IF(UPDATE(Auditoriu))
	BEGIN
		SELECT 'The ' + Cod_Grupa + ' has transfered for ' + Disciplina + ' from Auditory #' + CAST(@AUDITORIU_VECHI AS VARCHAR(4)) + ' to #' + CAST(Auditoriu AS VARCHAR(4)) + ' at ' + CAST(Ora AS VARCHAR(5)) 
		FROM inserted
		JOIN grupe ON grupe.Id_Grupa = inserted.Id_Grupa
		JOIN discipline ON  discipline.Id_Disciplina = inserted.Id_Disciplina
	END
GO