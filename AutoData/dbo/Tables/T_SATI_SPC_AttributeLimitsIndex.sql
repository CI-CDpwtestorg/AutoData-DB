CREATE TABLE [dbo].[T_SATI_SPC_AttributeLimitsIndex] (
    [Key]          INT           IDENTITY (1, 1) NOT NULL,
    [AttributeKey] INT           NULL,
    [LimitKey]     INT           NULL,
    [Note]         VARCHAR (50)  NULL,
    [EventTime]    SMALLDATETIME CONSTRAINT [DF_T_SATI_SPC_AttributeLimitsIndex_EventTime] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_T_SATI_SPC_AttributeLimitsIndex] PRIMARY KEY CLUSTERED ([Key] ASC)
);

