
CREATE  FUNCTION exsil_user.fctn_Particle_Data_Recipe_SP1
	(
		@Recipe nvarchar(20)
		,@MainID nChar(4)
		,@Disposition nVarChar(8)
		,@CofA nVarChar(15)
	)
RETURNS TABLE
AS
	RETURN (SELECT SP1.[ID#]
		,SP1.[RUN#]
		,SP1.Wafer_log
		,SP1.SPRecipeName
		,SP1.DispositionName
		,BinCnt1 as [0.10]
		,BinCnt2 as [0.12]
		,BinCnt3 as [0.13]
		,BinCnt4 as [0.16]
		,BinCnt5 as [0.20]
		,BinCnt6 as [0.25]
		,BinCnt7 as [0.30]
		,CONVERT(nVarChar(10) ,SP1.CreationDate, 101) as [date]
	FROM         dbo.SP1_Data AS SP1
	WHERE     (SP1.DispositionName like @Disposition)
		AND (LEFT(SP1.ChannelID, 9) = 'Composite') 
		AND (SP1.SPRecipeName like @Recipe)

)

