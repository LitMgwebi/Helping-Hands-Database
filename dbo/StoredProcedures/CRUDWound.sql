-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CRUDWound] 
	-- Add the parameters for the stored procedure here
	@WoundId int = 0,
	@WoundName nvarchar(30) = " ",
	@Grade nvarchar(5) = " ",
	@WoundDescription nvarchar(max) = " ",
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
		Insert into Wound(WoundName, WoundDescription, Grade, Active)
		Values (@WoundName, @WoundDescription, @Grade, @Active)
	end

	if @Command = 'GetAll'
	begin
		Select *
		From Wound
		Where Active = 1
	end

	if @Command = 'GetOne'
	begin
		Select *
		from Wound
		where WoundId = @WoundId and Active = 1
		Order by WoundName asc
	end

	if @Command = 'Update'
	begin
		update Wound
		set
			WoundName = @WoundName,
			WoundDescription = @WoundDescription,
			Grade = @Grade
		where WoundId = @WoundId
	end

	if @Command = 'Delete'
	begin
		update Wound
		set
			Active = 0
		where WoundId = @WoundId
	end
END

GO

