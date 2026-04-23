CREATE TABLE [exsil_user].[ADE_Recipe_Cutter] (
    [Key]       INT          IDENTITY (1, 1) NOT NULL,
    [ToolData]  VARCHAR (50) NULL,
    [DB_C_Name] VARCHAR (50) NULL,
    [C1]        INT          NULL,
    [C2]        INT          NULL,
    [Sort]      INT          NULL,
    CONSTRAINT [PK_ADE_Recipe_Cutter] PRIMARY KEY CLUSTERED ([Key] ASC) WITH (FILLFACTOR = 90)
);

