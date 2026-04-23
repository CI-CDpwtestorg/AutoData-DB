

CREATE   PROCEDURE exsil_user.Customer_Query_Old
	(
		@PickTicket nvarchar(15)
	)
AS
Declare @MainID as nVarChar(4)
SELECT top 1 @MainID = LEFT(Lot, 4)
FROM [$(ALTS)].dbo.q_Shipping_Lots
WHERE (PickTicket = @PickTicket)
SELECT DISTINCT 
                      Cust.Business_Name AS CUSTOMER, ID.CustomerID AS ABREV_NAME, ID.MainID AS ID_NUMBER, Pro.MET_NMET, Spec.PART_NUMBER, 
                      Pro.P_REV_NUMBER, Spec.SPEC_NUMBER, Spec.SPEC_REV_NUMBER, Spec.ORTN, Spec.WTYPE_DOPE AS [TYPE], '' AS DOPE, 
                      id.DIAMETER, Spec.SAMPLE_STANDARD, Pro.SCRIBE_MODE, 
                      Pro.SCRIBE_NOTE_1, Pro.SCRIBE_NOTE_2, Pro.SCRIBE_NOTE_3, Pro.SIDE, Pro.LOCATION, Pro.Scribe_DETAIL, Pro.LASERSCRIBE_DETAIL_NOTE, 
                      Pro.ETCH_TYPE, Pro.METALS_REQUIREMENT1, Pro.METALS_REQUIREMENT2, Pro.METALS_NOTE, Pro.VISUAL_NOTE_1, Pro.VISUAL_NOTE_2, 
                      Pro.VISUAL_NOTE_3, Pro.VISUAL_SCRATCHES, Pro.VISUAL_STAINS, Pro.VISUAL_BACKSIDE_INSPECTION, Pro.PARTICLES, Pro.BACK_STAINS, 
                      Pro.VISUAL_MOTTLING, Pro.BACK_SCRATCHES, Pro.VISUAL_CHIPS, Pro.FINAL_MIN_THICKNESS, Pro.FINAL_MAX_THICKNESS, Pro.final_max_res, 
                      Pro.final_min_res, Pro.FINAL_TTV, Pro.FINAL_TIR, Pro.FINAL_STIR, Pro.BOW, Pro.WARP, Pro.EDGE_EXCLUSION, Pro.PARTICLE_SPEC_1, 
                      Pro.PARTICLE_SPEC_2, CofA.RES_HI_LO, CofA.REPORT_TYPE, CofA.COFA, CofA.METALS, CofA.LPD_SOURCE, CofA.REPORT_DATA, CofA.SOD_AT, 
                      CofA.SOD_LPD, CofA.ADE_S1_G1, CofA.ADE_S1_G2, CofA.ADE_S1_G3, CofA.ADE_S1_G4, CofA.ADE_S2_G1, CofA.ADE_S2_G2, CofA.ADE_S2_G3, 
                      CofA.ADE_S2_G4, CofA.LPD_G1, CofA.LPD_G2, CofA.LPD_G3, CofA.LPD_G4, Pro.PARTICLE_SPEC_3, Pro.PARTICLE_SPEC_4
                      , Pro.Backside_Finish
FROM         [$(ALTS)].dbo.CofA_Info CofA INNER JOIN
                      [$(ALTS)].dbo.PROCESS_INFO Pro INNER JOIN
                      [$(ALTS)].dbo.MainIDSpec Spec INNER JOIN
                      [$(ALTS)].dbo.Customer Cust INNER JOIN
                      [$(ALTS)].dbo.MainID ID ON Cust.CustomerID = ID.CustomerID INNER JOIN
                      [$(ALTS)].dbo.MainID_MainIDSpec Spec_x ON ID.MainID = Spec_x.MainID ON Spec.RecordNumber = Spec_x.WaferSpec_Key ON 
                      Pro.ID_NUMBER = ID.MainID ON CofA.ID_NUMBER = ID.MainID
WHERE     (ID.MainID = @MainID) AND (Spec_x.ExpirationDtd > { fn NOW() } OR
                      Spec_x.ExpirationDtd IS NULL) AND (Spec_x.EffectiveDtd <= { fn NOW() })
	RETURN

