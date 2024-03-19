CREATE TABLE [dbo].[Nurse] (
    [NurseId] INT          NOT NULL,
    [Grade]   NVARCHAR (5) NOT NULL,
    [Active]  BIT          NOT NULL,
    CONSTRAINT [PK_Nurse] PRIMARY KEY CLUSTERED ([NurseId] ASC),
    CONSTRAINT [FK_Nurse_EndUser] FOREIGN KEY ([NurseId]) REFERENCES [dbo].[EndUser] ([UserId])
);


GO

