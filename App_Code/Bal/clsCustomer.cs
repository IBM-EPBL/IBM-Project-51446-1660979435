using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using CustomerDesk.DAL;

/// <summary>
/// Summary description for clsCustomer
/// </summary>
public class clsCustomer:Connection 
{
	public clsCustomer()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public int DomainId { get; set; }
    public string DomainName { get; set; }
    public string DomainAbbr { get; set; }
    public string  DomainDesc { get; set; }
    public int InChargeId { get; set; }
    public int DepartmentId { get; set; }

    public int CustomerId { get; set; }
    public string  CustomerName { get; set; }
    public DateTime   CustomerDOB { get; set; }
    public string CustomerPhoneNo { get; set; }
    public string CustomerEmailId { get; set; }
    public string CustomerDesc { get; set; }
    public DateTime  CustomerDOR { get; set; }
    public string CustomerAddress { get; set; }
    public string UserName { get; set; }
    public string  Password { get; set; }

    public int ComplaintTypeId { get; set; }
    public string ComplaintTypeName { get; set; }
    public string ComplaintTypeAbbr { get; set; }
    public string ComplaintTypeDesc { get; set; }

    public int ReportId { get; set; }
    public string ReportDate { get; set; }
    public string ReportTime { get; set; }
    public int EmpId { get; set; }
    public string ReportFile { get; set; }

    public int FeedBackId { get; set; }
    public string FeedBackDate { get; set; }
    public string  FeedBackText { get; set; }
    public string EmailId { get; set; }
    public byte[] VoiceFile { get; set; }
    public string  FileName { get; set; }
    public int ComplaintRegistrationId { get; set; }

    public int FeedBackEvaluationId { get; set; }
    public string FeedBackEvaluationDate{ get; set; }
    public int EmpInchargeId { get; set; }
    public string EvaluationText { get; set; }
    public byte[] EvaluationLinkFile { get; set; }
    public string LinkFile { get; set; }

