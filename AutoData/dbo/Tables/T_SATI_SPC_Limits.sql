CREATE TABLE [dbo].[T_SATI_SPC_Limits] (
    [Key]       INT           IDENTITY (1, 1) NOT NULL,
    [LimitName] VARCHAR (50)  NULL,
    [USl1]      DECIMAL (18)  NULL,
    [1Sigma]    DECIMAL (18)  NULL,
    [2Sigma]    DECIMAL (18)  NULL,
    [3Sigma]    DECIMAL (18)  NULL,
    [LSL]       DECIMAL (18)  NULL,
    [Note]      VARCHAR (50)  NULL,
    [EventTime] SMALLDATETIME CONSTRAINT [DF_T_SATI_SPC_Limits_EventTime] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_T_SATI_SPC_Limits] PRIMARY KEY CLUSTERED ([Key] ASC)
);

