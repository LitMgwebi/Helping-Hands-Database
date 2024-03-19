-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[NurseVisitRange]
	-- Add the parameters for the stored procedure here
	@NurseId int,
	@StartDate date,
	@EndDate date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select *
	From CareContract
		Left Outer join EndUser N
		on CareContract.NurseId = N.UserId
		left outer join EndUser P
		on CareContract.PatientId = P.UserId
		left outer join Suburb
		on CareContract.SuburbId = Suburb.SuburbId
		left outer Join Wound
		on CareContract.WoundId = Wound.WoundId
	Left outer join Visit
	on CareContract.ContractId = Visit.ContractId
	Where CareContract.Active = 1 
		and VisitDate Between @StartDate and @EndDate
		and CareContract.NurseId = @NurseId
	Order by CareContract.ContractId, ApproxTime asc
END

GO

