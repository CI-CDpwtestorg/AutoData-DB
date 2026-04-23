CREATE TABLE [dbo].[SP1_Data_SP5_DW2] (
    [Id]               INT        IDENTITY (1, 1) NOT NULL,
    [SP1_Data_Entry]   INT        NOT NULL,
    [BinCnt1_DW2]      INT        DEFAULT ((0)) NOT NULL,
    [BinCnt2_DW2]      INT        DEFAULT ((0)) NOT NULL,
    [BinCnt3_DW2]      INT        DEFAULT ((0)) NOT NULL,
    [BinCnt4_DW2]      INT        DEFAULT ((0)) NOT NULL,
    [BinCnt5_DW2]      INT        DEFAULT ((0)) NOT NULL,
    [BinCnt6_DW2]      INT        DEFAULT ((0)) NOT NULL,
    [BinCnt7_DW2]      INT        DEFAULT ((0)) NOT NULL,
    [BinCnt8_DW2]      INT        DEFAULT ((0)) NOT NULL,
    [BinCnt18_DW2]     INT        DEFAULT ((0)) NOT NULL,
    [Peak_DW2]         FLOAT (53) DEFAULT ((0)) NOT NULL,
    [Average_DW2]      FLOAT (53) DEFAULT ((0)) NOT NULL,
    [Median_DW2]       FLOAT (53) DEFAULT ((0)) NOT NULL,
    [StdDeviation_DW2] FLOAT (53) DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_SP1_Data_SP5_DW2_SP1_Data] FOREIGN KEY ([SP1_Data_Entry]) REFERENCES [dbo].[SP1_Data] ([Entry])
);

