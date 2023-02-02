BACKUP DATABASE [nfldb] 
TO  DISK = N'/var/opt/mssql/data/nfldb-202321-10-41-28.bak' 
WITH NOFORMAT, NOINIT,  NAME = N'nfldb-Full-2023-02-01T15:41:28', 
NOSKIP, REWIND, NOUNLOAD,  STATS = 10

-- To save backup open up terminal, type in 
--C:\> docker cp sqlserver:/var/opt/mssql/data/nfldb-202321-10-41-28.bak 
--C:\Users\shaun\Desktop\nfldb_sql_server.bak 
-- Keep in mind to change file namebased on filename provided.

--Restore Backup--
RESTORE DATABASE nfldb
FROM DISK = N'/var/opt/mssql/data/nfldb-202321-10-41-28.bak'

SELECT * FROM fn_dblog(NULL, NULL);