

/* SPC Functions By Tim Hughes */

CREATE  FUNCTION [dbo].[fn_SPC_LEO]()
RETURNS TABLE
AS
	RETURN 
	( 
	SELECT TOP (10) Operator, TheDateTime, LotNo AS DSC, RecipeName AS Recipe, COUNT([Key]) AS R_Count, ROUND(AVG(CAST(CenterTHK AS float)), 2) AS CenterTHK_AVG, ROUND(STDEV(CAST(CenterTHK AS float)), 2) 
		AS CenterTHK_StDev, ROUND(AVG(CAST(TTV AS float)), 2) AS TTV_AVG, ROUND(STDEV(CAST(TTV AS float)), 2) AS TTV_StDev, ROUND(AVG(CAST(TV5 AS float)), 2) AS TV5_AVG, ROUND(STDEV(CAST(TV5 AS float)), 
        2) AS TV5_StDev, ROUND(AVG(CAST(Bow3P AS float)), 2) AS Bow3P_AVG, ROUND(STDEV(CAST(Bow3P AS float)), 2) AS Bow3P_StDev, ROUND(AVG(CAST(Warp3P AS float)), 2) AS Warp3P_AVG, 
        ROUND(STDEV(CAST(Warp3P AS float)), 2) AS Warp3P_StDev, ROUND(AVG(CAST(Resistivity AS float)), 2) AS Resistivity_AVG, ROUND(STDEV(CAST(Resistivity AS float)), 2) AS Resistivity_StDev
	FROM dbo.Leo
	GROUP BY LotNo, RecipeName, TheDateTime, Operator
	HAVING (RecipeName LIKE N'%spc%')
	ORDER BY TheDateTime DESC
	)






