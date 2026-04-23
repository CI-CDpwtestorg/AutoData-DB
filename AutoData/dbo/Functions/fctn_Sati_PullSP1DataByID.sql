










CREATE     FUNCTION dbo.fctn_Sati_PullSP1DataByID ( @MainID as nvarchar(4) )

RETURNS TABLE 
		
AS
	
	RETURN 	
		SELECT     TOP 100 PERCENT Machine, CreationDate, SPSessionName, SPRecipeName, SessionDate, [ID#], [RUN#], Wafer_log, Comment1, Comment2, ChannelID, 
                      SourceSlotID, DispositionName, SumAllDefects, FailedLimit, AreaCnt, TotalArea, ScratchCnt, ScratchTotalLength, ScratchAveLength, ScratchMaxLength, 
                      ClusterAreaCnt, LPDECnt, LPDSCnt, PosCnt, NegCnt, WaferPosAvgDensity, WaferPosMean, WaferPosStdDev, WaferNegAvgDensity, WaferNegMean, 
                      WaferNegStdDev, BinCnt1, BinCnt2, BinCnt3, BinCnt4, BinCnt5, BinCnt6, BinCnt7, BinCnt8, BinCnt18, RangeMin, RangeMax, TotalNCDefectsCount, 
                      LPDNBinCntInSize1, LPDNBinCntInSize2, LPDNBinCntInSize3, LPDNBinCntInSize4, LPDNBinCntInSize5, LPDNBinCntInSize6, LPDNBinCntInSize7, 
                      LPDNBinCntInSize8, LPDNBinCntInSize18, SOD1, SOD2, SOD3, SOD4, SOD5, SOD6, SOD7, SOD8, SOD18, Average, Peak, Median, StdDeviation, 
                      Thruput, WaferDia, EdgeExclusion, DestinationStationID, DestinationSlotID, WaferIdLabel, Comment
		FROM         dbo.SP1_Data
		WHERE     ([ID#] = @MainID)
		ORDER BY Entry DESC






