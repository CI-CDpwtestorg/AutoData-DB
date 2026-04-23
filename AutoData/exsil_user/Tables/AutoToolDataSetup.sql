CREATE TABLE [exsil_user].[AutoToolDataSetup] (
    [Key]        INT           IDENTITY (1, 1) NOT NULL,
    [Node]       NVARCHAR (50) NOT NULL,
    [ToolNumber] INT           NOT NULL,
    [ToolType]   NVARCHAR (50) NOT NULL,
    [Port]       INT           NOT NULL,
    [OCR]        BIT           NOT NULL,
    [OCRPort]    INT           NOT NULL,
    [OCR_IP]     NVARCHAR (50) NULL,
    CONSTRAINT [PK_AutoToolDataSetup] PRIMARY KEY CLUSTERED ([Key] ASC) WITH (FILLFACTOR = 90)
);

