CREATE TABLE [dbo].[Condition] (
    [ConditionId]          INT            IDENTITY (1, 1) NOT NULL,
    [ConditionName]        NVARCHAR (30)  NOT NULL,
    [ConditionDescription] NVARCHAR (MAX) NOT NULL,
    [Active]               BIT            NOT NULL,
    CONSTRAINT [PK_Condition] PRIMARY KEY CLUSTERED ([ConditionId] ASC)
);


GO

