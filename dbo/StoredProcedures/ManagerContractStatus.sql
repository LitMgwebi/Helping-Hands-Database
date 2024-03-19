-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ManagerContractStatus]
	-- Add the parameters for the stored procedure here
	@Status nvarchar(5)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select *
	From CareContract
	Left outer join EndUser N
	on CareContract.NurseId = N.UserId
	Left outer join EndUser P
	on CareContract.PatientId = P.UserId
	Left outer join Suburb
	on CareContract.SuburbId = Suburb.SuburbId
	Left outer join Wound
	on CareContract.WoundId = Wound.WoundId
	Where ContractStatus = @Status
		and CareContract.Active = 1
	order by N.Firstname, N.Lastname asc
END

GO

