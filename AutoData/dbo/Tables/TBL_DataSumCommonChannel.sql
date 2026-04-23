CREATE TABLE [dbo].[TBL_DataSumCommonChannel] (
    [index]               INT           IDENTITY (1, 1) NOT NULL,
    [Version]             INT           NULL,
    [InstrumentSN]        NVARCHAR (22) NULL,
    [CreationDate]        DATETIME      NOT NULL,
    [ChannelID]           NVARCHAR (32) NOT NULL,
    [SumAllDefects]       INT           NULL,
    [SystemGain]          FLOAT (53)    NULL,
    [CollectPolarization] INT           NULL,
    [CollectAperture]     INT           NULL,
    CONSTRAINT [PK_TBL_DataSumCommonChannel] PRIMARY KEY CLUSTERED ([index] ASC) WITH (FILLFACTOR = 90)
);

