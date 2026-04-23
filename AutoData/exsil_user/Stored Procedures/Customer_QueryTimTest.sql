
Create  PROCEDURE exsil_user.Customer_QueryTimTest
	(@PickTicket nvarchar(15))
AS
Declare @MainID as nVarChar(4)
Declare @PART_NUMBER nVarChar(50)
Declare @PART_REV_NUMBER nVarChar(50)
Declare @SPEC_NUMBER nVarChar(50)
Declare @SPEC_REV_NUMBER nVarChar(50)
Declare @ORTN nVarChar(50)
Declare @WTYPE_DOPE nVarChar(50)
Declare @SAMPLE_STANDARD nVarChar(50)

SELECT   @MainID = LEFT(LM.Lot, 4)
	, @SPEC_NUMBER = Spec.SPEC_NUMBER
	, @SPEC_REV_NUMBER = Spec.SPEC_REV_NUMBER
	, @PART_NUMBER = Spec.PART_NUMBER
	, @PART_REV_NUMBER = Spec.PART_REV_NUMBER
	, @ORTN = Spec.ORTN
    , @WTYPE_DOPE = Spec.WTYPE_DOPE
	, @SAMPLE_STANDARD = Spec.SAMPLE_STANDARD
FROM      [$(ALTS)].dbo.ShippingInventory SI INNER JOIN
                [$(ALTS)].dbo.LabelsMade LM ON SI.LotEntry = LM.LabelRecordNumber INNER JOIN
                [$(ALTS)].dbo.MainIDSpec Spec ON LM.RecordNumber = Spec.RecordNumber INNER JOIN
                [$(ALTS)].dbo.MainID_MainIDSpec Spec_X ON Spec.RecordNumber = Spec_X.WaferSpec_Key CROSS JOIN
                [$(ALTS)].dbo.MainID ID
WHERE   (SI.Error = 0) AND (SI.PickTicket = @PickTicket)
GROUP BY LEFT(LM.Lot, 4)
	, Spec.SPEC_NUMBER, Spec.SPEC_REV_NUMBER
	, Spec.PART_NUMBER, Spec.PART_REV_NUMBER
	, Spec.ORTN, Spec.WTYPE_DOPE, Spec.SAMPLE_STANDARD

	Delete from dbo.Archive_CofA_Customer where SO_Number=@PickTicket
insert dbo.Archive_CofA_Customer
	SELECT DISTINCT @PickTicket
		, Cust.Business_Name AS CUSTOMER, ID.CustomerID AS ABREV_NAME, @MainID AS ID_NUMBER, Pro.MET_NMET
		, @PART_NUMBER as PART_NUMBER
		, @PART_REV_NUMBER as P_REV_NUMBER
		, @SPEC_NUMBER as Spec_Number
		, @SPEC_REV_NUMBER as SPEC_REV_NUMBER
		, @ORTN as ORTN
		, @WTYPE_DOPE AS [TYPE]
		, '' AS DOPE
		, id.DIAMETER
		, @SAMPLE_STANDARD as SAMPLE_STANDARD
		, Pro.SCRIBE_MODE
		, Pro.SCRIBE_NOTE_1
		, Pro.SCRIBE_NOTE_2
		, Pro.SCRIBE_NOTE_3
		, Pro.SIDE, Pro.LOCATION
		, Pro.Scribe_DETAIL
		, Pro.LASERSCRIBE_DETAIL_NOTE
		, Pro.ETCH_TYPE
		, Pro.METALS_REQUIREMENT1
		, Pro.METALS_REQUIREMENT2
		, Pro.METALS_NOTE, Pro.VISUAL_NOTE_1
		, Pro.VISUAL_NOTE_2
		, Pro.VISUAL_NOTE_3
		, Pro.VISUAL_SCRATCHES
		, Pro.VISUAL_STAINS
		, Pro.VISUAL_BACKSIDE_INSPECTION
		, Pro.PARTICLES
		, Pro.BACK_STAINS
		, Pro.VISUAL_MOTTLING
		, Pro.BACK_SCRATCHES
		, Pro.VISUAL_CHIPS
		, Pro.FINAL_MIN_THICKNESS
		, Pro.FINAL_MAX_THICKNESS
		, Pro.final_max_res
		, Pro.final_min_res
		, Pro.FINAL_TTV
		, Pro.FINAL_TIR
		, Pro.FINAL_STIR
		, Pro.BOW
		, Pro.WARP
		, Pro.EDGE_EXCLUSION
		, Pro.PARTICLE_SPEC_1
		, Pro.PARTICLE_SPEC_2
		, CofA.RES_HI_LO
		, CofA.REPORT_TYPE
		, CofA.COFA
		, CofA.METALS
		, CofA.LPD_SOURCE
		, CofA.REPORT_DATA
		, CofA.SOD_AT
		, CofA.SOD_LPD
		, CofA.ADE_S1_G1
		, CofA.ADE_S1_G2
		, CofA.ADE_S1_G3
		, CofA.ADE_S1_G4
		, CofA.ADE_S2_G1
		, CofA.ADE_S2_G2
		, CofA.ADE_S2_G3
		, CofA.ADE_S2_G4
		, CofA.LPD_G1
		, CofA.LPD_G2
		, CofA.LPD_G3
		, CofA.LPD_G4
		, Pro.PARTICLE_SPEC_3
		, Pro.PARTICLE_SPEC_4
		, Pro.Backside_Finish
		, Pro.ResGradient
	FROM      [$(ALTS)].dbo.CofA_Info CofA INNER JOIN
	                [$(ALTS)].dbo.PROCESS_INFO Pro INNER JOIN
	                [$(ALTS)].dbo.Customer Cust INNER JOIN
	                [$(ALTS)].dbo.MainID ID ON Cust.CustomerID = ID.CustomerID ON Pro.ID_NUMBER = ID.MainID ON CofA.ID_NUMBER = ID.MainID
	WHERE   (ID.MainID = @MainID)

