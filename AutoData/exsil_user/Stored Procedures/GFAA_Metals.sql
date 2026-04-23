CREATE PROCEDURE exsil_user.GFAA_Metals
(@PickTicket nvarchar(15))
AS
	Delete from dbo.Archive_CofA_Metals where SO_Number=@PickTicket
	
	insert dbo.Archive_CofA_Metals
	SELECT     TOP 2 @PickTicket as SO_Number,Ca, Ma, Ni, Zn, Al, Fe, Cr, Cu, Na, K
	FROM         [$(ALTS)].dbo.[GFAAS Data]
	WHERE (Location = 'Prescott')
		AND (Notes IS NULL)
		AND (LEFT(Source, 2) = 'SC') 
		AND (LEFT([Test Type], 2) = 'at')	
		AND (Ca < 0.35) 
		AND (Ma < 0.32) 
		AND (Ni < 0.28) 
		AND (Zn < 0.29) 
		AND (Al < 0.19) 
		AND (Fe < 0.22) 
		AND (Cr < 0.15) 
		AND (Cu < 0.22) 
		AND (Na < 0.19) 
		AND (K < 0.15) 
		AND [date/Time]<=(SELECT EventTime FROM  [$(ALTS)].dbo.Pick_ShippingUnit WHERE (PickTicket = @PickTicket))
	order by [date/Time] desc

SELECT     TOP 2 Ca, Ma, Ni, Zn, Al, Fe, Cr, Cu, Na, K
FROM         [$(ALTS)].dbo.[GFAAS Data]
WHERE (Location = 'Prescott')
	AND (Notes IS NULL)
	AND (LEFT(Source, 2) = 'SC') 
	AND (LEFT([Test Type], 2) = 'at')	
	AND (Ca < 0.35) 
	AND (Ma < 0.32) 
	AND (Ni < 0.28) 
	AND (Zn < 0.29) 
	AND (Al < 0.19) 
	AND (Fe < 0.22) 
	AND (Cr < 0.15) 
	AND (Cu < 0.22) 
	AND (Na < 0.19) 
	AND (K < 0.15) 
	AND [date/Time]<=(SELECT EventTime FROM  [$(ALTS)].dbo.Pick_ShippingUnit WHERE (PickTicket = @PickTicket))
order by [date/Time] desc

	RETURN