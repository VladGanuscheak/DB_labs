DROP TRIGGER IF EXISTS VERY_HARD ON DATABASE;
GO

CREATE TRIGGER VERY_HARD ON DATABASE
FOR ALTER_TABLE
AS SET NOCOUNT ON
	
	DECLARE @CHOSEN_ATTRIBUTE VARCHAR(50)
	SELECT @CHOSEN_ATTRIBUTE = EVENTDATA().value('(/EVENT_INSTANCE/AlterTableActionList/*/Columns/Name)[1]', 'nvarchar(100)');
	
	IF @CHOSEN_ATTRIBUTE = 'Id_Profesor'
		BEGIN
		
		DECLARE @TASK VARCHAR(50)
		SELECT @TASK = EVENTDATA().value('(/EVENT_INSTANCE/TSQLCommand/CommandText)[1]','nvarchar(max)') 
		
		DECLARE @INITIAL_TABLE VARCHAR(20)
		SELECT @INITIAL_TABLE = EVENTDATA().value('(/EVENT_INSTANCE/ObjectName)[1]','nvarchar(max)') 
		
		DECLARE @TASK1 VARCHAR(50);
		SELECT @TASK1 = REPLACE(@CHOSEN_ATTRIBUTE, @INITIAL_TABLE, 'profesori');
		
		DECLARE @TASK2 VARCHAR(50);
		SELECT @TASK2 = REPLACE(@CHOSEN_ATTRIBUTE, @INITIAL_TABLE, 'orarul');
		
		DECLARE @TASK3 VARCHAR(50)
		SELECT @TASK3 = REPLACE(@CHOSEN_ATTRIBUTE, @INITIAL_TABLE, 'studenti_reusita');
	
		EXECUTE (@TASK1)   
		EXECUTE (@TASK2)
		EXECUTE (@TASK3) 
	
		PRINT 'THE DATA HAS BEEN MODIFIED IN ALL THE TABLES!!!' 
		END;