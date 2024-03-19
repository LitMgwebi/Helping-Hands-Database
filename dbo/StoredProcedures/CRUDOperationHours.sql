-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CRUDOperationHours]
	-- Add the parameters for the stored procedure here
	@OperationHoursId int = 0,
	@OperationDay nvarchar(15) = " ",
	@OpenTime time(0) = " ",
	@CloseTime time(7) = " ",
	@BusinessId int = 1,
	@Active	bit = 1,
	@Command nvarchar(10) = " "
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @Command = 'Insert'
	begin
		Insert into OperationHours(OperationDay, OpenTime, CloseTime, BusinessId, Active)
		values (@OperationDay, @OpenTime, @CloseTime, @BusinessId, @Active)
	end

	if @Command = 'GetAll'
	begin
		Select *
		from OperationHours
		Where Active = 1
	end

	if @Command = 'GetOne'
	begin
		Select *
		from OperationHours
		Where OperationHoursId = @OperationHoursId and Active = 1
	end

	if @Command = 'Update'
	begin
		update OperationHours
		set
			OperationDay = @OperationDay,
			OpenTime = @OpenTime, 
			CloseTime = @CloseTime,
			BusinessId = @BusinessId
		where OperationHoursId = @OperationHoursId
	end

	if @Command = 'Delete'
	begin
		update OperationHours
		set
			Active = 0 
		where OperationHoursId = @OperationHoursId
	end
END

GO

