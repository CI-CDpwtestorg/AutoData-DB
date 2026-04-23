CREATE TABLE [exsil_user].[SurfScan_RejectsByID] (
    [Key]          INT           IDENTITY (1, 1) NOT NULL,
    [ID]           INT           NOT NULL,
    [Recipe_Rev]   VARCHAR (50)  NOT NULL,
    [Tool]         VARCHAR (50)  NOT NULL,
    [SOD]          INT           NULL,
    [Point12]      INT           NULL,
    [Point13]      INT           NULL,
    [Point16]      INT           NULL,
    [Point2]       INT           NULL,
    [Point25]      INT           NULL,
    [Point3]       INT           NULL,
    [Point5]       INT           NULL,
    [OnePoint0]    INT           NULL,
    [AreaCount]    INT           NULL,
    [AreaTotal]    INT           NULL,
    [ScratchCount] INT           NULL,
    [ScratchTotal] INT           NULL,
    [StartDate]    SMALLDATETIME NOT NULL,
    CONSTRAINT [PK_SurfScan_RejectsByID] PRIMARY KEY CLUSTERED ([Key] ASC) WITH (FILLFACTOR = 90)
);

