CREATE TABLE [dbo].[PatientCondition] (
    [PatientId]   INT NOT NULL,
    [ConditionId] INT NOT NULL,
    [Active]      BIT NOT NULL,
    CONSTRAINT [PK_PatientCondition] PRIMARY KEY CLUSTERED ([PatientId] ASC, [ConditionId] ASC),
    CONSTRAINT [FK_PatientCondition_Condition] FOREIGN KEY ([ConditionId]) REFERENCES [dbo].[Condition] ([ConditionId]),
    CONSTRAINT [FK_PatientCondition_Patient] FOREIGN KEY ([PatientId]) REFERENCES [dbo].[Patient] ([PatientId])
);


GO

