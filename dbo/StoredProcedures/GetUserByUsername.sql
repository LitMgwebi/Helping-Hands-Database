-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetUserByUsername]
	-- Add the parameters for the stored procedure here
	@Username nvarchar(20) = " "
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select U.UserId, U.Username, U.Password, U.Firstname, U.Lastname, U.DateOfBirth, U.Email, U.UserType
	From EndUser as U
	where Username = @Username and Active = 1
END

GO

