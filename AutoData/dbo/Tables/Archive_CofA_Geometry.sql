CREATE TABLE [dbo].[Archive_CofA_Geometry] (
    [SO_Number]           NVARCHAR (15) NOT NULL,
    [SampleSize]          INT           NULL,
    [WL_Lot]              NVARCHAR (50) NULL,
    [Run_SourceCarrierID] NVARCHAR (50) NULL,
    [Loc_EquipmentID]     NVARCHAR (50) NULL,
    [Class]               NVARCHAR (30) NULL,
    [CntThk]              REAL          NULL,
    [AvgThk]              REAL          NULL,
    [TTV]                 REAL          NULL,
    [TIR]                 REAL          NULL,
    [Stir_MinThk]         REAL          NULL,
    [Res]                 REAL          NULL,
    [ResGradient]         REAL          NULL,
    [Bow]                 REAL          NULL,
    [Warp]                REAL          NULL,
    [Receiver]            INT           NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_DefaultView', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Filter', @value = NULL, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderBy', @value = NULL, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderByOn', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Orientation', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TableMaxRecords', @value = 10000, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'SO_Number';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'SO_Number';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'SO_Number';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'SampleSize';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'SampleSize';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'SampleSize';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'WL_Lot';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'WL_Lot';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'WL_Lot';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'Run_SourceCarrierID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'Run_SourceCarrierID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'Run_SourceCarrierID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'Loc_EquipmentID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'Loc_EquipmentID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'Loc_EquipmentID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'Class';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'Class';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'Class';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'CntThk';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'CntThk';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'CntThk';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'AvgThk';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'AvgThk';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'AvgThk';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'TTV';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'TTV';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'TTV';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'TIR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'TIR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'TIR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'Stir_MinThk';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'Stir_MinThk';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'Stir_MinThk';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'Res';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'Res';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'Res';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'ResGradient';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'ResGradient';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'ResGradient';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'Bow';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'Bow';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'Bow';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'Warp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'Warp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'Warp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'Receiver';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'Receiver';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Archive_CofA_Geometry', @level2type = N'COLUMN', @level2name = N'Receiver';

