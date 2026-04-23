
CREATE FUNCTION exsil_user.fctn_Geometry_Data_Recipe
	(
		@Recipe nvarchar(20)
		,@MainID nChar(4)
		,@Receivers_F nVarChar(8)
		,@Receivers_F2 nVarChar(8)
		,@Receivers_F3 nVarChar(8)
		,@Receivers_F4 nVarChar(8)
		,@CofA nVarChar(15)
	)
RETURNS TABLE
AS
	RETURN (	SELECT 
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
	WHERE (Case ADE_data.location
			When 'Final' 
				then CHARINDEX(CAST(ADE_data.Receiver AS char(1)), @Receivers_F, 1) 
			When 'Final2' 	
				then CHARINDEX(CAST(ADE_data.Receiver AS char(1)), @Receivers_F2, 1) 
			When 'Final3' 
				then CHARINDEX(CAST(ADE_data.Receiver AS char(1)), @Receivers_F3, 1) 
			When 'Final4' 
				then CHARINDEX(CAST(ADE_data.Receiver AS char(1)), @Receivers_F4, 1) 
			end
			> 0)
		AND (ADE_data.class='Accept')
		AND (ADE_data.recipe = @Recipe)
	    AND (ADE_data.ave_thk<>99999)
	    AND (ADE_data.ttv<>99999)
	    AND (ADE_data.tir<>99999)
	    AND (ADE_data.resistivity<200)
	    AND (ADE_data.bow<>99999)
	    AND (ADE_data.warp<>99999)
)

