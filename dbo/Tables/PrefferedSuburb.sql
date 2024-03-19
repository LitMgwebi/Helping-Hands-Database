CREATE TABLE [dbo].[PrefferedSuburb] (
    [NurseId]  INT NOT NULL,
    [SuburbId] INT NOT NULL,
    [Active]   BIT NOT NULL,
    CONSTRAINT [PK_PrefferedSuburb] PRIMARY KEY CLUSTERED ([NurseId] ASC, [SuburbId] ASC),
    CONSTRAINT [FK_PrefferedSuburb_Nurse] FOREIGN KEY ([NurseId]) REFERENCES [dbo].[Nurse] ([NurseId]),
    CONSTRAINT [FK_PrefferedSuburb_Suburb] FOREIGN KEY ([SuburbId]) REFERENCES [dbo].[Suburb] ([SuburbId])
);


GO

