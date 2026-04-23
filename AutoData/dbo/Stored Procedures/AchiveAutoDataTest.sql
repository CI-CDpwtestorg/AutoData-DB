
CREATE PROCEDURE [dbo].[AchiveAutoDataTest] AS
/************************************************************************************************************/
/*Tim Hughes*/
/*2016-05-19*/
/*Goal: One shot call for nightly archive of DB tables and make it easy for someone to adjust days*/
/************************************************************************************************************/

DECLARE @Mydate datetime, 
		@MyDays int;

SET @Mydate = GETDATE();
SET @MyDays = 90;  /* How many Days You Want To Keep */ 


/************************************ */
/************** ADE ***************** */
/************************************ */
INSERT INTO dbo.Archive_ADE_data (ENTRY, [date], [time], operator, [id#], [wl#], [run#], location, recipe, quantity, wafer, class, cen_thk, ave_thk, resistivity, Res2, rgrad, ttv, tir, stir, bow, warp, [type], fpd, sfpd, Receiver, EventTime)

SELECT TOP (100) PERCENT ENTRY, [date], [time], operator, [id#], [wl#], [run#], location, recipe, quantity, wafer, class, cen_thk, ave_thk, resistivity, Res2, rgrad, ttv, tir, stir, bow, warp, [type], fpd, sfpd, Receiver, EventTime
FROM dbo.ADE_data
WHERE (EventTime < DATEADD(day, - @MyDays, @Mydate))
ORDER BY EventTime DESC


delete FROM dbo.ADE_data
WHERE (EventTime < DATEADD(day, - @MyDays, @Mydate))



/************************************ */
/************** SPx ***************** */
/************************************ */
INSERT INTO dbo.Archive_SP1_Data (Entry, Machine, CreationDate, SPSessionName, SPRecipeName, SessionDate, [ID#], [RUN#], Wafer_log, Comment1, Comment2, ChannelID, SourceSlotID, DispositionName, SumAllDefects, 
            FailedLimit, AreaCnt, TotalArea, ScratchCnt, ScratchTotalLength, ScratchAveLength, ScratchMaxLength, ClusterAreaCnt, LPDECnt, LPDSCnt, PosCnt, NegCnt, WaferPosAvgDensity, WaferPosMean, 
            WaferPosStdDev, WaferNegAvgDensity, WaferNegMean, WaferNegStdDev, BinCnt1, BinCnt2, BinCnt3, BinCnt4, BinCnt5, BinCnt6, BinCnt7, BinCnt8, BinCnt18, RangeMin, RangeMax, TotalNCDefectsCount, 
            LPDNBinCntInSize1, LPDNBinCntInSize2, LPDNBinCntInSize3, LPDNBinCntInSize4, LPDNBinCntInSize5, LPDNBinCntInSize6, LPDNBinCntInSize7, LPDNBinCntInSize8, LPDNBinCntInSize18, SOD1, SOD2, SOD3,
            SOD4, SOD5, SOD6, SOD7, SOD8, SOD18, Average, Peak, Median, StdDeviation, Thruput, WaferDia, EdgeExclusion, DestinationStationID, DestinationSlotID, WaferIdLabel, Comment, Map, RFID)

SELECT TOP (100) PERCENT Entry, Machine, CreationDate, SPSessionName, SPRecipeName, SessionDate, [ID#], [RUN#], Wafer_log, Comment1, Comment2, ChannelID, SourceSlotID, DispositionName, SumAllDefects, 
       FailedLimit, AreaCnt, TotalArea, ScratchCnt, ScratchTotalLength, ScratchAveLength, ScratchMaxLength, ClusterAreaCnt, LPDECnt, LPDSCnt, PosCnt, NegCnt, WaferPosAvgDensity, WaferPosMean, 
       WaferPosStdDev, WaferNegAvgDensity, WaferNegMean, WaferNegStdDev, BinCnt1, BinCnt2, BinCnt3, BinCnt4, BinCnt5, BinCnt6, BinCnt7, BinCnt8, BinCnt18, RangeMin, RangeMax, TotalNCDefectsCount, 
       LPDNBinCntInSize1, LPDNBinCntInSize2, LPDNBinCntInSize3, LPDNBinCntInSize4, LPDNBinCntInSize5, LPDNBinCntInSize6, LPDNBinCntInSize7, LPDNBinCntInSize8, LPDNBinCntInSize18, SOD1, SOD2, SOD3,
       SOD4, SOD5, SOD6, SOD7, SOD8, SOD18, Average, Peak, Median, StdDeviation, Thruput, WaferDia, EdgeExclusion, DestinationStationID, DestinationSlotID, WaferIdLabel, Comment, Map, RFID
FROM dbo.SP1_Data
WHERE (CreationDate < DATEADD(day, - @MyDays, @Mydate))
ORDER BY CreationDate DESC

delete FROM dbo.SP1_Data
WHERE (CreationDate < DATEADD(day, - @MyDays, @Mydate))



/************************************ */
/************** LEO ***************** */
/************************************ */
INSERT INTO dbo.Archive_Leo ([Key], TheDateTime, LotNo, ProductNo, Operator, RecipeName, CenterTHK, AverageTHK, MaximumTHK, MinimumTHK, TTV, TV5, TV9, BowBf, WarpBf, Bow3P, Warp3P, Resistivity, PNType, ID1Mark, ID1Judge, 
       ID2Mark, ID2Judge, Loader, LoadSlot, Unloader, UnloadSlot, Definition, CassetteIndex, RecordTime)


SELECT [Key], TheDateTime, LotNo, ProductNo, Operator, RecipeName, CenterTHK, AverageTHK, MaximumTHK, MinimumTHK, TTV, TV5, TV9, BowBf, WarpBf, Bow3P, Warp3P, Resistivity, PNType, ID1Mark, ID1Judge, 
       ID2Mark, ID2Judge, Loader, LoadSlot, Unloader, UnloadSlot, Definition, CassetteIndex, RecordTime
FROM dbo.Leo
WHERE (TheDateTime < DATEADD(day, - @MyDays, @Mydate))

delete FROM dbo.Leo
WHERE (TheDateTime < DATEADD(day, - @MyDays, @Mydate))




/************************************ */
/************** Hologenix *********** */
/************************************ */
INSERT INTO dbo.Archive_DC_OCR (DCIdx, DevIdx, LotsProIdx, AbsBow, AdjustedResRange, AvgRes, AvgStress, AvgThk, Bow, BowX, BowY, CalibrationError, CassetteCapacity, CassetteType, CenterBow, Clock, CntPeak, 
       CntPeakIn, CntPeakOut, CntPeakRed, CntPV, CntPVIn, CntPVOut, CntPVRed, CntRes, CntStress, CntThk, CntValley, CntValleyIn, CntValleyOut, CntValleyRed, DestCarrierID, DestSlot, Diameter, DL35, DL42, DNL35, 
       DNL42, Dotation, DotationValid, EdgeExclusion, EdgeExclusionRed, Epsilon, EquipmentID, EquipmentSerNo, FilmThk, FirstWaferOCRLotID, ForkMMPos, ForkMSFV, ForkMSPos, FQA, FQAred, GeoCurSpecimen, 
       GeoLTVEnabled, GeoLTVLimit, GeoMaxBorderDeltaTHK, GeoOperational, GeoSetupState, GeoValid, HTMLCalibrationResult, [Index], LotID, LTVlimitExceedCount, MaxBowXY, MaxCenterWaviness, 
       MaxCenterWavinessIn, MaxCenterWavinessOut, MaxCenterWavinessRed, MaxGeoLTV, MaxLTVS1, MaxLTVS2, MaxRes, MaxStress, MaxThk, MeasIndex, MinGeoLTV, MinLTVS1, MinLTVS2, MinRes, MinStress, 
       MinThk, MsmtFailure, MX10x_AvgThk, MX10x_CntThk, MX10x_MaxThk, MX10x_MinThk, MX10x_NegFPD, MX10x_PosFPD, MX10x_StdThk, MX10x_THKValid, MX10x_TIR, MX10x_TTV, MX10x_TTVred, 
       MX20x_AbsBow, MX20x_AvgThk, MX20x_Bow, MX20x_BowX, MX20x_BowY, MX20x_CenterBow, MX20x_CntThk, MX20x_MaxBowXY, MX20x_MaxThk, MX20x_MinThk, MX20x_NegFPD, MX20x_NegSori, 
       MX20x_NegWarp, MX20x_PosFPD, MX20x_PosSori, MX20x_PosWarp, MX20x_StdThk, MX20x_THKValid, MX20x_TIR, MX20x_TotSori, MX20x_TotWarp, MX20x_TTV, MX20x_TTVred, MX20x_WarpValid, 
       MX700AbsBow, MX700AvgThk, MX700Bow, MX700BowX, MX700BowY, MX700CenterBow, MX700CntThk, MX700MaxBowXY, MX700MaxThk, MX700MinThk, MX700NegFPD, MX700NegSori, MX700NegWarp, 
       MX700PosFPD, MX700PosSori, MX700PosWarp, MX700ScanResultText, MX700ScanValid, MX700StdThk, MX700THKValid, MX700TIR, MX700TotSori, MX700TotWarp, MX700TTV, MX700TTVred, 
       MX700WarpValid, MXOperational, MXSetupState, NegFPD, NegSori, NegWarp, NotifyHost, PoissonConst, PosFPD, PosSori, PosWarp, PPBuildID, ProcessStepID, RawGeoSpecimenTHK, ReferenceFound, 
       ReferenceLotID, ReferencePSID, ResHeadTemperature, ResOperational, ResRange, ResRng, ResSetupState, ResTargetCalibrationRange, ResValid, RoughDepthLeft, RoughDepthRight, RoughnessLeft, 
       RoughnessRight, RRV, SaveMeasurements, ScanCurSpecimen, ScanOperational, ScanResultText, ScanSetupState, ScanValid, SlotOrder, SourceCarrierID, SourceSlot, SourceStationID, StdRes, StdThk, 
       StressEnabled, SubstrateType, TapeThk, THKValid, Throughput, TIR, ToolIsInService, TotSori, TotWarp, TTV, TTVred, WaferClass, WaferClassName, WaferClassType, WaferHangType, WaferID, WaferIDByUser, 
       WaferIDRead, WaferIDValid, WaferOcrCarrierID, WaferOcrCheckSum, WaferOcrCustomerCode, WaferOcrDesignatedSlot, WaferOcrExtraInfo, WaferOcrLotID, WaferOCRReaderJob, WaferPortState, WaferSizeType, 
       WaferTransferState, WaferTypeName, WarpValid)



SELECT TOP (100) PERCENT DCIdx, DevIdx, LotsProIdx, AbsBow, AdjustedResRange, AvgRes, AvgStress, AvgThk, Bow, BowX, BowY, CalibrationError, CassetteCapacity, CassetteType, CenterBow, Clock, CntPeak, 
       CntPeakIn, CntPeakOut, CntPeakRed, CntPV, CntPVIn, CntPVOut, CntPVRed, CntRes, CntStress, CntThk, CntValley, CntValleyIn, CntValleyOut, CntValleyRed, DestCarrierID, DestSlot, Diameter, DL35, DL42, DNL35, 
       DNL42, Dotation, DotationValid, EdgeExclusion, EdgeExclusionRed, Epsilon, EquipmentID, EquipmentSerNo, FilmThk, FirstWaferOCRLotID, ForkMMPos, ForkMSFV, ForkMSPos, FQA, FQAred, GeoCurSpecimen, 
       GeoLTVEnabled, GeoLTVLimit, GeoMaxBorderDeltaTHK, GeoOperational, GeoSetupState, GeoValid, HTMLCalibrationResult, [Index], LotID, LTVlimitExceedCount, MaxBowXY, MaxCenterWaviness, 
       MaxCenterWavinessIn, MaxCenterWavinessOut, MaxCenterWavinessRed, MaxGeoLTV, MaxLTVS1, MaxLTVS2, MaxRes, MaxStress, MaxThk, MeasIndex, MinGeoLTV, MinLTVS1, MinLTVS2, MinRes, MinStress, 
       MinThk, MsmtFailure, MX10x_AvgThk, MX10x_CntThk, MX10x_MaxThk, MX10x_MinThk, MX10x_NegFPD, MX10x_PosFPD, MX10x_StdThk, MX10x_THKValid, MX10x_TIR, MX10x_TTV, MX10x_TTVred, 
       MX20x_AbsBow, MX20x_AvgThk, MX20x_Bow, MX20x_BowX, MX20x_BowY, MX20x_CenterBow, MX20x_CntThk, MX20x_MaxBowXY, MX20x_MaxThk, MX20x_MinThk, MX20x_NegFPD, MX20x_NegSori, 
       MX20x_NegWarp, MX20x_PosFPD, MX20x_PosSori, MX20x_PosWarp, MX20x_StdThk, MX20x_THKValid, MX20x_TIR, MX20x_TotSori, MX20x_TotWarp, MX20x_TTV, MX20x_TTVred, MX20x_WarpValid, 
       MX700AbsBow, MX700AvgThk, MX700Bow, MX700BowX, MX700BowY, MX700CenterBow, MX700CntThk, MX700MaxBowXY, MX700MaxThk, MX700MinThk, MX700NegFPD, MX700NegSori, MX700NegWarp, 
       MX700PosFPD, MX700PosSori, MX700PosWarp, MX700ScanResultText, MX700ScanValid, MX700StdThk, MX700THKValid, MX700TIR, MX700TotSori, MX700TotWarp, MX700TTV, MX700TTVred, 
       MX700WarpValid, MXOperational, MXSetupState, NegFPD, NegSori, NegWarp, NotifyHost, PoissonConst, PosFPD, PosSori, PosWarp, PPBuildID, ProcessStepID, RawGeoSpecimenTHK, ReferenceFound, 
       ReferenceLotID, ReferencePSID, ResHeadTemperature, ResOperational, ResRange, ResRng, ResSetupState, ResTargetCalibrationRange, ResValid, RoughDepthLeft, RoughDepthRight, RoughnessLeft, 
       RoughnessRight, RRV, SaveMeasurements, ScanCurSpecimen, ScanOperational, ScanResultText, ScanSetupState, ScanValid, SlotOrder, SourceCarrierID, SourceSlot, SourceStationID, StdRes, StdThk, 
       StressEnabled, SubstrateType, TapeThk, THKValid, Throughput, TIR, ToolIsInService, TotSori, TotWarp, TTV, TTVred, WaferClass, WaferClassName, WaferClassType, WaferHangType, WaferID, WaferIDByUser, 
       WaferIDRead, WaferIDValid, WaferOcrCarrierID, WaferOcrCheckSum, WaferOcrCustomerCode, WaferOcrDesignatedSlot, WaferOcrExtraInfo, WaferOcrLotID, WaferOCRReaderJob, WaferPortState, WaferSizeType, 
       WaferTransferState, WaferTypeName, WarpValid
FROM dbo.DC_OCR
WHERE (Clock < DATEADD(day, - @MyDays, @Mydate))
ORDER BY Clock


delete FROM dbo.DC_OCR
WHERE (Clock < DATEADD(day, - @MyDays, @Mydate))




/************************************ */
/************** GigaSorter ********** */
/************************************ */
INSERT INTO dbo.Archive_tblWafers (WaferIdx, WaferNum, JobIdx, SenderIdx, SenderSlotNbr, ReceiverIdx, ReceiverSlotNbr, ReadTime, CtrThick, [Type], Resistivity, ResGradient, OCRString, Category, RecipeName, 
       MeasurementNum, OperID, Receiver, JobID)


SELECT TOP (100) PERCENT WaferIdx, WaferNum, JobIdx, SenderIdx, SenderSlotNbr, ReceiverIdx, ReceiverSlotNbr, ReadTime, CtrThick, [Type], Resistivity, ResGradient, OCRString, Category, RecipeName, 
       MeasurementNum, OperID, Receiver, JobID
FROM dbo.tblWafers
WHERE (ReadTime < DATEADD(day, - @MyDays, @Mydate))
ORDER BY ReadTime

delete FROM dbo.tblWafers
WHERE (ReadTime < DATEADD(day, - @MyDays, @Mydate))




/************************************ */
/************** Tencor ************** */
/************************************ */
INSERT INTO dbo.Archive_Tencor_Data (ENTRY, [DATE], [TIME], RECIPE, OPERATOR, [ID#], [RUN#], WAFER_LOG, MACHINE, [WAFER#], LPD_COUNT, LPD_CM2, [130_BIN], [160_BIN], [200_BIN], [250_BIN], [300_BIN], [500_BIN], 
       [1000_BIN], MEAN_T, STD_DEV, AREA_COUNT, AREA_TOTAL_MM, SCRATCH_COUNT, SCRATCH_TOTAL_MM, SUM_ALL_DEFECTS, GAIN, THRESHOLD_uM, HAZE_RANGE_PPM, SORT, [HAZE_REGION_%], 
       HAZE_AVE_PPM, HAZE_PEAK, [BELOW_HAZE_%], [098_%], [144_%], [286_%], [429_%], [572_%], [715_%], [857_%], [ABOVE_HAZE_%], DIAMETER_MM, EXCLUSION_MM, THRUPUT, EventTime)


SELECT TOP (100) PERCENT ENTRY, [DATE], [TIME], RECIPE, OPERATOR, [ID#], [RUN#], WAFER_LOG, MACHINE, [WAFER#], LPD_COUNT, LPD_CM2, [130_BIN], [160_BIN], [200_BIN], [250_BIN], [300_BIN], [500_BIN], 
       [1000_BIN], MEAN_T, STD_DEV, AREA_COUNT, AREA_TOTAL_MM, SCRATCH_COUNT, SCRATCH_TOTAL_MM, SUM_ALL_DEFECTS, GAIN, THRESHOLD_uM, HAZE_RANGE_PPM, SORT, [HAZE_REGION_%], 
       HAZE_AVE_PPM, HAZE_PEAK, [BELOW_HAZE_%], [098_%], [144_%], [286_%], [429_%], [572_%], [715_%], [857_%], [ABOVE_HAZE_%], DIAMETER_MM, EXCLUSION_MM, THRUPUT, EventTime
FROM dbo.Tencor_Data
WHERE (EventTime < DATEADD(day, - @MyDays, @Mydate))
ORDER BY EventTime

delete FROM dbo.Tencor_Data
WHERE (EventTime < DATEADD(day, - @MyDays, @Mydate))




