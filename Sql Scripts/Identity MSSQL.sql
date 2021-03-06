USE [Identity]
GO
/****** Object:  Table [dbo].[Statuses]    Script Date: 11/14/2014 17:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Statuses](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](256) NOT NULL,
	[CreatedOn] [smalldatetime] NOT NULL,
	[UpdatedOn] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Statuses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11/14/2014 17:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [tinyint] NOT NULL,
	[Name] [varchar](256) NOT NULL,
	[CreateOn] [smalldatetime] NOT NULL,
	[UpdatedOn] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/14/2014 17:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [varchar](512) NOT NULL,
	[SecurityStamp] [varchar](512) NULL,
	[PhoneNumber] [varchar](32) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[FailedLoginCount] [int] NOT NULL,
	[PerishableToken] [uniqueidentifier] NULL,
	[LastLoginDate] [smalldatetime] NOT NULL,
	[StatusId] [tinyint] NOT NULL,
	[CreatedOn] [smalldatetime] NOT NULL,
	[UpdatedOn] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Statuses_Update]    Script Date: 11/14/2014 17:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Statuses_Update] 
    @Id tinyint,
    @Name varchar(256),
    @CreatedOn smalldatetime,
    @UpdatedOn smalldatetime
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Statuses]
	SET    [Name] = @Name, [CreatedOn] = @CreatedOn, [UpdatedOn] = @UpdatedOn
	WHERE  [Id] = @Id
	
	-- Begin Return Select <- do not remove
	SELECT [Id], [Name], [CreatedOn], [UpdatedOn]
	FROM   [dbo].[Statuses]
	WHERE  [Id] = @Id	
	-- End Return Select <- do not remove

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_Statuses_Insert]    Script Date: 11/14/2014 17:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Statuses_Insert] 
    @Name varchar(256),
    @CreatedOn smalldatetime,
    @UpdatedOn smalldatetime
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Statuses] ([Name], [CreatedOn], [UpdatedOn])
	SELECT @Name, @CreatedOn, @UpdatedOn
	
	-- Begin Return Select <- do not remove
	SELECT [Id], [Name], [CreatedOn], [UpdatedOn]
	FROM   [dbo].[Statuses]
	WHERE  [Id] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_Statuses_GetById]    Script Date: 11/14/2014 17:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Statuses_GetById] 
    @Id tinyint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [Id], [Name], [CreatedOn], [UpdatedOn] 
	FROM   [dbo].[Statuses] 
	WHERE  ([Id] = @Id OR @Id IS NULL) 

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_Statuses_Delete]    Script Date: 11/14/2014 17:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Statuses_Delete] 
    @Id tinyint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Statuses]
	WHERE  [Id] = @Id

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_Roles_Update]    Script Date: 11/14/2014 17:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Roles_Update] 
    @Id tinyint,
    @Name varchar(256),
    @CreateOn smalldatetime,
    @UpdatedOn smalldatetime
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Roles]
	SET    [Id] = @Id, [Name] = @Name, [CreateOn] = @CreateOn, [UpdatedOn] = @UpdatedOn
	WHERE  [Id] = @Id
	
	-- Begin Return Select <- do not remove
	SELECT [Id], [Name], [CreateOn], [UpdatedOn]
	FROM   [dbo].[Roles]
	WHERE  [Id] = @Id	
	-- End Return Select <- do not remove

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_Roles_Insert]    Script Date: 11/14/2014 17:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Roles_Insert] 
    @Id tinyint,
    @Name varchar(256),
    @CreateOn smalldatetime,
    @UpdatedOn smalldatetime
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Roles] ([Id], [Name], [CreateOn], [UpdatedOn])
	SELECT @Id, @Name, @CreateOn, @UpdatedOn
	
	-- Begin Return Select <- do not remove
	SELECT [Id], [Name], [CreateOn], [UpdatedOn]
	FROM   [dbo].[Roles]
	WHERE  [Id] = @Id
	-- End Return Select <- do not remove
               
	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_Roles_GetIdByName]    Script Date: 11/14/2014 17:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Roles_GetIdByName]
	@Name varchar(256)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [Id]
	FROM [dbo].[Roles]
	WHERE [Name] = @Name

END
GO
/****** Object:  StoredProcedure [dbo].[usp_Roles_GetById]    Script Date: 11/14/2014 17:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Roles_GetById] 
    @Id tinyint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [Id], [Name], [CreateOn], [UpdatedOn] 
	FROM   [dbo].[Roles] 
	WHERE  ([Id] = @Id OR @Id IS NULL) 

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_Roles_Delete]    Script Date: 11/14/2014 17:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Roles_Delete] 
    @Id tinyint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Roles]
	WHERE  [Id] = @Id

	COMMIT
GO
/****** Object:  Table [dbo].[UsersRoles]    Script Date: 11/14/2014 17:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [tinyint] NOT NULL,
 CONSTRAINT [PK_UsersRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogins]    Script Date: 11/14/2014 17:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserLogins](
	[UserId] [int] NOT NULL,
	[LoginProvider] [varchar](128) NOT NULL,
	[ProviderKey] [varbinary](128) NOT NULL,
 CONSTRAINT [PK_UserLogins] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserClaims]    Script Date: 11/14/2014 17:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ClaimType] [varchar](max) NOT NULL,
	[ClaimValue] [varchar](max) NULL,
 CONSTRAINT [PK_UserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Users_Update]    Script Date: 11/14/2014 17:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Users_Update] 
    @Id int,
    @Name nvarchar(256),
    @Email nvarchar(256),
    @EmailConfirmed bit,
    @PasswordHash varchar(512),
    @SecurityStamp varchar(512) = NULL,
    @PhoneNumber varchar(32) = NULL,
    @PhoneNumberConfirmed bit,
    @TwoFactorEnabled bit,
    @LockoutEndDateUtc datetime = NULL,
    @LockoutEnabled bit,
    @FailedLoginCount int,
    @PerishableToken uniqueidentifier = NULL,
    @LastLoginDate smalldatetime,
    @StatusId tinyint,
    @CreatedOn smalldatetime,
    @UpdatedOn smalldatetime
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Users]
	SET    [UserName] = @Name, [Email] = @Email, [EmailConfirmed] = @EmailConfirmed, [PasswordHash] = @PasswordHash, [SecurityStamp] = @SecurityStamp, [PhoneNumber] = @PhoneNumber, [PhoneNumberConfirmed] = @PhoneNumberConfirmed, [TwoFactorEnabled] = @TwoFactorEnabled, [LockoutEndDateUtc] = @LockoutEndDateUtc, [LockoutEnabled] = @LockoutEnabled, [FailedLoginCount] = @FailedLoginCount, [PerishableToken] = @PerishableToken, [LastLoginDate] = @LastLoginDate, [StatusId] = @StatusId, [CreatedOn] = @CreatedOn, [UpdatedOn] = @UpdatedOn
	WHERE  [Id] = @Id
	
	-- Begin Return Select <- do not remove
	SELECT [Id], [UserName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [FailedLoginCount], [PerishableToken], [LastLoginDate], [StatusId], [CreatedOn], [UpdatedOn]
	FROM   [dbo].[Users]
	WHERE  [Id] = @Id	
	-- End Return Select <- do not remove

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_Users_Insert]    Script Date: 11/14/2014 17:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Users_Insert] 
    @Name nvarchar(256),
    @Email nvarchar(256),
    @EmailConfirmed bit,
    @PasswordHash varchar(512),
    @SecurityStamp varchar(512) = NULL,
    @PhoneNumber varchar(32) = NULL,
    @PhoneNumberConfirmed bit,
    @TwoFactorEnabled bit,
    @LockoutEndDateUtc datetime = NULL,
    @LockoutEnabled bit,
    @FailedLoginCount int,
    @PerishableToken uniqueidentifier = NULL,
    @LastLoginDate smalldatetime,
    @StatusId tinyint,
    @CreatedOn smalldatetime,
    @UpdatedOn smalldatetime
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Users] ([UserName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [FailedLoginCount], [PerishableToken], [LastLoginDate], [StatusId], [CreatedOn], [UpdatedOn])
	SELECT @Name, @Email, @EmailConfirmed, @PasswordHash, @SecurityStamp, @PhoneNumber, @PhoneNumberConfirmed, @TwoFactorEnabled, @LockoutEndDateUtc, @LockoutEnabled, @FailedLoginCount, @PerishableToken, @LastLoginDate, @StatusId, @CreatedOn, @UpdatedOn
	
	-- Begin Return Select <- do not remove
	SELECT [Id], [UserName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [FailedLoginCount], [PerishableToken], [LastLoginDate], [StatusId], [CreatedOn], [UpdatedOn]
	FROM   [dbo].[Users]
	WHERE  [Id] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_Users_GetPasswordHashById]    Script Date: 11/14/2014 17:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Users_GetPasswordHashById]
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT [PasswordHash]
	FROM [dbo].[Users]
	WHERE [Id] = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Users_GetByUserName]    Script Date: 11/14/2014 17:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Users_GetByUserName]
	@Name nvarchar(256)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT [Id]
      ,[UserName]
      ,[Email]
      ,[EmailConfirmed]
      ,[PasswordHash]
      ,[SecurityStamp]
      ,[PhoneNumber]
      ,[PhoneNumberConfirmed]
      ,[TwoFactorEnabled]
      ,[LockoutEndDateUtc]
      ,[LockoutEnabled]
      ,[FailedLoginCount]
      ,[PerishableToken]
      ,[LastLoginDate]
      ,[StatusId]
      ,[CreatedOn]
      ,[UpdatedOn]
	FROM [dbo].[Users]
	WHERE [UserName] = @Name    
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Users_GetById]    Script Date: 11/14/2014 17:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Users_GetById] 
    @Id int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [Id], [UserName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [FailedLoginCount], [PerishableToken], [LastLoginDate], [StatusId], [CreatedOn], [UpdatedOn] 
	FROM   [dbo].[Users] 
	WHERE  ([Id] = @Id OR @Id IS NULL) 

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_Users_GetByEmail]    Script Date: 11/14/2014 17:32:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Users_GetByEmail]
	@Email nvarchar(256)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT [Id]
      ,[UserName]
      ,[Email]
      ,[EmailConfirmed]
      ,[PasswordHash]
      ,[SecurityStamp]
      ,[PhoneNumber]
      ,[PhoneNumberConfirmed]
      ,[TwoFactorEnabled]
      ,[LockoutEndDateUtc]
      ,[LockoutEnabled]
      ,[FailedLoginCount]
      ,[PerishableToken]
      ,[LastLoginDate]
      ,[StatusId]
      ,[CreatedOn]
      ,[UpdatedOn]
	FROM [dbo].[Users]
	WHERE [Email] = @Email
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Users_Delete]    Script Date: 11/14/2014 17:32:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Users_Delete] 
    @Id int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Users]
	WHERE  [Id] = @Id

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_UsersRoles_Insert]    Script Date: 11/14/2014 17:32:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_UsersRoles_Insert] 
    @UserId int,
    @RoleId tinyint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[UsersRoles] ([UserId], [RoleId])
	SELECT @UserId, @RoleId
	
	-- Begin Return Select <- do not remove
	SELECT [UserId], [RoleId]
	FROM   [dbo].[UsersRoles]
	WHERE  [UserId] = @UserId
	       AND [RoleId] = @RoleId
	-- End Return Select <- do not remove
               
	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_UsersRoles_GetByUserId]    Script Date: 11/14/2014 17:32:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_UsersRoles_GetByUserId] 
    @UserId int,
    @RoleId tinyint
AS 
	SET NOCOUNT ON 
	
	SELECT [UserId], [RoleId]
	FROM   [dbo].[UsersRoles]
	WHERE  [UserId] = @UserId
GO
/****** Object:  StoredProcedure [dbo].[usp_UsersRoles_Delete]    Script Date: 11/14/2014 17:32:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_UsersRoles_Delete] 
    @UserId int,
    @RoleName varchar(256)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE [dbo].[UsersRoles]
	FROM   [dbo].[UsersRoles] ur
				INNER JOIN [dbo.Roles] r on r.[Id] = ur.[RoleId]
	WHERE  ur.[UserId] = @UserId
	       AND r.[Name] = @RoleName

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_UserLogins_Insert]    Script Date: 11/14/2014 17:32:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_UserLogins_Insert] 
    @UserId int,
    @LoginProvider varchar(128),
    @ProviderKey varbinary(128)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[UserLogins] ([UserId], [LoginProvider], [ProviderKey])
	SELECT @UserId, @LoginProvider, @ProviderKey
	
	-- Begin Return Select <- do not remove
	SELECT [UserId], [LoginProvider], [ProviderKey]
	FROM   [dbo].[UserLogins]
	WHERE  [UserId] = @UserId
	       AND [LoginProvider] = @LoginProvider
	       AND [ProviderKey] = @ProviderKey
	-- End Return Select <- do not remove
               
	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_UserLogins_GetUserIdByLogin]    Script Date: 11/14/2014 17:32:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_UserLogins_GetUserIdByLogin]
	@LoginProvider varchar(128),
	@ProviderKey varchar(128)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT [UserId]
	FROM [dbo].[UserLogins]
	WHERE [LoginProvider] = @LoginProvider and [ProviderKey] = @ProviderKey
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_UserLogins_GetByUserId]    Script Date: 11/14/2014 17:32:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_UserLogins_GetByUserId]
	@UserId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	SELECT [LoginProvider]
		  ,[ProviderKey]
	FROM [dbo].[UserLogins]
	WHERE [UserId] = @UserId    
END
GO
/****** Object:  StoredProcedure [dbo].[usp_UserLogins_Delete]    Script Date: 11/14/2014 17:32:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_UserLogins_Delete] 
    @UserId int,
    @LoginProvider varchar(128),
    @ProviderKey varbinary(128)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[UserLogins]
	WHERE  [UserId] = @UserId
	       AND [LoginProvider] = @LoginProvider
	       AND [ProviderKey] = @ProviderKey

	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_UserClaims_Insert]    Script Date: 11/14/2014 17:32:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_UserClaims_Insert] 
    @UserId int,
    @ClaimType varchar(MAX),
    @ClaimValue varchar(MAX)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[UserClaims] ([UserId], [ClaimType], [ClaimValue])
	SELECT @UserId, @ClaimType, @ClaimValue
	
	-- Begin Return Select <- do not remove
	SELECT [Id], [UserId], [ClaimType], [ClaimValue]
	FROM   [dbo].[UserClaims]
	WHERE  [Id] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[usp_UserClaims_GetByUserId]    Script Date: 11/14/2014 17:32:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_UserClaims_GetByUserId]
	@UserId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT [Id]
		  ,[UserId]
		  ,[ClaimType]
		  ,[ClaimValue]
	FROM [Identity].[dbo].[UserClaims]
	WHERE [UserId] = @UserId
END
GO
/****** Object:  StoredProcedure [dbo].[usp_UserClaims_Delete]    Script Date: 11/14/2014 17:32:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_UserClaims_Delete] 
    @Id int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[UserClaims]
	WHERE  [Id] = @Id

	COMMIT
GO
/****** Object:  Default [DF_Statuses_CreatedOn]    Script Date: 11/14/2014 17:32:41 ******/
ALTER TABLE [dbo].[Statuses] ADD  CONSTRAINT [DF_Statuses_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_Statuses_UpdatedOn]    Script Date: 11/14/2014 17:32:41 ******/
ALTER TABLE [dbo].[Statuses] ADD  CONSTRAINT [DF_Statuses_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
/****** Object:  Default [DF_Table_1_CreateDate]    Script Date: 11/14/2014 17:32:41 ******/
ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [DF_Table_1_CreateDate]  DEFAULT (getdate()) FOR [CreateOn]
GO
/****** Object:  Default [DF_Roles_UpdatedOn]    Script Date: 11/14/2014 17:32:41 ******/
ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [DF_Roles_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
/****** Object:  Default [DF_Users_EmailConfirmed]    Script Date: 11/14/2014 17:32:41 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_EmailConfirmed]  DEFAULT ((0)) FOR [EmailConfirmed]
GO
/****** Object:  Default [DF_Users_PhoneNumberConfirmed]    Script Date: 11/14/2014 17:32:41 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_PhoneNumberConfirmed]  DEFAULT ((0)) FOR [PhoneNumberConfirmed]
GO
/****** Object:  Default [DF_Users_TwoFactorEnabled]    Script Date: 11/14/2014 17:32:41 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_TwoFactorEnabled]  DEFAULT ((0)) FOR [TwoFactorEnabled]
GO
/****** Object:  Default [DF_Users_LockoutEnabled]    Script Date: 11/14/2014 17:32:41 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_LockoutEnabled]  DEFAULT ((0)) FOR [LockoutEnabled]
GO
/****** Object:  Default [DF_Users_FailedLoginCount]    Script Date: 11/14/2014 17:32:41 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_FailedLoginCount]  DEFAULT ((0)) FOR [FailedLoginCount]
GO
/****** Object:  Default [DF_Users_LastLoginDate]    Script Date: 11/14/2014 17:32:41 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_LastLoginDate]  DEFAULT (getdate()) FOR [LastLoginDate]
GO
/****** Object:  Default [DF_Users_StatusId]    Script Date: 11/14/2014 17:32:41 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_StatusId]  DEFAULT ((0)) FOR [StatusId]
GO
/****** Object:  Default [DF_Users_CreatedOn]    Script Date: 11/14/2014 17:32:41 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_Users_UpdatedOn]    Script Date: 11/14/2014 17:32:41 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
/****** Object:  ForeignKey [FK_Users_Statuses]    Script Date: 11/14/2014 17:32:41 ******/
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Statuses] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Statuses] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Statuses]
GO
/****** Object:  ForeignKey [FK_UsersRoles_Roles]    Script Date: 11/14/2014 17:32:41 ******/
ALTER TABLE [dbo].[UsersRoles]  WITH CHECK ADD  CONSTRAINT [FK_UsersRoles_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[UsersRoles] CHECK CONSTRAINT [FK_UsersRoles_Roles]
GO
/****** Object:  ForeignKey [FK_UsersRoles_Users]    Script Date: 11/14/2014 17:32:41 ******/
ALTER TABLE [dbo].[UsersRoles]  WITH CHECK ADD  CONSTRAINT [FK_UsersRoles_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UsersRoles] CHECK CONSTRAINT [FK_UsersRoles_Users]
GO
/****** Object:  ForeignKey [FK_UserLogins_Users]    Script Date: 11/14/2014 17:32:41 ******/
ALTER TABLE [dbo].[UserLogins]  WITH CHECK ADD  CONSTRAINT [FK_UserLogins_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserLogins] CHECK CONSTRAINT [FK_UserLogins_Users]
GO
/****** Object:  ForeignKey [FK_UserClaims_Users]    Script Date: 11/14/2014 17:32:41 ******/
ALTER TABLE [dbo].[UserClaims]  WITH CHECK ADD  CONSTRAINT [FK_UserClaims_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserClaims] CHECK CONSTRAINT [FK_UserClaims_Users]
GO
