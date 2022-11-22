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
using CustomerDesk.DAL;
using System.Data.SqlClient;
/// <summary>
/// Summary description for clsLogin
/// </summary>
public class clsLogin
{
	public clsLogin()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public static  string UserName { get; set; }
    public static string Password { get; set; }
    public static string Role { get; set; }
    public static int UserId { get; set; }
    public static int Emp_Cus_Id { get; set; }
   static  DataSet ds = null;

    public static string GetUserLogin()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[5];

            p[0] = new SqlParameter("@UserName", UserName);
            p[1] = new SqlParameter("@Password", Password );
            p[2] = new SqlParameter("@Role", SqlDbType.VarChar, 50);
            p[2].Direction = ParameterDirection.Output;
            p[3] = new SqlParameter("@UserId", SqlDbType.Int);
            p[3].Direction = ParameterDirection.Output;
            p[4] = new SqlParameter("@Emp_Cus_Id", SqlDbType.Int);
            p[4].Direction = ParameterDirection.Output;
           
             SqlHelper.ExecuteNonQuery(Connection.con, CommandType.StoredProcedure, "spLoginChecking", p);
             Role = Convert.ToString(p[2].Value);
             if (Role != "NoUser")
             {
                 UserId = Convert.ToInt32(p[3].Value);
                 Emp_Cus_Id = Convert.ToInt32(p[4].Value);
             }
             return Role;
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }



    public static DataSet GetOnlineCustomerData()
    {
        try
        {
            return SqlHelper.ExecuteDataset(Connection.con, CommandType.StoredProcedure, "sp_GetOnlineCustomerData");
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public static DataSet GetOnlineEmployeeData()
    {
        try
        {
            return SqlHelper.ExecuteDataset(Connection.con, CommandType.StoredProcedure, "sp_GetOnlineEmployeeData");
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

    public static void ActiveCustomerOnlineStatus(int Id)
    {
        try
        {
            string str = "Update tbl_CustomerOnline set [status]=1 where CustomerId=" + Id;
            SqlHelper.ExecuteNonQuery(Connection.con, CommandType.Text, str);
        }
        catch (Exception ex)
        {

            throw new ArgumentException(ex.Message);
        }
                
    }

    public static void ActiveEmployeeOnlineStatus(int Id)
    {
        try
        {
            string str = "Update tbl_EmployeeOnline set [status]=1 where EmployeeId=" + Id;
            SqlHelper.ExecuteNonQuery(Connection.con, CommandType.Text, str);
        }
        catch (Exception ex)
        {

            throw new ArgumentException(ex.Message);
        }
                
    }

    public static void InActiveCustomerOnlineStatus(int Id)
    {
        try
        {
            string str = "Update tbl_CustomerOnline set [status]=0 where CustomerId=" + Id;
            SqlHelper.ExecuteNonQuery(Connection.con, CommandType.Text, str);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public static void InActiveEmployeeOnlineStatus(int Id)
    {
        try
        {
            string str = "Update tbl_EmployeeOnline set [status]=0 where EmployeeId=" + Id;
            SqlHelper.ExecuteNonQuery(Connection.con, CommandType.Text, str);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
   

    
}
