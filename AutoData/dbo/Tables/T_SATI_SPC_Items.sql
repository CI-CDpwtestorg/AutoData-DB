CREATE TABLE [dbo].[T_SATI_SPC_Items] (
    [key]       INT           IDENTITY (1, 1) NOT NULL,
    [ToolKey]   INT           NOT NULL,
    [Item]      VARCHAR (50)  NULL,
    [Note]      VARCHAR (50)  NULL,
    [EventTime] SMALLDATETIME CONSTRAINT [DF_T_SATI_SPC_Items_EventTime] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_T_SATI_SPC_Items] PRIMARY KEY CLUSTERED ([key] ASC)
);

