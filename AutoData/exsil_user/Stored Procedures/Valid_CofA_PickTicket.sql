
CREATE  PROCEDURE exsil_user.Valid_CofA_PickTicket
	(
		@PickTicket nvarchar(15)
		,@Result bit output
	)
AS
	declare @Cnt int
--	SELECT  @Cnt=COUNT(Pallet_Key)
--	FROM         [$(ALTS)].dbo.ShippingUnit 
	SELECT  @Cnt=COUNT(PickTicket)
	FROM         [$(ALTS)].dbo.Pick_Log
	WHERE     (PickTicket = @PickTicket)
	
	set @Result=case  when @Cnt>0 then 1 else 0 end

