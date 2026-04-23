CREATE TABLE [dbo].[AutoData_Index] (
    [Key]     INT          IDENTITY (1, 1) NOT NULL,
    [Tool]    VARCHAR (50) NULL,
    [ToolID]  VARCHAR (50) NULL,
    [TableID] VARCHAR (50) NULL,
    CONSTRAINT [PK_AutoData_Index] PRIMARY KEY CLUSTERED ([Key] ASC) WITH (FILLFACTOR = 90)
);

