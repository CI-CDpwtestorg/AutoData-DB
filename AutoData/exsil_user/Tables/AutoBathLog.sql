CREATE TABLE [exsil_user].[AutoBathLog] (
    [Key]        INT           IDENTITY (1, 1) NOT NULL,
    [TimeStamp]  SMALLDATETIME NULL,
    [Tank]       VARCHAR (50)  NULL,
    [Action]     VARCHAR (50)  NULL,
    [WaferCount] VARCHAR (50)  NULL,
    [EmpID]      VARCHAR (50)  NULL,
    [ECN]        VARCHAR (50)  NULL,
    [DurationHr] INT           NULL
);

