










CREATE     FUNCTION dbo.fctn_Sati_PullTencorDataByID ( @MainID as nvarchar(4) )

RETURNS TABLE 
		
AS
	
	RETURN 	
		SELECT     TOP 100 PERCENT [DATE], [TIME], RECIPE, OPERATOR, [ID#], [RUN#], WAFER_LOG, MACHINE, [WAFER#], LPD_COUNT, LPD_CM2, [130_BIN], [160_BIN], 
                      [200_BIN], [250_BIN], [300_BIN], [500_BIN], [1000_BIN], MEAN_T, STD_DEV, AREA_COUNT, AREA_TOTAL_MM, SCRATCH_COUNT, 
                      SCRATCH_TOTAL_MM, SUM_ALL_DEFECTS, GAIN, THRESHOLD_uM, HAZE_RANGE_PPM, SORT, [HAZE_REGION_%], HAZE_AVE_PPM, HAZE_PEAK, 
                      [BELOW_HAZE_%], [098_%], [144_%], [286_%], [429_%], [572_%], [715_%], [857_%], [ABOVE_HAZE_%], DIAMETER_MM, EXCLUSION_MM, THRUPUT, 
                      EventTime
FROM         dbo.Tencor_Data
WHERE     ([ID#] = @MainID)
ORDER BY ENTRY DESC






