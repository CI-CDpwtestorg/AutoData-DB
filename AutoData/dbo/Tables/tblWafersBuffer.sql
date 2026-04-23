CREATE TABLE [dbo].[tblWafersBuffer] (
    [MyKey]           INT           IDENTITY (1, 1) NOT NULL,
    [WaferIdx]        INT           NOT NULL,
    [WaferNum]        REAL          NULL,
    [JobIdx]          REAL          NULL,
    [SenderIdx]       REAL          NULL,
    [SenderSlotNbr]   REAL          NULL,
    [ReceiverIdx]     REAL          NULL,
    [ReceiverSlotNbr] REAL          NULL,
    [ReadTime]        SMALLDATETIME NULL,
    [CtrThick]        REAL          NULL,
    [Type]            NVARCHAR (50) NULL,
    [Resistivity]     REAL          NULL,
    [ResGradient]     REAL          NULL,
    [OCRString]       NVARCHAR (50) NULL,
    [Category]        REAL          NULL,
    [RecipeName]      NVARCHAR (50) NULL,
    [MeasurementNum]  REAL          NULL,
    [OperID]          NVARCHAR (50) NULL,
    CONSTRAINT [PK_tblWafersBuffer] PRIMARY KEY CLUSTERED ([MyKey] ASC)
);

