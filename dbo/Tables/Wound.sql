CREATE TABLE [dbo].[Wound] (
    [WoundId]          INT            IDENTITY (1, 1) NOT NULL,
    [WoundName]        NVARCHAR (20)  NOT NULL,
    [Grade]            NVARCHAR (5)   NULL,
    [WoundDescription] NVARCHAR (MAX) NULL,
    [Active]           BIT            NOT NULL,
    CONSTRAINT [PK_Wounf] PRIMARY KEY CLUSTERED ([WoundId] ASC)
);


GO

