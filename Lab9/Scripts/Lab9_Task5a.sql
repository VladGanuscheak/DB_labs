Use universitatea
Go

DROP PROCEDURE IF EXISTS TOP_STUDENTS;
Go

CREATE PROCEDURE TOP_STUDENTS
	@TOP_QUANTITY INT = 3,
	@DISCIPLINA VARCHAR(60) = NULL,
	@TIP_EVALUARE VARCHAR(60) = NULL
AS
BEGIN
	BEGIN TRY
	DECLARE @ID_DISCIPLINA INT = (SELECT d.Id_Disciplina
							FROM discipline AS d
							WHERE d.Disciplina = @DISCIPLINA);
	IF @ID_DISCIPLINA IS NULL
		BEGIN
		RAISERROR('NO CORRESPONDING DISCIPLINE!!!',
				11,
				1);
		END
	
	UPDATE studenti_reusita
	SET Nota = IIF (Nota < 10, Nota + 1, Nota)
	WHERE @TIP_EVALUARE = Tip_Evaluare and @ID_DISCIPLINA = Id_Disciplina and Id_Student IN
					(SELECT TOP(@TOP_QUANTITY) st_r.Id_Student
					FROM studenti_reusita AS st_r
					WHERE @ID_DISCIPLINA = st_r.Id_Disciplina AND st_r.Tip_Evaluare = @TIP_EVALUARE
					GROUP BY st_r.Id_Student
					ORDER BY AVG(CAST(st_r.Nota AS FLOAT)) DESC, st_r.Id_Student
					)
	
	SELECT * FROM BEST_MARK(@TOP_QUANTITY, @DISCIPLINA, @TIP_EVALUARE);

	END TRY
	BEGIN CATCH
		SELECT   
        ERROR_NUMBER() AS ErrorNumber  
       ,ERROR_MESSAGE() AS ErrorMessage;
	END CATCH;
END;