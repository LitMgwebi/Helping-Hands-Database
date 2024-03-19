CREATE TABLE [dbo].[EndUser] (
    [UserId]             INT            IDENTITY (1, 1) NOT NULL,
    [Username]           NVARCHAR (20)  NOT NULL,
    [Firstname]          NVARCHAR (20)  NOT NULL,
    [Lastname]           NVARCHAR (20)  NOT NULL,
    [DateOfBirth]        DATETIME2 (0)  NOT NULL,
    [Email]              NVARCHAR (40)  NOT NULL,
    [Password]           NVARCHAR (MAX) NOT NULL,
    [Gender]             NVARCHAR (15)  NOT NULL,
    [ContactNumber]      NVARCHAR (20)  NOT NULL,
    [IDNumber]           NVARCHAR (15)  NULL,
    [UserType]           NVARCHAR (5)   NULL,
    [ApplicationType]    NVARCHAR (5)   NULL,
    [ProfilePicture]     NVARCHAR (MAX) NULL,
    [ProfilePictureName] NVARCHAR (50)  NULL,
    [Active]             BIT            NOT NULL,
    CONSTRAINT [PK_EndUser] PRIMARY KEY CLUSTERED ([UserId] ASC)
);


GO

