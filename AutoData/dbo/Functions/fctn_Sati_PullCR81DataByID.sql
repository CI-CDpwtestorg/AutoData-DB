











CREATE     FUNCTION dbo.fctn_Sati_PullCR81DataByID ( @MainID as nvarchar(4) )

RETURNS TABLE 
		
AS
	
	RETURN 	
		SELECT  top 100   [DATE], [TIME], RECIPE, OPERATOR, [ID#], [RUN#], WAFER_LOG, MACHINE, [WAFER#], SUMMATION, [120_BIN], [130_BIN], [160_BIN], [200_BIN], 
                      [250_BIN], [300_BIN], AREA, HAZE_AVE, GRADE, SCRATCH
FROM         CR81_DATA
WHERE     ([ID#] = @MainID)
ORDER BY [DATE] DESC







