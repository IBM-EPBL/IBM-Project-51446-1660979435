SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SessionKey]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SessionKey](
	[group_name] [nvarchar](50) NULL,
	[session_key] [nvarchar](1000) NULL,
	[member_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SessionKey] PRIMARY KEY CLUSTERED 
(
	[member_name] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MultiGroups]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MultiGroups](
	[group_id] [int] IDENTITY(1,1) NOT NULL,
	[group_name] [varchar](50) NOT NULL,
	[session_key] [varchar](200) NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[group_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Group] UNIQUE NONCLUSTERED 
(
	[session_key] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserDetail](
	[username] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[secretkey] [varchar](50) NULL
) ON [PRIMARY]
END
