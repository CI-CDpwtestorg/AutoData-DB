










CREATE     FUNCTION dbo.fctn_Sati_SP2CurrentSummary ( @SR as sql_variant  ) -- SR = How Many Session Records

RETURNS TABLE 
--RETURNS @SP2History TABLE 
--		( [ID] nVarChar(4)
--		, WH int
--		, WIP int
--		, Rework int
--		, FGI int)
	
AS
	
	RETURN 	
		SELECT     TOP 25 SessionDate, Machine, SPSessionName, [ID#] + N'-' + [RUN#] + N'-' + Wafer_log AS Lot
FROM         dbo.SP1_Data
GROUP BY Machine, SPSessionName, SessionDate, [ID#], [RUN#], Wafer_log, [ID#] + N'-' + [RUN#] + N'-' + Wafer_log
HAVING      (NOT ([ID#] = N'move')) AND (Machine = N'SP2-S0132') AND (NOT ([RUN#] = N'99999')) AND (NOT (Wafer_log = N'99999'))
ORDER BY SessionDate DESC



