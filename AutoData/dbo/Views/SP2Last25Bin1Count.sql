CREATE VIEW dbo.SP2Last25Bin1Count
AS
SELECT     TOP 25 SessionDate, COUNT(ISNULL(DestinationStationID, '0')) AS [Bin 1]
FROM         dbo.SP1_Data
WHERE     (DestinationStationID = 1) AND (NOT ([ID#] = N'move')) AND (Machine = N'SP2-S0132') AND (NOT ([RUN#] = N'99999')) AND (NOT (Wafer_log = N'99999'))
GROUP BY SessionDate
ORDER BY SessionDate DESC
