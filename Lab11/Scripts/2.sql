IF EXISTS 
		(SELECT * 
		FROM master.dbo.sysdevices 
		WHERE NAME = 'device02')
BEGIN
	EXEC sp_dropdevice 'device02' , 'delfile';
END;

exec sp_addumpdevice 'DISK', 'device02', 'C:\Users\MSSQLSERVER\Backup_lab11\exercitiul2.bak'
Go

Backup database universitatea

TO device02 WITH FORMAT, NAME = N'Universitatea DIFFERENTIAL DB BACKUP'
Go