CREATE TABLE [dbo].[Archive_CofA_Lot] (
    [SO_Number] NVARCHAR (15) NOT NULL,
    [Date]      SMALLDATETIME NULL,
    [Qty]       INT           NULL,
    [PO_Number] NVARCHAR (50) NULL,
    [LOT1]      NVARCHAR (15) NULL,
    [LOT2]      NVARCHAR (15) NULL,
    [LOT3]      NVARCHAR (15) NULL,
    [LOT4]      NVARCHAR (15) NULL,
    [LOT5]      NVARCHAR (15) NULL,
    [LOT6]      NVARCHAR (15) NULL,
    [LOT7]      NVARCHAR (15) NULL,
    [LOT8]      NVARCHAR (15) NULL,
    [LOT9]      NVARCHAR (15) NULL,
    [LOT10]     NVARCHAR (15) NULL,
    CONSTRAINT [PK_Archive_CofA_Lot] PRIMARY KEY CLUSTERED ([SO_Number] ASC) WITH (FILLFACTOR = 90)
);

