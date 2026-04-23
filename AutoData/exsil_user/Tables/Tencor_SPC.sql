CREATE TABLE [exsil_user].[Tencor_SPC] (
    [MACHINE]      NVARCHAR (50) NULL,
    [ASSET_NUMBER] NVARCHAR (50) NULL,
    [OPERATOR]     NVARCHAR (50) NULL,
    [MASTER_SET]   REAL          NULL,
    [160_MEAN]     REAL          NULL,
    [160_STD_DEV]  REAL          NULL,
    [200_MEAN]     REAL          NULL,
    [200_STD_DEV]  REAL          NULL,
    [SUM_MEAN]     REAL          NULL,
    [SUM_STD_DEV]  REAL          NULL,
    [OUT_OF_SPC]   TINYINT       NULL,
    [ACTION_TAKEN] NVARCHAR (10) NULL,
    [ENTRY]        INT           IDENTITY (1, 1) NOT NULL,
    [DATE]         VARCHAR (20)  CONSTRAINT [DF_Tencor_SPC_DATE_1] DEFAULT (convert(varchar(20),getdate(),101)) NULL,
    [TIME]         VARCHAR (20)  CONSTRAINT [DF_Tencor_SPC_TIME_1] DEFAULT (convert(varchar(20),right(getdate(),7),101)) NULL,
    [EventTime]    DATETIME      CONSTRAINT [DF_Tencor_SPC_EventTime_1] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_Tencor_SPC_1] PRIMARY KEY CLUSTERED ([ENTRY] ASC) WITH (FILLFACTOR = 90)
);

