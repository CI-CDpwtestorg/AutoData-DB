CREATE TABLE [exsil_user].[T_Titrator_Setup] (
    [key]    INT  IDENTITY (1, 1) NOT NULL,
    [Port]   INT  NULL,
    [Switch] TEXT NULL,
    CONSTRAINT [PK_T_Titrator_Setup] PRIMARY KEY CLUSTERED ([key] ASC) WITH (FILLFACTOR = 90)
);

