-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CRUDCareContract]
	-- Add the parameters for the stored procedure here
	@ContractId int = 0,
	@ContractDate date = " ",
	@PatientId int = 0,
	@AddressLineOne nvarchar(50) = " ",
	@AddressLineTwo nvarchar(50) = " ",
	@SuburbId int = 0,
	@WoundId int =0,
	@StartDate date = " ",
	@EndDate date = " ",
	@NurseId int = " ",
	@ContractStatus nvarchar(5) = " ",
	@ContractComment nvarchar(max) = " ",
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
		Insert into CareContract(
			ContractDate,
			PatientId,
			AddressLineOne,
			AddressLineTwo,
			SuburbId,
			WoundId,
			StartDate,
			EndDate,
			NurseId,
			ContractStatus,
			ContractComment, 
			Active
			)
		Values (
			@ContractDate,
			@PatientId,
			@AddressLineOne,
			@AddressLineTwo,
			@SuburbId,
			@WoundId,
			@StartDate,
			@EndDate,
			@NurseId,
			@ContractStatus,
			@ContractComment,
			@Active
			)
	end

	if @Command = 'GetAll'
	begin
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
 		Where CareContract.Active = 1
	end

	if @Command = 'GetOne'
	begin
		Select *
		From CareContract
		left outer join EndUser N
		on CareContract.NurseId = N.UserId
		left outer join EndUser P
		on CareContract.PatientId = P.UserId
		left outer join Suburb
		on CareContract.SuburbId = Suburb.SuburbId
		left outer Join Wound
		on CareContract.WoundId = Wound.WoundId
 		Where CareContract.Active = 1 and CareContract.ContractId = @ContractId
	end

	if @Command = 'Update'
	begin
		update CareContract
		set
			ContractDate = @ContractDate,
			PatientId = @PatientId,
			AddressLineOne = @AddressLineOne,
			AddressLineTwo = @AddressLineTwo,
			SuburbId = @SuburbId,
			WoundId = @WoundId,
			StartDate = @StartDate,
			EndDate = @EndDate,
			NurseId = @NurseId,
			ContractStatus = @ContractStatus,
			ContractComment = @ContractComment 
		where CareContract.ContractId = @ContractId
	end

	if @Command = 'Delete'
	begin
		update CareContract
		set
			Active = 0
		where CareContract.ContractId = @ContractId
	end
END

GO

