
CREATE  PROCEDURE exsil_user.[Geometry_Data_Old]
	(
		@PickTicket nvarchar(15)
		,@SampleSize int
	)
AS
Declare @Lots table 
	(Lot nVarChar(15))
insert @Lots SELECT distinct Lot FROM [$(ALTS)].dbo.q_Shipping_Lots WHERE PickTicket = @PickTicket
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
	,MaxThk real
	,Bow real
	,Warp real
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
	,MaxThk real
	,Bow real
	,Warp real
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
	,@MaxThk real
	,@Bow real
	,@Warp real
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
	, ADE_data.resistivity
	, ADE_data.bow
	, ADE_data.warp
FROM dbo.ADE_data INNER JOIN 
	[$(ALTS)].dbo.CofA_Info AS CI ON ADE_data.[id#] = CI.ID_NUMBER INNER JOIN
		@Lots A ON RIGHT(A.Lot, 4) = ADE_data.[wl#] 
			AND SUBSTRING(A.Lot, 6, LEN(A.Lot) - 10) = ADE_data.[run#]
WHERE (ADE_data.class=
            (SELECT DISTINCT F_SC1 FROM [$(ALTS)].dbo.CofA_Info
            WHERE ID_NUMBER = LEFT(A.Lot, 4)))
    AND (left(ADE_data.location,1)='F')
    AND (ADE_data.ave_thk<>99999)
    AND (ADE_data.ttv<>99999)
    AND (ADE_data.tir<>99999)
    AND (ADE_data.resistivity<200)
    AND (ADE_data.bow<>99999)
    AND (ADE_data.warp<>99999)
insert @Data
SELECT DC2.LotID
	, DC2.SourceCarrierID
	, DC2.EquipmentID
	, DC2.WaferClassName
    , DC2.CntThk
    , DC2.AvgThk
    , DC2.TTV
    , DC2.TIR
    , DC2.MinThk
    , DC2.CntRes
    , DC2.MaxThk
    , DC2.Bow
    , DC2.TotWarp
FROM dbo.DC_NEWDATA2 AS DC2 INNER JOIN
    [$(ALTS)].dbo.CofA_Info AS CI ON DC2.LotID = CI.ID_NUMBER INNER JOIN
    @Lots A ON SUBSTRING(A.Lot, 6, LEN(A.Lot) - 5) = DC2.SourceCarrierID
WHERE (DC2.WaferClassName =
    (SELECT DISTINCT H_SC1
    FROM          [$(ALTS)].dbo.CofA_Info
    WHERE      ID_NUMBER = LEFT(A.Lot, 4))
    ) 
    AND (DC2.TTV < 25) 
Declare @Cnt int Select @Cnt = count(*) from @Data
Declare @Increment int set @Increment=@Cnt/@SampleSize
if @Increment=1 begin 
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
	,MaxThk 
	,Bow
	,Warp
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
			,MaxThk 
			,Bow
			,Warp
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
			,@MaxThk 
			,@Bow
			,@Warp
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
			,@Res 
			,@MaxThk 
			,@Bow
			,@Warp)
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
				,@MaxThk 
				,@Bow
				,@Warp
		Set @Cnt = @Cnt+1
	end
	Close SampleData DeAllocate SampleData
	Select * from @Data1
end
	RETURN 


