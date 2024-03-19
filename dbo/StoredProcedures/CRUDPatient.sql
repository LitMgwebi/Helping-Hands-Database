-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CRUDPatient]
	-- Add the parameters for the stored procedure here
	@PatientId int = 0,
	@AddressLineOne nvarchar(50) = " ",
	@AddressLineTwo nvarchar(50) = " ",
	@SuburbId int = 0,
	@ICEName nvarchar(20) = " ",
	@ICENumber nvarchar(50) = " ",
	@AdditionalInfo nvarchar(max) = " ",
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
		Insert into Patient(PatientId, AddressLineOne, AddressLineTwo, SuburbId, ICEName, ICENumber, AdditionalInfo, Active)
		Values (@PatientId, @AddressLineOne, @AddressLineTwo, @SuburbId, @ICEName, @ICENumber, @AdditionalInfo, @Active)
	end

	if @Command = 'GetAll'
	begin
		Select *
		From Patient
		left outer join EndUser
		on Patient.PatientId = EndUser.UserId
		left outer join Suburb
		on Patient.SuburbId = Suburb.SuburbId
		Where Patient.Active = 1
		Order by EndUser.Username asc
	end

	if @Command = 'GetOne'
	begin
		Select *
		From Patient
		left outer join EndUser
		on Patient.PatientId = EndUser.UserId
		left outer join Suburb
		on Patient.SuburbId = Suburb.SuburbId
		Where PatientId = @PatientId and Patient.Active = 1
	end

	if @Command = 'Update'
	begin
		update Patient
		set
			PatientId = @PatientId, 
			AddressLineOne = @AddressLineOne, 
			AddressLineTwo = @AddressLineTwo, 
			SuburbId = @SuburbId, 
			ICEName = @ICEName, 
			ICENumber = ICENumber, 
			AdditionalInfo = @AdditionalInfo
		where PatientId = @PatientId
	end

	if @Command = 'Delete'
	begin
		update Patient
		set
			Active = 0
		where PatientId = @PatientId
	end
END

GO

