IF EXISTS 
		(SELECT * 
		FROM master.dbo.sysdevices 
		WHERE NAME = 'device01')
BEGIN
	EXEC sp_dropdevice 'device01' , 'delfile';
END;

exec sp_addumpdevice 'DISK', 'device01', 'C:\Users\MSSQLSERVER\Backup_lab11\exercitiul1.bak'
Go

Backup database universitatea

to device01 with format, Name = N'Universitatea FULL DB BACKUP'
Go