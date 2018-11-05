Use universitatea
Go

DECLARE @NOTA INT = 0, @IND INT = 0, @NAME NVARCHAR(20) = '';

DECLARE @tmp NVARCHAR(20) = '!';

BEGIN TRY  
    WHILE (@IND < 10)
	BEGIN
		IF (@tmp = @NAME) 
			BEGIN
			RAISERROR ('Less Rows in the Relation!', -- Message text.  
               11, -- Severity.  
               1 -- State.  
               );  
			END;
		SET @tmp = @NAME;

		SELECT TOP(@IND + 1) @NOTA = st_r.Nota, @NAME = st.Nume_Student + ' ' + st.Prenume_Student
		FROM (studenti as st INNER JOIN studenti_reusita as st_r
			ON st.Id_Student = st_r.Id_Student) INNER JOIN discipline as d
			ON st_r.Id_Disciplina = d.Id_Disciplina
		WHERE D.Disciplina = 'Baze de date' and st_r.Tip_Evaluare LIKE 'Testul 1';
		
		IF (@NOTA <> 6 and @NOTA <> 8)
		BEGIN
			SELECT @NAME;
			SET @IND = @IND + 1;
		END; 

END;  
END TRY  
BEGIN CATCH  
    SELECT   
        ERROR_NUMBER() AS ErrorNumber  
       ,ERROR_MESSAGE() AS ErrorMessage;  
END CATCH 
