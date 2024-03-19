CREATE TABLE [dbo].[Suburb] (
    [SuburbId]   INT           IDENTITY (1, 1) NOT NULL,
    [SuburbName] NVARCHAR (30) NOT NULL,
    [PostalCode] INT           NOT NULL,
    [CityId]     INT           NOT NULL,
    [Active]     BIT           NOT NULL,
    CONSTRAINT [PK_Suburb] PRIMARY KEY CLUSTERED ([SuburbId] ASC),
    CONSTRAINT [FK_Suburb_City] FOREIGN KEY ([CityId]) REFERENCES [dbo].[City] ([CityId])
);


GO

