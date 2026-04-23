CREATE TABLE [dbo].[Sorter_Info] (
    [Sorter_Key]    INT           IDENTITY (1, 1) NOT NULL,
    [ID]            CHAR (4)      NOT NULL,
    [Tool]          NVARCHAR (15) CONSTRAINT [DF_Sorter_Info_Tool] DEFAULT (N'FINAL') NULL,
    [Class]         NVARCHAR (10) CONSTRAINT [DF_Sorter_Info_Class] DEFAULT (N'Accept') NULL,
    [Receivers]     NVARCHAR (10) NULL,
    [Split_Allowed] BIT           CONSTRAINT [DF_Sorter_Info_Split_Allowed] DEFAULT (0) NULL,
    [EffectiveDtd]  SMALLDATETIME NOT NULL,
    [ExpirationDtd] SMALLDATETIME NULL,
    [EventTime]     SMALLDATETIME CONSTRAINT [DF_Sorter_Info_EventTime] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Sorter_Info] PRIMARY KEY CLUSTERED ([Sorter_Key] ASC) WITH (FILLFACTOR = 90)
);

