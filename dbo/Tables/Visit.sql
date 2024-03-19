CREATE TABLE [dbo].[Visit] (
    [VisitId]        INT            IDENTITY (1, 1) NOT NULL,
    [ContractId]     INT            NOT NULL,
    [VisitDate]      DATETIME2 (0)  NOT NULL,
    [ApproxTime]     TIME (0)       NULL,
    [Arrival]        TIME (0)       NULL,
    [Departure]      TIME (0)       NULL,
    [WoundCondition] NVARCHAR (150) NULL,
    [Note]           NVARCHAR (MAX) NULL,
    [Active]         BIT            NOT NULL,
    CONSTRAINT [PK_Visit] PRIMARY KEY CLUSTERED ([VisitId] ASC),
    CONSTRAINT [FK_Visit_CareContract] FOREIGN KEY ([ContractId]) REFERENCES [dbo].[CareContract] ([ContractId])
);


GO

