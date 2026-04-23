CREATE FUNCTION exsil_user.fctn_ADE_Receiver_Parser
	(
		@Receiver nVarChar(10)
	)
RETURNS @tbl_Receiver table (Receiver int)
AS
begin
Declare @i int
set @i=0
while @i < len(@Receiver)
	begin
		set @i=@i+1
		insert @tbl_Receiver(Receiver) VALUES   (substring(@Receiver,@i,1))
	end

	RETURN 
end
