

/* SPC Functions By Tim Hughes */

CREATE  FUNCTION [dbo].[fn_SPC_SP3-1]()
RETURNS TABLE
AS
	RETURN 
	( 
	SELECT TOP (10) Machine, Comment1 AS Operator, SessionDate, Comment2 AS DSC, SPSessionName as Recipe, COUNT(Comment1) AS R_Count, ROUND(AVG(CAST(SOD1 AS float)), 2) AS SOD_AVG, 
		ROUND(STDEV(CAST(SOD1 AS float)), 2) AS SOD_StDev, ROUND(AVG(CAST(TotalArea AS float)), 2) AS Area_AVG, ROUND(STDEV(CAST(TotalArea AS float)), 2) AS Area_StDev, 
		ROUND(AVG(CAST(Average AS float)), 4) AS Haze_AVG, ROUND(STDEV(CAST(Average AS float)), 4) AS Haze_StDev
	FROM dbo.SP1_Data
	GROUP BY Machine, Comment2, SessionDate, SPSessionName, Comment1
	HAVING (SPSessionName LIKE N'%spc%') AND (Machine = N'SP3-2110224')
	ORDER BY SessionDate DESC
	)






