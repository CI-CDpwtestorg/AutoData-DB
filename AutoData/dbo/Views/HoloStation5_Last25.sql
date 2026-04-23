CREATE VIEW dbo.HoloStation5_Last25
AS
SELECT     TOP 25 Clock, DestSlot, WaferID, CntThk, Bow, TotWarp, TTV, Dotation, CntRes, LotID, WaferClassName
FROM         dbo.DC_OCR
WHERE     (DestCarrierID = 'Station5')
ORDER BY DCIdx DESC
