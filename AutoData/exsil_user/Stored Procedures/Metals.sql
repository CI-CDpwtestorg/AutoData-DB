CREATE PROCEDURE exsil_user.Metals
(@PickTicket nvarchar(15))
AS
Declare @MetalsData Table(
	  Ca decimal(4,3)
	, Ma decimal(4,3)
	, Ni decimal(4,3)
	, Zn decimal(4,3)
	, Al decimal(4,3)
	, Fe decimal(4,3)
	, Cr decimal(4,3)
	, Cu decimal(4,3)
	, Na decimal(4,3)
	, K decimal(4,3))
	
	insert @MetalsData
	SELECT Ca, Ma, Ni, Zn, Al, Fe, Cr, Cu, Na, K FROM [$(ALTS)].[dbo].[fctn_MetalsSample](@PickTicket)
	
	Delete from dbo.Archive_CofA_Metals where SO_Number=@PickTicket
	
	insert dbo.Archive_CofA_Metals
	SELECT @PickTicket as SO_Number,Ca, Ma, Ni, Zn, Al, Fe, Cr, Cu, Na, K FROM @MetalsData
	
	SELECT Ca, Ma, Ni, Zn, Al, Fe, Cr, Cu, Na, K FROM @MetalsData
	
	RETURN
