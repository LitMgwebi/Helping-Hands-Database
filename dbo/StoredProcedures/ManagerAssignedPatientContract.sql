-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE ManagerAssignedPatientContract
	-- Add the parameters for the stored procedure here
	@PatientId int
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
	where CareContract.PatientId = @PatientId
		and CareContract.ContractStatus = 'A'
		and CareContract.Active = 1
	order by CareContract.ContractStatus, P.Firstname, P.Lastname asc
END

GO

