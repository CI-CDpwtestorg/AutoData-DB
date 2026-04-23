CREATE VIEW dbo.HoloStation4_Last25
AS
SELECT     TOP 25 Clock, DestSlot, WaferID, CntThk, Bow, TotWarp, TTV, Dotation, CntRes, LotID, WaferClassName
FROM         dbo.DC_OCR
WHERE     (DestCarrierID = 'Station4')
ORDER BY DCIdx DESC
