


CREATE PROCEDURE exsil_user.Particle_Data_V0
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
SELECT     Tencor_Data.[ID#], Tencor_Data.[RUN#], Tencor_Data.WAFER_LOG, Tencor_Data.RECIPE, Tencor_Data.SORT, 
                      1 AS [100_BIN], 1 AS [120_BIN], Tencor_Data.[130_BIN], Tencor_Data.[160_BIN], Tencor_Data.[200_BIN], 
                      Tencor_Data.[250_BIN], Tencor_Data.[300_BIN], convert(nVarChar(10),cast(Tencor_Data.[DATE] as smalldatetime),101)
FROM         dbo.Tencor_Data INNER JOIN
                      [$(ALTS)].dbo.CofA_Info AS CI ON Tencor_Data.[ID#] = CI.ID_NUMBER INNER JOIN
                      @Lots A ON RIGHT(A.Lot, 4) = Tencor_Data.WAFER_LOG AND SUBSTRING(A.Lot, 6, LEN(A.Lot) - 10) 
                      = Tencor_Data.[RUN#] AND LEFT(Tencor_Data.RECIPE, 6) = 'T-' + @MainID
WHERE     (Tencor_Data.SORT =
                          (SELECT DISTINCT T_C1
                            FROM          [$(ALTS)].dbo.CofA_Info
                            WHERE      ID_NUMBER = @MainID)) AND (Tencor_Data.[160_BIN] < 200)
insert @Data
SELECT CR81_DATA.[ID#], CR81_DATA.[RUN#], CR81_DATA.WAFER_LOG
	,CR81_DATA.RECIPE, CR81_DATA.GRADE
	,1 AS [100_BIN],CR81_DATA.[120_BIN], CR81_DATA.[130_BIN],CR81_DATA.[160_BIN]
	,CR81_DATA.[200_BIN],CR81_DATA.[250_BIN],CR81_DATA.[300_BIN],convert(nVarChar(10),cast(CR81_DATA.[DATE] as smalldatetime),101)
FROM dbo.CR81_DATA INNER JOIN
    [$(ALTS)].dbo.CofA_Info AS CI ON CR81_DATA.[ID#] = CI.ID_NUMBER INNER JOIN
		@Lots A ON RIGHT(A.Lot, 4) = CR81_DATA.WAFER_LOG 
			AND SUBSTRING(A.Lot, 6, LEN(A.Lot) - 10) = CR81_DATA.[RUN#]
WHERE     (CR81_DATA.[160_BIN] < 200) 
	AND (CR81_DATA.GRADE =
                          (SELECT DISTINCT CR81_C1
                            FROM          [$(ALTS)].dbo.CofA_Info
                            WHERE      ID_NUMBER = @MainID)) 
    AND (LEFT(CR81_DATA.RECIPE, 6) = 'C-' +
                          (SELECT DISTINCT T2_C3
                            FROM          [$(ALTS)].dbo.CofA_Info
                            WHERE      ID_NUMBER = @MainID))
if @SODs=1 begin
insert @Data
SELECT     SP1_Data.[ID#], SP1_Data.[RUN#], SP1_Data.Wafer_log, SP1_Data.SPRecipeName, SP1_Data.DispositionName, 
    CASE CofA_Info.sod_AT WHEN '0.12um' THEN SP1_Data.SOD1 + SP1_Data.SOD2 WHEN '0.13um' THEN SP1_Data.SOD1 + SP1_Data.SOD2
    + SP1_Data.SOD3 WHEN '0.16um' THEN SP1_Data.SOD1 + SP1_Data.SOD2 + SP1_Data.SOD3 + SP1_Data.SOD4 WHEN '0.20um'
    THEN SP1_Data.SOD1 + SP1_Data.SOD2 + SP1_Data.SOD3 + SP1_Data.SOD4 + SP1_Data.SOD5 WHEN '0.25um' THEN SP1_Data.SOD1
    + SP1_Data.SOD2 + SP1_Data.SOD3 + SP1_Data.SOD4 + SP1_Data.SOD5 + SP1_Data.SOD6 WHEN '0.30um' THEN SP1_Data.SOD1
    + SP1_Data.SOD2 + SP1_Data.SOD3 + SP1_Data.SOD4 + SP1_Data.SOD5 + SP1_Data.SOD6 + SP1_Data.SOD7 ELSE SP1_Data.SOD1
    END AS [100_BIN], 
    CASE CofA_Info.sod_AT WHEN '0.13um' THEN SP1_Data.SOD2 + SP1_Data.SOD3 WHEN '0.16um' THEN SP1_Data.SOD2 + SP1_Data.SOD3
    + SP1_Data.SOD4 WHEN '0.20um' THEN SP1_Data.SOD2 + SP1_Data.SOD3 + SP1_Data.SOD4 + SP1_Data.SOD5 WHEN '0.25um'
    THEN SP1_Data.SOD2 + SP1_Data.SOD3 + SP1_Data.SOD4 + SP1_Data.SOD5 + SP1_Data.SOD6 WHEN '0.30um' THEN SP1_Data.SOD2
	+ SP1_Data.SOD3 + SP1_Data.SOD4 + SP1_Data.SOD5 + SP1_Data.SOD6 + SP1_Data.SOD7 ELSE SP1_Data.SOD2 END AS [120_BIN],
    CASE CofA_Info.sod_AT WHEN '0.16um' THEN SP1_Data.SOD3 + SP1_Data.SOD4 WHEN '0.20um' THEN SP1_Data.SOD3 + SP1_Data.SOD4
    + SP1_Data.SOD5 WHEN '0.25um' THEN SP1_Data.SOD3 + SP1_Data.SOD4 + SP1_Data.SOD5 + SP1_Data.SOD6 WHEN '0.30um'
    THEN SP1_Data.SOD3 + SP1_Data.SOD4 + SP1_Data.SOD5 + SP1_Data.SOD6 + SP1_Data.SOD7 ELSE SP1_Data.SOD3 END
    AS [130_BIN], 
    CASE CofA_Info.sod_AT WHEN '0.20um' THEN SP1_Data.SOD4 + SP1_Data.SOD5 WHEN '0.25um' THEN SP1_Data.SOD4 + SP1_Data.SOD5
    + SP1_Data.SOD6 WHEN '0.30um' THEN SP1_Data.SOD4 + SP1_Data.SOD5 + SP1_Data.SOD6 + SP1_Data.SOD7 ELSE SP1_Data.SOD4
    END AS [160_BIN], 
    CASE CofA_Info.sod_AT WHEN '0.25um' THEN SP1_Data.SOD5 + SP1_Data.SOD6 WHEN '0.30um' THEN SP1_Data.SOD5 + SP1_Data.SOD6
    + SP1_Data.SOD7 ELSE SP1_Data.SOD5 END AS [200_BIN], 
    CASE CofA_Info.sod_AT WHEN '0.30um' THEN SP1_Data.SOD6 + SP1_Data.SOD7 ELSE SP1_Data.SOD6 END AS [250_BIN], 
    SP1_Data.SOD7 AS [300_BIN], CONVERT(nVarChar(10), SP1_Data.CreationDate, 101) 
FROM         dbo.SP1_Data INNER JOIN
    [$(ALTS)].dbo.CofA_Info AS CI ON SP1_Data.[ID#] = CI.ID_NUMBER INNER JOIN
    @Lots A ON RIGHT(A.Lot, 4) = SP1_Data.Wafer_log AND SUBSTRING(A.Lot, 6, LEN(A.Lot) - 10) 
    = SP1_Data.[RUN#]
WHERE     (SP1_Data.DispositionName Like
		(SELECT DISTINCT T2_C1
		FROM          [$(ALTS)].dbo.CofA_Info
		WHERE      ID_NUMBER = @MainID) +'%')
	AND (SP1_Data.SPRecipeName Like 'T2-' +
		(SELECT DISTINCT T2_C3
		FROM          [$(ALTS)].dbo.CofA_Info
		WHERE      ID_NUMBER = @MainID)+'%')
	AND (SP1_Data.SOD2 < 738) 
	AND (SP1_Data.SOD4 < 200) 
	--AND (SP1_Data.BinCnt4 < 200) 
	AND (LEFT(SP1_Data.ChannelID, 9) = 'Composite') 
end
else begin
insert @Data
SELECT SP1_Data.[ID#]
	,SP1_Data.[RUN#]
	,SP1_Data.Wafer_log
	,SP1_Data.SPRecipeName
	,SP1_Data.DispositionName
	,BinCnt1
	,BinCnt2
	,BinCnt3
	,BinCnt4
	,BinCnt5
	,BinCnt6
	,BinCnt7
    ,CONVERT(nVarChar(10) ,SP1_Data.CreationDate, 101) 
FROM         dbo.SP1_Data INNER JOIN
    [$(ALTS)].dbo.CofA_Info AS CI ON SP1_Data.[ID#] = CI.ID_NUMBER INNER JOIN
    @Lots A ON RIGHT(A.Lot, 4) = SP1_Data.Wafer_log AND SUBSTRING(A.Lot, 6, LEN(A.Lot) - 10) 
    = SP1_Data.[RUN#]
WHERE     (SP1_Data.DispositionName Like
		(SELECT DISTINCT T2_C1
		FROM          [$(ALTS)].dbo.CofA_Info
		WHERE      ID_NUMBER = @MainID) +'%')
	AND (SP1_Data.SPRecipeName Like 'T2-' +
		(SELECT DISTINCT T2_C3
		FROM          [$(ALTS)].dbo.CofA_Info
		WHERE      ID_NUMBER = @MainID)+'%')
	--AND (SP1_Data.SOD2 < 738) 
	--AND (SP1_Data.SOD4 < 200) 
	--AND (SP1_Data.BinCnt4 < 200) 
	AND (LEFT(SP1_Data.ChannelID, 9) = 'Composite') 
end
Declare @Cnt int Select @Cnt = count(*) from @Data
if @Cnt=0 begin
	insert @Data
	SELECT CR81_DATA.[ID#], CR81_DATA.[RUN#], CR81_DATA.WAFER_LOG
		,CR81_DATA.RECIPE, CR81_DATA.GRADE
		,1 AS [100_BIN],CR81_DATA.[120_BIN], CR81_DATA.[130_BIN],CR81_DATA.[160_BIN]
		,CR81_DATA.[200_BIN],CR81_DATA.[250_BIN],CR81_DATA.[300_BIN],convert(nVarChar(10),cast(CR81_DATA.[DATE] as smalldatetime),101)
	FROM dbo.CR81_DATA INNER JOIN
		[$(ALTS)].dbo.CofA_Info AS CI ON CR81_DATA.[ID#] = CI.ID_NUMBER INNER JOIN
			@Lots A ON RIGHT(A.Lot, 4) = CR81_DATA.WAFER_LOG 
				AND SUBSTRING(A.Lot, 6, LEN(A.Lot) - 10) = CR81_DATA.[RUN#]
	WHERE     (CR81_DATA.[160_BIN] < 200) 
		AND (CR81_DATA.GRADE =
							(SELECT DISTINCT CR81_C1
								FROM          [$(ALTS)].dbo.CofA_Info
								WHERE      ID_NUMBER = @MainID)) 
		AND (substring(CR81_DATA.RECIPE,1,6) in (SELECT   'C-' + [From] 
                         FROM      [$(ALTS)].dbo.TransferID_ByStage
                         WHERE   (StageName = N'Final Pack') AND ([To] = @MainID)))
	if @SODs=1 begin
	insert @Data
	SELECT     SP1_Data.[ID#], SP1_Data.[RUN#], SP1_Data.Wafer_log, SP1_Data.SPRecipeName, SP1_Data.DispositionName, 
		CASE CofA_Info.sod_AT WHEN '0.12um' THEN SP1_Data.SOD1 + SP1_Data.SOD2 WHEN '0.13um' THEN SP1_Data.SOD1 + SP1_Data.SOD2
		+ SP1_Data.SOD3 WHEN '0.16um' THEN SP1_Data.SOD1 + SP1_Data.SOD2 + SP1_Data.SOD3 + SP1_Data.SOD4 WHEN '0.20um'
		THEN SP1_Data.SOD1 + SP1_Data.SOD2 + SP1_Data.SOD3 + SP1_Data.SOD4 + SP1_Data.SOD5 WHEN '0.25um' THEN SP1_Data.SOD1
		+ SP1_Data.SOD2 + SP1_Data.SOD3 + SP1_Data.SOD4 + SP1_Data.SOD5 + SP1_Data.SOD6 WHEN '0.30um' THEN SP1_Data.SOD1
		+ SP1_Data.SOD2 + SP1_Data.SOD3 + SP1_Data.SOD4 + SP1_Data.SOD5 + SP1_Data.SOD6 + SP1_Data.SOD7 ELSE SP1_Data.SOD1
		END AS [100_BIN], 
		CASE CofA_Info.sod_AT WHEN '0.13um' THEN SP1_Data.SOD2 + SP1_Data.SOD3 WHEN '0.16um' THEN SP1_Data.SOD2 + SP1_Data.SOD3
		+ SP1_Data.SOD4 WHEN '0.20um' THEN SP1_Data.SOD2 + SP1_Data.SOD3 + SP1_Data.SOD4 + SP1_Data.SOD5 WHEN '0.25um'
		THEN SP1_Data.SOD2 + SP1_Data.SOD3 + SP1_Data.SOD4 + SP1_Data.SOD5 + SP1_Data.SOD6 WHEN '0.30um' THEN SP1_Data.SOD2
		+ SP1_Data.SOD3 + SP1_Data.SOD4 + SP1_Data.SOD5 + SP1_Data.SOD6 + SP1_Data.SOD7 ELSE SP1_Data.SOD2 END AS [120_BIN],
		CASE CofA_Info.sod_AT WHEN '0.16um' THEN SP1_Data.SOD3 + SP1_Data.SOD4 WHEN '0.20um' THEN SP1_Data.SOD3 + SP1_Data.SOD4
		+ SP1_Data.SOD5 WHEN '0.25um' THEN SP1_Data.SOD3 + SP1_Data.SOD4 + SP1_Data.SOD5 + SP1_Data.SOD6 WHEN '0.30um'
		THEN SP1_Data.SOD3 + SP1_Data.SOD4 + SP1_Data.SOD5 + SP1_Data.SOD6 + SP1_Data.SOD7 ELSE SP1_Data.SOD3 END
		AS [130_BIN], 
		CASE CofA_Info.sod_AT WHEN '0.20um' THEN SP1_Data.SOD4 + SP1_Data.SOD5 WHEN '0.25um' THEN SP1_Data.SOD4 + SP1_Data.SOD5
		+ SP1_Data.SOD6 WHEN '0.30um' THEN SP1_Data.SOD4 + SP1_Data.SOD5 + SP1_Data.SOD6 + SP1_Data.SOD7 ELSE SP1_Data.SOD4
		END AS [160_BIN], 
		CASE CofA_Info.sod_AT WHEN '0.25um' THEN SP1_Data.SOD5 + SP1_Data.SOD6 WHEN '0.30um' THEN SP1_Data.SOD5 + SP1_Data.SOD6
		+ SP1_Data.SOD7 ELSE SP1_Data.SOD5 END AS [200_BIN], 
		CASE CofA_Info.sod_AT WHEN '0.30um' THEN SP1_Data.SOD6 + SP1_Data.SOD7 ELSE SP1_Data.SOD6 END AS [250_BIN], 
		SP1_Data.SOD7 AS [300_BIN], CONVERT(nVarChar(10), SP1_Data.CreationDate, 101) 
	FROM         dbo.SP1_Data INNER JOIN
		[$(ALTS)].dbo.CofA_Info AS CI ON SP1_Data.[ID#] = CI.ID_NUMBER INNER JOIN
		@Lots A ON RIGHT(A.Lot, 4) = SP1_Data.Wafer_log AND SUBSTRING(A.Lot, 6, LEN(A.Lot) - 10) 
		= SP1_Data.[RUN#]
	WHERE     (SP1_Data.DispositionName Like
			(SELECT DISTINCT T2_C1
			FROM          [$(ALTS)].dbo.CofA_Info
			WHERE      ID_NUMBER = @MainID) +'%')
		AND (substring(SP1_Data.SPRecipeName,1,7) in (SELECT   'T2-' + [From] 
                         FROM      [$(ALTS)].dbo.TransferID_ByStage
           WHERE   (StageName = N'Final Pack') AND ([To] = @MainID)))
		AND (SP1_Data.SOD2 < 738) 
		AND (SP1_Data.SOD4 < 200) 
		--AND (SP1_Data.BinCnt4 < 200) 
		AND (LEFT(SP1_Data.ChannelID, 9) = 'Composite') 
	end
	else begin
	insert @Data
	SELECT SP1_Data.[ID#]
		,SP1_Data.[RUN#]
		,SP1_Data.Wafer_log
		,SP1_Data.SPRecipeName
		,SP1_Data.DispositionName
		,BinCnt1
		,BinCnt2
		,BinCnt3
		,BinCnt4
		,BinCnt5
		,BinCnt6
		,BinCnt7
		,CONVERT(nVarChar(10) ,SP1_Data.CreationDate, 101) 
	FROM         dbo.SP1_Data INNER JOIN
		[$(ALTS)].dbo.CofA_Info AS CI ON SP1_Data.[ID#] = CI.ID_NUMBER INNER JOIN
		@Lots A ON RIGHT(A.Lot, 4) = SP1_Data.Wafer_log AND SUBSTRING(A.Lot, 6, LEN(A.Lot) - 10) 
		= SP1_Data.[RUN#]
	WHERE     (SP1_Data.DispositionName Like
			(SELECT DISTINCT T2_C1
			FROM          [$(ALTS)].dbo.CofA_Info
			WHERE      ID_NUMBER = @MainID) +'%')
		AND (substring(SP1_Data.SPRecipeName,1,7) in (SELECT   'T2-' + [From] 
                         FROM      [$(ALTS)].dbo.TransferID_ByStage
                         WHERE   (StageName = N'Final Pack') AND ([To] = @MainID)))
		--AND (SP1_Data.SOD2 < 738) 
		--AND (SP1_Data.SOD4 < 200) 
		--AND (SP1_Data.BinCnt4 < 200) 
		AND (LEFT(SP1_Data.ChannelID, 9) = 'Composite') 
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
	Select * from @Data1
end
	RETURN 