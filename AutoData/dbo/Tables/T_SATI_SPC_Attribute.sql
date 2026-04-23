CREATE TABLE [dbo].[T_SATI_SPC_Attribute] (
    [key]        INT           IDENTITY (1, 1) NOT NULL,
    [ItemKey]    INT           NOT NULL,
    [Attribute]  VARCHAR (50)  NULL,
    [SQLDataCan] VARCHAR (50)  NULL,
    [SelectSQL]  VARCHAR (250) NULL,
    [Viewable]   BIT           CONSTRAINT [DF_T_SATI_SPC_Attribute_Viewable] DEFAULT (1) NOT NULL,
    [Note]       VARCHAR (50)  NULL,
    [EventTime]  SMALLDATETIME CONSTRAINT [DF_T_SATI_SPC_Attribute_EventTime] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_T_SATI_SPC_Attribute] PRIMARY KEY CLUSTERED ([key] ASC)
);

