









CREATE     FUNCTION dbo.fctn_Sati_PullADEDataByID ( @MainID as nvarchar(4) )

RETURNS TABLE 
		
AS
	
	RETURN 	
		SELECT     TOP 100 PERCENT [date], [time], operator, [id#], [wl#], [run#], location, recipe, quantity, wafer, class, cen_thk, ave_thk, resistivity, Res2, rgrad, ttv, tir, stir, 
                      bow, warp, [type], fpd, sfpd, Receiver, EventTime
FROM         dbo.ADE_data
WHERE     ([id#] = @MainID)
ORDER BY ENTRY DESC





