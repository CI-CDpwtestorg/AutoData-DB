CREATE TABLE [exsil_user].[AutoBathCurrent] (
    [key]           INT             IDENTITY (1, 1) NOT NULL,
    [Station]       VARCHAR (50)    NULL,
    [Tank]          VARCHAR (50)    NULL,
    [Stat]          VARCHAR (50)    NULL,
    [ModTime]       SMALLDATETIME   NULL,
    [Wafers]        DECIMAL (10, 2) NULL,
    [NextSpikeTime] SMALLDATETIME   NULL,
    CONSTRAINT [PK_AutoBathCurrent] PRIMARY KEY CLUSTERED ([key] ASC) WITH (FILLFACTOR = 90)
);

