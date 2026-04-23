CREATE TABLE [dbo].[Archive_CofA_Particle] (
    [SO_Number]  NVARCHAR (15) NOT NULL,
    [SampleSize] INT           NULL,
    [ID#]        NVARCHAR (4)  NULL,
    [Run#]       NVARCHAR (5)  NULL,
    [Wafer_Log]  NVARCHAR (4)  NULL,
    [Recipe]     NVARCHAR (80) NULL,
    [Result]     NVARCHAR (80) NULL,
    [100_BIN]    INT           NULL,
    [120_BIN]    INT           NULL,
    [130_BIN]    INT           NULL,
    [160_BIN]    INT           NULL,
    [200_BIN]    INT           NULL,
    [250_BIN]    INT           NULL,
    [300_BIN]    INT           NULL
);