SELECT DISTINCT 
	Cust.Business_Name AS CUSTOMER, ID.CustomerID AS ABREV_NAME, @MainID AS ID_NUMBER, Pro.MET_NMET
		, @PART_NUMBER as PART_NUMBER
		, Pro.P_REV_NUMBER
		, @SPEC_NUMBER as Spec_Number
		, @SPEC_REV_NUMBER as SPEC_REV_NUMBER
		, @ORTN as ORTN
		, @WTYPE_DOPE AS [TYPE]
		, '' AS DOPE
		, id.DIAMETER
		, @SAMPLE_STANDARD as SAMPLE_STANDARD
		, Pro.SCRIBE_MODE
		, Pro.SCRIBE_NOTE_1
		, Pro.SCRIBE_NOTE_2
		, Pro.SCRIBE_NOTE_3
		, Pro.SIDE, Pro.LOCATION
		, Pro.Scribe_DETAIL
		, Pro.LASERSCRIBE_DETAIL_NOTE
		, Pro.ETCH_TYPE
		, Pro.METALS_REQUIREMENT1
		, Pro.METALS_REQUIREMENT2
		, Pro.METALS_NOTE, Pro.VISUAL_NOTE_1
		, Pro.VISUAL_NOTE_2
		, Pro.VISUAL_NOTE_3
		, Pro.VISUAL_SCRATCHES
		, Pro.VISUAL_STAINS
		, Pro.VISUAL_BACKSIDE_INSPECTION
		, Pro.PARTICLES
		, Pro.BACK_STAINS
		, Pro.VISUAL_MOTTLING
		, Pro.BACK_SCRATCHES
		, Pro.VISUAL_CHIPS
		, Pro.FINAL_MIN_THICKNESS
		, Pro.FINAL_MAX_THICKNESS
		, Pro.final_max_res
		, Pro.final_min_res
		, Pro.FINAL_TTV
		, Pro.FINAL_TIR
		, Pro.FINAL_STIR
		, Pro.BOW
		, Pro.WARP
		, Pro.EDGE_EXCLUSION
		, Pro.PARTICLE_SPEC_1
		, Pro.PARTICLE_SPEC_2
		, CofA.RES_HI_LO
		, CofA.REPORT_TYPE
		, CofA.COFA
		, CofA.METALS
		, CofA.LPD_SOURCE
		, CofA.REPORT_DATA
		, CofA.SOD_AT
		, CofA.SOD_LPD
		, CofA.ADE_S1_G1
		, CofA.ADE_S1_G2
		, CofA.ADE_S1_G3
		, CofA.ADE_S1_G4
		, CofA.ADE_S2_G1
		, CofA.ADE_S2_G2
		, CofA.ADE_S2_G3
		, CofA.ADE_S2_G4
		, CofA.LPD_G1
		, CofA.LPD_G2
		, CofA.LPD_G3
		, CofA.LPD_G4
		, Pro.PARTICLE_SPEC_3
		, Pro.PARTICLE_SPEC_4
		, Pro.Backside_Finish
		, Pro.ResGradient
FROM      [$(ALTS)].dbo.CofA_Info CofA INNER JOIN
                [$(ALTS)].dbo.PROCESS_INFO Pro INNER JOIN
                [$(ALTS)].dbo.Customer Cust INNER JOIN
                [$(ALTS)].dbo.MainID ID ON Cust.CustomerID = ID.CustomerID ON Pro.ID_NUMBER = ID.MainID ON CofA.ID_NUMBER = ID.MainID
WHERE   (ID.MainID = @MainID)
	RETURN


