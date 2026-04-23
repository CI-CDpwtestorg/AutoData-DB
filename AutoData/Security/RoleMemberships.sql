ALTER ROLE [db_owner] ADD MEMBER [exsil_user];


GO
ALTER ROLE [db_owner] ADD MEMBER [daveadmin];


GO
ALTER ROLE [db_owner] ADD MEMBER [Administrator];


GO
ALTER ROLE [db_accessadmin] ADD MEMBER [daveadmin];


GO
ALTER ROLE [db_securityadmin] ADD MEMBER [daveadmin];


GO
ALTER ROLE [db_ddladmin] ADD MEMBER [exsil_user];


GO
ALTER ROLE [db_ddladmin] ADD MEMBER [daveadmin];


GO
ALTER ROLE [db_backupoperator] ADD MEMBER [daveadmin];


GO
ALTER ROLE [db_datareader] ADD MEMBER [exsil_user];


GO
ALTER ROLE [db_datareader] ADD MEMBER [daveadmin];


GO
ALTER ROLE [db_datareader] ADD MEMBER [Domain Users];


GO
ALTER ROLE [db_datareader] ADD MEMBER [Ted_SQL];


GO
ALTER ROLE [db_datareader] ADD MEMBER [read_only_global];


GO
ALTER ROLE [db_datawriter] ADD MEMBER [exsil_user];


GO
ALTER ROLE [db_datawriter] ADD MEMBER [daveadmin];


GO
ALTER ROLE [db_datawriter] ADD MEMBER [Domain Users];


GO
ALTER ROLE [db_denydatareader] ADD MEMBER [daveadmin];


GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [daveadmin];

