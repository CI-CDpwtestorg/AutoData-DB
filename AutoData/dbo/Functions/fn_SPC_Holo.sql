


/* SPC Functions By Tim Hughes */

CREATE  FUNCTION [dbo].[fn_SPC_Holo]()
RETURNS TABLE
AS
	RETURN 
	( 
	SELECT        TOP (10) MAX(Clock) AS TheDateTime, SourceCarrierID AS DSC, LotID AS Recipe, COUNT(DCIdx) AS R_Count, ROUND(AVG(CAST(CntThk AS float)), 2) AS CntThk_AVG, ROUND(STDEV(CAST(CntThk AS float)), 2) 
                         AS CntThk_StDev, ROUND(AVG(CAST(TTV AS float)), 2) AS TTV_AVG, ROUND(STDEV(CAST(TTV AS float)), 2) AS TTV_StDev, ROUND(AVG(CAST(TIR AS float)), 2) AS TIR_AVG, ROUND(STDEV(CAST(TIR AS float)), 2) 
                         AS TIR_StDev, ROUND(AVG(CAST(CntRes AS float)), 2) AS CntRes_AVG, ROUND(STDEV(CAST(CntRes AS float)), 2) AS CntRes_StDev, ROUND(AVG(CAST(Bow AS float)), 2) AS Bow_AVG, 
                         ROUND(STDEV(CAST(Bow AS float)), 2) AS Bow_StDev, ROUND(AVG(CAST(TotWarp AS float)), 2) AS TotWarp_AVG, ROUND(STDEV(CAST(TotWarp AS float)), 2) AS TotWarp_StDev
FROM            dbo.DC_OCR
GROUP BY SourceCarrierID, LotID
HAVING        (LotID LIKE N'%SPC')
ORDER BY TheDateTime DESC

	)







