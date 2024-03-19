-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[NurseContractVisits]
	-- Add the parameters for the stored procedure here
	@ContractId int
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
		and V.ContractId = @ContractId
	order by VisitDate asc
END

GO