    public string InsertDomain()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[6];
            p[0] = new SqlParameter("@DomainName", DomainName);
            p[1] = new SqlParameter("@DomainAbbr", DomainAbbr);
            p[2] = new SqlParameter("@DomainDesc", DomainDesc);
            p[3] = new SqlParameter("@DomainInChargeId", InChargeId);
            p[4] = new SqlParameter("@DepartmentId", DepartmentId);
            p[5] = new SqlParameter("@Message", SqlDbType.VarChar, 250);
            p[5].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "sp_InsertDomain", p);
            return p[5].Value.ToString();
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public string InsertCustomer()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[10];
            p[0] = new SqlParameter("@CustomerName", CustomerName);
            p[1] = new SqlParameter("@CustomerDOB", CustomerDOB);
            p[2] = new SqlParameter("@CustomerPhoneNo", CustomerPhoneNo);
            p[3] = new SqlParameter("@CustomerEmailId", CustomerEmailId);
            p[4] = new SqlParameter("@CustomerDesc", CustomerDesc);
            p[5] = new SqlParameter("@CustomerDOR", CustomerDOR);
            p[6] = new SqlParameter("@CustomerAddress", CustomerAddress);
            p[7] = new SqlParameter("@UserName", UserName);
            p[8] = new SqlParameter("@Password", Password);
            p[9] = new SqlParameter("@Message", SqlDbType.VarChar, 250);
            p[9].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "sp_InsertCustomer", p);
            return p[9].Value.ToString();
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public string InsertComplaintType()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[5];
            p[0] = new SqlParameter("@ComplaintTypeName",ComplaintTypeName);
            p[1] = new SqlParameter("@ComplaintTypeAbbr", ComplaintTypeAbbr);
            p[2] = new SqlParameter("@ComplaintTypeDesc", ComplaintTypeDesc);
            p[3] = new SqlParameter("@InChargeId", InChargeId);
            p[4] = new SqlParameter("@Message", SqlDbType.VarChar, 250);
            p[4].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "sp_InsertComplaintType", p);
            return p[4].Value.ToString();
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

    public string InsertReport()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[5];
            p[0] = new SqlParameter("@ReportDate", ReportDate);
            p[1] = new SqlParameter("@ReportTime", ReportTime);
            p[2] = new SqlParameter("@ReportGeneratedEmpId", EmpId);
            p[3] = new SqlParameter("@ReportFileToSave", ReportFile);
            p[4] = new SqlParameter("@Message", SqlDbType.VarChar, 250);
            p[4].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "sp_InsertReport", p);
            return p[4].Value.ToString();
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

    public string InsertCustomerFeedBack()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[8];
            p[0] = new SqlParameter("@CustomerId", CustomerId);
            p[1] = new SqlParameter("@FeedBackDate", FeedBackDate);
            p[2] = new SqlParameter("@FeedBackText", FeedBackText);
            p[3] = new SqlParameter("@EmailId", EmailId);
            p[4] = new SqlParameter("@FeedBackVoiceFile", VoiceFile);
            p[5] = new SqlParameter("@VoiceFileName", FileName);
            p[6] = new SqlParameter("@ComplaintRegistrationId", ComplaintRegistrationId);
            p[7] = new SqlParameter("@Message", SqlDbType.VarChar, 250);
            p[7].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "sp_InsertCustomerFeedBack", p);
            return p[7].Value.ToString();
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

    public string InsertFeedBackEvaluation()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[7];
            p[0] = new SqlParameter("@FeedBackEvaluationDate", FeedBackEvaluationDate);
            p[1] = new SqlParameter("@EmployeeInChargeId", EmpInchargeId);
            p[2] = new SqlParameter("@FeedBackId", FeedBackId);
            p[3] = new SqlParameter("@FeedBackEvaluationText", EvaluationText);
            p[4] = new SqlParameter("@FeedBackEvaluationLinkFile", EvaluationLinkFile);
            p[5] = new SqlParameter("@LinkFileName", LinkFile);
            p[6] = new SqlParameter("@Message", SqlDbType.VarChar, 250);
            p[6].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "sp_InsertFeedBackEvaluation", p);
            return p[6].Value.ToString();
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }





    public string UpdateDomain()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[5];
            p[0] = new SqlParameter("@DomainId", DomainId);
            p[1] = new SqlParameter("@DomainName", DomainName);
            p[2] = new SqlParameter("@DomainAbbr", DomainAbbr);
            p[3] = new SqlParameter("@DomainDesc", DomainDesc);
            p[4] = new SqlParameter("@Message", SqlDbType.VarChar, 250);
            p[4].Direction = ParameterDirection.Output;

            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "sp_UpdateDomain", p);
            return p[4].Value.ToString();
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

    public string UpdateCustomer()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[9];
            p[0] = new SqlParameter("@CustomerId", CustomerId);
            p[1] = new SqlParameter("@CustomerName", CustomerName);
            p[2] = new SqlParameter("@CustomerDOB", CustomerDOB);
            p[3] = new SqlParameter("@CustomerPhoneNo", CustomerPhoneNo);
            p[4] = new SqlParameter("@CustomerEmailId", CustomerEmailId);
            p[5] = new SqlParameter("@CustomerDesc", CustomerDesc);
            p[6] = new SqlParameter("@CustomerDOR", CustomerDOR);
            p[7] = new SqlParameter("@CustomerAddress", CustomerAddress);
            p[8] = new SqlParameter("@Message", SqlDbType.VarChar, 250);
            p[8].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "sp_UpdateCustomer", p);
            return p[8].Value.ToString();
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public string UpdateComplaintType()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[5];
            p[0] = new SqlParameter("@ComplaintTypeId", ComplaintTypeId);
            p[1] = new SqlParameter("@ComplaintTypeName", ComplaintTypeName);
            p[2] = new SqlParameter("@ComplaintTypeAbbr", ComplaintTypeAbbr);
            p[3] = new SqlParameter("@ComplaintTypeDesc", ComplaintTypeDesc);
            p[4] = new SqlParameter("@Message", SqlDbType.VarChar, 250);
            p[4].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "sp_UpdateComplaintType", p);
            return p[4].Value.ToString();
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public string UpdateReport()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[5];
            p[0] = new SqlParameter("@ReportId", ReportId);
            p[1] = new SqlParameter("@ReportDate", ReportDate);
            p[2] = new SqlParameter("@ReportTime", ReportTime);
            p[3] = new SqlParameter("@ReportFileToSave", ReportFile);
            p[4] = new SqlParameter("@Message", SqlDbType.VarChar, 250);
            p[4].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "sp_UpdateReport", p);
            return p[4].Value.ToString();
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

    public string UpdateCustomerFeedBack()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[7];
            p[0] = new SqlParameter("@FeedBackId", FeedBackId);
            p[1] = new SqlParameter("@FeedBackDate", FeedBackDate);
            p[2] = new SqlParameter("@FeedBackText", FeedBackText);
            p[3] = new SqlParameter("@EmailId", EmailId);
            p[4] = new SqlParameter("@FeedBackVoiceFile", VoiceFile);
            p[5] = new SqlParameter("@VoiceFileName", FileName);
            p[6] = new SqlParameter("@Message", SqlDbType.VarChar, 250);
            p[6].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "sp_UpdateCustomerFeedBack", p);
            return p[6].Value.ToString();
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public string UpdateFeedBackEvaluation()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[6];
            p[0] = new SqlParameter("@FeedBackEvaluationId", FeedBackEvaluationId);
            p[1] = new SqlParameter("@FeedBackEvaluationDate", FeedBackEvaluationDate);
            p[2] = new SqlParameter("@FeedBackEvaluationText", EvaluationText);
            p[3] = new SqlParameter("@FeedBackEvaluationLinkFile", EvaluationLinkFile);
            p[4] = new SqlParameter("@LinkFileName", LinkFile);
            p[5] = new SqlParameter("@Message", SqlDbType.VarChar, 250);
            p[5].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "sp_UpdateFeedBackEvaluation", p);
            return p[5].Value.ToString();
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }



    public DataSet GetAllDomainIds()
    {
        try
        {
            string str = "select * from tbl_Domain";
            return SqlHelper.ExecuteDataset(con, CommandType.Text, str);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

    public DataSet GetAllCustomerIds()
    {
        try
        {
            string str = "select * from tbl_Customer";
            return SqlHelper.ExecuteDataset(con, CommandType.Text, str);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetAllComplaintEmpIds()
    {
        try
        {
            
            return SqlHelper.ExecuteDataset(con, CommandType.Text, "sp_GetAllComplaintEmpIds",null);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    
    public DataSet GetAllComplaintTypeIds()
    {
        try
        {
            string str = "select * from tbl_ComplaintType";
            return SqlHelper.ExecuteDataset(con, CommandType.Text, str);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetAllReportIds()
    {
        try
        {
            string str = "select * from tbl_Report";
            return SqlHelper.ExecuteDataset(con, CommandType.Text, str);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetAllFeedBackIds()
    {
        try
        {
            string str = "select * from tbl_CustomerFeedback";
            return SqlHelper.ExecuteDataset(con, CommandType.Text, str);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetAllFeedBackEvaluationIds()
    {
        try
        {
            string str = "select * from tbl_FeedbackEvaluation";
            return SqlHelper.ExecuteDataset(con, CommandType.Text, str);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }



    public DataSet GetAllDeptIds()
    {
        try
        {
            string str = "select * from tbl_Department";
            return SqlHelper.ExecuteDataset(con, CommandType.Text, str);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetAllDomainInchargeIds()
    {
        try
        {
            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "sp_GetDomainIncharges", null);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

    public DataSet GetDomainDataByDomainId()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@DomainId", DomainId);
            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "sp_GetDomainDataByDomainId", p);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetCutomerDataByCustomerId()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@CustomerId", CustomerId);
            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "sp_GetCutomerDataByCustomerId", p);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetComplaintTypeDataByComplaintTypeId()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@ComplaintTypeId", ComplaintTypeId);
            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "sp_GetComplaintTypeDataByComplaintTypeId", p);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetReportsDataByReportId()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@ReportId", ReportId );
            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "sp_GetReportsDataByReportId", p);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetFeedBackDataByFeedBackId()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@FeedBackId", FeedBackId);
            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "sp_GetFeedBackDataByFeedBackId", p);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetFeedBackEvaluationDataByFeedBackEvaluationId()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@FeedBackEvaluationId", FeedBackEvaluationId);
            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "sp_GetFeedBackEvaluationDataByFeedBackEvaluationId", p);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }




    public DataSet GetAllDomainData()
    {
        try
        {
            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "sp_GetAllDomainData", null);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet ShowDomain()
    {
        try
        {
            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "spShowDomain", null);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetAllCustomerData()
    {
        try
        {
            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "sp_GetAllCustomerData", null);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetAllComplaintTypeData()
    {
        try
        {
            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "sp_GetAllComplaintTypeData", null);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet ShowComplaintType()
    {
        try
        {
            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "spShowComplaintType", null);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

    public DataSet GetAllReportsData()
    {
        try
        {
            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "sp_GetAllReportsData", null);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetAllFeedBackData()
    {
        try
        {
            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "sp_GetAllFeedBackData", null);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetAllFeedBackEvaluationData()
    {
        try
        {
            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "sp_GetAllFeedBackEvaluationData", null);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

    public DataSet ShowFeedBackEvaluation()
    {
        try
        {
            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "spShowFeedbackEvaluation", null);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

}
