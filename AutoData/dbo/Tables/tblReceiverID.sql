CREATE TABLE [dbo].[tblReceiverID] (
    [ReceiverIdx]   INT           IDENTITY (1, 1) NOT NULL,
    [ReceiverLotID] NVARCHAR (50) NULL,
    [PortNbr]       INT           NULL,
    [JobIdx]        INT           NULL,
    [Created]       SMALLDATETIME NULL,
    CONSTRAINT [PK_tblReceiverID] PRIMARY KEY CLUSTERED ([ReceiverIdx] ASC)
);

