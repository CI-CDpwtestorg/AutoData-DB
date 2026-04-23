


/* SPC Functions By Tim Hughes */

CREATE  FUNCTION [dbo].[fn_SPC_Tencor]()
RETURNS TABLE
AS
	RETURN 
	( 
	SELECT        TOP (10) MACHINE, MAX(EventTime) AS TheDateTime, OPERATOR AS DSC, RECIPE, COUNT(RECIPE) AS R_Count, ROUND(AVG(CAST([160_BIN] AS float)), 2) AS [160_BIN_AVG], 
                         ROUND(STDEV(CAST([160_BIN] AS float)), 2) AS [160_BIN_StDev], ROUND(AVG(CAST([200_BIN] AS float)), 2) AS [200_BIN_AVG], ROUND(STDEV(CAST([200_BIN] AS float)), 2) AS [200_BIN_StDev], 
                         ROUND(AVG(CAST([300_BIN] AS float)), 2) AS [300_BIN_AVG], ROUND(STDEV(CAST([300_BIN] AS float)), 2) AS [300_BIN_StDev]
FROM            dbo.Tencor_Data
GROUP BY OPERATOR, MACHINE, RECIPE
HAVING        (RECIPE LIKE N'%SPC%') AND (MACHINE = N'TENCOR')
ORDER BY TheDateTime DESC
	)







