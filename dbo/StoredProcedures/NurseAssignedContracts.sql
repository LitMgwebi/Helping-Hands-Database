-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[NurseAssignedContracts]
	-- Add the parameters for the stored procedure here
	@NurseId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select *
	From CareContract
	left outer join EndUser P
	on CareContract.PatientId = P.UserId
	left outer join Suburb
	on CareContract.SuburbId = Suburb.SuburbId
	left outer Join Wound
	on CareContract.WoundId = Wound.WoundId
 	Where CareContract.Active = 1 
		and CareContract.NurseId = @NurseId
		and CareContract.ContractStatus = 'A'
	order by P.Lastname asc

END

GO

