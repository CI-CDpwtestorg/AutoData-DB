CREATE TABLE [dbo].[Archive_CofA_Metals] (
    [SO_Number] NVARCHAR (15) NOT NULL,
    [Ca]        FLOAT (53)    CONSTRAINT [DF_Archive_CofA_Metals_Ca] DEFAULT (0.01) NULL,
    [Mg]        FLOAT (53)    CONSTRAINT [DF_Archive_CofA_Metals_Mg] DEFAULT (0.01) NULL,
    [Ni]        FLOAT (53)    CONSTRAINT [DF_Archive_CofA_Metals_Ni] DEFAULT (0.01) NULL,
    [Zn]        FLOAT (53)    CONSTRAINT [DF_Archive_CofA_Metals_Zn] DEFAULT (0.01) NULL,
    [Al]        FLOAT (53)    CONSTRAINT [DF_Archive_CofA_Metals_Al] DEFAULT (0.01) NULL,
    [Fe]        FLOAT (53)    CONSTRAINT [DF_Archive_CofA_Metals_Fe] DEFAULT (0.01) NULL,
    [Cr]        FLOAT (53)    CONSTRAINT [DF_Archive_CofA_Metals_Cr] DEFAULT (0.01) NULL,
    [Cu]        FLOAT (53)    CONSTRAINT [DF_Archive_CofA_Metals_Cu] DEFAULT (0.01) NULL,
    [Na]        FLOAT (53)    CONSTRAINT [DF_Archive_CofA_Metals_Na] DEFAULT (0.01) NULL,
    [K]         FLOAT (53)    CONSTRAINT [DF_Archive_CofA_Metals_K] DEFAULT (0.01) NULL
);

