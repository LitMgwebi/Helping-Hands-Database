-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ManagerCareVisits]
	-- Add the parameters for the stored procedure here
	@PatientId int,
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
	Where CareContract.ContractDate between @StartDate and @EndDate
		or CareContract.ContractDate >= @StartDate 
		and CareContract.Active = 1
		and CareContract.PatientId = @PatientId
	Order by N.Firstname asc
END

GO

