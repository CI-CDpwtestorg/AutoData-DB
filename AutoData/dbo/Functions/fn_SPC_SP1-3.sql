

/* SPC Functions By Tim Hughes */

CREATE  FUNCTION [dbo].[fn_SPC_SP1-3]()
RETURNS TABLE
AS
	RETURN 
	( 
	SELECT TOP (10) Machine, Comment1 AS Operator, SessionDate, Comment2 AS DSC, SPSessionName as Recipe, COUNT(Comment1) AS R_Count, ROUND(AVG(CAST(SumAllDefects AS float)), 2) AS SOD_AVG, 
		ROUND(STDEV(CAST(SumAllDefects AS float)), 2) AS SOD_StDev, ROUND(AVG(CAST(AreaCnt AS float)), 2) AS Area_AVG, ROUND(STDEV(CAST(AreaCnt AS float)), 2) AS Area_StDev, 
		ROUND(AVG(CAST(Average AS float)), 4) AS Haze_AVG, ROUND(STDEV(CAST(Average AS float)), 4) AS Haze_StDev
	FROM dbo.SP1_Data
	GROUP BY Machine, Comment2, SessionDate, SPSessionName, Comment1
	HAVING (SPSessionName LIKE N'%spc%') AND (Machine = N'SP1-3')
	ORDER BY SessionDate DESC
	)






