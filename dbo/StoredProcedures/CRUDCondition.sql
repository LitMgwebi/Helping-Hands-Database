-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [CRUDCondition]
	-- Add the parameters for the stored procedure here
	@ConditionId int = 0,
	@ConditionName nvarchar(30) = " ",
	@ConditionDescription nvarchar(max) = " ",
	@Active bit = 1,
	@Command nvarchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @Command = 'Insert'
	Begin
		Insert into Condition(ConditionName, ConditionDescription, Active)
		Values (@ConditionName, @ConditionDescription, @Active)
	end

	if @Command = 'GetAll'
	begin
		Select *
		From Condition
		Where Active = 1
	end

	if @Command = 'GetOne'
	begin
		Select *
		from Condition
		where ConditionId = @ConditionId and Active = 1
	end

	if @Command = 'Update'
	begin
		update Condition
		set
			ConditionName = @ConditionName,
			ConditionDescription = @ConditionDescription
		where ConditionId = @ConditionId
	end

	if @Command = 'Delete'
	begin
		update Condition
		set
			Active = 0
		where ConditionId = @ConditionId
	end
END

GO

