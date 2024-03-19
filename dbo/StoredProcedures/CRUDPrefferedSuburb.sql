-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CRUDPrefferedSuburb] 
	-- Add the parameters for the stored procedure here
	@NurseId int = 0,
	@SuburbId int = 0,
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
		Insert into PrefferedSuburb(NurseId, SuburbId, Active)
		Values (@NurseId, @SuburbId, @Active)
	end

	if @Command = 'GetAll'
	begin
		Select *
		From PrefferedSuburb
		left outer join EndUser
		on PrefferedSuburb.NurseId = EndUser.UserId
		left outer join Suburb
		on PrefferedSuburb.SuburbId = Suburb.SuburbId
		Where PrefferedSuburb.Active = 1
	end

	if @Command = 'GetOne'
	begin
		Select *
		From PrefferedSuburb
		left outer join EndUser
		on PrefferedSuburb.NurseId = EndUser.UserId
		left outer join Suburb
		on PrefferedSuburb.SuburbId = Suburb.SuburbId
		Where PrefferedSuburb.NurseId = @NurseId and PrefferedSuburb.SuburbId = @SuburbId and PrefferedSuburb.Active = 1
	end

	if @Command = 'ByNurses'
	begin
		Select *
		From PrefferedSuburb
		left outer join EndUser
		on PrefferedSuburb.NurseId = EndUser.UserId
		left outer join Suburb
		on PrefferedSuburb.SuburbId = Suburb.SuburbId
		Where PrefferedSuburb.NurseId = @NurseId and PrefferedSuburb.Active = 1
	end

	if @Command = 'Update'
	begin
		update PrefferedSuburb
		set
			NurseId = @NurseId,
			SuburbId = @SuburbId
		where PrefferedSuburb.NurseId = @NurseId
	end

	if @Command = 'Delete'
	begin
		update PrefferedSuburb
		set
			Active = 0
		where PrefferedSuburb.NurseId = @NurseId and PrefferedSuburb.SuburbId = @SuburbId
	end
END

GO

