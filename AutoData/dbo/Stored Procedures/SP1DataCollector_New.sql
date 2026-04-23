


CREATE   PROCEDURE [dbo].[SP1DataCollector_New]
AS
INSERT      SP1_Data
	(Machine, CreationDate, SPSessionName, SPRecipeName, SessionDate
	, [ID#],[RUN#], Wafer_log
	, Comment1, Comment2, ChannelID, SourceSlotID, 
              DispositionName, SumAllDefects, FailedLimit, AreaCnt, TotalArea, ScratchCnt, ScratchTotalLength, ScratchMaxLength, ScratchAveLength, 
              ClusterAreaCnt, LPDECnt, LPDSCnt, PosCnt, NegCnt, WaferPosAvgDensity, WaferPosMean, WaferPosStdDev, WaferNegAvgDensity, WaferNegMean, 
              WaferNegStdDev, BinCnt1, BinCnt2, BinCnt3, BinCnt4, BinCnt5, BinCnt6, BinCnt7, BinCnt8, BinCnt18, RangeMin, RangeMax, TotalNCDefectsCount, 
              LPDNBinCntInSize1, LPDNBinCntInSize2, LPDNBinCntInSize3, LPDNBinCntInSize4, LPDNBinCntInSize5, LPDNBinCntInSize6, LPDNBinCntInSize7, 
              LPDNBinCntInSize8, LPDNBinCntInSize18, Average, Peak, Median, StdDeviation, Thruput, WaferDia, EdgeExclusion, DestinationStationID, 
              DestinationSlotID, WaferIdLabel, Comment, SOD1, SOD2, SOD3, SOD4, SOD5, SOD6, SOD7, SOD8, SOD18)
SELECT     'SP1', Info.CreationDate, Info.SPSessionName, Info.SPRecipeName, Info.SessionDate
	, ltrim(rtrim(Info.LotIdLabel)), ltrim(rtrim( Info.StepID)), ltrim(rtrim(Info.ProcessToolID)), 
              Info.ProcessGroup, Info.ProcessArea, Defect.ChannelID, Info.SourceSlotID, Info.DispositionName, Chnl.SumAllDefects, Info.FailedLimit, 
              Class.AreaCnt, Class.TotalArea, Class.ScratchCnt, Class.ScratchTotalLength, Class.ScratchMaxLength, Class.ScratchAveLength, Class.ClusterAreaCnt, 
              Class.LPDECnt, Class.LPDSCnt, Defect.PosCnt, Defect.NegCnt, Defect.WaferPosAvgDensity, Defect.WaferPosMean, Defect.WaferPosStdDev, 
              Defect.WaferNegAvgDensity, Defect.WaferNegMean, Defect.WaferNegStdDev, Defect.BinCnt1, Defect.BinCnt2, Defect.BinCnt3, Defect.BinCnt4, 
              Defect.BinCnt5, Defect.BinCnt6, Defect.BinCnt7, Defect.BinCnt8, Defect.BinCnt18, Defect.RangeMin, Defect.RangeMax, Class.TotalNCDefectsCount, 
              Defect.LPDNBinCntInSize1, Defect.LPDNBinCntInSize2, Defect.LPDNBinCntInSize3, Defect.LPDNBinCntInSize4, Defect.LPDNBinCntInSize5, 
              Defect.LPDNBinCntInSize6, Defect.LPDNBinCntInSize7, Defect.LPDNBinCntInSize8, Defect.LPDNBinCntInSize18, Haze.Average, Haze.Peak, 
              Haze.Median, Haze.StdDeviation, Info.Thruput, Info.WaferDia, Info.EdgeExclusion, Info.DestinationStationID, Info.DestinationSlotID, Info.WaferIdLabel, 
              Info.Comment, Defect.BinCnt1 + Defect.LPDNBinCntInSize1 AS SOD1, Defect.BinCnt2 + Defect.LPDNBinCntInSize2 AS SOD2, 
              Defect.BinCnt3 + Defect.LPDNBinCntInSize3 AS SOD3, Defect.BinCnt4 + Defect.LPDNBinCntInSize4 AS SOD4, 
              Defect.BinCnt5 + Defect.LPDNBinCntInSize5 AS SOD5, Defect.BinCnt6 + Defect.LPDNBinCntInSize6 AS SOD6, 
              Defect.BinCnt7 + Defect.LPDNBinCntInSize7 AS SOD7, Defect.BinCnt8 + Defect.LPDNBinCntInSize8 AS SOD8, 
              Defect.BinCnt18 + Defect.LPDNBinCntInSize18 AS SOD18
FROM         dbo.TBL_DataSumClassification Class INNER JOIN
                      dbo.TBL_DataSumInfo Info ON Class.CreationDate = Info.CreationDate INNER JOIN
                      dbo.TBL_DataSumCommonChannel Chnl ON Chnl.ChannelID = Class.ChannelID AND Info.CreationDate = Chnl.CreationDate INNER JOIN
                      dbo.TBL_DataSumHazeMap Haze ON Class.ChannelID = Haze.ChannelID AND Info.CreationDate = Haze.CreationDate INNER JOIN
                      dbo.TBL_DataSumDefect Defect ON Haze.ChannelID = Defect.ChannelID AND Info.CreationDate = Defect.CreationDate LEFT OUTER JOIN
                      dbo.SP1_Data SP1 ON Info.CreationDate = SP1.CreationDate
WHERE     (SP1.CreationDate IS NULL) AND (LEFT(Defect.ChannelID, 9) = 'Composite')
ORDER BY Info.CreationDate	
Return



