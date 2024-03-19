-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[NurseAssignedConditions]
	-- Add the parameters for the stored procedure here
	@NurseId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select *
	From CareContract C
	Left outer join EndUser P
	on C.PatientId = P.UserId
	Left outer join Suburb
	on C.SuburbId = Suburb.SuburbId
	Left outer join PatientCondition CC
	on P.UserId = CC.PatientId
	Left outer join Wound
	On C.WoundId = Wound.WoundId
	Left outer join Condition
	on Condition.ConditionId = CC.ConditionId
	Where C.NurseId = @NurseId
	Order by cc.ConditionId
END

GO

