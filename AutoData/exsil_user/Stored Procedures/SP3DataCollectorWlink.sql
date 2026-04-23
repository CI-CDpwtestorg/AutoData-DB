


CREATE      PROCEDURE exsil_user.SP3DataCollectorWlink
AS
INSERT      SP1_Data
	(Machine, CreationDate, SPSessionName, SPRecipeName, SessionDate
	, [ID#],[RUN#], Wafer_log
	, Comment1, SourceSlotID, DispositionName,
              BinCnt1, BinCnt2, BinCnt3, BinCnt4, BinCnt5, BinCnt6, BinCnt7, BinCnt8, 
	      LPDNBinCntInSize1, LPDNBinCntInSize2, LPDNBinCntInSize3, LPDNBinCntInSize4, LPDNBinCntInSize5, LPDNBinCntInSize6, LPDNBinCntInSize7, 
              LPDNBinCntInSize8, SOD1, SOD2, SOD3, SOD4, SOD5, SOD6, SOD7, SOD8, DestinationStationID, 
              DestinationSlotID)
SELECT     TOP 100 PERCENT 'SP3' AS Machine, TBL_ResultsCharData.CreationDate, TBL_ResultsCharData_1.fieldValue AS SPSessionName, 
                      TBL_ResultsCharData_2.fieldValue AS SPRecipeName, TBL_ResultsCharData.CreationDate AS SessionDate, 
                      TBL_ResultsCharData_3.fieldValue AS [ID#], TBL_ResultsCharData_4.fieldValue AS [Run#], TBL_ResultsCharData_5.fieldValue AS Wafer_log, 
                      TBL_ResultsCharData_6.fieldValue AS Comment1, TBL_ResultsLongData_2.fieldValue AS SourceSlotID, 
                      TBL_ResultsCharData_7.fieldValue AS DispositionName, TBL_ResultsSumBinData_1.BinCount1 AS BinCnt1, 
                      TBL_ResultsSumBinData_1.BinCount2 AS BinCnt2, TBL_ResultsSumBinData_1.BinCount3 AS BinCnt3, 
                      TBL_ResultsSumBinData_1.BinCount4 AS BinCnt4, TBL_ResultsSumBinData_1.BinCount5 AS BinCnt5, 
                      TBL_ResultsSumBinData_1.BinCount6 AS BinCnt6, TBL_ResultsSumBinData_1.BinCount7 AS BinCnt7, 
                      TBL_ResultsSumBinData_1.BinCount8 AS BinCnt8, TBL_ResultsSumBinData_2.BinCount1 AS LPDNBinCntInSize1, 
                      TBL_ResultsSumBinData_2.BinCount2 AS LPDNBinCntInSize2, TBL_ResultsSumBinData_2.BinCount3 AS LPDNBinCntInSize3, 
                      TBL_ResultsSumBinData_2.BinCount4 AS LPDNBinCntInSize4, TBL_ResultsSumBinData_2.BinCount5 AS LPDNBinCntInSize5, 
                      TBL_ResultsSumBinData_2.BinCount6 AS LPDNBinCntInSize6, TBL_ResultsSumBinData_2.BinCount7 AS LPDNBinCntInSize7, 
                      TBL_ResultsSumBinData_2.BinCount8 AS LPDNBinCntInSize8, 
                      TBL_ResultsSumBinData_1.BinCount1 + TBL_ResultsSumBinData_2.BinCount1 AS SOD1, 
                      TBL_ResultsSumBinData_1.BinCount2 + TBL_ResultsSumBinData_2.BinCount2 AS SOD2, 
                      TBL_ResultsSumBinData_1.BinCount3 + TBL_ResultsSumBinData_2.BinCount3 AS SOD3, 
                      TBL_ResultsSumBinData_1.BinCount4 + TBL_ResultsSumBinData_2.BinCount4 AS SOD4, 
                      TBL_ResultsSumBinData_1.BinCount5 + TBL_ResultsSumBinData_2.BinCount5 AS SOD5, 
                      TBL_ResultsSumBinData_1.BinCount6 + TBL_ResultsSumBinData_2.BinCount6 AS SOD6, 
                      TBL_ResultsSumBinData_1.BinCount7 + TBL_ResultsSumBinData_2.BinCount7 AS SOD7, 
                      TBL_ResultsSumBinData_1.BinCount8 + TBL_ResultsSumBinData_2.BinCount8 AS SOD8, TBL_ResultsLongData_1.fieldValue AS DestinationStationID,
                       TBL_ResultsLongData_3.fieldValue AS DestinationSlotID
FROM         	      [SP2-S0132].KTResults_520.dbo.TBL_ResultsCharData TBL_ResultsCharData INNER JOIN
                      [SP2-S0132].KTResults_520.dbo.TBL_ResultsSumBinData TBL_ResultsSumBinData_1 ON 
                      TBL_ResultsCharData.CreationDate = TBL_ResultsSumBinData_1.CreationDate LEFT OUTER JOIN
                      [SP2-S0132].KTResults_520.dbo.TBL_ResultsSumBinData TBL_ResultsSumBinData_2 ON 
                      TBL_ResultsCharData.CreationDate = TBL_ResultsSumBinData_2.CreationDate LEFT OUTER JOIN
                      [SP2-S0132].KTResults_520.dbo.TBL_ResultsLongData TBL_ResultsLongData_2 ON 
                      TBL_ResultsCharData.CreationDate = TBL_ResultsLongData_2.CreationDate LEFT OUTER JOIN
                      [SP2-S0132].KTResults_520.dbo.TBL_ResultsLongData TBL_ResultsLongData_1 ON 
                      TBL_ResultsCharData.CreationDate = TBL_ResultsLongData_1.CreationDate LEFT OUTER JOIN
		      [SP2-S0132].KTResults_520.dbo.TBL_ResultsLongData TBL_ResultsLongData_3 ON 
                      TBL_ResultsCharData.CreationDate = TBL_ResultsLongData_3.CreationDate LEFT OUTER JOIN
                      [SP2-S0132].KTResults_520.dbo.TBL_ResultsCharData TBL_ResultsCharData_7 ON 
                      TBL_ResultsCharData.CreationDate = TBL_ResultsCharData_7.CreationDate LEFT OUTER JOIN
                      [SP2-S0132].KTResults_520.dbo.TBL_ResultsCharData TBL_ResultsCharData_6 ON 
                      TBL_ResultsCharData.CreationDate = TBL_ResultsCharData_6.CreationDate LEFT OUTER JOIN
                      [SP2-S0132].KTResults_520.dbo.TBL_ResultsCharData TBL_ResultsCharData_5 ON 
                      TBL_ResultsCharData.CreationDate = TBL_ResultsCharData_5.CreationDate LEFT OUTER JOIN
                      [SP2-S0132].KTResults_520.dbo.TBL_ResultsCharData TBL_ResultsCharData_4 ON 
                      TBL_ResultsCharData.CreationDate = TBL_ResultsCharData_4.CreationDate LEFT OUTER JOIN
                      [SP2-S0132].KTResults_520.dbo.TBL_ResultsCharData TBL_ResultsCharData_3 ON 
                      TBL_ResultsCharData.CreationDate = TBL_ResultsCharData_3.CreationDate LEFT OUTER JOIN
                      [SP2-S0132].KTResults_520.dbo.TBL_ResultsCharData TBL_ResultsCharData_2 ON 
                      TBL_ResultsCharData.CreationDate = TBL_ResultsCharData_2.CreationDate LEFT OUTER JOIN
                      [SP2-S0132].KTResults_520.dbo.TBL_ResultsCharData TBL_ResultsCharData_1 ON 
                      TBL_ResultsCharData.CreationDate = TBL_ResultsCharData_1.CreationDate LEFT OUTER JOIN
		      dbo.SP1_Data SP1 ON TBL_ResultsCharData.CreationDate = SP1.CreationDate AND SP1.Machine='SP3'
WHERE     (TBL_ResultsCharData_1.DisplayLabel = 'Job Name') AND (TBL_ResultsCharData_2.DisplayLabel = 'Recipe Name') AND 
                      (TBL_ResultsCharData_4.DisplayLabel = 'Run Number') AND (TBL_ResultsCharData_3.DisplayLabel = 'LotID') AND 
                      (TBL_ResultsCharData_5.DisplayLabel = 'WL Number') AND (TBL_ResultsCharData_6.DisplayLabel = 'Stamp Number') AND 
                      (TBL_ResultsCharData_7.DisplayLabel = 'Grade') AND (TBL_ResultsLongData_2.DisplayLabel = 'Source Slot ID') AND 
                      (TBL_ResultsLongData_1.DisplayLabel = 'Destination Station ID') AND (TBL_ResultsLongData_3.DisplayLabel = 'Destination Slot ID') AND (TBL_ResultsSumBinData_1.FieldID = 'FLNM#LPD Size,FLTY#Bins') AND 
                      (TBL_ResultsSumBinData_1.ResultsID LIKE '%Composite%') AND (SP1.CreationDate IS NULL) 
	AND (TBL_ResultsSumBinData_2.FieldID = 'FLNM#LPD-N Size,FLTY#Bins')
GROUP BY TBL_ResultsCharData_1.fieldValue, TBL_ResultsCharData_2.fieldValue, TBL_ResultsCharData_3.fieldValue, TBL_ResultsCharData_4.fieldValue, 
                      TBL_ResultsCharData_5.fieldValue, TBL_ResultsCharData_6.fieldValue, TBL_ResultsCharData_7.fieldValue, TBL_ResultsCharData.CreationDate, 
                      TBL_ResultsLongData_3.fieldValue, TBL_ResultsLongData_1.fieldValue, TBL_ResultsLongData_2.fieldValue, TBL_ResultsSumBinData_2.BinCount1, 
                      TBL_ResultsSumBinData_1.BinCount1, TBL_ResultsSumBinData_2.BinCount2, TBL_ResultsSumBinData_1.BinCount2, 
                      TBL_ResultsSumBinData_2.BinCount3, TBL_ResultsSumBinData_1.BinCount3, TBL_ResultsSumBinData_2.BinCount4, 
                      TBL_ResultsSumBinData_1.BinCount4, TBL_ResultsSumBinData_2.BinCount5, TBL_ResultsSumBinData_1.BinCount5, 
                      TBL_ResultsSumBinData_2.BinCount6, TBL_ResultsSumBinData_1.BinCount6, TBL_ResultsSumBinData_2.BinCount7, 
                      TBL_ResultsSumBinData_1.BinCount7, TBL_ResultsSumBinData_2.BinCount8, TBL_ResultsSumBinData_1.BinCount8, 
                      TBL_ResultsSumBinData_1.BinCount1, TBL_ResultsSumBinData_1.BinCount2, TBL_ResultsSumBinData_1.BinCount3, 
                      TBL_ResultsSumBinData_1.BinCount4, TBL_ResultsSumBinData_1.BinCount5, TBL_ResultsSumBinData_1.BinCount6, 
                      TBL_ResultsSumBinData_1.BinCount7, TBL_ResultsSumBinData_1.BinCount8, 
                      TBL_ResultsSumBinData_1.BinCount2 + TBL_ResultsSumBinData_2.BinCount2, 
                      TBL_ResultsSumBinData_1.BinCount4 + TBL_ResultsSumBinData_2.BinCount4, 
                      TBL_ResultsSumBinData_1.BinCount5 + TBL_ResultsSumBinData_2.BinCount5, 
                      TBL_ResultsSumBinData_1.BinCount6 + TBL_ResultsSumBinData_2.BinCount6, 
                      TBL_ResultsSumBinData_1.BinCount7 + TBL_ResultsSumBinData_2.BinCount7, 
                      TBL_ResultsSumBinData_1.BinCount8 + TBL_ResultsSumBinData_2.BinCount8, 
                      TBL_ResultsSumBinData_1.BinCount1 + TBL_ResultsSumBinData_2.BinCount1, 
                      TBL_ResultsSumBinData_1.BinCount3 + TBL_ResultsSumBinData_2.BinCount3
ORDER BY TBL_ResultsCharData.CreationDate	

Return



