CREATE FUNCTION exsil_user.fctn_Particle_Data_Recipe
	(
		@Recipe nvarchar(20)
		,@MainID nChar(4)
		,@Disposition nVarChar(8)
		,@Tencor_Sort nVarChar(8)
		,@CR81_Sort nVarChar(8)
		,@CofA nVarChar(15)
	)
RETURNS @Data TABLE ([100_BIN] int
			, [120_BIN] int
			, [130_BIN] int
			, [160_BIN] int
			, [200_BIN] int
			, [250_BIN] int
			, [300_BIN] int
			, [Date] nVarChar(10))
AS
	BEGIN
		insert @Data
		SELECT TD.[500_BIN]
			, TD.[1000_BIN]
			, TD.[130_BIN]
			, TD.[160_BIN]
			, TD.[200_BIN]
			, TD.[250_BIN]
			, TD.[300_BIN]	
			, TD.[DATE]		
		FROM  dbo.Tencor_Data AS TD
		WHERE     (TD.SORT like @Tencor_Sort)
			AND (TD.RECIPE like 'T-' + @Recipe)
			AND (TD.[500_BIN]<>999999)
		insert @Data
		SELECT 1 AS [100_BIN]
			, CR81.[120_BIN]
			, CR81.[130_BIN]
			, CR81.[160_BIN]
			, CR81.[200_BIN]
			, CR81.[250_BIN]
			, CR81.[300_BIN]
			, CR81.[DATE]
		FROM dbo.CR81_DATA AS CR81
		WHERE (CR81.GRADE like '%' + @CR81_Sort)  
			AND (CR81.RECIPE like 'C-' + @Recipe)
			AND (CR81.[120_BIN]<>999999)
		INSERT INTO @Data 
		SELECT 
		CASE CI.sod_AT 
			WHEN '0.12um' THEN SP1.SOD1 + SP1.SOD2 
			WHEN '0.13um' THEN SP1.SOD1 + SP1.SOD2 + SP1.SOD3 
			WHEN '0.16um' THEN SP1.SOD1 + SP1.SOD2 + SP1.SOD3 + SP1.SOD4 
			WHEN '0.20um' THEN SP1.SOD1 + SP1.SOD2 + SP1.SOD3 + SP1.SOD4 + SP1.SOD5 
			WHEN '0.25um' THEN SP1.SOD1 + SP1.SOD2 + SP1.SOD3 + SP1.SOD4 + SP1.SOD5 + SP1.SOD6 
			WHEN '0.30um' THEN SP1.SOD1 + SP1.SOD2 + SP1.SOD3 + SP1.SOD4 + SP1.SOD5 + SP1.SOD6 + SP1.SOD7 
			ELSE SP1.SOD1 END 
		AS [100_BIN]
		, CASE CI.sod_AT 
			WHEN '0.13um' THEN SP1.SOD2 + SP1.SOD3 
			WHEN '0.16um' THEN SP1.SOD2 + SP1.SOD3 + SP1.SOD4 
			WHEN '0.20um' THEN SP1.SOD2 + SP1.SOD3 + SP1.SOD4 + SP1.SOD5 
			WHEN '0.25um' THEN SP1.SOD2 + SP1.SOD3 + SP1.SOD4 + SP1.SOD5 + SP1.SOD6 
			WHEN '0.30um' THEN SP1.SOD2 + SP1.SOD3 + SP1.SOD4 + SP1.SOD5 + SP1.SOD6 + SP1.SOD7 
			ELSE SP1.SOD2 END 
		AS [120_BIN]
		, CASE CI.sod_AT 
			WHEN '0.16um' THEN SP1.SOD3 + SP1.SOD4 
			WHEN '0.20um' THEN SP1.SOD3 + SP1.SOD4 + SP1.SOD5 
			WHEN '0.25um' THEN SP1.SOD3 + SP1.SOD4 + SP1.SOD5 + SP1.SOD6 
			WHEN '0.30um' THEN SP1.SOD3 + SP1.SOD4 + SP1.SOD5 + SP1.SOD6 + SP1.SOD7 
			ELSE SP1.SOD3 END
		AS [130_BIN]
		, CASE CI.sod_AT 
			WHEN '0.20um' THEN SP1.SOD4 + SP1.SOD5 
			WHEN '0.25um' THEN SP1.SOD4 + SP1.SOD5 + SP1.SOD6 
			WHEN '0.30um' THEN SP1.SOD4 + SP1.SOD5 + SP1.SOD6 + SP1.SOD7 
			ELSE SP1.SOD4 END 
		AS [160_BIN]
		, CASE CI.sod_AT 
			WHEN '0.25um' THEN SP1.SOD5 + SP1.SOD6 
			WHEN '0.30um' THEN SP1.SOD5 + SP1.SOD6 + SP1.SOD7 
			ELSE SP1.SOD5 END 
		AS [200_BIN]
		, CASE CI.sod_AT 
			WHEN '0.30um' THEN SP1.SOD6 + SP1.SOD7 
			ELSE SP1.SOD6 END 
		AS [250_BIN]
		, SP1.SOD7 
		AS [300_BIN]
		, CONVERT(nVarChar(10), SP1.CreationDate, 101) as [Date]
	FROM dbo.SP1_Data AS SP1 CROSS JOIN [$(ALTS)].dbo.CofA_Info AS CI
	WHERE     (SP1.DispositionName like @Disposition)
		AND (LEFT(SP1.ChannelID, 9) = 'Composite') 
		AND (SP1.SPRecipeName like 'T2-' +@Recipe)
		AND (CI.ID_NUMBER = @MainID)  
		AND (SP1.SOD1 <> 999999)
	RETURN
	END