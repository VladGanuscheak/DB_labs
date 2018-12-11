IF EXISTS 
		(SELECT * 
		FROM master.sys.databases 
		WHERE NAME = 'universitatea_lab11')
BEGIN
	DROP DATABASE universitatea_lab11;
END
GO

RESTORE DATABASE universitatea_lab11
FROM DISK = 'C:\Users\MSSQLSERVER\Backup_lab11\exercitiul1.bak'
WITH MOVE 'universitatea' TO 'C:\Users\MSSQLSERVER\Backup_lab11\data.mdf',
MOVE 'universitatea_log' TO 'C:\Users\MSSQLSERVER\Backup_lab11\log.ldf',
NORECOVERY
GO

RESTORE LOG universitatea_lab11
FROM DISK = 'C:\Users\MSSQLSERVER\Backup_lab11\LOG\exercitiul3.bak'
WITH NORECOVERY
GO

RESTORE DATABASE universitatea_lab11
FROM DISK = 'C:\Users\MSSQLSERVER\Backup_lab11\exercitiul2.bak'
WITH 
NORECOVERY
GO