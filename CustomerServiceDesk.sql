USE [CustomerServiceDesk]
GO
/****** Object:  StoredProcedure [dbo].[GetDeptDataByDeptId]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetDeptDataByDeptId] 
	(
@DeptId int
)
AS
BEGIN
	select * from tbl_Department
where DepartmentId=@DeptId
  END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllDeptMasterData]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetAllDeptMasterData]
	
AS
	 SET NOCOUNT ON 
	 begin
	 select DeptName,Abbreviation,Description from tbl_Department 
	 
	 end
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[GetEmpDataByEmpId]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetEmpDataByEmpId]
	(
@EmpId int
)
AS
BEGIN
	select * from tbl_Employee
where EmpId=@EmpId 
  END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllDesgMasterData]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetAllDesgMasterData]
	
AS
	
	begin
	select Desg_Name,Abbreviation,Description 
	from tbl_Designation 
	
	
	end
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertDesgMaster]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_InsertDesgMaster]
	(
@DesgName varchar(100),
@Abbreviation varchar(50),
@Description varchar(1000),
@Message varchar(250)output
)	
AS
	 
	 begin

	 insert into tbl_Designation
	 ( 
	 Desg_Name,
	 Abbreviation,
     Description
	
	 )
	 values
	 (
	
	 @DesgName,
	 @Abbreviation,
     @Description
	 
	 )
	 set @Message='Record Inserted Successfully..'
	 end
GO
/****** Object:  Table [dbo].[tbl_Employee]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Employee](
	[EmpId] [int] NOT NULL,
	[Emp_FirstName] [varchar](100) NULL,
	[Emp_LastName] [varchar](100) NULL,
	[Emp_MiddleName] [varchar](100) NULL,
	[Emp_DOB] [datetime] NULL,
	[Emp_DOJ] [datetime] NULL,
	[Address] [varchar](500) NULL,
	[Email] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Emp_DeptId] [int] NOT NULL,
	[Emp_DesgId] [int] NOT NULL,
	[Emp_Photo] [varbinary](max) NULL,
	[Emp_PhotoFileName] [varchar](100) NULL,
	[SuperiorEmpId] [int] NULL,
 CONSTRAINT [PK_tbl_Employee] PRIMARY KEY CLUSTERED 
(
	[EmpId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_Modify_EmpDept]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_Modify_EmpDept]
(
  @EmpId int,
  @Department int
  
)
AS
BEGIN


UPDATE tbl_Emp_Master set
 Emp_DeptId=@Department
 
 
WHERE  EmpId=@EmpId 

 END
GO
/****** Object:  StoredProcedure [dbo].[sp_Modify_EmpDesg]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_Modify_EmpDesg]
(
  @EmpId int,
  @Designation int
  
)
AS
BEGIN


UPDATE tbl_Emp_Master set
 Emp_DesgId=@Designation
 
 
WHERE  EmpId=@EmpId 

 END
GO
/****** Object:  Table [dbo].[tbl_Customer]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Customer](
	[CustomerId] [int] IDENTITY(800,1) NOT NULL,
	[CustomerName] [varchar](1000) NULL,
	[CustomerDOB] [datetime] NULL,
	[CustomerPhoneNo] [varchar](50) NULL,
	[CustomerEmailId] [varchar](50) NULL,
	[CustomerDesc] [varchar](50) NULL,
	[CustomerDOR] [datetime] NULL,
	[CustomerAddress] [varchar](5000) NULL,
 CONSTRAINT [PK_tbl_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Department]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Department](
	[DepartmentId] [int] IDENTITY(300,1) NOT NULL,
	[DeptName] [varchar](100) NULL,
	[Abbreviation] [varchar](50) NULL,
	[DeptInChargeId] [int] NULL,
	[Description] [varchar](1000) NULL,
 CONSTRAINT [PK_tbl_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Designation]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Designation](
	[DesignationId] [int] IDENTITY(600,1) NOT NULL,
	[Desg_Name] [varchar](100) NULL,
	[Abbreviation] [varchar](50) NULL,
	[DesgInchargeId] [int] NULL,
	[SuperiorDesgId] [int] NULL,
	[Description] [varchar](1000) NULL,
 CONSTRAINT [PK_tbl_Designation_Master] PRIMARY KEY CLUSTERED 
(
	[DesignationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Login]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Login](
	[UserId] [int] IDENTITY(3333,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Emp_Cus_Id] [int] NOT NULL,
	[Role] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_Login] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_ServiceCustomerDomainEmpInCharge]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ServiceCustomerDomainEmpInCharge](
	[ServiceCustomerDomainId] [int] NOT NULL,
	[ServiceCustomerDomainInChargeId] [int] NOT NULL,
	[EmpId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ServiceCustomerDomainPhone]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_ServiceCustomerDomainPhone](
	[ServiceCustomerDomainId] [int] NULL,
	[PhoneNo1] [varchar](50) NULL,
	[PhoneNo2] [varchar](50) NULL,
	[PhoneNo3] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateReport]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateReport]
	@ReportId int
,	@ReportDate varchar(50)
,	@ReportTime varchar(50)
,	@ReportFileToSave varchar(1000)
,   @Message varchar(250) output
AS

SET NOCOUNT ON

UPDATE dbo.tbl_Report SET
	ReportDate = @ReportDate
,	ReportTime = @ReportTime
,	ReportFileToSave = @ReportFileToSave
WHERE
	ReportId = @ReportId

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertReport]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_InsertReport]
	@ReportDate varchar(50)
,	@ReportTime varchar(50)
,	@ReportGeneratedEmpId int
,	@ReportFileToSave varchar(1000)
,   @Message varchar(250) output
AS

SET NOCOUNT ON

INSERT INTO dbo.tbl_Report (
	ReportDate
,	ReportTime
,	ReportGeneratedEmpId
,	ReportFileToSave
)
VALUES (
	@ReportDate
,	@ReportTime
,	@ReportGeneratedEmpId
,	@ReportFileToSave
)

SELECT ReportId = @@IDENTITY

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllReportData]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_GetAllReportData]
	
AS
BEGIN
	
	SELECT * From tbl_Report
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetReportDataByReportId]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_GetReportDataByReportId] 
	(
@ReportId int
)
AS
BEGIN
	select * from tbl_Report
where ReportId=@ReportId
  END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllServiceCustomerData]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_GetAllServiceCustomerData]
	
AS
BEGIN
	
	SELECT * From tbl_ServiceCustomers
END
GO
/****** Object:  Table [dbo].[tbl_Email]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Email](
	[EmailId] [int] IDENTITY(1111,1) NOT NULL,
	[EmailSenderId] [int] NULL,
	[EmailDate] [datetime] NULL,
	[EmailSubjectText] [varchar](200) NULL,
	[EmailBodyMsg] [varchar](1000) NULL,
	[EmailReadStatus] [bit] NULL CONSTRAINT [DF_tbl_Email_EmailReadStatus]  DEFAULT ((0)),
	[EmailDeleteStatus] [bit] NULL CONSTRAINT [DF_tbl_Email_EmailDeleteStatus]  DEFAULT ((0)),
 CONSTRAINT [PK_tbl_Email] PRIMARY KEY CLUSTERED 
(
	[EmailId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_CustomerOnline]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CustomerOnline](
	[CustomerId] [int] NOT NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_tbl_CustomerOnline_Status]  DEFAULT ((0))
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_EmployeeOnline]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_EmployeeOnline](
	[EmployeeId] [int] NOT NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_tbl_EmployeeOnline_Status]  DEFAULT ((0))
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateCustomerComplaintsRegistration]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateCustomerComplaintsRegistration]
	@ComplaintRegistrationId int
,	@RegistrationDate varchar(50)
,	@RegistrationTime varchar(50)
,	@PhoneNo varchar(50)
,   @TextofComplaint varchar(1000)
,	@VoiceTextOfComplaint varbinary(Max)
,	@TextFile varchar(50)
,	@ComplaintStatus varchar(50)
,	@ComplaintEscalatedStatus varchar(50)
,	@CountOfEscalation int
,	@ComplaintResponseText varchar(1000)
,	@ComplaintResponseVoiceFile varbinary
,	@VoiceFileName varchar(50)
,	@ComplaintSeverity varchar(50)
,   @Message varchar(250) output
AS

SET NOCOUNT ON

UPDATE dbo.tbl_CustomerComplaintsRegistration SET
	RegistrationDate = @RegistrationDate
,	RegistrationTime = @RegistrationTime
,	PhoneNo = @PhoneNo
,   TextofComplaint=@TextofComplaint
,	VoiceTextOfComplaint = @VoiceTextOfComplaint
,	TextFile = @TextFile
,	ComplaintStatus = @ComplaintStatus
,	ComplaintEscalatedStatus = @ComplaintEscalatedStatus
,	CountOfEscalation = @CountOfEscalation
,	ComplaintResponseText = @ComplaintResponseText
,	ComplaintResponseVoiceFile = @ComplaintResponseVoiceFile
,	VoiceFileName = @VoiceFileName
,	ComplaintSeverity = @ComplaintSeverity
WHERE
	ComplaintRegistrationId = @ComplaintRegistrationId

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllCustomerComplaintsData]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_GetAllCustomerComplaintsData]
	
AS
BEGIN
	
	SELECT * From tbl_CustomerComplaintsRegistration
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetComplaintRegistrationDataByComplaintRegistrationId]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_GetComplaintRegistrationDataByComplaintRegistrationId]
	(
	@ComplaintRegistrationId int
	)
AS
	 SET NOCOUNT ON 
	 begin
	 
	 select * from  tbl_CustomerComplaintsRegistration where ComplaintRegistrationId=@ComplaintRegistrationId
	 end
	RETURN
GO
/****** Object:  Table [dbo].[tbl_CustomerComplaintsRegistration]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_CustomerComplaintsRegistration](
	[ComplaintRegistrationId] [int] IDENTITY(555,5) NOT NULL,
	[RegistrationDate] [varchar](50) NULL,
	[RegistrationTime] [varchar](50) NULL,
	[CustomerId] [int] NULL,
	[ServiceCustomerDomainId] [int] NULL,
	[PhoneNo] [varchar](50) NULL,
	[TextofComplaint] [varchar](1000) NULL,
	[EmpId] [int] NULL,
	[VoiceTextOfComplaint] [varbinary](max) NULL,
	[TextFile] [varchar](50) NULL,
	[ComplaintStatus] [varchar](50) NULL CONSTRAINT [DF_tbl_CustomerComplaintsRegistration_ComplaintStatus]  DEFAULT ('Pending'),
	[ComplaintEscalatedStatus] [varchar](50) NULL CONSTRAINT [DF_tbl_CustomerComplaintsRegistration_ComplaintEscalatedStatus]  DEFAULT ('Processed'),
	[CountOfEscalation] [int] NULL,
	[ComplaintResponseText] [varchar](1000) NULL,
	[ComplaintResponseVoiceFile] [varbinary](max) NULL,
	[VoiceFileName] [varchar](50) NULL,
	[ComplaintSeverity] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_CustomerComplaintsRegistration] PRIMARY KEY CLUSTERED 
(
	[ComplaintRegistrationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_ComplaintEscalation]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_ComplaintEscalation](
	[ComplaintEscalationId] [int] IDENTITY(220,2) NOT NULL,
	[ComplaintEscalationDate] [varchar](50) NULL,
	[ComplaintEscalationTime] [varchar](50) NULL,
	[ComplaintRegistrationId] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[ComplaintEscalationText] [varchar](50) NULL,
	[PhoneNo] [varchar](50) NULL,
	[VoiceTextFileOfComplaint] [varbinary](max) NULL,
	[VoiceTextFile] [varchar](50) NULL,
	[ComplaintResponseText] [varchar](50) NULL,
	[ComplaintResponseVoiceFile] [varbinary](max) NULL,
	[VoiceFileName] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_ComplaintEscalation] PRIMARY KEY CLUSTERED 
(
	[ComplaintEscalationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_ServiceCustomerDomain]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_ServiceCustomerDomain](
	[ServiceCustomerDomainId] [int] IDENTITY(500,10) NOT NULL,
	[ServiceCustomerId] [int] NOT NULL,
	[ServiceCustomerDomainMasterId] [int] NOT NULL,
	[ServiceCustomerDomainPhone] [varchar](50) NULL,
	[ServiceCustomerDomainInChargeId] [int] NOT NULL,
	[ServiceCustomerDomainManagerName] [varchar](100) NULL,
	[ServiceCustomerDomainEmail] [varchar](50) NULL,
	[ServiceCustomerDomainAddress] [varchar](500) NULL,
	[ServiceCustomerDomainDesc] [varchar](2000) NULL,
 CONSTRAINT [PK_tbl_ServiceCustomerDomain] PRIMARY KEY CLUSTERED 
(
	[ServiceCustomerDomainId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_ServiceCustomers]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_ServiceCustomers](
	[ServiceCustomerId] [int] IDENTITY(333,1) NOT NULL,
	[ServiceCustomerName] [varchar](100) NULL,
	[ServiceCustomerDOR] [datetime] NULL,
	[CustomerAddress] [varchar](500) NULL,
	[CustomerPhoneNo] [varchar](50) NULL,
	[CustomerEmail] [varchar](50) NULL,
	[ServiceCustomerInChargeId] [int] NOT NULL,
	[ServiceCustomerDesc] [varchar](2000) NULL,
 CONSTRAINT [PK_tbl_ServiceCustomers] PRIMARY KEY CLUSTERED 
(
	[ServiceCustomerId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_ComplaintType]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_ComplaintType](
	[ComplaintTypeId] [int] IDENTITY(100,1) NOT NULL,
	[ComplaintTypeName] [varchar](100) NULL,
	[ComplaintTypeAbbr] [varchar](50) NULL,
	[ComplaintTypeDesc] [varchar](1000) NULL,
	[InchargeId] [int] NOT NULL,
 CONSTRAINT [PK_tbl_ComplaintType] PRIMARY KEY CLUSTERED 
(
	[ComplaintTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Domain]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Domain](
	[DomainId] [int] IDENTITY(900,1) NOT NULL,
	[DomainName] [varchar](1000) NULL,
	[DomainAbbr] [varchar](50) NULL,
	[DomainDesc] [varchar](50) NULL,
	[DomainInChargeId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
 CONSTRAINT [PK_tbl_Domain] PRIMARY KEY CLUSTERED 
(
	[DomainId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_FeedbackEvaluation]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_FeedbackEvaluation](
	[FeedBackEvaluationId] [int] IDENTITY(111,1) NOT NULL,
	[FeedBackEvaluationDate] [varchar](50) NULL,
	[EmployeeInChargeId] [int] NOT NULL,
	[FeedBackId] [int] NOT NULL,
	[FeedBackEvaluationText] [varchar](3000) NULL,
	[FeedBackEvaluationLinkFile] [varbinary](max) NULL,
	[LinkFileName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_FeedbackEvaluation] PRIMARY KEY CLUSTERED 
(
	[FeedBackEvaluationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_CustomerFeedback]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_CustomerFeedback](
	[FeedBackId] [int] IDENTITY(222,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[FeedBackDate] [varchar](50) NULL,
	[FeedBackText] [varchar](3000) NULL,
	[EmailId] [varchar](50) NULL,
	[FeedBackVoiceFile] [varbinary](max) NULL,
	[VoiceFileName] [varchar](50) NULL,
	[ComplaintRegistrationId] [int] NOT NULL,
 CONSTRAINT [PK_tbl_CustomerFeedback] PRIMARY KEY CLUSTERED 
(
	[FeedBackId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_ServiceCustomerDomainComplaint]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ServiceCustomerDomainComplaint](
	[ServiceCustomerDomainId] [int] NOT NULL,
	[ComplaintTypeId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ServiceCustomerDomainCustomers]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ServiceCustomerDomainCustomers](
	[ServiceCustomerDomainId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_EmailDetails]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_EmailDetails](
	[EmailId] [int] NOT NULL,
	[EmailReciepentId] [int] NULL,
	[EmailReadStatus] [bit] NULL CONSTRAINT [DF_tbl_EmailDetails_EmailReadStatus]  DEFAULT ((0)),
	[EmailDeleteStatus] [bit] NULL CONSTRAINT [DF_tbl_EmailDetails_EmailDeleteStatus]  DEFAULT ((0))
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetServiceCustomerDomainDataByServiceCustomerDomainId]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetServiceCustomerDomainDataByServiceCustomerDomainId]   
 (  
@ServiceCustomerDomainId int  
)  
AS  
BEGIN  
 select s.servicecustomerdomainid,c.servicecustomername,s.servicecustomerdomainmasterid,
        s.servicecustomerdomainphone,e.emp_firstname,s.ServiceCustomerDomainManagerName,
        s.servicecustomerdomainemail,s.servicecustomerdomainaddress,s.servicecustomerdomaindesc
 from tbl_ServiceCustomerDomain  s,tbl_servicecustomers c,tbl_employee e 
where c.servicecustomerid=s.servicecustomerid and
      e.empid=s.servicecustomerdomaininchargeid and 
s.ServiceCustomerDomainId=@ServiceCustomerDomainId  
  END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetComplaintEscalationDataByComplaintEscalationId]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetComplaintEscalationDataByComplaintEscalationId]    
 (    
 @ComplaintEscalationId int    
 )    
AS    
  begin    
      
 select  c.complaintescalationid,c.complaintescalationDate,c.complaintescalationtime,c.complaintregistrationId,
         e.emp_firstName,c.complaintescalationtext,c.phoneno,c.voicetextfileofcomplaint,
         c.voicetextfile,c.complaintresponsetext,c.complaintresponsevoicefile,c.voicefilename
from tbl_complaintescalation c,tbl_employee e

where e.empid=c.employeeid and
      c.complaintescalationid=@ComplaintEscalationId
  end    
 RETURN
GO
/****** Object:  StoredProcedure [dbo].[spReportEmployee]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spReportEmployee]    
as    
begin    
    
select e.Emp_FirstName,e.Emp_LastName,e.Emp_MiddleName,e.Emp_DOB,e.Emp_DOJ,e.Address,
      e.Email,e.Phone,d.DeptName,s.Desg_Name

from tbl_employee e,tbl_department d,tbl_designation s

where d.departmentid=e.Emp_deptid and
      s.designationid=e.emp_desgid
    
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllComplaintEmpIds]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_GetAllComplaintEmpIds]
	
AS
	
	 begin
	 
	select e.Emp_FirstName,s.EmpId from tbl_ServiceCustomerDomainEmpInCharge s,tbl_Employee e
where s.EmpId=e.EmpId
	 end
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_GetComplaintTypeDataByComplaintTypeId]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetComplaintTypeDataByComplaintTypeId]  
 (  
 @ComplaintTypeId int  
 )  
AS  
   
  begin  
select c.complainttypeid,c.complainttypename,c.complainttypeabbr,
       c.complainttypedesc,e.emp_firstname
 from tbl_complainttype c,tbl_employee e
    
 where 
e.empid=c.inchargeid and
c.ComplaintTypeId=@ComplaintTypeId  
  end
GO
/****** Object:  StoredProcedure [dbo].[spShowDomain]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spShowDomain]
as
begin

 SELECT d.DomainName,d.DomainAbbr,d.DomainDesc,e.Emp_FirstName,f.DeptName

from tbl_domain d,tbl_employee e,tbl_department f

where e.empid=d.domaininchargeid and
      f.departmentid=d.departmentid
   
end
GO
/****** Object:  StoredProcedure [dbo].[spShowFeedbackEvaluation]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spShowFeedbackEvaluation]
as
begin

select f.feedbackevaluationid,f.feedbackEvaluationdate,e.emp_firstname,f.feedbackid,f.FeedBackEvaluationText,f.linkfilename

from tbl_feedbackevaluation f,tbl_employee e

where e.empid=f.employeeinchargeid
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetServiceCustomerDataByServiceCustomersId]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetServiceCustomerDataByServiceCustomersId]   
 (  
@ServiceCustomerId int  
)  
AS  
BEGIN  
 select s.servicecustomerid,s.servicecustomername,s.servicecustomerdor,s.customeraddress,s.customerphoneno,
        s.customeremail,e.emp_firstname,s.servicecustomerdesc
 from tbl_ServiceCustomers s,tbl_employee e 
where  e.empid=s.servicecustomerinchargeid  and
s.ServiceCustomerId=@ServiceCustomerId  
  END
GO
/****** Object:  StoredProcedure [dbo].[spShowComplaintType]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spShowComplaintType]
as
begin
 SELECT c.complainttypename,c.complainttypeabbr,c.complainttypedesc,e.emp_firstname
From tbl_complaintType c,tbl_employee e
where e.empid=c.InchargeId 
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Show_Emp]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_Show_Emp]
	
AS
BEGIN
	
	SELECT * From tbl_Employee
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetFeedbackEvaluationDataByFeedbackEvaluationId]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetFeedbackEvaluationDataByFeedbackEvaluationId]   
 (  
@FeedbackEvaluationId int  
)  
AS  
BEGIN  
select  f.FeedbackevaluationId,f.Feedbackevaluationdate,e.emp_firstname,f.feedbackid,
      f.feedbackevaluationtext,f.feedbackevaluationlinkfile,f.linkfilename
from tbl_employee e,tbl_feedbackevaluation f
where e.empid=f.employeeinchargeid and
FeedbackEvaluationId=@FeedbackEvaluationId  
  END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSuperiorEmpId]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetSuperiorEmpId]  
   
AS  
  SET NOCOUNT ON   
  begin  
  select EmpId,Emp_FirstName from tbl_Employee where EmpId in (select SuperiorDesgId from tbl_designation where desg_name='Manager')
  end  
 RETURN
GO
/****** Object:  StoredProcedure [dbo].[ShowComplaint]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ShowComplaint]
as
begin
declare @IncId int 

set @IncId =(select SuperiorEmpId from tbl_Employee where empid=500604)
print @incid
select * from tbl_CustomerComplaintsRegistration
where ServiceCustomerDomainId in (select ServiceCustomerDomainId from tbl_ServiceCustomerDomain where ServiceCustomerDomainInChargeId=@IncId)
and complaintStatus ='pending'

end
GO
/****** Object:  StoredProcedure [dbo].[GetDesgDataByDesgId]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDesgDataByDesgId]       
 (      
@DesgId int      
)      
AS      
BEGIN      
 select d.designationid,d.desg_name,d.abbreviation,e.emp_firstname,d.description   
from tbl_designation d,tbl_employee e    
where    
e.empid=d.desginchargeid   and    
    
DesignationId=@DesgId      
  END
GO
/****** Object:  StoredProcedure [dbo].[GetAllSerCustomerInChargeIds]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllSerCustomerInChargeIds]
	
AS
	 SET NOCOUNT ON 
	 begin
	 
	Select e.Emp_FirstName,d.DomainInChargeId from tbl_Employee e,tbl_Domain d ,tbl_Department dp
where d.DomainInChargeId=e.EmpId and d.DepartmentId=dp.DepartmentId and 
dp.DepartmentId=(Select DepartmentId from tbl_Department where DeptName='Marketing Department')
	 end
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[GetServiceCustomerEmpIds]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetServiceCustomerEmpIds]
	
AS
	 SET NOCOUNT ON 
	 begin
	 
	select EmpId,Emp_FirstName from tbl_Employee  where Emp_DesgId=(select DesignationId from tbl_designation where Desg_Name='Team Member')
	 end
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_GeneratedEmpId]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_GeneratedEmpId]
(@EmpId int Output)
as
begin
	set @EmpId=(Select max(EmpId)from tbl_Employee)
	if(@EmpId is Null)
	begin
		set @EmpId=500600
		return
	end
	else
	begin
		set @EmpId=(Select max(EmpId)+1 from tbl_Employee)
		return 
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetDomainDataByDomainId]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetDomainDataByDomainId]     
 (    
@DomainId int    
)    
AS    
BEGIN    
select d.domainid,d.DomainName,d.domainabbr,d.domaindesc,e.emp_firstName,  
        t.deptname   
from tbl_domain d,tbl_employee e,tbl_department t  
where   
 e.empid=d.domaininchargeid and  
 t.departmentid=d.departmentid and  
d.DomainId=@DomainId    
  END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetDomainIncharges]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetDomainIncharges]
	
AS
	 SET NOCOUNT ON 
	 begin
	 
select EmpId,Emp_FirstName from tbl_Employee 

 end
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllDeptInChargeIds]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetAllDeptInChargeIds]
	(
	@DeptId int
)
AS
	 SET NOCOUNT ON 
	 begin
	 select EmpId,Emp_FirstName from tbl_Employee where Emp_DeptId=(select DepartmentId from tbl_Department where DepartmentId=@DeptId) 
	 
	 end
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllDesgInChargeIds]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetAllDesgInChargeIds]  
 (  
 @DesgId int  
)  
AS  
 
 begin 
  select EmpId,Emp_FirstName from tbl_Employee where Emp_DesgId=(select DesignationId from tbl_Designation where DesignationId=@DesgId)  
    
  end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllSuperiorDesgIds]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_GetAllSuperiorDesgIds]
	
AS
	 SET NOCOUNT ON 
	 begin
	 select EmpId,Emp_FirstName from tbl_Employee where Emp_DesgId=(select DesignationId from tbl_Designation where Desg_Name='Manager') 
	 end
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllEmpIds]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_GetAllEmpIds]
	
AS
BEGIN
	
	Select e.Emp_FirstName,c.EmpId from tbl_Employee e,tbl_CustomerComplaintsRegistration c where c.EmpId=e.EmpId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertCustomerFeedback]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertCustomerFeedback]
	@CustomerId int
,	@FeedBackDate varchar(50)
,	@FeedBackText varchar(50)
,	@EmailId varchar(50)
,	@FeedBackVoiceFile varbinary(Max)
,	@VoiceFileName varchar(50)
,	@ComplaintRegistrationId int
,   @Message varchar(250) output
AS

SET NOCOUNT ON

INSERT INTO dbo.tbl_CustomerFeedback (
	CustomerId
,	FeedBackDate
,	FeedBackText
,	EmailId
,	FeedBackVoiceFile
,	VoiceFileName
,	ComplaintRegistrationId
)
VALUES (
	@CustomerId
,	@FeedBackDate
,	@FeedBackText
,	@EmailId
,	@FeedBackVoiceFile
,	@VoiceFileName
,	@ComplaintRegistrationId
)

SELECT FeedBackId = @@IDENTITY

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateCustomerFeedback]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateCustomerFeedback]
	@FeedBackId int
,	@FeedBackDate varchar(50)
,	@FeedBackText varchar(50)
,	@EmailId varchar(50)
,	@FeedBackVoiceFile varbinary(Max)
,	@VoiceFileName varchar(50)
,   @Message varchar(250) output
AS

SET NOCOUNT ON

UPDATE dbo.tbl_CustomerFeedback SET
	FeedBackDate = @FeedBackDate
,	FeedBackText = @FeedBackText
,	EmailId = @EmailId
,	FeedBackVoiceFile = @FeedBackVoiceFile
,	VoiceFileName = @VoiceFileName
WHERE
	FeedBackId = @FeedBackId

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_GetFeedBackDataByFeedBackId]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetFeedBackDataByFeedBackId]     
 (    
@FeedBackId int    
)    
AS    
BEGIN    
 select f.FeedBackId,c.customerName,f.feedbackdate,f.feedbacktext,f.emailid,f.feedbackvoicefile,  
     voicefilename,f.complaintregistrationid  
from tbl_Customerfeedback f,tbl_customer c  
where c.customerid=f.customerid and   
f.FeedBackId=@FeedBackId    
  END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllFeedBackData]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_GetAllFeedBackData]
	
AS
BEGIN
	
	SELECT * From tbl_CustomerFeedback
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllDomainData]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_GetAllDomainData]
	
AS
BEGIN
	
	SELECT * From tbl_Domain
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateDomain]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateDomain]
	@DomainId int
,	@DomainName varchar(1000)
,	@DomainAbbr varchar(50)
,	@DomainDesc varchar(50)
,   @Message varchar(250) output
As
begin

UPDATE dbo.tbl_Domain SET
	DomainName = @DomainName
,	DomainAbbr = @DomainAbbr
,	DomainDesc = @DomainDesc

WHERE
	DomainId = @DomainId
end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertDomain]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_InsertDomain]
	@DomainName varchar(1000)
,	@DomainAbbr varchar(50)
,	@DomainDesc varchar(50)
,	@DomainInChargeId int
,	@DepartmentId int
,   @Message varchar(250) output
AS

SET NOCOUNT ON

INSERT INTO dbo.tbl_Domain (
	DomainName
,	DomainAbbr
,	DomainDesc
,	DomainInChargeId
,	DepartmentId
)
VALUES (
	@DomainName
,	@DomainAbbr
,	@DomainDesc
,	@DomainInChargeId
,	@DepartmentId
)

SELECT DomainId = @@IDENTITY

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spReportCustomer]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spReportCustomer] 
as    
begin    
    
Select CustomerName,CustomerDOB,CustomerPhoneNo,CustomerEmailId,CustomerDesc,
       CustomerDOR,CustomerAddress

from tbl_Customer
    
end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertCustomer]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertCustomer]  
 @CustomerName varchar(1000)  
, @CustomerDOB datetime  
, @CustomerPhoneNo varchar(50)  
, @CustomerEmailId varchar(50)  
, @CustomerDesc varchar(50)  
, @CustomerDOR datetime  
, @CustomerAddress varchar(5000)  
,   @UserName varchar(50)  
,   @Password varchar(50)  
,   @Message varchar(250) output  
AS  
  
begin  
  
INSERT INTO dbo.tbl_Customer (  
 CustomerName  
, CustomerDOB  
, CustomerPhoneNo  
, CustomerEmailId  
, CustomerDesc  
, CustomerDOR  
, CustomerAddress  
  
)  
VALUES (  
 @CustomerName  
, @CustomerDOB  
, @CustomerPhoneNo  
, @CustomerEmailId  
, @CustomerDesc  
, @CustomerDOR  
, @CustomerAddress  
  
)  
  
declare @CustomerId int   
set @CustomerId=(select ident_current('tbl_Customer'))  
insert into tbl_Login  
(UserName,[Password],Emp_Cus_Id,[Role])  
values  
(@UserName, @Password,@CustomerId,'Customer'  
)  
  
set @CustomerId=(select ident_current('tbl_Login'))  
insert into tbl_CustomerOnline  
(CustomerId)   
values   
(@CustomerId)  
return  
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCutomerDataByCustomerId]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_GetCutomerDataByCustomerId] 
	(
@CustomerId int
)
AS
BEGIN
	select * from tbl_Customer
where CustomerId=@CustomerId
  END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllCustomerData]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_GetAllCustomerData]
	
AS
BEGIN
	
	SELECT * From tbl_Customer
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateCustomer]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateCustomer]
	@CustomerId int
,	@CustomerName varchar(1000)
,	@CustomerDOB datetime
,	@CustomerPhoneNo varchar(50)
,	@CustomerEmailId varchar(50)
,	@CustomerDesc varchar(50)
,	@CustomerDOR datetime
,	@CustomerAddress varchar(5000)
,   @Message varchar(250) output
AS

SET NOCOUNT ON

UPDATE dbo.tbl_Customer SET
	CustomerName = @CustomerName
,	CustomerDOB = @CustomerDOB
,	CustomerPhoneNo = @CustomerPhoneNo
,	CustomerEmailId = @CustomerEmailId
,	CustomerDesc = @CustomerDesc
,	CustomerDOR = @CustomerDOR
,	CustomerAddress = @CustomerAddress
WHERE
	CustomerId = @CustomerId

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertComplaintType]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertComplaintType]
	@ComplaintTypeName varchar(100)
,	@ComplaintTypeAbbr varchar(50)
,	@ComplaintTypeDesc varchar(1000)
,	@InchargeId int
,   @Message varchar(250) output
AS

SET NOCOUNT ON

INSERT INTO dbo.tbl_ComplaintType (
	ComplaintTypeName
,	ComplaintTypeAbbr
,	ComplaintTypeDesc
,	InchargeId
)
VALUES (
	@ComplaintTypeName
,	@ComplaintTypeAbbr
,	@ComplaintTypeDesc
,	@InchargeId
)

SELECT ComplaintTypeId = @@IDENTITY

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateComplaintType]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateComplaintType]
	@ComplaintTypeId int
,	@ComplaintTypeName varchar(100)
,	@ComplaintTypeAbbr varchar(50)
,	@ComplaintTypeDesc varchar(1000)
,	@Message varchar(250) output
AS

SET NOCOUNT ON

UPDATE dbo.tbl_ComplaintType SET
	ComplaintTypeName = @ComplaintTypeName
,	ComplaintTypeAbbr = @ComplaintTypeAbbr
,	ComplaintTypeDesc = @ComplaintTypeDesc

WHERE
	ComplaintTypeId = @ComplaintTypeId

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllComplaintTypeData]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_GetAllComplaintTypeData]
	
AS
BEGIN
	
	SELECT * From tbl_complaintType
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateDeptMaster]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateDeptMaster]
	(
@DeptId int,
@DeptName varchar(50),
@Abbreviation varchar(50),
@DeptInChargeId int,
@Description varchar(1000),
@Message varchar(250)output
)
AS
	 SET NOCOUNT ON 
	 begin
	 update tbl_Department set 
	 DeptName=@DeptName,
	 Abbreviation =@Abbreviation,
     DeptInChargeId=@DeptInChargeId,
	Description=@Description
	
	 where
	 DepartmentId=@DeptId 
	 set @Message='Record Updated Successfully..'
	 end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertDeptMaster]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertDeptMaster]
	(
@DeptName varchar(100),
@Abbreviation varchar(50),
@Description varchar(1000),
@Message varchar(250) output
)	
AS
	
	 begin
	 insert into tbl_Department
	 (
	
	 DeptName,
	 Abbreviation,
     Description
	
	 )
	 values
	 (
	 @DeptName,
	 @Abbreviation,
     @Description
	 
	 )
	 set @Message='Record Inserted Successfully..'
	 end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetDeptMasterDataByDeptId]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetDeptMasterDataByDeptId]  
 (  
 @DeptId int  
 )  
AS  
   
  begin  
    
  select * from  
  tbl_Department where DepartmentId=@DeptId  
  end  
 RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateDesgMaster]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[sp_UpdateDesgMaster]
(
@DesgId int,
@DesgName varchar(100),
@Abbreviation varchar(50),
@DesgInchargeId int,
@SuperiorDesgId int,
@Description varchar(1000),
@Message varchar(250) output
)
AS
	
	 update tbl_Designation set 
	 Desg_Name=@DesgName,
	 Abbreviation =@Abbreviation,
     DesgInchargeId=@DesgInchargeId,
     SuperiorDesgId=@SuperiorDesgId,
	 Description=@Description
 where
	 DesignationId=@DesgId
GO
/****** Object:  StoredProcedure [dbo].[sp_GetEmployeeEmails]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_GetEmployeeEmails]    
as    
begin    
Select Username+'@techinnova.co.in' as UserName,UserId from tbl_Login where       
role='Employee'    
end
GO
/****** Object:  StoredProcedure [dbo].[sp_outboxdetails]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_outboxdetails](@senderid int)          
as           
begin          
          
select  e.username,f.EMailReadStatus,f.EmailDeletestatus,f.Emailid,convert( varchar (50), f.Emaildate,103)as Date ,f.EmailSubjectText,f.EMailBodyMsg          
 from tbl_login e inner join tbl_EmailDetails d on d.EmailReciepentId=e.UserId          
inner join tbl_email f on f.emailid=d.emailid where f.emailsenderid=@senderid  and f.EmailDeletestatus =0     
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetOnlineEmployeeData]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_GetOnlineEmployeeData]
as
begin
select UserName as [Online Employees] from tbl_Login where Emp_Cus_Id in(select EmployeeId from tbl_EmployeeOnline where [status]=1)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetOnlineCustomerData]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_GetOnlineCustomerData]
as
begin
select UserName as [Online Customers],Emp_Cus_Id from tbl_Login 
where Userid in(select CustomerId from tbl_CustomerOnline where [status]=1)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCustomerEmails]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_GetCustomerEmails]  
as  
begin  
Select Username+'@CustomerServiceDesk.com' as UserName,UserId from tbl_Login where     
role='Customer'  
end
GO
/****** Object:  StoredProcedure [dbo].[sp_Inboxdetailshows]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_Inboxdetailshows](@EmailReciepentId int)            
as             
begin            
select  e.username,f.EMailReadStatus,f.EmailDeletestatus,d.Emailid,convert( varchar (50), d.Emaildate,103)as Date ,d.EmailSubjectText,d.EMailBodyMsg        
 from tbl_login e inner join tbl_email d on d.EmailSenderId=e.Userid       
inner join  tbl_EmailDetails f on f.emailid=d.emailid where f.EmailReciepentId =@EmailReciepentId and f.EmailDeleteStatus=0 
      
end
GO
/****** Object:  StoredProcedure [dbo].[spLoginChecking]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLoginChecking]
	(
	@UserName varchar(50),
	@Password varchar(50),
	@Role varchar(20) output,
	@UserId int output,
    @Emp_Cus_Id int output
	)
AS
	
	 select @Role=[Role],@UserId=UserId,@Emp_Cus_Id=Emp_Cus_Id from tbl_Login where UserName=@UserName and [Password]=@Password
	if @Role is null
	begin
	  set @Role='NoUser'
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetShowEmpIncharges]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetShowEmpIncharges]
	
AS
BEGIN
	
	SELECT * From tbl_ServiceCustomerDomainEmpInCharge
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertServiceCustomerDomainEmpInCharges]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_InsertServiceCustomerDomainEmpInCharges]
	(
@ServiceCustomerDomainId int,
@ServiceCustomerDomainInChargeId int,
@EmpId int,
@Message varchar(250) output
)	
AS
	
	 begin
	 insert into tbl_ServiceCustomerDomainEmpInCharge
	 (
	
	 ServiceCustomerDomainId,
	 ServiceCustomerDomainInChargeId,
     EmpId
	
	 )
	 values
	 (
	 @ServiceCustomerDomainId,
	 @ServiceCustomerDomainInChargeId,
     @EmpId
	 
	 )
	 set @Message='Record Inserted Successfully..'
	 end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertServiceCustomerDomainComplaintType]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_InsertServiceCustomerDomainComplaintType]
	(
@ServiceCustomerDomainId int,
@ComplaintTypeId int,
@Message varchar(250) output
)	
AS
	
	 begin
	 insert into tbl_ServiceCustomerDomainComplaint
	 (
	
	 ServiceCustomerDomainId,
	 ComplaintTypeId
	 )
	 values
	 (
	 @ServiceCustomerDomainId,
	 @ComplaintTypeId
	 
	 )
	 set @Message='Record Inserted Successfully..'
	 end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertServiceCustomerDomainPhoneNos]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_InsertServiceCustomerDomainPhoneNos]
	(
@ServiceCustomerDomainId int,
@PhoneNo1 varchar(50),
@PhoneNo2 varchar(50),
@PhoneNo3 varchar(50),
@Message varchar(250) output
)	
AS
	
	 begin
	 insert into tbl_ServiceCustomerDomainPhone
	 (
	
	 ServiceCustomerDomainId,
	 PhoneNo1,
     PhoneNo2,
     PhoneNo3
	 )
	 values
	 (
	 @ServiceCustomerDomainId,
	 @PhoneNo1,
     @PhoneNo2,
     @PhoneNo3
	 
	 )
	 set @Message='Record Inserted Successfully..'
	 end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertServiceCustomerDomainCustomers]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertServiceCustomerDomainCustomers]
	(
@ServiceCustomerDomainId int,
@CustomerId varchar(50),
@Message varchar(250) output
)	
AS
	
	 begin
	 insert into tbl_ServiceCustomerDomainCustomers
	 (
	
	 ServiceCustomerDomainId,
	 CustomerId
	 )
	 values
	 (
	 @ServiceCustomerDomainId,
	 @CustomerId
	 
	 )
	 set @Message='Record Inserted Successfully..'
	 end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetServiceCustomerDomainCustomerIds]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_GetServiceCustomerDomainCustomerIds]
	
AS
	 
	 begin
	 
	select s.ServiceCustomerName,c.ServiceCustomerId from  tbl_ServiceCustomers s,tbl_ServiceCustomerDomain c
where c.ServiceCustomerId=s.ServiceCustomerId



	 end
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertServiceCustomers]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertServiceCustomers]
	@ServiceCustomerName varchar(100)
,	@ServiceCustomerDOR datetime
,	@CustomerAddress varchar(500)
,	@CustomerPhoneNo varchar(50)
,	@CustomerEmail varchar(50)
,	@ServiceCustomerInChargeId int
,	@ServiceCustomerDesc varchar(2000)
,   @Message varchar(250) output
AS

SET NOCOUNT ON

INSERT INTO dbo.tbl_ServiceCustomers (
	ServiceCustomerName
,	ServiceCustomerDOR
,	CustomerAddress
,	CustomerPhoneNo
,	CustomerEmail
,	ServiceCustomerInChargeId
,	ServiceCustomerDesc
)
VALUES (
	
	@ServiceCustomerName
,	@ServiceCustomerDOR
,	@CustomerAddress
,	@CustomerPhoneNo
,	@CustomerEmail
,	@ServiceCustomerInChargeId
,	@ServiceCustomerDesc
)


SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateServiceCustomers]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateServiceCustomers]
	@ServiceCustomerId int
,	@ServiceCustomerName varchar(100)
,	@ServiceCustomerDOR datetime
,	@CustomerAddress varchar(500)
,	@CustomerPhoneNo varchar(50)
,	@CustomerEmail varchar(50)
,	@ServiceCustomerDesc varchar(2000)
,   @Message varchar(250) output
AS

SET NOCOUNT ON

UPDATE dbo.tbl_ServiceCustomers SET
	
	ServiceCustomerName = @ServiceCustomerName
,	ServiceCustomerDOR = @ServiceCustomerDOR
,	CustomerAddress = @CustomerAddress
,	CustomerPhoneNo = @CustomerPhoneNo
,	CustomerEmail = @CustomerEmail
,	ServiceCustomerDesc = @ServiceCustomerDesc
WHERE
	ServiceCustomerId = @ServiceCustomerId

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spReportServiceCustomers]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spReportServiceCustomers]
as
begin
select ServiceCustomerName,ServiceCustomerDOR,CustomerAddress,CustomerPhoneNo,
       CustomerEmail,ServiceCustomerDesc

from tbl_ServiceCustomers 

end
GO
/****** Object:  StoredProcedure [dbo].[Sp_ShowEmaildetailsOutbox]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Sp_ShowEmaildetailsOutbox](@Emailid int)  
as   
begin  
update tbl_email set emailreadstatus =1 where emailid=@Emailid  
select * from tbl_email where emailid=@Emailid  
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_ShowDetailsEmailidwise]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Sp_ShowDetailsEmailidwise](@Emailid int)      
as begin    
update  tbl_EmailDetails set EMailReadStatus=1 where emailid=@Emailid     
select * from tbl_Email where emailid=@Emailid      
end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertEmailData]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertEmailData]  
 @EmailSenderId int  
, @EmailSubjectText varchar(200)  
, @EMailBodyMsg varchar(1000)  
, @EmailReciepentId int  
  
AS  
begin  
declare @Emaildate datetime,@Emailid int  
  
set @Emaildate=(select getdate())  
  
  
begin  
INSERT INTO dbo.tbl_Email (  
 EmailSenderId  
, Emaildate  
, EmailSubjectText  
, EMailBodyMsg  
)  
VALUES (  
 @EmailSenderId  
, @Emaildate  
, @EmailSubjectText  
, @EMailBodyMsg  
  
)  
set @Emailid=(select ident_current('tbl_Email'))  
insert into tbl_EmailDetails(Emailid,EmailReciepentId)values(@Emailid,@EmailReciepentId)  
end  
  
  
end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertServiceCustomerDomain]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertServiceCustomerDomain]
	@ServiceCustomerId int
,	@ServiceCustomerDomainMasterId int
,	@ServiceCustomerDomainPhone varchar(50)
,	@ServiceCustomerDomainInChargeId int
,	@ServiceCustomerDomainManagerName varchar(100)
,	@ServiceCustomerDomainEmail varchar(50)
,	@ServiceCustomerDomainAddress varchar(500)
,	@ServiceCustomerDomainDesc varchar(2000)
,   @Message varchar(250) output
AS

SET NOCOUNT ON

INSERT INTO dbo.tbl_ServiceCustomerDomain (
	ServiceCustomerId
,	ServiceCustomerDomainMasterId
,	ServiceCustomerDomainPhone
,	ServiceCustomerDomainInChargeId
,	ServiceCustomerDomainManagerName
,	ServiceCustomerDomainEmail
,	ServiceCustomerDomainAddress
,	ServiceCustomerDomainDesc
)
VALUES (
	@ServiceCustomerId
,	@ServiceCustomerDomainMasterId
,	@ServiceCustomerDomainPhone
,	@ServiceCustomerDomainInChargeId
,	@ServiceCustomerDomainManagerName
,	@ServiceCustomerDomainEmail
,	@ServiceCustomerDomainAddress
,	@ServiceCustomerDomainDesc
)



SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateServiceCustomerDomain]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateServiceCustomerDomain]
	@ServiceCustomerDomainId int
,	@ServiceCustomerDomainPhone varchar(50)
,	@ServiceCustomerDomainManagerName varchar(100)
,	@ServiceCustomerDomainEmail varchar(50)
,	@ServiceCustomerDomainAddress varchar(500)
,	@ServiceCustomerDomainDesc varchar(2000)
,   @Message varchar(250) output
AS

SET NOCOUNT ON

UPDATE dbo.tbl_ServiceCustomerDomain SET
	ServiceCustomerDomainPhone = @ServiceCustomerDomainPhone
,	ServiceCustomerDomainManagerName = @ServiceCustomerDomainManagerName
,	ServiceCustomerDomainEmail = @ServiceCustomerDomainEmail
,	ServiceCustomerDomainAddress = @ServiceCustomerDomainAddress
,	ServiceCustomerDomainDesc = @ServiceCustomerDomainDesc
WHERE
	ServiceCustomerDomainId = @ServiceCustomerDomainId

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllServiceCustomerDomain]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_GetAllServiceCustomerDomain]
	
AS
BEGIN
	
	SELECT * From tbl_ServiceCustomerDomain
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateComplaintEscalation]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateComplaintEscalation]
	@ComplaintEscalationId int
,	@ComplaintEscalationDate varchar(50)
,	@ComplaintEscalationTime varchar(50)
,	@ComplaintEscalationText varchar(50)
,	@PhoneNo varchar(50)
,	@VoiceTextFileOfComplaint varbinary
,	@VoiceTextFile varchar(50)
,	@ComplaintResponseText varchar(50)
,	@ComplaintResponseVoiceFile varbinary
,	@VoiceFileName varchar(50)
,   @Message varchar(250) output
AS

SET NOCOUNT ON

UPDATE dbo.tbl_ComplaintEscalation SET
	ComplaintEscalationDate = @ComplaintEscalationDate
,	ComplaintEscalationTime = @ComplaintEscalationTime
,	ComplaintEscalationText = @ComplaintEscalationText
,	PhoneNo = @PhoneNo
,	VoiceTextFileOfComplaint = @VoiceTextFileOfComplaint
,	VoiceTextFile = @VoiceTextFile
,	ComplaintResponseText = @ComplaintResponseText
,	ComplaintResponseVoiceFile = @ComplaintResponseVoiceFile
,	VoiceFileName = @VoiceFileName
WHERE
	ComplaintEscalationId = @ComplaintEscalationId

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertComplaintEscalation]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertComplaintEscalation]
	@ComplaintEscalationDate varchar(50)
,	@ComplaintEscalationTime varchar(50)
,	@ComplaintRegistrationId int
,	@EmployeeId int
,	@ComplaintEscalationText varchar(50)
,	@PhoneNo varchar(50)
,	@VoiceTextFileOfComplaint varbinary
,	@VoiceTextFile varchar(50)
,	@ComplaintResponseText varchar(50)
,	@ComplaintResponseVoiceFile varbinary
,	@VoiceFileName varchar(50)
,   @Message varchar(250) output
AS

SET NOCOUNT ON

INSERT INTO dbo.tbl_ComplaintEscalation (
	ComplaintEscalationDate
,	ComplaintEscalationTime
,	ComplaintRegistrationId
,	EmployeeId
,	ComplaintEscalationText
,	PhoneNo
,	VoiceTextFileOfComplaint
,	VoiceTextFile
,	ComplaintResponseText
,	ComplaintResponseVoiceFile
,	VoiceFileName
)
VALUES (
	@ComplaintEscalationDate
,	@ComplaintEscalationTime
,	@ComplaintRegistrationId
,	@EmployeeId
,	@ComplaintEscalationText
,	@PhoneNo
,	@VoiceTextFileOfComplaint
,	@VoiceTextFile
,	@ComplaintResponseText
,	@ComplaintResponseVoiceFile
,	@VoiceFileName
)



SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllComplaintEscalationData]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_GetAllComplaintEscalationData]
	
AS
BEGIN
	
	SELECT * From tbl_ComplaintEscalation
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertCustomerComplaintsRegistration]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertCustomerComplaintsRegistration]  
  @CustomerId int  
, @ServiceCustomerDomainId int  
, @PhoneNo varchar(50)  
, @TextofComplaint varchar(1000)  
, @Message varchar(250) output,
  @FileName varchar(20),
  @FileContent varbinary(max)  
AS  
  
begin
 declare @RegistrationDate varchar(50)  
set  @RegistrationDate=(select convert(varchar(50),getdate(),104))
declare @RegistrationTime varchar(50) 
set @RegistrationTime=(select convert(varchar(50),getdate(),108)) 

INSERT INTO dbo.tbl_CustomerComplaintsRegistration (  
  RegistrationDate  
, RegistrationTime  
, CustomerId  
, ServiceCustomerDomainId  
, PhoneNo  
, TextofComplaint 
, VoiceTextOfComplaint
, TextFile
)  
VALUES (  
  @RegistrationDate  
, @RegistrationTime  
, @CustomerId  
, @ServiceCustomerDomainId  
, @PhoneNo  
, @TextofComplaint
, @FileContent
, @FileName 
)  
end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertCustomerComplaintsResponse]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_InsertCustomerComplaintsResponse]  
(
  @ComplaintRegistrationId int,
  @EmployeeId int,  
  @Status varchar(50),  
  @EscalatedStatus varchar(50),  
  @CountEscalation varchar(50),  
  @ComplaintResponseText varchar(50),  
  @ComplaintSeverity varchar(50),  
  @Message varchar(50) output,
  @voicefilecontent varbinary(max),
  @Voicefilename varchar(50)
)  
as  
begin  
  
  
update  tbl_CustomerComplaintsRegistration  
set
   EmpId=@EmployeeId,  
   ComplaintStatus=@Status,  
   ComplaintEscalatedStatus=@EscalatedStatus,  
   CountOfEscalation=@CountEscalation,  
   ComplaintResponseText=@ComplaintResponseText,
   ComplaintResponseVoiceFile=@voicefilecontent,
   VoiceFileName=@Voicefilename,
   ComplaintSeverity=@ComplaintSeverity  
where 
ComplaintRegistrationId=@ComplaintRegistrationId
end
GO
/****** Object:  StoredProcedure [dbo].[ShowInformation]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ShowInformation]  
(  
@CustomerId int  
)  
as  
begin  

select * from tbl_CustomerComplaintsRegistration where CustomerId=@CustomerId  
  
end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertFeedbackEvaluation]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertFeedbackEvaluation]
	@FeedBackEvaluationDate varchar(50)
,	@EmployeeInChargeId int
,	@FeedBackId int
,	@FeedBackEvaluationText varchar(3000)
,	@FeedBackEvaluationLinkFile varbinary
,	@LinkFileName varchar(50)
,   @Message varchar(250) output
AS

SET NOCOUNT ON

INSERT INTO dbo.tbl_FeedbackEvaluation (
	FeedBackEvaluationDate
,	EmployeeInChargeId
,	FeedBackId
,	FeedBackEvaluationText
,	FeedBackEvaluationLinkFile
,	LinkFileName
)
VALUES (
	@FeedBackEvaluationDate
,	@EmployeeInChargeId
,	@FeedBackId
,	@FeedBackEvaluationText
,	@FeedBackEvaluationLinkFile
,	@LinkFileName
)


SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllFeedbackEvaluationData]    Script Date: 01/08/2010 17:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_GetAllFeedbackEvaluationData]
	
AS
BEGIN
	
	SELECT * From tbl_FeedbackEvaluation
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateFeedbackEvaluation]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateFeedbackEvaluation]
	@FeedBackEvaluationId int
,	@FeedBackEvaluationDate varchar(50)
,	@FeedBackEvaluationText varchar(3000)
,	@FeedBackEvaluationLinkFile varbinary
,	@LinkFileName varchar(50)
,   @Message varchar(250) output
AS

SET NOCOUNT ON

UPDATE dbo.tbl_FeedbackEvaluation SET
	FeedBackEvaluationDate = @FeedBackEvaluationDate
,	FeedBackEvaluationText = @FeedBackEvaluationText
,	FeedBackEvaluationLinkFile = @FeedBackEvaluationLinkFile
,	LinkFileName = @LinkFileName
WHERE
	FeedBackEvaluationId = @FeedBackEvaluationId

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertEmpDetails]    Script Date: 01/08/2010 17:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertEmpDetails]    
(    
	@FirstName varchar(50),    
    @LastName varchar(50),    
    @MiddleName varchar(50),    
    @EmpDOB datetime,      
    @EmpDOJ datetime,        
    @Address varchar(500),     
	@Email varchar(50),    
    @Phone varchar(50),    
    @EmpDeptId int,    
    @EmpDesgId int,    
    @SupEmp int,  
	@EmpPhoto varbinary(max),    
	@EmpPhotoFileName varchar(50),  
    @UserName varchar(50),    
    @Password varchar(50),    
	@Flag int output    
        
)    
 as    
 begin     
	declare @EmpDateofBirth datetime    
    set @EmpDateofBirth=convert(datetime,@EmpDOB,103)    
	Declare @EmpId int    
	exec sp_GeneratedEmpId @EmpId output    
	print @EmpId    

	Insert into tbl_Employee(EmpId,Emp_FirstName,Emp_LastName,Emp_MiddleName,Emp_DOB,Emp_DOJ,    
               Address,Email,Phone,Emp_DeptId,SuperiorEmpId,Emp_DesgId,Emp_Photo,Emp_PhotoFileName)    
	Values(@EmpId,@FirstName,@LastName,@MiddleName,@EmpDOB,@EmpDOJ,@Address,@Email,@Phone,@EmpDeptId,    
            @EmpDesgId,@SupEmp,@EmpPhoto,@EmpPhotoFileName)    
        
    insert into tbl_Login(UserName,[Password],Emp_Cus_Id,[Role])    
	values(@UserName, @Password,@EmpId,'Employee'    
)    
    
	insert into tbl_EmployeeOnline (EmployeeId)     
	values (@EmpId)    
    return    
end
GO
/****** Object:  ForeignKey [FK_tbl_ComplaintEscalation_tbl_CustomerComplaintsRegistration]    Script Date: 01/08/2010 17:36:05 ******/
ALTER TABLE [dbo].[tbl_ComplaintEscalation]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ComplaintEscalation_tbl_CustomerComplaintsRegistration] FOREIGN KEY([ComplaintRegistrationId])
REFERENCES [dbo].[tbl_CustomerComplaintsRegistration] ([ComplaintRegistrationId])
GO
ALTER TABLE [dbo].[tbl_ComplaintEscalation] CHECK CONSTRAINT [FK_tbl_ComplaintEscalation_tbl_CustomerComplaintsRegistration]
GO
/****** Object:  ForeignKey [FK_tbl_ComplaintEscalation_tbl_Employee]    Script Date: 01/08/2010 17:36:05 ******/
ALTER TABLE [dbo].[tbl_ComplaintEscalation]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ComplaintEscalation_tbl_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[tbl_Employee] ([EmpId])
GO
ALTER TABLE [dbo].[tbl_ComplaintEscalation] CHECK CONSTRAINT [FK_tbl_ComplaintEscalation_tbl_Employee]
GO
/****** Object:  ForeignKey [FK_tbl_ComplaintType_tbl_Employee]    Script Date: 01/08/2010 17:36:05 ******/
ALTER TABLE [dbo].[tbl_ComplaintType]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ComplaintType_tbl_Employee] FOREIGN KEY([InchargeId])
REFERENCES [dbo].[tbl_Employee] ([EmpId])
GO
ALTER TABLE [dbo].[tbl_ComplaintType] CHECK CONSTRAINT [FK_tbl_ComplaintType_tbl_Employee]
GO
/****** Object:  ForeignKey [FK_tbl_CustomerComplaintsRegistration_tbl_Employee]    Script Date: 01/08/2010 17:36:05 ******/
ALTER TABLE [dbo].[tbl_CustomerComplaintsRegistration]  WITH CHECK ADD  CONSTRAINT [FK_tbl_CustomerComplaintsRegistration_tbl_Employee] FOREIGN KEY([EmpId])
REFERENCES [dbo].[tbl_Employee] ([EmpId])
GO
ALTER TABLE [dbo].[tbl_CustomerComplaintsRegistration] CHECK CONSTRAINT [FK_tbl_CustomerComplaintsRegistration_tbl_Employee]
GO
/****** Object:  ForeignKey [FK_tbl_CustomerComplaintsRegistration_tbl_ServiceCustomerDomain]    Script Date: 01/08/2010 17:36:05 ******/
ALTER TABLE [dbo].[tbl_CustomerComplaintsRegistration]  WITH CHECK ADD  CONSTRAINT [FK_tbl_CustomerComplaintsRegistration_tbl_ServiceCustomerDomain] FOREIGN KEY([ServiceCustomerDomainId])
REFERENCES [dbo].[tbl_ServiceCustomerDomain] ([ServiceCustomerDomainId])
GO
ALTER TABLE [dbo].[tbl_CustomerComplaintsRegistration] CHECK CONSTRAINT [FK_tbl_CustomerComplaintsRegistration_tbl_ServiceCustomerDomain]
GO
/****** Object:  ForeignKey [FK_tbl_CustomerFeedback_tbl_Customer]    Script Date: 01/08/2010 17:36:05 ******/
ALTER TABLE [dbo].[tbl_CustomerFeedback]  WITH CHECK ADD  CONSTRAINT [FK_tbl_CustomerFeedback_tbl_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[tbl_Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[tbl_CustomerFeedback] CHECK CONSTRAINT [FK_tbl_CustomerFeedback_tbl_Customer]
GO
/****** Object:  ForeignKey [FK_tbl_CustomerFeedback_tbl_CustomerComplaintsRegistration]    Script Date: 01/08/2010 17:36:05 ******/
ALTER TABLE [dbo].[tbl_CustomerFeedback]  WITH CHECK ADD  CONSTRAINT [FK_tbl_CustomerFeedback_tbl_CustomerComplaintsRegistration] FOREIGN KEY([ComplaintRegistrationId])
REFERENCES [dbo].[tbl_CustomerComplaintsRegistration] ([ComplaintRegistrationId])
GO
ALTER TABLE [dbo].[tbl_CustomerFeedback] CHECK CONSTRAINT [FK_tbl_CustomerFeedback_tbl_CustomerComplaintsRegistration]
GO
/****** Object:  ForeignKey [FK_tbl_Domain_tbl_Employee]    Script Date: 01/08/2010 17:36:05 ******/
ALTER TABLE [dbo].[tbl_Domain]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Domain_tbl_Employee] FOREIGN KEY([DomainInChargeId])
REFERENCES [dbo].[tbl_Employee] ([EmpId])
GO
ALTER TABLE [dbo].[tbl_Domain] CHECK CONSTRAINT [FK_tbl_Domain_tbl_Employee]
GO
/****** Object:  ForeignKey [FK_tbl_EmailDetails_tbl_Email]    Script Date: 01/08/2010 17:36:05 ******/
ALTER TABLE [dbo].[tbl_EmailDetails]  WITH CHECK ADD  CONSTRAINT [FK_tbl_EmailDetails_tbl_Email] FOREIGN KEY([EmailId])
REFERENCES [dbo].[tbl_Email] ([EmailId])
GO
ALTER TABLE [dbo].[tbl_EmailDetails] CHECK CONSTRAINT [FK_tbl_EmailDetails_tbl_Email]
GO
/****** Object:  ForeignKey [FK_tbl_FeedbackEvaluation_tbl_CustomerFeedback]    Script Date: 01/08/2010 17:36:05 ******/
ALTER TABLE [dbo].[tbl_FeedbackEvaluation]  WITH CHECK ADD  CONSTRAINT [FK_tbl_FeedbackEvaluation_tbl_CustomerFeedback] FOREIGN KEY([FeedBackId])
REFERENCES [dbo].[tbl_CustomerFeedback] ([FeedBackId])
GO
ALTER TABLE [dbo].[tbl_FeedbackEvaluation] CHECK CONSTRAINT [FK_tbl_FeedbackEvaluation_tbl_CustomerFeedback]
GO
/****** Object:  ForeignKey [FK_tbl_ServiceCustomerDomain_tbl_Domain]    Script Date: 01/08/2010 17:36:05 ******/
ALTER TABLE [dbo].[tbl_ServiceCustomerDomain]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ServiceCustomerDomain_tbl_Domain] FOREIGN KEY([ServiceCustomerDomainMasterId])
REFERENCES [dbo].[tbl_Domain] ([DomainId])
GO
ALTER TABLE [dbo].[tbl_ServiceCustomerDomain] CHECK CONSTRAINT [FK_tbl_ServiceCustomerDomain_tbl_Domain]
GO
/****** Object:  ForeignKey [FK_tbl_ServiceCustomerDomain_tbl_Employee1]    Script Date: 01/08/2010 17:36:05 ******/
ALTER TABLE [dbo].[tbl_ServiceCustomerDomain]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ServiceCustomerDomain_tbl_Employee1] FOREIGN KEY([ServiceCustomerDomainInChargeId])
REFERENCES [dbo].[tbl_Employee] ([EmpId])
GO
ALTER TABLE [dbo].[tbl_ServiceCustomerDomain] CHECK CONSTRAINT [FK_tbl_ServiceCustomerDomain_tbl_Employee1]
GO
/****** Object:  ForeignKey [FK_tbl_ServiceCustomerDomain_tbl_ServiceCustomers1]    Script Date: 01/08/2010 17:36:05 ******/
ALTER TABLE [dbo].[tbl_ServiceCustomerDomain]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ServiceCustomerDomain_tbl_ServiceCustomers1] FOREIGN KEY([ServiceCustomerId])
REFERENCES [dbo].[tbl_ServiceCustomers] ([ServiceCustomerId])
GO
ALTER TABLE [dbo].[tbl_ServiceCustomerDomain] CHECK CONSTRAINT [FK_tbl_ServiceCustomerDomain_tbl_ServiceCustomers1]
GO
/****** Object:  ForeignKey [FK_tbl_ServiceCustomerDomainComplaint_tbl_ComplaintType]    Script Date: 01/08/2010 17:36:05 ******/
ALTER TABLE [dbo].[tbl_ServiceCustomerDomainComplaint]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ServiceCustomerDomainComplaint_tbl_ComplaintType] FOREIGN KEY([ComplaintTypeId])
REFERENCES [dbo].[tbl_ComplaintType] ([ComplaintTypeId])
GO
ALTER TABLE [dbo].[tbl_ServiceCustomerDomainComplaint] CHECK CONSTRAINT [FK_tbl_ServiceCustomerDomainComplaint_tbl_ComplaintType]
GO
/****** Object:  ForeignKey [FK_tbl_ServiceCustomerDomainComplaint_tbl_ServiceCustomerDomain]    Script Date: 01/08/2010 17:36:05 ******/
ALTER TABLE [dbo].[tbl_ServiceCustomerDomainComplaint]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ServiceCustomerDomainComplaint_tbl_ServiceCustomerDomain] FOREIGN KEY([ServiceCustomerDomainId])
REFERENCES [dbo].[tbl_ServiceCustomerDomain] ([ServiceCustomerDomainId])
GO
ALTER TABLE [dbo].[tbl_ServiceCustomerDomainComplaint] CHECK CONSTRAINT [FK_tbl_ServiceCustomerDomainComplaint_tbl_ServiceCustomerDomain]
GO
/****** Object:  ForeignKey [FK_tbl_ServiceCustomerDomainCustomers_tbl_ServiceCustomerDomain]    Script Date: 01/08/2010 17:36:05 ******/
ALTER TABLE [dbo].[tbl_ServiceCustomerDomainCustomers]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ServiceCustomerDomainCustomers_tbl_ServiceCustomerDomain] FOREIGN KEY([ServiceCustomerDomainId])
REFERENCES [dbo].[tbl_ServiceCustomerDomain] ([ServiceCustomerDomainId])
GO
ALTER TABLE [dbo].[tbl_ServiceCustomerDomainCustomers] CHECK CONSTRAINT [FK_tbl_ServiceCustomerDomainCustomers_tbl_ServiceCustomerDomain]
GO
/****** Object:  ForeignKey [FK_tbl_ServiceCustomerDomainCustomers_tbl_ServiceCustomers]    Script Date: 01/08/2010 17:36:05 ******/
ALTER TABLE [dbo].[tbl_ServiceCustomerDomainCustomers]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ServiceCustomerDomainCustomers_tbl_ServiceCustomers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[tbl_ServiceCustomers] ([ServiceCustomerId])
GO
ALTER TABLE [dbo].[tbl_ServiceCustomerDomainCustomers] CHECK CONSTRAINT [FK_tbl_ServiceCustomerDomainCustomers_tbl_ServiceCustomers]
GO
/****** Object:  ForeignKey [FK_tbl_ServiceCustomers_tbl_Employee]    Script Date: 01/08/2010 17:36:05 ******/
ALTER TABLE [dbo].[tbl_ServiceCustomers]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ServiceCustomers_tbl_Employee] FOREIGN KEY([ServiceCustomerInChargeId])
REFERENCES [dbo].[tbl_Employee] ([EmpId])
GO
ALTER TABLE [dbo].[tbl_ServiceCustomers] CHECK CONSTRAINT [FK_tbl_ServiceCustomers_tbl_Employee]
GO
