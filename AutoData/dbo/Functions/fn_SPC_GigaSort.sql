


/* SPC Functions By Tim Hughes */

CREATE  FUNCTION [dbo].[fn_SPC_GigaSort]()
RETURNS TABLE
AS
	RETURN 
	( 
	SELECT        TOP (10) OperID, MAX(ReadTime) AS TheDateTime, JobID AS DSC, RecipeName AS Recipe, COUNT(WaferIdx) AS R_Count, ROUND(AVG(CAST(CtrThick AS float)), 2) AS CtrThick_AVG, 
                         ROUND(STDEV(CAST(CtrThick AS float)), 2) AS CtrThick_StDev, ROUND(AVG(CAST(Resistivity AS float)), 2) AS Resistivity_AVG, ROUND(STDEV(CAST(Resistivity AS float)), 2) AS Resistivity_StDev
FROM            dbo.tblWafers
GROUP BY OperID, JobID, RecipeName
HAVING        (RecipeName LIKE N'%spc%')
ORDER BY TheDateTime DESC
	)







