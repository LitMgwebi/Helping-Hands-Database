CREATE TABLE [dbo].[CareContract] (
    [ContractId]      INT            IDENTITY (1, 1) NOT NULL,
    [ContractStatus]  NVARCHAR (5)   NOT NULL,
    [ContractDate]    DATETIME2 (0)  NOT NULL,
    [PatientId]       INT            NOT NULL,
    [NurseId]         INT            NULL,
    [WoundId]         INT            NULL,
    [AddressLineOne]  NVARCHAR (50)  NULL,
    [AddressLineTwo]  NVARCHAR (50)  NULL,
    [SuburbId]        INT            NULL,
    [StartDate]       DATETIME2 (0)  NULL,
    [EndDate]         DATETIME2 (0)  NULL,
    [ContractComment] NVARCHAR (MAX) NULL,
    [Active]          BIT            NOT NULL,
    CONSTRAINT [PK_CareContract] PRIMARY KEY CLUSTERED ([ContractId] ASC),
    CONSTRAINT [FK_CareContract_Nurse] FOREIGN KEY ([NurseId]) REFERENCES [dbo].[Nurse] ([NurseId]),
    CONSTRAINT [FK_CareContract_Patient] FOREIGN KEY ([PatientId]) REFERENCES [dbo].[Patient] ([PatientId]),
    CONSTRAINT [FK_CareContract_Suburb] FOREIGN KEY ([SuburbId]) REFERENCES [dbo].[Suburb] ([SuburbId]),
    CONSTRAINT [FK_CareContract_Wound] FOREIGN KEY ([WoundId]) REFERENCES [dbo].[Wound] ([WoundId])
);


GO

