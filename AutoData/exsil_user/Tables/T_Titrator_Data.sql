CREATE TABLE [exsil_user].[T_Titrator_Data] (
    [key]        INT             IDENTITY (1, 1) NOT NULL,
    [Date]       DATETIME        NULL,
    [Time]       TEXT            NULL,
    [HF]         DECIMAL (18, 6) NULL,
    [Am1]        DECIMAL (18, 6) NULL,
    [Per1]       DECIMAL (18, 6) NULL,
    [Am2]        DECIMAL (18, 6) NULL,
    [Per2]       DECIMAL (18, 6) NULL,
    [HCL]        DECIMAL (18, 6) NULL,
    [SC1-1_H2O2] DECIMAL (18, 6) NULL,
    [SC1-1_NH3]  DECIMAL (18, 6) NULL,
    [SC1-2_H2O2] DECIMAL (18, 6) NULL,
    [SC1-2_NH3]  DECIMAL (18, 6) NULL,
    CONSTRAINT [PK_T_Titrator_Data] PRIMARY KEY CLUSTERED ([key] ASC) WITH (FILLFACTOR = 90)
);

