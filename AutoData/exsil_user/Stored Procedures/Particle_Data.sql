

CREATE  PROCEDURE exsil_user.Particle_Data
	(
		@PickTicket nvarchar(15)
		,@SampleSize int
		,@SODs bit
	)
AS
Declare @Lots table 
	(Lot nVarChar(15))
insert @Lots SELECT distinct Lot FROM [$(ALTS)].dbo.q_Shipping_Lots WHERE PickTicket = @PickTicket

--SELECT distinct Lot FROM [$(ALTS)].dbo.q_Shipping_Lots WHERE PickTicket = @PickTicket

Declare @Data table
	([ID#] nVarChar(4)
	,[Run#] nVarChar(5)
	,Wafer_Log nVarChar(4)
	,Recipe nVarChar(80)
	,Result nVarChar(80)
	,[100_BIN] int
	,[120_BIN] int
	,[130_BIN] int
	,[160_BIN] int
	,[200_BIN] int
	,[250_BIN] int
	,[300_BIN] int
	,[Date] nVarChar(10)
	)
Declare @Data1 table
	([ID#] nVarChar(4)
	,[Run#] nVarChar(5)
	,Wafer_Log nVarChar(4)
	,Recipe nVarChar(80)
	,Result nVarChar(80)
	,[100_BIN] int
	,[120_BIN] int
	,[130_BIN] int
	,[160_BIN] int
	,[200_BIN] int
	,[250_BIN] int
	,[300_BIN] int
	)
Declare @ID# nVarChar(4)
	,@Run# nVarChar(5)
	,@Wafer_Log nVarChar(4)
	,@Recipe nVarChar(80)
	,@Result nVarChar(80)
	,@BIN100 int
	,@BIN120 int
	,@BIN130 int
	,@BIN160 int
	,@BIN200 int
	,@BIN250 int
	,@BIN300 int
	,@MainID as nVarChar(4)
	
Select Top 1 @MainID = Lot from @Lots

insert @Data
	SELECT     substring(td.[ID#],1,4)
		, td.[RUN#]
		, td.WAFER_LOG
		, td.RECIPE
		, td.SORT
		, td.[500_BIN]
		, td.[1000_BIN]
		, td.[130_BIN]
		, td.[160_BIN]
		, td.[200_BIN]
		, td.[250_BIN]
		, td.[300_BIN]
		, convert(nVarChar(10)
		, cast(td.[DATE] as smalldatetime),101)
	FROM         dbo.Tencor_Data AS td INNER JOIN
						@Lots A ON RIGHT(A.Lot, 4) = td.WAFER_LOG 
							AND SUBSTRING(A.Lot, 6, LEN(A.Lot) - 10) = td.[RUN#]
	WHERE @MainID=(case when td.SORT = 'PASS'then substring(td.RECIPE,charindex('-',td.RECIPE,1)+1,4) else td.SORT end)
insert @Data
	SELECT substring(cr.[ID#],1,4)
		, cr.[RUN#]
		, cr.WAFER_LOG
		, cr.RECIPE
		, cr.GRADE
		, 1 AS [100_BIN]
		, cr.[120_BIN]
		, cr.[130_BIN]
		, cr.[160_BIN]
		, cr.[200_BIN]
		, cr.[250_BIN]
		, cr.[300_BIN]
		, convert(nVarChar(10),cast(cr.[DATE] as smalldatetime),101)
	FROM dbo.CR81_DATA AS cr INNER JOIN
			@Lots A ON RIGHT(A.Lot, 4) = cr.WAFER_LOG 
				AND SUBSTRING(A.Lot, 6, LEN(A.Lot) - 10) = cr.[RUN#]
	WHERE @MainID=(case when ltrim(cr.GRADE)='PASS' then substring(cr.RECIPE,3,4) else ltrim(cr.GRADE) end)
		
if @SODs=1 begin
insert @Data
	SELECT     substring(sp.[ID#],1,4), sp.[RUN#], sp.Wafer_log, sp.SPRecipeName, sp.DispositionName, 
		CASE ci.sod_AT WHEN '0.12um' THEN sp.SOD1 + sp.SOD2 WHEN '0.13um' THEN sp.SOD1 + sp.SOD2
		+ sp.SOD3 WHEN '0.16um' THEN sp.SOD1 + sp.SOD2 + sp.SOD3 + sp.SOD4 WHEN '0.20um'
		THEN sp.SOD1 + sp.SOD2 + sp.SOD3 + sp.SOD4 + sp.SOD5 WHEN '0.25um' THEN sp.SOD1
		+ sp.SOD2 + sp.SOD3 + sp.SOD4 + sp.SOD5 + sp.SOD6 WHEN '0.30um' THEN sp.SOD1
		+ sp.SOD2 + sp.SOD3 + sp.SOD4 + sp.SOD5 + sp.SOD6 + sp.SOD7 ELSE sp.SOD1
		END AS [100_BIN], 
		CASE ci.sod_AT WHEN '0.13um' THEN sp.SOD2 + sp.SOD3 WHEN '0.16um' THEN sp.SOD2 + sp.SOD3
		+ sp.SOD4 WHEN '0.20um' THEN sp.SOD2 + sp.SOD3 + sp.SOD4 + sp.SOD5 WHEN '0.25um'
		THEN sp.SOD2 + sp.SOD3 + sp.SOD4 + sp.SOD5 + sp.SOD6 WHEN '0.30um' THEN sp.SOD2
		+ sp.SOD3 + sp.SOD4 + sp.SOD5 + sp.SOD6 + sp.SOD7 ELSE sp.SOD2 END AS [120_BIN],
		CASE ci.sod_AT WHEN '0.16um' THEN sp.SOD3 + sp.SOD4 WHEN '0.20um' THEN sp.SOD3 + sp.SOD4
		+ sp.SOD5 WHEN '0.25um' THEN sp.SOD3 + sp.SOD4 + sp.SOD5 + sp.SOD6 WHEN '0.30um'
		THEN sp.SOD3 + sp.SOD4 + sp.SOD5 + sp.SOD6 + sp.SOD7 ELSE sp.SOD3 END
		AS [130_BIN], 
		CASE ci.sod_AT WHEN '0.20um' THEN sp.SOD4 + sp.SOD5 WHEN '0.25um' THEN sp.SOD4 + sp.SOD5
		+ sp.SOD6 WHEN '0.30um' THEN sp.SOD4 + sp.SOD5 + sp.SOD6 + sp.SOD7 ELSE sp.SOD4
		END AS [160_BIN], 
		CASE ci.sod_AT WHEN '0.25um' THEN sp.SOD5 + sp.SOD6 WHEN '0.30um' THEN sp.SOD5 + sp.SOD6
		+ sp.SOD7 ELSE sp.SOD5 END AS [200_BIN], 
		CASE ci.sod_AT WHEN '0.30um' THEN sp.SOD6 + sp.SOD7 ELSE sp.SOD6 END AS [250_BIN], 
		sp.SOD7 AS [300_BIN], CONVERT(nVarChar(10), sp.CreationDate, 101) 
	FROM         dbo.SP1_Data AS sp INNER JOIN
		[$(ALTS)].dbo.CofA_Info AS ci ON sp.[ID#] = ci.ID_NUMBER INNER JOIN
		@Lots A ON RIGHT(A.Lot, 4) = sp.Wafer_log AND SUBSTRING(A.Lot, 6, LEN(A.Lot) - 10) 
		= sp.[RUN#]
	WHERE     @MainID=(case when substring(sp.DispositionName,1,4) ='PASS' then substring(sp.SPRecipeName,4,4) else sp.DispositionName end)
		AND (sp.SOD2 < 738) 
		AND (sp.SOD4 < 200) 
		--AND (sp.BinCnt4 < 200) 
		AND (LEFT(sp.ChannelID, 9) = 'Composite') 
end
else begin
insert @Data
SELECT substring(sp.[ID#],1,4)
	,sp.[RUN#]
	,sp.Wafer_log
	,sp.SPRecipeName
	,sp.DispositionName
	,BinCnt1
	,BinCnt2
	,BinCnt3
	,BinCnt4
	,BinCnt5
	,BinCnt6
	,BinCnt7
    ,CONVERT(nVarChar(10) ,sp.CreationDate, 101) 
FROM         dbo.SP1_Data AS sp INNER JOIN
    @Lots A ON RIGHT(A.Lot, 4) = sp.Wafer_log AND SUBSTRING(A.Lot, 6, LEN(A.Lot) - 10) 
    = sp.[RUN#]
WHERE     @MainID=(case when substring(sp.DispositionName,1,4) ='PASS' then substring(sp.SPRecipeName,4,4) else sp.DispositionName end)
	--AND (sp.SOD2 < 738) 
	--AND (sp.SOD4 < 200) 
	--AND (sp.BinCnt4 < 200) 
	AND (LEFT(sp.ChannelID, 9) = 'Composite') 
end
Declare @Cnt int Select @Cnt = count(*) from @Data
if @Cnt<@SampleSize begin
	insert @Data
		SELECT substring(cr.[ID#],1,4)
			, cr.[RUN#]
			, cr.WAFER_LOG
			,cr.RECIPE
			, cr.GRADE
			,1 AS [100_BIN]
			,cr.[120_BIN]
			, cr.[130_BIN]
			,cr.[160_BIN]
			,cr.[200_BIN]
			,cr.[250_BIN]
			,cr.[300_BIN]
			,convert(nVarChar(10)
			,cast(cr.[DATE] as smalldatetime),101)
		FROM dbo.CR81_DATA AS cr INNER JOIN
				@Lots A ON RIGHT(A.Lot, 4) = cr.WAFER_LOG 
					AND SUBSTRING(A.Lot, 6, LEN(A.Lot) - 10) = cr.[RUN#]
		WHERE (case when ltrim(cr.GRADE)='PASS' then substring(cr.RECIPE,3,4) else ltrim(cr.GRADE) end) 
				in (SELECT  [From] FROM [$(ALTS)].dbo.TransferID_ByStage WHERE (StageName = N'Final Pack' or StageName = N'PWC' or StageName = N'ALL') AND ([To] = @MainID))
			AND (cr.[160_BIN] < 200) 
		if @SODs=1 begin
	insert @Data
		SELECT     substring(sp.[ID#],1,4), sp.[RUN#], sp.Wafer_log, sp.SPRecipeName, sp.DispositionName, 
			CASE ci.sod_AT WHEN '0.12um' THEN sp.SOD1 + sp.SOD2 WHEN '0.13um' THEN sp.SOD1 + sp.SOD2
			+ sp.SOD3 WHEN '0.16um' THEN sp.SOD1 + sp.SOD2 + sp.SOD3 + sp.SOD4 WHEN '0.20um'
			THEN sp.SOD1 + sp.SOD2 + sp.SOD3 + sp.SOD4 + sp.SOD5 WHEN '0.25um' THEN sp.SOD1
			+ sp.SOD2 + sp.SOD3 + sp.SOD4 + sp.SOD5 + sp.SOD6 WHEN '0.30um' THEN sp.SOD1
			+ sp.SOD2 + sp.SOD3 + sp.SOD4 + sp.SOD5 + sp.SOD6 + sp.SOD7 ELSE sp.SOD1
			END AS [100_BIN], 
			CASE ci.sod_AT WHEN '0.13um' THEN sp.SOD2 + sp.SOD3 WHEN '0.16um' THEN sp.SOD2 + sp.SOD3
			+ sp.SOD4 WHEN '0.20um' THEN sp.SOD2 + sp.SOD3 + sp.SOD4 + sp.SOD5 WHEN '0.25um'
			THEN sp.SOD2 + sp.SOD3 + sp.SOD4 + sp.SOD5 + sp.SOD6 WHEN '0.30um' THEN sp.SOD2
			+ sp.SOD3 + sp.SOD4 + sp.SOD5 + sp.SOD6 + sp.SOD7 ELSE sp.SOD2 END AS [120_BIN],
			CASE ci.sod_AT WHEN '0.16um' THEN sp.SOD3 + sp.SOD4 WHEN '0.20um' THEN sp.SOD3 + sp.SOD4
			+ sp.SOD5 WHEN '0.25um' THEN sp.SOD3 + sp.SOD4 + sp.SOD5 + sp.SOD6 WHEN '0.30um'
			THEN sp.SOD3 + sp.SOD4 + sp.SOD5 + sp.SOD6 + sp.SOD7 ELSE sp.SOD3 END
			AS [130_BIN], 
			CASE ci.sod_AT WHEN '0.20um' THEN sp.SOD4 + sp.SOD5 WHEN '0.25um' THEN sp.SOD4 + sp.SOD5
			+ sp.SOD6 WHEN '0.30um' THEN sp.SOD4 + sp.SOD5 + sp.SOD6 + sp.SOD7 ELSE sp.SOD4
			END AS [160_BIN], 
			CASE ci.sod_AT WHEN '0.25um' THEN sp.SOD5 + sp.SOD6 WHEN '0.30um' THEN sp.SOD5 + sp.SOD6
			+ sp.SOD7 ELSE sp.SOD5 END AS [200_BIN], 
			CASE ci.sod_AT WHEN '0.30um' THEN sp.SOD6 + sp.SOD7 ELSE sp.SOD6 END AS [250_BIN], 
			sp.SOD7 AS [300_BIN], CONVERT(nVarChar(10), sp.CreationDate, 101) 
		FROM         dbo.SP1_Data AS sp INNER JOIN
	   		[$(ALTS)].dbo.CofA_Info AS ci ON sp.[ID#] = ci.ID_NUMBER INNER JOIN
			@Lots A ON RIGHT(A.Lot, 4) = sp.Wafer_log AND SUBSTRING(A.Lot, 6, LEN(A.Lot) - 10) 
			= sp.[RUN#]
		WHERE (case when substring(sp.DispositionName,1,4) ='PASS' then substring(sp.SPRecipeName,4,4) else sp.DispositionName end) 
				in (SELECT [From] FROM [$(ALTS)].dbo.TransferID_ByStage WHERE   (StageName = N'Final Pack' or StageName = N'PWC' or StageName = N'ALL') AND ([To] = @MainID))
			AND (sp.SOD2 < 738) 
			AND (sp.SOD4 < 200) 
			--AND (sp.BinCnt4 < 200) 
			AND (LEFT(sp.ChannelID, 9) = 'Composite') 
	end
else begin
	insert @Data
		SELECT substring(sp.[ID#],1,4)
			,sp.[RUN#]
			,sp.Wafer_log
			,sp.SPRecipeName
			,sp.DispositionName
			,BinCnt1
			,BinCnt2
			,BinCnt3
			,BinCnt4
			,BinCnt5
			,BinCnt6
			,BinCnt7
			,CONVERT(nVarChar(10) ,sp.CreationDate, 101) 
		FROM         dbo.SP1_Data AS sp INNER JOIN
			@Lots A ON RIGHT(A.Lot, 4) = sp.Wafer_log AND SUBSTRING(A.Lot, 6, LEN(A.Lot) - 10) 
			= sp.[RUN#]
		WHERE (case when substring(sp.DispositionName,1,4) ='PASS' then substring(sp.SPRecipeName,4,4) else sp.DispositionName end) 
				in (SELECT [From] FROM [$(ALTS)].dbo.TransferID_ByStage WHERE   (StageName = N'Final Pack' or StageName = N'PWC' or StageName = N'ALL') AND ([To] = @MainID))
			--AND (sp.SOD2 < 738) 
			--AND (sp.SOD4 < 200) 
			--AND (sp.BinCnt4 < 200) 
			AND (LEFT(sp.ChannelID, 9) = 'Composite') 
	end
	Select @Cnt = count(*) from @Data
end

Declare @Increment int set @Increment=@Cnt/@SampleSize
if @Increment=1 begin 
Select [ID#] 
	,[Run#]
	,Wafer_Log 
	,Recipe 
	,Result 
	,[100_BIN] 
	,[120_BIN] 
	,[130_BIN] 
	,[160_BIN] 	
	,[200_BIN] 
	,[250_BIN] 
	,[300_BIN] 
 from @Data
end
else begin
	set @Cnt=1
	Declare SampleData Cursor Scroll for 
		Select [ID#] 
			,[Run#]
			,Wafer_Log 
			,Recipe 
			,Result 
			,[100_BIN] 
			,[120_BIN] 
			,[130_BIN] 
			,[160_BIN] 	
			,[200_BIN] 
			,[250_BIN] 
			,[300_BIN] 
		from @Data
		open SampleData
	Fetch Relative @Increment from SampleData 
		into @ID# 
			,@Run#
			,@Wafer_Log 
			,@Recipe 
			,@Result 
			,@BIN100
			,@BIN120
			,@BIN130
			,@BIN160
			,@BIN200 
			,@BIN250 
			,@BIN300
	While @@FETCH_STATUS = 0 and @Cnt<=@SampleSize begin
		Insert @Data1 Values(@ID# 
			,@Run#
			,@Wafer_Log 
			,@Recipe 
			,@Result 
			,@BIN100
			,@BIN120
			,@BIN130
			,@BIN160
			,@BIN200 
			,@BIN250 
			,@BIN300)
		Fetch Relative @Increment from SampleData 
			into @ID# 
				,@Run#
				,@Wafer_Log 
				,@Recipe 
				,@Result 
				,@BIN100
				,@BIN120
				,@BIN130
				,@BIN160
				,@BIN200 
				,@BIN250 
				,@BIN300
		Set @Cnt = @Cnt+1
	end
	Close SampleData DeAllocate SampleData
	
	Delete from dbo.Archive_CofA_Particle where SO_Number=@PickTicket

	insert dbo.Archive_CofA_Particle
	Select @PickTicket, @SampleSize, * from @Data1

	Select * from @Data1
end
	RETURN

