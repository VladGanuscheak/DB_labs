IF EXISTS 
		(SELECT * 
		FROM master.dbo.sysdevices 
		WHERE NAME = 'LOG_BACKUP')

EXEC sp_dropdevice 'Backup_Log' , 'delfile';
GO
EXEC sp_addumpdevice 'DISK', 'LOG_BACKUP', 'C:\Users\MSSQLSERVER\Backup_lab11\LOG\exercitiul3.bak'

GO
BACKUP LOG universitatea TO LOG_BACKUP
GO