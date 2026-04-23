CREATE TABLE [dbo].[T_SATI_SPC_Tools] (
    [key]           INT           IDENTITY (1, 1) NOT NULL,
    [DepartmentKey] INT           NOT NULL,
    [Tool]          VARCHAR (50)  NULL,
    [Note]          VARCHAR (50)  NULL,
    [EventTime]     SMALLDATETIME CONSTRAINT [DF_T_SATI_SPC_Tools_EventTime] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_T_SATI_SPC_Tools] PRIMARY KEY CLUSTERED ([key] ASC)
);

