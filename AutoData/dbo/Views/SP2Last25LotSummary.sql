CREATE VIEW dbo.SP2Last25LotSummary
AS
SELECT     TOP 100 PERCENT Sess.SessionDate, Sess.Machine, Sess.SPSessionName, 
                      Sess.Lot, ISNULL(B1.[Bin 1], 0) AS [Bin 1], ISNULL(B2.[Bin 2], '0') AS [Bin 2], 
                      ISNULL(B3.[Bin 3], '0') AS [Bin 3], ISNULL(B1.[Bin 1], 0) + ISNULL(B2.[Bin 2], 0) 
                      + ISNULL(B3.[Bin 3], 0) AS [Bin Total]
FROM         dbo.SP2Last25Sessions AS Sess LEFT OUTER JOIN
                      dbo.SP2Last25Bin3Count AS B3 ON Sess.SessionDate = B3.SessionDate LEFT OUTER JOIN
                      dbo.SP2Last25Bin2Count AS B2 ON Sess.SessionDate = B2.SessionDate LEFT OUTER JOIN
                      dbo.SP2Last25Bin1Count AS B1 ON Sess.SessionDate = B1.SessionDate
ORDER BY Sess.SessionDate DESC
