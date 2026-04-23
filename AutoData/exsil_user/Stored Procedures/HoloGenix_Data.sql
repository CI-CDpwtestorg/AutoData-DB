CREATE PROCEDURE exsil_user.HoloGenix_Data
	(
		@PickTicket nvarchar(15)
	)
AS
Declare @Lots table 
	(Lot nVarChar(15))
insert @Lots SELECT distinct Lot FROM [$(ALTS)].dbo.q_Shipping_Lots WHERE PickTicket = @PickTicket

SELECT DC2.LotID, DC2.SourceCarrierID, DC2.EquipmentID, DC2.WaferClassName, 
    DC2.CntThk, DC2.AvgThk, DC2.TTV, DC2.TIR, DC2.MinThk, 
    DC2.CntRes, DC2.MaxThk, DC2.Bow, DC2.TotWarp
FROM dbo.DC_NEWDATA2 AS DC2 INNER JOIN
    dbo.CofA_Info AS CI ON DC2.LotID = CI.ID_NUMBER INNER JOIN
    @Lots A ON SUBSTRING(A.Lot, 6, LEN(A.Lot) - 5) = DC2.SourceCarrierID
WHERE (DC2.WaferClassName =
    (SELECT DISTINCT H_SC1
    FROM          CofA_Info
    WHERE      ID_NUMBER = LEFT(A.Lot, 4))
    ) 
    AND (DC2.TTV < 25) 
Return