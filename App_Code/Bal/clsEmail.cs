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
/// Summary description for clsEmail
/// </summary>
public class clsEmail
{

    private int emailId;
    private int emailSenderId;
    private string emaildate;
    private string emailSubjectText;
    private string eMailBodyMsg;
    private int emailReciptedId;


    // constructor
    public clsEmail()
    {
    }

    public int InsertEmailData()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[4];
            p[0] = new SqlParameter("@EmailSenderId", EmailSenderId);
            p[1] = new SqlParameter("@EmailSubjectText", EmailSubjectText);
            p[2] = new SqlParameter("@EMailBodyMsg", EMailBodyMsg);
            p[3] = new SqlParameter("@EmailReciepentId", EmailReciptedId);

            return SqlHelper.ExecuteNonQuery(Connection.con, CommandType.StoredProcedure, "sp_InsertEmailData", p);

        }
        catch (Exception ex)
        {

            throw new ArgumentException(ex.Message);
        }
    }

    public int EmailId { get { return emailId; } set { emailId = value; } }
    public int EmailSenderId { get { return emailSenderId; } set { emailSenderId = value; } }
    public string Emaildate { get { return emaildate; } set { emaildate = value; } }
    public string EmailSubjectText { get { return emailSubjectText; } set { emailSubjectText = value; } }
    public string EMailBodyMsg { get { return eMailBodyMsg; } set { eMailBodyMsg = value; } }
    public int EmailReciptedId { get { return emailReciptedId; } set { emailReciptedId = value; } }


    public static DataSet GetCustomerEmails()
    {
        try
        {
            DataSet ds = new DataSet();
            return SqlHelper.ExecuteDataset(Connection.con, CommandType.StoredProcedure, "sp_GetCustomerEmails");
        }
        catch (Exception ex)
        {

            throw new ArgumentException(ex.Message);
        }
    }

    public static DataSet GetEmployeeEmails()
    {
        try
        {
            DataSet ds = new DataSet();
            return SqlHelper.ExecuteDataset(Connection.con, CommandType.StoredProcedure, "sp_GetEmployeeEmails");
        }
        catch (Exception ex)
        {

            throw new ArgumentException(ex.Message);
        }
    }
    


    public static DataSet ShowFacultyEmailsStudentWise(int id)
    {
        try
        {
            DataSet ds = new DataSet();
            SqlParameter p = new SqlParameter("@studentid", id);
            return SqlHelper.ExecuteDataset(Connection.con, CommandType.StoredProcedure, "SP_FacultyidemailsselectStudentId", p);
        }
        catch (Exception ex)
        {

            throw new ArgumentException(ex.Message);
        }
    }

    public static DataSet ShowStudentEmailsFacultyWise(int id)
    {
        try
        {
            DataSet ds = new DataSet();
            SqlParameter p = new SqlParameter("@Facultyid", id);
            return SqlHelper.ExecuteDataset(Connection.con, CommandType.StoredProcedure, "SP_studentidemailsselectFacultyid", p);
        }
        catch (Exception ex)
        {

            throw new ArgumentException(ex.Message);
        }
    }


    public static DataSet ShowInboxdetails(int id)
    {
        try
        {
            DataSet ds = new DataSet();
            SqlParameter p = new SqlParameter("@EmailReciepentId", id);
            return SqlHelper.ExecuteDataset(Connection.con, CommandType.StoredProcedure, "sp_Inboxdetailshows", p);
        }
        catch (Exception ex)
        {

            throw new ArgumentException(ex.Message);
        }
    }

    public static DataSet ShowOutboxdetails(int id)
    {
        try
        {
            DataSet ds = new DataSet();
            SqlParameter p = new SqlParameter("@senderid", id);
            return SqlHelper.ExecuteDataset(Connection.con, CommandType.StoredProcedure, "sp_outboxdetails", p);
        }
        catch (Exception ex)
        {

            throw new ArgumentException(ex.Message);
        }
    }
    public static DataSet ShowEmailDetailsidwiseInbox(int Emailid1)
    {
        try
        {
            DataSet ds = new DataSet();
            SqlParameter p = new SqlParameter("@Emailid", Emailid1);


            return SqlHelper.ExecuteDataset(Connection.con, CommandType.StoredProcedure, "Sp_ShowDetailsEmailidwise", p);

        }
        catch (Exception ex)
        {

            throw new ArgumentException(ex.Message);
        }
    }

    public static DataSet ShowEmailDetailsidwiseOutbox(int Emailid1)
    {
        try
        {
            DataSet ds = new DataSet();
            SqlParameter p = new SqlParameter("@Emailid", Emailid1);


            return SqlHelper.ExecuteDataset(Connection.con, CommandType.StoredProcedure, "Sp_ShowEmaildetailsOutbox", p);

        }
        catch (Exception ex)
        {

            throw new ArgumentException(ex.Message);
        }
    }

    public static int UpdateEmailDeleteStatusInbox(int p)
    {
        try
        {
            return SqlHelper.ExecuteNonQuery(Connection.con, CommandType.Text, "update tbl_EmailDetails set EmailDeleteStatus=1 where Emailid=" + p);
        }
        catch (Exception ex)
        {

            throw new ArgumentException(ex.Message);
        }
    }
    public static int UpdateEmailDeleteStatusOutbox(int p)
    {
        try
        {
            return SqlHelper.ExecuteNonQuery(Connection.con, CommandType.Text, "update tbl_email set EmailDeleteStatus=1 where Emailid=" + p);
        }
        catch (Exception ex)
        {

            throw new ArgumentException(ex.Message);
        }
    }
}