CREATE TABLE [dbo].[Archive_tblWafers] (
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
    [Receiver]        REAL          NULL,
    [JobID]           NVARCHAR (50) NULL,
    CONSTRAINT [PK_Archive_tblWafers] PRIMARY KEY CLUSTERED ([WaferIdx] ASC)
);

