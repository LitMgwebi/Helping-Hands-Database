-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[NurseContractsByGrades]
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
	left outer join Nurse n
	on N.NurseId = @NurseId
	left outer join EndUser P
	on C.PatientId = P.UserId
	left outer join Suburb S
	on C.SuburbId = S.SuburbId
	left outer join Wound W
	on C.WoundId = W.WoundId
	left outer join PrefferedSuburb PS
	on @NurseId in (PS.NurseId)
	Where C.SuburbId in (PS.SuburbId)
	and N.Grade = W.Grade
	and C.Active = 1
	and C.ContractStatus = 'N'

END

GO

