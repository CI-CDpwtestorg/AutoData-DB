

/* SPC Functions By Tim Hughes */

CREATE  FUNCTION [dbo].[fn_SPC_PreSort2]()
RETURNS TABLE
AS
	RETURN 
	( 
	SELECT TOP (10) location AS Machine, MAX(EventTime) AS SessionDate, operator AS DSC, recipe AS Recipe, COUNT(ENTRY) AS R_Count, ROUND(AVG(CAST(cen_thk AS float)), 2) AS [Cen Thk_AVG], 
		ROUND(STDEV(CAST(cen_thk AS float)), 2) AS [Cen Thk_STDEV], ROUND(AVG(CAST(ttv AS float)), 2) AS TTV_AVG, ROUND(STDEV(CAST(ttv AS float)), 2) AS TTV_STDEV, ROUND(AVG(CAST(tir AS float)), 2) AS TIR_AVG,
        ROUND(STDEV(CAST(tir AS float)), 2) AS TIR_STDEV, ROUND(AVG(CAST(resistivity AS float)), 2) AS [Cen Res_AVG], ROUND(STDEV(CAST(resistivity AS float)), 2) AS [Cen Res_STDEV], 
        ROUND(AVG(CAST(bow AS float)), 2) AS Bow_AVG, ROUND(STDEV(CAST(bow AS float)), 2) AS Bow_STDEV, ROUND(AVG(CAST(warp AS float)), 2) AS Warp_AVG, ROUND(STDEV(CAST(warp AS float)), 2) 
        AS Warp_STDEV
	FROM dbo.ADE_data
	GROUP BY location, recipe, operator
	HAVING (location = N'PRESORT2,' OR location = N'PRESORT2') AND (recipe LIKE N'%spc%')
	ORDER BY MAX(EventTime) DESC
	)






