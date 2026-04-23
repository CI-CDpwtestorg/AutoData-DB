IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = N'exsil_user')
BEGIN
    EXEC(N'CREATE SCHEMA [exsil_user] AUTHORIZATION [dbo]');
END
GO
