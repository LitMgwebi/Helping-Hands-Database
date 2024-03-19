-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CRUDUser]
	-- Add the parameters for the stored procedure here
	@UserId int = 0,
	@Firstname nvarchar(20) = " ",
	@Lastname nvarchar(20) = " ",
	@DateOfBirth date = " ",
	@Email nvarchar(40) = " ",
	@Password nvarchar(max) = " ",
	@Username nvarchar(20) = " ",
	@ContactNumber nvarchar(20) = " ",
	@UserType nvarchar(5) = " ",
	@ApplicationType nvarchar(5) = " ",
	@IDNumber nvarchar(15) = " ",
	@Gender nvarchar(15) = " ",
	@ProfilePicture nvarchar(max) = null,
	@ProfilePictureName nvarchar(50) = null,
	@Active bit = 1,
	@Command nvarchar(10) = " "
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @Command = 'Insert'
	Begin
		Insert into EndUser(
			Firstname,
			Lastname,
			DateOfBirth,
			Email,
			Password,
			Username,
			ContactNumber,
			UserType,
			ApplicationType,
			IDNumber,
			Gender,
			ProfilePicture,
			ProfilePictureName,
			Active
			)
		Values (
			@Firstname,
			@Lastname,
			@DateOfBirth,
			@Email,
			@Password,
			@Username,
			@ContactNumber,
			@UserType,
			@ApplicationType,
			@IDNumber,
			@Gender,
			@ProfilePicture,
			@ProfilePictureName,
			@Active
			)
	end

	if @Command = 'GetAll'
	begin
		Select *, (Firstname + SPACE(1) + Lastname) as Fullname,  IDNumber as Idnumber
		From EndUser
		Where Active = 1
		Order by Username asc
	end
	
	if @Command = 'GetOne'
	begin
		Select *, (Firstname + SPACE(1) + Lastname) as Fullname, IDNumber as Idnumber
		from EndUser
		where UserId = @UserId and Active = 1
	end

	if @Command = 'Update'
	begin
		update EndUser
		set
			Firstname = @Firstname,
			Lastname = @Lastname,
			DateOfBirth = @DateOfBirth,
			Email = @Email,
			Password = @Password,
			Username = @Username,
			ContactNumber = @ContactNumber,
			UserType = @UserType,
			ApplicationType = @ApplicationType,
			IDNumber = @IDNumber,
			Gender = @Gender,
			ProfilePicture = @ProfilePicture,
			ProfilePictureName = @ProfilePictureName
		where UserId = @UserId
	end

	if @Command = 'Delete'
	begin
		update EndUser
		set
			Active = 0
		where UserId = @UserId
	end

	if @Command = 'Managers'
	begin
		Select *
		From EndUser
		Where Active = 1 and UserType = 'O'
	end
END

GO

