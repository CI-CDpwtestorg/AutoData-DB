CREATE PROCEDURE exsil_user.Geometry_Data_New
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
	,MaxThk real
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
	,@MaxThk real
	,@Bow real
	,@Warp real
	,@Receiver int

	,@F_SC1 as nVarChar(10)
	,@F_SC2 as nVarChar(10)
	,@MainID as nVarChar(4)

Select Top 1 @MainID = Lot from @Lots

EXEC [exsil_user].[Final2Bin3_FinalBin7] 

/*
Select * from @Lots
select @MainID as MainID
Select @F_SC1 As Class
Select @F_SC2 as Receiver
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
		, ADE_data.resistivity
		, ADE_data.bow
		, ADE_data.warp
		,ADE_data.Receiver
	FROM dbo.ADE_data INNER JOIN
			@Lots A ON RIGHT(A.Lot, 4) = ADE_data.[wl#] 
				AND SUBSTRING(A.Lot, 6, LEN(A.Lot) - 10) = ADE_data.[run#]
				INNER JOIN
                dbo.Sorter_Info ON ADE_data.recipe = Sorter_Info.ID AND ADE_data.location = Sorter_Info.Tool AND ADE_data.class = Sorter_Info.Class

	WHERE (CHARINDEX(CAST(ADE_data.Receiver AS char(1)), Sorter_Info.Receivers, 1) > 0)
		AND (DATEDIFF(d, Sorter_Info.EffectiveDtd, ADE_data.EventTime) >= 0) 
		AND ((DATEDIFF(d, Sorter_Info.ExpirationDtd, ADE_data.EventTime) < 0) or (Sorter_Info.ExpirationDtd IS NULL))
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
, 0
FROM dbo.DC_NEWDATA2 AS DC2 INNER JOIN
    [$(ALTS)].dbo.CofA_Info AS CI ON DC2.LotID = CI.ID_NUMBER INNER JOIN
    @Lots A ON SUBSTRING(A.Lot, 6, LEN(A.Lot) - 5) = DC2.SourceCarrierID
WHERE (DC2.WaferClassName =
    (SELECT DISTINCT H_SC1
    FROM          [$(ALTS)].dbo.CofA_Info
    WHERE      ID_NUMBER = @MainID)
    ) 
    AND (DC2.TTV <= 25) 

Declare @Cnt int Select @Cnt = count(*) from @Data

if @cnt=0 begin
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
	,ADE_data.Receiver
FROM dbo.ADE_data INNER JOIN
		@Lots A ON RIGHT(A.Lot, 4) = ADE_data.[wl#] 
			AND SUBSTRING(A.Lot, 6, LEN(A.Lot) - 10) = ADE_data.[run#]
			INNER JOIN
            dbo.Sorter_Info ON ADE_data.[id#] = Sorter_Info.ID AND ADE_data.location = Sorter_Info.Tool AND ADE_data.class = Sorter_Info.Class

WHERE (CHARINDEX(CAST(ADE_data.Receiver AS char(1)), Sorter_Info.Receivers, 1) > 0)
	AND (DATEDIFF(d, Sorter_Info.EffectiveDtd, ADE_data.EventTime) >= 0) 
	AND ((DATEDIFF(d, Sorter_Info.ExpirationDtd, ADE_data.EventTime) < 0) or (Sorter_Info.ExpirationDtd IS NULL))
	AND (ADE_data.ave_thk<>99999)
    AND (ADE_data.ttv<>99999)
	AND (ADE_data.tir<>99999)
    AND (ADE_data.resistivity<200)
    AND (ADE_data.bow<>99999)
    AND (ADE_data.warp<>99999)
    AND (ADE_data.[id#] in (SELECT   [From]
                         FROM      [$(ALTS)].dbo.TransferID_ByStage
                         WHERE   (StageName = N'Final Pack') AND ([To] = @MainID)))
Select @Cnt = count(*) from @Data
end
--Select * from @Data
Declare @Increment int set @Increment=@Cnt/@SampleSize

--Select @Cnt as Cnt
--select @Increment as increment

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
			,MaxThk 
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
			,@MaxThk 
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
			,@Res 
			,@MaxThk 
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
				,@MaxThk 
				,@Bow
				,@Warp
				,@Receiver
		Set @Cnt = @Cnt+1
	end
	Close SampleData DeAllocate SampleData

	Delete from dbo.Archive_CofA_Geometry where SO_Number=@PickTicket

	insert dbo.Archive_CofA_Geometry
	Select @PickTicket, @SampleSize, * from @Data1

	Select * from @Data1
end
	RETURN 
