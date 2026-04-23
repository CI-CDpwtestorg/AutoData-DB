CREATE TABLE [dbo].[SP11_SPC] (
    [Entry]            INT           IDENTITY (1, 1) NOT NULL,
    [MACHINE]          NVARCHAR (50) NULL,
    [ASSET_NUMBER]     NVARCHAR (32) NULL,
    [TIME]             VARCHAR (7)   CONSTRAINT [DF_SP11_SPC_TIME] DEFAULT (convert(varchar(7),right(getdate(),7),101)) NULL,
    [DATE]             VARCHAR (10)  CONSTRAINT [DF_SP11_SPC_DATE] DEFAULT (convert(varchar(10),getdate(),101)) NULL,
    [OPERATOR]         NVARCHAR (50) NULL,
    [MASTER_SET]       INT           NULL,
    [160_LPD_MEAN]     FLOAT (53)    NULL,
    [160_LPD_STD_DEV]  INT           NULL,
    [160_LPDN_MEAN]    FLOAT (53)    NULL,
    [160_LPDN_STD_DEV] INT           NULL,
    [HAZE_MEAN]        FLOAT (53)    NULL,
    [HAZE_STD_DEV]     FLOAT (53)    NULL,
    [OUT_OF_SPC]       INT           NULL,
    [ACTION_TAKEN]     NVARCHAR (50) NULL,
    [SessionDate]      SMALLDATETIME NULL,
    [EventTime]        SMALLDATETIME CONSTRAINT [DF_SP11_SPC_EventTime] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_SP11_SPC] PRIMARY KEY CLUSTERED ([Entry] ASC) WITH (FILLFACTOR = 90)
);

