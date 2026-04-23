


/* SPC Functions By Tim Hughes */

CREATE  FUNCTION  [dbo].[fn_SPC_ICPMS_8900_QC]()
RETURNS TABLE
AS
	RETURN 
	( 
	SELECT        TOP (20) [Date/[Time]], Source, [Test Type], Idenyification, Location, Na AS Na_AVG, Al AS Al_AVG, K AS K_AVG, Ca AS Ca_AVG, Ti AS Ti_AVG, V AS V_AVG, Cr AS Cr_AVG, Mn AS Mn_AVG, Fe AS Fe_AVG, Co AS Co_AVG, Ni AS Ni_AVG, Cu AS Cu_AVG, Zn AS Zn_AVG, Mo AS Mo_AVG, Mo AS Ag_AVG, Notes AS DSC, 'SPC' AS Recipe, 1 AS R_Count

FROM            [$(ALTS)].dbo.[GFAAS Data]
WHERE        (Source = N'Lab') AND (Notes LIKE N'QC-%')
ORDER BY [Date/[Time]] DESC
	)







