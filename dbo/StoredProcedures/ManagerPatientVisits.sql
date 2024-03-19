-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE ManagerPatientVisits 
	-- Add the parameters for the stored procedure here	
	@PatientId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select *
	From Visit V
	left outer join CareContract C
	on C.ContractId = V.ContractId
	Where V.Active = 1
		and C.PatientId = @PatientId
	order by VisitDate asc
END

GO

