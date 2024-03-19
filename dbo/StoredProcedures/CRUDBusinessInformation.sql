-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CRUDBusinessInformation]
	-- Add the parameters for the stored procedure here
	@BusinessId int = 0,
	@OrganizationName nvarchar(25) = " ",
	@NPONumber nvarchar(15) = " ",
	@AddressLineOne	nvarchar(50) = " ",
	@AddressLineTwo	nvarchar(50) = " ",
	@SuburbId int = 0,
	@ContactNumber nvarchar(20) = " ",
	@Email nvarchar(40) = " ",
	@Active	bit = 1,
	@Command nvarchar(10) = " "
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if @Command = 'Insert'
	begin
		Insert into BusinessInformation(OrganizationName, NPONumber, AddressLineOne, AddressLineTwo, SuburbId, ContactNumber, Email, Active)
		Values (@OrganizationName, @NPONumber, @AddressLineOne, @AddressLineTwo, @SuburbId, @ContactNumber, @Email, @Active)
	end

	if @Command = 'GetAll'
	begin
		Select BusinessId, OrganizationName, NPONumber, AddressLineOne, AddressLineTwo, ContactNumber, Email, S.SuburbName
		from BusinessInformation as BI
		Left outer join Suburb S
		on BI.SuburbId = S.SuburbId
		Where BI.Active = 1
	end

	if @Command = 'GetOne'
	begin
		Select BusinessId, OrganizationName, NPONumber, AddressLineOne, AddressLineTwo, ContactNumber, Email, BI.SuburbId as SuburbId, S.SuburbName
		from BusinessInformation as BI
		Left outer join Suburb S
		on BI.SuburbId = S.SuburbId
		Where BusinessId = @BusinessId and BI.Active = 1
	end

	if @Command = 'Update'
	begin
		update BusinessInformation
		set
			OrganizationName = @OrganizationName,
			NPONumber = @NPONumber,
			AddressLineOne = @AddressLineOne,
			AddressLineTwo = @AddressLineTwo,
			ContactNumber = @ContactNumber,
			SuburbId = @SuburbId,
			Email = @Email
		Where BusinessId = @BusinessId
	end

	if @Command = 'Delete'
	begin
		update BusinessInformation
		set
			Active = 0
		where BusinessId = @BusinessId
	end
END

GO

