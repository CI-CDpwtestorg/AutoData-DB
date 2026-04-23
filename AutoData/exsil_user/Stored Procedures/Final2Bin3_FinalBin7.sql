CREATE PROCEDURE exsil_user.Final2Bin3_FinalBin7
AS
UPDATE  dbo.ADE_data
SET         location = N'Final', Receiver = 7
WHERE   ([date] > N'10/27/05') 
	AND ([id#] = N'2646' OR [id#] = N'2821') 
	AND (location = N'final2') 
	AND (Receiver = 3) 
	AND (class = N'accept')
	RETURN 
