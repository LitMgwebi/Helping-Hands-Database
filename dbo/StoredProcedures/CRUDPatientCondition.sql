-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CRUDPatientCondition] 
	-- Add the parameters for the stored procedure here
	@PatientId int = 0,
	@ConditionId int = 0,
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
		Insert into PatientCondition(PatientId, ConditionId, Active)
		Values (@PatientId, @ConditionId, @Active)
	end

	if @Command = 'GetAll'
	begin
		Select *
		From PatientCondition
		left outer join EndUser
		on PatientCondition.PatientId = EndUser.UserId
		left outer join Condition
		on PatientCondition.ConditionId = Condition.ConditionId
		Where PatientCondition.Active = 1
	end

	if @Command = 'GetOne'
	begin
		Select *
		From PatientCondition
		left outer join EndUser
		on PatientCondition.PatientId = EndUser.UserId
		left outer join Condition
		on PatientCondition.ConditionId = Condition.ConditionId
		Where PatientCondition.Active = 1 and PatientCondition.PatientId = @PatientId and PatientCondition.ConditionId = @ConditionId
	end

	if @Command = 'ByPatients'
	begin
		Select *
		From PatientCondition
		left outer join EndUser
		on PatientCondition.PatientId = EndUser.UserId
		left outer join Condition
		on PatientCondition.ConditionId = Condition.ConditionId
		Where PatientCondition.Active = 1 and PatientCondition.PatientId = @PatientId
	end
	if @Command = 'Update'
	begin
		update PatientCondition
		set
			PatientId = @PatientId,
			ConditionId = @ConditionId
		where PatientCondition.PatientId = @PatientId
	end

	if @Command = 'Delete'
	begin
		update PatientCondition
		set
			Active = 0
		where PatientCondition.PatientId = @PatientId and PatientCondition.ConditionId = @ConditionId
	end
END

GO

