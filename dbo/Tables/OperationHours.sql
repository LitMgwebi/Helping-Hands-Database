CREATE TABLE [dbo].[OperationHours] (
    [OperationHoursId] INT           IDENTITY (1, 1) NOT NULL,
    [OperationDay]     NVARCHAR (15) NULL,
    [OpenTime]         TIME (0)      NULL,
    [CloseTime]        TIME (0)      NULL,
    [Active]           BIT           NOT NULL,
    [BusinessId]       INT           NULL,
    CONSTRAINT [PK_OperationHours] PRIMARY KEY CLUSTERED ([OperationHoursId] ASC),
    CONSTRAINT [FK_OperationHours_BusinessInformation] FOREIGN KEY ([BusinessId]) REFERENCES [dbo].[BusinessInformation] ([BusinessId])
);


GO

