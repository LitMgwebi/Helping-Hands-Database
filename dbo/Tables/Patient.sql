CREATE TABLE [dbo].[Patient] (
    [PatientId]      INT            NOT NULL,
    [AddressLineOne] NVARCHAR (50)  NULL,
    [AddressLineTwo] NVARCHAR (50)  NULL,
    [SuburbId]       INT            NULL,
    [ICEName]        NVARCHAR (20)  NOT NULL,
    [ICENumber]      NVARCHAR (20)  NOT NULL,
    [AdditionalInfo] NVARCHAR (MAX) NULL,
    [Active]         BIT            NOT NULL,
    CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED ([PatientId] ASC),
    CONSTRAINT [FK_Patient_EndUser] FOREIGN KEY ([PatientId]) REFERENCES [dbo].[EndUser] ([UserId]),
    CONSTRAINT [FK_Patient_Suburb] FOREIGN KEY ([SuburbId]) REFERENCES [dbo].[Suburb] ([SuburbId])
);


GO

