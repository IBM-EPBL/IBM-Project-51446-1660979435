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
/// Summary description for clsCustomerComplaints
/// </summary>
public class clsCustomerComplaints:Connection
{
	public clsCustomerComplaints()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public int ComplaintRegistrationId { get; set; }
    public string RegistrationDate { get; set; }
    public string RegistrationTime { get; set; }
    public int CustomerId { get; set; }
    public int ServiceCustomerDomainId { get; set; }
    public string PhoneNo { get; set; }
    public string TextComplaint { get; set; }
    public int EmpId { get; set; }
    public byte[] VoiceText { get; set; }
    public string  TextFile { get; set; }
    public string Status { get; set; }
    public string EscalatedStatus { get; set; }
    public int Count { get; set; }
    public string ResponseText { get; set; }
    public byte[] ResponseVoice { get; set; }
    public string VoiceFile { get; set; }
    public string Severity { get; set; }

    public int ComplaintEscalationId { get; set; }
    public string EscalationDate { get; set; }
    public string EscalationTime { get; set; }
    public string EscalationText { get; set; }


    public string InsertCustomerComplaintsRegistration()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[7];
           
            p[0] = new SqlParameter("@CustomerId", CustomerId);
            p[1] = new SqlParameter("@ServiceCustomerDomainId", ServiceCustomerDomainId);
            p[2] = new SqlParameter("@PhoneNo", PhoneNo);
            p[3] = new SqlParameter("@Textofcomplaint", TextComplaint);

