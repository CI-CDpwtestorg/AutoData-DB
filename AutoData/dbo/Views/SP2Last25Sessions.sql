CREATE VIEW dbo.SP2Last25Sessions
AS
SELECT     TOP 25 SessionDate, Machine, SPSessionName, [ID#] + N'-' + [RUN#] + N'-' + Wafer_log AS Lot
FROM         dbo.SP1_Data
GROUP BY Machine, SPSessionName, SessionDate, [ID#], [RUN#], Wafer_log, [ID#] + N'-' + [RUN#] + N'-' + Wafer_log
HAVING      (NOT ([ID#] = N'move')) AND (Machine = N'SP2-S0132') AND (NOT ([RUN#] = N'99999')) AND (NOT (Wafer_log = N'99999'))
ORDER BY SessionDate DESC
