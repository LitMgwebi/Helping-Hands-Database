-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ManagerAvailableNurses]
	-- Add the parameters for the stored procedure here
	@SuburbId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select EndUser.Firstname, EndUser.Lastname, EndUser.Username, EndUser.Email, EndUser.IDNumber, EndUser.DateOfBirth, EndUser.Gender, EndUser.ContactNumber, Suburb.SuburbName
	From PrefferedSuburb
	Left outer join EndUser
	On PrefferedSuburb.NurseId = EndUser.UserId
	Left outer join Suburb
	on PrefferedSuburb.SuburbId = Suburb.SuburbId
	Where @SuburbId in (PrefferedSuburb.SuburbId)
		and PrefferedSuburb.Active = 1
	Order by EndUser.Firstname asc
END

GO

