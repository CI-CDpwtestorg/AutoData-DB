


CREATE   PROCEDURE exsil_user.Lot_Query
	(
		@PickTicket nvarchar(15)
	)
AS
Declare @Lot nVarChar(15)
	,@Lot1 nVarChar(15)
	,@Lot2 nVarChar(15)
	,@Lot3 nVarChar(15)
	,@Lot4 nVarChar(15)
	,@Lot5 nVarChar(15)
	,@Lot6 nVarChar(15)
	,@Lot7 nVarChar(15)
	,@Lot8 nVarChar(15)
	,@Lot9 nVarChar(15)
	,@Lot10 nVarChar(15)
	,@Qty int
	,@Cnt int Set @Cnt=2
	Declare Lot Cursor Scroll for 
		Select Lot from [$(ALTS)].dbo.q_Shipping_Lots Where PickTicket=@PickTicket And Lot not Like '%RJCT%'
		open Lot
	Fetch first from Lot into @Lot1
	Fetch Next from Lot into @Lot
	While @@FETCH_STATUS = 0 begin
		If @Cnt=2 set @Lot2=@Lot
		else If @Cnt= 3 set @Lot3 =@Lot
		else If @Cnt= 4 set @Lot4 =@Lot
		else If @Cnt= 5 set @Lot5 =@Lot
		else If @Cnt= 6 set @Lot6 =@Lot
		else If @Cnt= 7 set @Lot7 =@Lot
		else If @Cnt= 8 set @Lot8 =@Lot
		else If @Cnt= 9 set @Lot9 =@Lot
		else If @Cnt= 10 set @Lot10 =@Lot
		Fetch Next from Lot into @Lot
		Set @Cnt = @Cnt+1
	end
	Close Lot DeAllocate Lot
	
SELECT   @Qty=SUM(Qty)
FROM      [$(ALTS)].dbo.q_Shipping_lots
WHERE   (PickTicket = @PickTicket) AND (Lot NOT LIKE '%RJCT%')

	Delete from dbo.Archive_CofA_Lot where SO_Number=@PickTicket
	insert dbo.Archive_CofA_Lot
	select PickTicket as SO_Number
		, (SELECT EventTime FROM  [$(ALTS)].dbo.Pick_ShippingUnit WHERE (PickTicket = @PickTicket))
		,@Qty as Qty
		,PO_Number
		,@Lot1 as LOT1
		,@Lot2 as LOT2
		,@Lot3 as LOT3
		,@Lot4 as LOT4
		,@Lot5 as LOT5
		,@Lot6 as LOT6
		,@Lot7 as LOT7
		,@Lot8 as LOT8
		,@Lot9 as LOT9
		,@Lot10 as LOT10
	from [$(ALTS)].exsil_user.q_Shipping_SO_PO 
	Where PickTicket=@PickTicket

select PickTicket as SO_Number
	,@Qty as Qty
	,PO_Number
	,@Lot1 as LOT1
	,@Lot2 as LOT2
	,@Lot3 as LOT3
	,@Lot4 as LOT4
	,@Lot5 as LOT5
	,@Lot6 as LOT6
	,@Lot7 as LOT7
	,@Lot8 as LOT8
	,@Lot9 as LOT9
	,@Lot10 as LOT10
from [$(ALTS)].exsil_user.q_Shipping_SO_PO 
Where PickTicket=@PickTicket	RETURN 



