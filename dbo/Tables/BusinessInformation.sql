CREATE TABLE [dbo].[BusinessInformation] (
    [BusinessId]       INT           IDENTITY (1, 1) NOT NULL,
    [OrganizationName] NVARCHAR (25) NULL,
    [NPONumber]        NVARCHAR (15) NULL,
    [AddressLineOne]   NVARCHAR (50) NULL,
    [AddressLineTwo]   NVARCHAR (50) NULL,
    [SuburbId]         INT           NULL,
    [ContactNumber]    NVARCHAR (20) NULL,
    [Email]            NVARCHAR (40) NULL,
    [Active]           BIT           NOT NULL,
    CONSTRAINT [PK_BusinessInformation] PRIMARY KEY CLUSTERED ([BusinessId] ASC),
    CONSTRAINT [FK_BusinessInformation_Suburb] FOREIGN KEY ([SuburbId]) REFERENCES [dbo].[Suburb] ([SuburbId])
);


GO

