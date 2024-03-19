-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CRUDNurse] 
	-- Add the parameters for the stored procedure here
	@NurseId int = 0,
	@Grade nvarchar(5) = " ",
	@Active bit = 1,
	@Command nvarchar(10) = " "
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @Command = 'Insert'
	Begin
		Insert into Nurse(NurseId, Grade, Active)
		Values (@NurseId, @Grade, @Active)
	end

	if @Command = 'GetAll'
	begin
		Select *
		From Nurse
		left outer join EndUser
		on Nurse.NurseId = EndUser.UserId
		Where Nurse.Active = 1
		Order by EndUser.Username asc
	end

	if @Command = 'GetOne'
	begin
		Select *
		From Nurse
		left outer join EndUser
		on Nurse.NurseId = EndUser.UserId
		Where Nurse.NurseId = @NurseId and Nurse.Active = 1
	end

	if @Command = 'Update'
	begin
		update Nurse
		set
			NurseId = @NurseId,
			Grade = @Grade
		where NurseId = @NurseId
	end

	if @Command = 'Delete'
	begin
		update Nurse
		set
			Active = 0
		where NurseId = @NurseId
	end
	
	if @Command = 'Waiting'
	begin
		Select * 
		From Nurse N
		Left Outer join EndUser EU
		on N.NurseId = EU.UserId
		Where N.Active = 1
		and EU.UserType = 'W'
		Order by EU.Username asc
	end
END

GO

