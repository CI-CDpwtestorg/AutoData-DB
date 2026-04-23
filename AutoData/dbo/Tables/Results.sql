CREATE TABLE [dbo].[Results] (
    [160_MEAN]     REAL          NULL,
    [160_STD_DEV]  REAL          NULL,
    [200_MEAN]     REAL          NULL,
    [200_STD_DEV]  REAL          NULL,
    [ACTION_TAKEN] NVARCHAR (10) NULL,
    [ASSET_NUMBER] NVARCHAR (50) NULL,
    [DATE]         SMALLDATETIME NULL,
    [MACHINE]      NVARCHAR (50) NULL,
    [MASTER_SET]   REAL          NULL,
    [OPERATOR]     NVARCHAR (50) NULL,
    [OUT_OF_SPC]   TINYINT       NULL,
    [SUM_MEAN]     REAL          NULL,
    [SUM_STD_DEV]  REAL          NULL,
    [TIME]         SMALLDATETIME NULL
);

