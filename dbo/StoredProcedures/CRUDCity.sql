-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CRUDCity] 
	-- Add the parameters for the stored procedure here
	@CityId int = 0,
	@CityName nvarchar(30) = " ",
	@CityAbbreviation nvarchar(5) = " ",
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
		Insert into City(CityName, CityAbbreviation, Active)
		Values (@CityName, @CityAbbreviation, @Active)
	end

	if @Command = 'GetAll'
	begin
		Select *
		From City
		Where Active = 1
		Order by CityName asc
	end

	if @Command = 'GetOne'
	begin
		Select *
		from City
		where CityId = @CityId and Active = 1
	end

	if @Command = 'Update'
	begin
		update city
		set
			CityName = @CityName,
			CityAbbreviation = @CityAbbreviation
		where CityId = @CityId
	end

	if @Command = 'Delete'
	begin
		update city
		set
			Active = 0
		where CityId = @CityId
	end
END

GO

