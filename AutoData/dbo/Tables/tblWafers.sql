CREATE TABLE [dbo].[tblWafers] (
    [WaferIdx]        INT           IDENTITY (1, 1) NOT NULL,
    [WaferNum]        REAL          CONSTRAINT [DF_tblWafers_WaferNum] DEFAULT (0) NULL,
    [JobIdx]          REAL          CONSTRAINT [DF_tblWafers_JobIdx] DEFAULT (0) NULL,
    [SenderIdx]       REAL          CONSTRAINT [DF_tblWafers_SenderIdx] DEFAULT (0) NULL,
    [SenderSlotNbr]   REAL          CONSTRAINT [DF_tblWafers_SenderSlotNbr] DEFAULT (0) NULL,
    [ReceiverIdx]     REAL          CONSTRAINT [DF_tblWafers_ReceiverIdx] DEFAULT (0) NULL,
    [ReceiverSlotNbr] REAL          CONSTRAINT [DF_tblWafers_ReceiverSlotNbr] DEFAULT (0) NULL,
    [ReadTime]        SMALLDATETIME NULL,
    [CtrThick]        REAL          CONSTRAINT [DF_tblWafers_CtrThick] DEFAULT (0) NULL,
    [Type]            NVARCHAR (50) NULL,
    [Resistivity]     REAL          CONSTRAINT [DF_tblWafers_Resistivity] DEFAULT ((-999)) NULL,
    [ResGradient]     REAL          CONSTRAINT [DF_tblWafers_ResGradient] DEFAULT ((-999)) NULL,
    [OCRString]       NVARCHAR (50) CONSTRAINT [DF_tblWafers_OCRString] DEFAULT (N'NoOCR') NULL,
    [Category]        REAL          CONSTRAINT [DF_tblWafers_Category] DEFAULT ((-99)) NULL,
    [RecipeName]      NVARCHAR (50) NULL,
    [MeasurementNum]  REAL          CONSTRAINT [DF_tblWafers_MeasurementNum] DEFAULT (0) NULL,
    [OperID]          NVARCHAR (50) NULL,
    [Receiver]        REAL          NULL,
    [JobID]           NVARCHAR (50) NULL,
    CONSTRAINT [PK_tblWafers] PRIMARY KEY CLUSTERED ([WaferIdx] ASC)
);


GO
CREATE TRIGGER [CopyToBuffer] ON [dbo].[tblWafers] 
FOR INSERT, UPDATE
AS

insert into tblWafersBuffer(WaferIdx, WaferNum, JobIdx, SenderIdx, SenderSlotNbr, ReceiverIdx, ReceiverSlotNbr, ReadTime, CtrThick, [Type], Resistivity, ResGradient, OCRString, Category, RecipeName, MeasurementNum, OperID)
select WaferIdx, WaferNum, JobIdx, SenderIdx, SenderSlotNbr, ReceiverIdx, ReceiverSlotNbr, ReadTime, CtrThick, [Type], Resistivity, ResGradient, OCRString, Category, RecipeName, MeasurementNum, OperID from inserted

