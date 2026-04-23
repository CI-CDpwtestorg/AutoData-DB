CREATE TABLE [exsil_user].[AutoBathRecipe] (
    [key]     INT          IDENTITY (1, 1) NOT NULL,
    [Station] VARCHAR (50) NULL,
    [Recipe]  VARCHAR (50) NULL,
    [Name]    VARCHAR (50) NULL,
    CONSTRAINT [PK_AutoBathRecipe] PRIMARY KEY CLUSTERED ([key] ASC) WITH (FILLFACTOR = 90)
);