            p[4] = new SqlParameter("@Message", SqlDbType.VarChar, 250);
            p[4].Direction = ParameterDirection.Output;
            p[5] = new SqlParameter("@FileName", VoiceFile);
            p[6] = new SqlParameter("@FileContent", VoiceText);
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "sp_InsertCustomerComplaintsRegistration", p);
            return p[4].Value.ToString();
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

    public string InsertCustomerComplaintsResponse()
    {
        try
        {

            SqlParameter [] p=new SqlParameter[10];
            p[0] = new SqlParameter("@ComplaintRegistrationId", ComplaintRegistrationId);
            p[1] = new SqlParameter("@EmployeeId", EmpId);
            p[2] = new SqlParameter("@Status", Status);
            p[3] = new SqlParameter("@EscalatedStatus", EscalatedStatus);
            p[4] = new SqlParameter("@CountEscalation", Count);
            p[5] = new SqlParameter("@ComplaintResponseText", ResponseText);
            p[6] = new SqlParameter("@ComplaintSeverity", Severity);
            p[7] = new SqlParameter("@Message", SqlDbType.VarChar, 250);
            p[7].Direction = ParameterDirection.Output;
            p[8] = new SqlParameter("@voicefilecontent", ResponseVoice);
            p[9] = new SqlParameter("@Voicefilename", VoiceFile);
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "sp_InsertCustomerComplaintsResponse", p);
            return p[7].Value.ToString();
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public string InsertComplaintEscalation()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[12];
            p[0] = new SqlParameter("@ComplaintEscalationDate", EscalationDate);
            p[1] = new SqlParameter("@ComplaintEscalationTime", EscalationTime);
            p[2] = new SqlParameter("@ComplaintRegistrationId", ComplaintRegistrationId);
            p[3] = new SqlParameter("@EmployeeId", EmpId);
            p[4] = new SqlParameter("@ComplaintEscalationText", EscalationText);
            p[5] = new SqlParameter("@PhoneNo", PhoneNo);
            p[6] = new SqlParameter("@VoiceTextFileOfComplaint", VoiceText);
            p[7] = new SqlParameter("@VoiceTextFile", TextFile);
            p[8] = new SqlParameter("@ComplaintResponseText", ResponseText);
            p[9] = new SqlParameter("@ComplaintResponseVoiceFile", ResponseVoice);
            p[10] = new SqlParameter("@VoiceFileName", VoiceFile);
            p[11] = new SqlParameter("@Message", SqlDbType.VarChar, 250);
            p[11].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "sp_InsertComplaintEscalation", p);
            return p[11].Value.ToString();
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

    public string UpdateCustomerComplaintsRegistration()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[15];
            p[0] = new SqlParameter("@ComplaintRegistrationId", ComplaintRegistrationId);
            p[1] = new SqlParameter("@RegistrationDate", RegistrationDate);
            p[2] = new SqlParameter("@RegistrationTime", RegistrationTime);
            p[3] = new SqlParameter("@PhoneNo", PhoneNo);
            p[4] = new SqlParameter("@Textofcomplaint", TextComplaint);
            p[5] = new SqlParameter("@VoiceTextOfComplaint", VoiceText);
            p[6] = new SqlParameter("@TextFile", TextFile);
            p[7] = new SqlParameter("@ComplaintStatus", Status);
            p[8] = new SqlParameter("@ComplaintEscalatedStatus", EscalatedStatus);
            p[9] = new SqlParameter("@CountOfEscalation", Count);
            p[10] = new SqlParameter("@ComplaintResponseText", ResponseText);
            p[11] = new SqlParameter("@ComplaintResponseVoiceFile", ResponseVoice);
            p[12] = new SqlParameter("@VoiceFileName", VoiceFile);
            p[13] = new SqlParameter("@ComplaintSeverity", Severity);
            p[14] = new SqlParameter("@Message", SqlDbType.VarChar, 250);
            p[14].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "sp_UpdateCustomerComplaintsRegistration", p);
            return p[14].Value.ToString();
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

    public string UpdateComplaintEscalation()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[11];
            p[0] = new SqlParameter("@ComplaintEscalationId", ComplaintEscalationId);
            p[1] = new SqlParameter("@ComplaintEscalationDate", EscalationDate);
            p[2] = new SqlParameter("@ComplaintEscalationTime", EscalationTime);
            p[3] = new SqlParameter("@ComplaintEscalationText", EscalationText);
            p[4] = new SqlParameter("@PhoneNo", PhoneNo);
            p[5] = new SqlParameter("@VoiceTextFileOfComplaint", VoiceText);
            p[6] = new SqlParameter("@VoiceTextFile", TextFile);
            p[7] = new SqlParameter("@ComplaintResponseText", ResponseText);
            p[8] = new SqlParameter("@ComplaintResponseVoiceFile", ResponseVoice);
            p[9] = new SqlParameter("@VoiceFileName", VoiceFile);
            p[10] = new SqlParameter("@Message", SqlDbType.VarChar, 250);
            p[10].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "sp_UpdateComplaintEscalation", p);
            return p[10].Value.ToString();
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetAllEmpIds()
    {
        try
        {
            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "sp_GetAllEmpIds", null);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet ShowComplaints()
    {
        try
        {
            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "ShowComplaint", null);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetAllComplaintRegistrationIds()
    {
        try
        {
            string str = "select * from tbl_CustomerComplaintsRegistration";
            return SqlHelper.ExecuteDataset(con, CommandType.Text, str);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetAllComplaintEscalationIds()
    {
        try
        {
            string str = "select * from tbl_ComplaintEscalation";
            return SqlHelper.ExecuteDataset(con, CommandType.Text, str);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

    public DataSet GetComplaintRegistrationDataByComplaintRegistrationId()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@ComplaintRegistrationId", ComplaintRegistrationId);
            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "sp_GetComplaintRegistrationDataByComplaintRegistrationId", p);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

    public DataSet DisplayInformation()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@CustomerId", CustomerId);
            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "ShowInformation", p);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetComplaintEscalationDataByComplaintEscalationId()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@ComplaintEscalationId", ComplaintEscalationId);
            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "sp_GetComplaintEscalationDataByComplaintEscalationId", p);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

    public DataSet GetAllCustomerComplaintsData()
    {
        try
        {
            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "sp_GetAllCustomerComplaintsData", null);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetAllComplaintEscalationData()
    {
        try
        {
            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "sp_GetAllComplaintEscalationData", null);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

    
}
