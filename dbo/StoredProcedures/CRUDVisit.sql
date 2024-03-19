-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CRUDVisit]
	-- Add the parameters for the stored procedure here
	@VisitId int = 0,
	@ContractId int = 0,
	@VisitDate date = " ",
	@ApproxTime time(7) = " ",
	@Arrival time(7) = " ",
	@Departure time(7) = " ",
	@WoundCondition nvarchar(150) = " ",
	@Note nvarchar(max) = " ",
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
		Insert into Visit(
			ContractId,
			VisitDate,
			ApproxTime,
			Arrival,
			Departure,
			WoundCondition,
			Note,
			Active
			)
		Values (@ContractId,
			@VisitDate,
			@ApproxTime,
			@Arrival,
			@Departure,
			@WoundCondition,
			@Note,
			@Active
			)
	end

	if @Command = 'GetAll'
	begin
		Select *
		From Visit
		Where Visit.Active = 1
	end

	if @Command = 'GetOne'
	begin
		Select *
		From Visit
		Where Visit.Active = 1 and VisitId = @VisitId
	end

	if @Command = 'Update'
	begin
		update Visit
		set
			ContractId = @ContractId,
			VisitDate = @VisitDate,
			ApproxTime = @ApproxTime,
			Arrival = @Arrival,
			Departure = @Departure,
			WoundCondition = @WoundCondition,
			Note = @Note
		where VisitId = @VisitId
	end

	if @Command = 'Delete'
	begin
		update Visit
		set
			Active = 0
		where VisitId = @VisitId
	end
END

GO

