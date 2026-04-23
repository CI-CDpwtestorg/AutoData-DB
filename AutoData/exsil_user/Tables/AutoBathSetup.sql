CREATE TABLE [exsil_user].[AutoBathSetup] (
    [Key]           INT          IDENTITY (1, 1) NOT NULL,
    [Station]       VARCHAR (50) NULL,
    [Tank]          VARCHAR (50) NULL,
    [Name]          VARCHAR (50) NULL,
    [Hours]         INT          NULL,
    [Wafers]        INT          NULL,
    [Spike]         BIT          NULL,
    [SpikeChem]     VARCHAR (50) NULL,
    [SpikeQty]      VARCHAR (50) NULL,
    [SpikeHours]    INT          NULL,
    [SpikeWaferQty] INT          NULL,
    CONSTRAINT [PK_AutoBathSetup] PRIMARY KEY CLUSTERED ([Key] ASC) WITH (FILLFACTOR = 90)
);

