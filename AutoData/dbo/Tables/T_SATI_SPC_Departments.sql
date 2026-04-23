CREATE TABLE [dbo].[T_SATI_SPC_Departments] (
    [Key]        INT           IDENTITY (1, 1) NOT NULL,
    [Department] VARCHAR (50)  NULL,
    [Note]       VARCHAR (50)  NULL,
    [DateStamp]  SMALLDATETIME CONSTRAINT [DF_T_SATI_SPC_Departments_DateStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_T_SATI_SPC_Departments] PRIMARY KEY CLUSTERED ([Key] ASC)
);

