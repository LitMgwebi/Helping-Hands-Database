CREATE TABLE [dbo].[City] (
    [CityId]           INT           IDENTITY (1, 1) NOT NULL,
    [CityName]         NVARCHAR (30) NOT NULL,
    [CityAbbreviation] NVARCHAR (5)  NOT NULL,
    [Active]           BIT           NOT NULL,
    CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED ([CityId] ASC)
);


GO

