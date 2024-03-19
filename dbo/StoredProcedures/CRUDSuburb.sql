-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CRUDSuburb]
	-- Add the parameters for the stored procedure here
	@SuburbId int = 0,
	@SuburbName nvarchar(30) = " ",
	@PostalCode int = 0,
	@CityId int = 0,
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
		Insert into Suburb(SuburbName, PostalCode, CityId, Active)
		Values (@SuburbName, @PostalCode, @CityId, @Active)
	end

	if @Command = 'GetAll'
	begin
		Select SuburbId, SuburbName, PostalCode, Suburb.CityId as CityId, City.CityName
		From Suburb
		left outer join City
		on Suburb.CityId = City.CityId
		Where Suburb.Active = 1
		Order by SuburbName asc
	end

	if @Command = 'GetOne'
	begin
		Select SuburbId, SuburbName, PostalCode, Suburb.CityId as CityId, City.CityName
		From Suburb
		left outer join City
		on Suburb.CityId = City.CityId
		Where SuburbId = @SuburbId and Suburb.Active = 1
	end

	if @Command = 'Update'
	begin
		update Suburb
		set
			SuburbName = @SuburbName,
			PostalCode = @PostalCode,
			CityId = @CityId
		where SuburbId = @SuburbId
	end

	if @Command = 'Delete'
	begin
		update Suburb
		set
			Active = 0
		where SuburbId = @SuburbId
	end
END

GO

