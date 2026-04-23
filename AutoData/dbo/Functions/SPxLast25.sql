


CREATE  FUNCTION dbo.SPxLast25 (@SP1 Bit, @SP12 bit,@SP2 bit )


--RETURNS @Data TABLE 
	--	(S real,Bar_X Real, S1 real, S2 real, S3 real,S4 real,S5 real)
RETURNS @TheDataSet TABLE 
	(SessionDate datetime , 
	Machine nVarChar(50), 
	SPSessionName nVarChar(50), 
	Lot nVarChar(25),
	Wafers int,
	[1] int,
	[2] int,
	[3] int)
AS

BEGIN
	
If @SP2=1 
begin
insert into @TheDataSet
	SELECT     TOP 25 SessionDate, Machine, SPSessionName, [ID#] + N'-' + [RUN#] + N'-' + Wafer_log AS Lot,
		count(DestinationStationID) as [Wafers], 
		SUM(CASE WHEN DestinationStationID = 1 THEN 1 ELSE 0 END) AS [Bin1], 
                SUM(CASE WHEN DestinationStationID = 2 THEN 1 ELSE 0 END) AS [Bin2], 
		SUM(CASE WHEN DestinationStationID = 3 THEN 1 ELSE 0 END) AS [Bin3]
	FROM         dbo.SP1_Data
	GROUP BY Machine, SPSessionName, SessionDate, [ID#], [RUN#], Wafer_log, [ID#] + N'-' + [RUN#] + N'-' + Wafer_log
	HAVING      (NOT ([ID#] = N'move')) AND (Machine = N'SP2-S0132') AND (NOT ([RUN#] = N'99999')) AND (NOT (Wafer_log = N'99999'))
	ORDER BY SessionDate DESC

end

If @SP1=1 
begin
insert into @TheDataSet
	SELECT     TOP 25 SessionDate, Machine, SPSessionName, [ID#] + N'-' + [RUN#] + N'-' + Wafer_log AS Lot,
		count(DestinationStationID) as [Wafers], 
		SUM(CASE WHEN DestinationStationID = 1 THEN 1 ELSE 0 END) AS [Bin1], 
		SUM(CASE WHEN DestinationStationID = 2 THEN 1 ELSE 0 END) AS [Bin2],
		SUM(CASE WHEN DestinationStationID = 3 THEN 1 ELSE 0 END) AS [Bin3]
	FROM         dbo.SP1_Data
	GROUP BY Machine, SPSessionName, SessionDate, [ID#], [RUN#], Wafer_log, [ID#] + N'-' + [RUN#] + N'-' + Wafer_log
	HAVING      (NOT ([ID#] = N'move')) AND (Machine = N'SP1') AND (NOT ([RUN#] = N'99999')) AND (NOT (Wafer_log = N'99999'))
	ORDER BY SessionDate DESC


end

If @SP12=1 
begin
insert into @TheDataSet
	
	SELECT     TOP 25 SessionDate, Machine, SPSessionName, [ID#] + N'-' + [RUN#] + N'-' + Wafer_log AS Lot,
		count(DestinationStationID) as [Wafers], 
		SUM(CASE WHEN DestinationStationID = 1 THEN 1 ELSE 0 END) AS [Bin1],
                SUM(CASE WHEN DestinationStationID = 2 THEN 1 ELSE 0 END) AS [Bin2],
		SUM(CASE WHEN DestinationStationID = 3 THEN 1 ELSE 0 END) AS [Bin3]
	FROM         dbo.SP1_Data
	GROUP BY Machine, SPSessionName, SessionDate, [ID#], [RUN#], Wafer_log, [ID#] + N'-' + [RUN#] + N'-' + Wafer_log
	HAVING      (NOT ([ID#] = N'move')) AND (Machine = N'SP2') AND (NOT ([RUN#] = N'99999')) AND (NOT (Wafer_log = N'99999'))
	ORDER BY SessionDate DESC


end

RETURN 	
END



