CREATE PROCEDURE exsil_user.Geometry_Data_Recipe
	(
		@Recipe nvarchar(20)
		,@SampleSize int
		,@MainID nChar(4)
		,@Receivers nVarChar(8)
		,@CofA nVarChar(15)
	)
AS
Declare @Data table
	(WL_Lot nVarChar(50)
	,Run_SourceCarrierID nVarChar(50)
	,Loc_EquipmentID nVarChar(50)
	,Class nVarChar(30)
	,CntThk real
	,AvgThk real
	,TTV real
	,TIR real
	,Stir_MinThk real
	,Res real
	,ResGradient real
	,Bow real
	,Warp real
	,Receiver int 
	)
Declare @Data1 table
	(WL_Lot nVarChar(50)
	,Run_SourceCarrierID nVarChar(50)
	,Loc_EquipmentID nVarChar(50)
	,Class nVarChar(30)
	,CntThk real
	,AvgThk real
	,TTV real
	,TIR real
	,Stir_MinThk real
	,Res real
	,ResGradient real
	,Bow real
	,Warp real
	,Receiver int 
	)
Declare @WL_Lot nVarChar(50)
	,@Run_SourceCarrierID nVarChar(50)
	,@Loc_EquipmentID nVarChar(50)
	,@Class nVarChar(30)
	,@CntThk real
	,@AvgThk real
	,@TTV real
	,@TIR real
	,@Stir_MinThk real
	,@Res real
	,@ResGradient real
	,@Bow real
	,@Warp real
	,@Receiver int

	,@F_SC1 as nVarChar(10)
	,@F_SC2 as nVarChar(10)

Declare @Res_Multiplier int
SELECT   TOP 1 @Res_Multiplier = CASE RES_HI_LO WHEN 'LOW' THEN 1000 ELSE 1 END
FROM      [$(ALTS)].dbo.CofA_Info
WHERE   (ID_NUMBER = @MainID)

--EXEC [exsil_user].[Final2Bin3_FinalBin7] 

/*
Select * from @Lots
select @MainID as MainID
Select @F_SC1 As Class
Select @F_SC2 as Receiver
Select @Res_Multiplier
*/	

	insert @Data
	SELECT 
		ADE_data.[wl#]
		, ADE_data.[run#]
		, ADE_data.location
		, ADE_data.class
		, ADE_data.cen_thk
		, ADE_data.ave_thk
		, ADE_data.ttv
		, ADE_data.tir
		, ADE_data.stir
		, ADE_data.resistivity
		, ADE_data.rgrad
		, ADE_data.bow
		, ADE_data.warp
		, ADE_data.Receiver
	FROM dbo.ADE_data 
	WHERE (CHARINDEX(CAST(ADE_data.Receiver AS char(1)), @Receivers, 1) > 0)
		AND (ADE_data.class='Accept')
		AND (ADE_data.recipe = @Recipe)
	    AND (ADE_data.ave_thk<>99999)
	    AND (ADE_data.ttv<>99999)
	    AND (ADE_data.tir<>99999)
	    AND (ADE_data.resistivity<200)
	    AND (ADE_data.bow<>99999)
	    AND (ADE_data.warp<>99999)

Declare @Cnt int Select @Cnt = count(*) from @Data

--Select * from @Data
Declare @Increment int set @Increment=@Cnt/@SampleSize

--Select @Cnt as Cnt
--select @Increment as increment

if @Increment=1 begin 

	Insert @Data1
		Select WL_Lot
			,Run_SourceCarrierID
			,Loc_EquipmentID 
			,Class 
			,CntThk
			,AvgThk
			,TTV 
			,TIR 
			,Stir_MinThk 
			,Res / @Res_Multiplier
			,ResGradient 
			,Bow
			,Warp
			,Receiver
		from @Data
end
else begin
	set @Cnt=1
	Declare SampleData Cursor Scroll for 
		Select WL_Lot
			,Run_SourceCarrierID
			,Loc_EquipmentID 
			,Class 
			,CntThk
			,AvgThk
			,TTV 
			,TIR 
			,Stir_MinThk 
			,Res
			,ResGradient 
			,Bow
			,Warp
			,Receiver
		from @Data
		open SampleData
	Fetch Relative @Increment from SampleData 
		into @WL_Lot
			,@Run_SourceCarrierID
			,@Loc_EquipmentID 
			,@Class 
			,@CntThk
			,@AvgThk
			,@TTV 
			,@TIR 
			,@Stir_MinThk 
			,@Res 
			,@ResGradient 
			,@Bow
			,@Warp
			,@Receiver
	While @@FETCH_STATUS = 0 and @Cnt<=@SampleSize begin
		Insert @Data1 Values
			(@WL_Lot
			,@Run_SourceCarrierID
			,@Loc_EquipmentID 
			,@Class 
			,@CntThk
			,@AvgThk
			,@TTV 
			,@TIR 
			,@Stir_MinThk 
			,@Res / @Res_Multiplier
			,@ResGradient 
			,@Bow
			,@Warp
			,@Receiver)
		Fetch Relative @Increment from SampleData 
			into @WL_Lot
				,@Run_SourceCarrierID
				,@Loc_EquipmentID 
				,@Class 
				,@CntThk
				,@AvgThk
				,@TTV 
				,@TIR 
				,@Stir_MinThk 
				,@Res 
				,@ResGradient
				,@Bow
				,@Warp
				,@Receiver
		Set @Cnt = @Cnt+1
	end
	Close SampleData DeAllocate SampleData
end

Delete from dbo.Archive_CofA_Geometry where SO_Number=@CofA

insert dbo.Archive_CofA_Geometry
Select @CofA, @SampleSize, * from @Data1

Select * from @Data1
	RETURN