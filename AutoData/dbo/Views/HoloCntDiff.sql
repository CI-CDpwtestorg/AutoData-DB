CREATE VIEW dbo.HoloCntDiff
AS
SELECT     TOP 100 PERCENT Clock, LotID, CntThk, MX10x_CntThk, MX20x_CntThk, CntThk - MX10x_CntThk AS Diff10, CntThk - MX20x_CntThk AS Diff20
FROM         dbo.DC_OCR
WHERE     (CntThk IS NOT NULL)
ORDER BY Clock DESC
