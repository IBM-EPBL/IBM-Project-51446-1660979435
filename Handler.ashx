<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;

public class Handler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["CustomerDeskConnectionString"].ConnectionString; 
        SqlConnection cn = new SqlConnection(connectionString);
       // SqlConnection cn = new SqlConnection("user id=sa;pwd=123;database=Recording;server=server2");
        SqlCommand cmd = new SqlCommand("select * from tbl_CustomerComplaintsRegistration where ComplaintRegistrationId=@id", cn);
        cmd.Parameters.Add("@id", SqlDbType.Int).Value = context.Request.QueryString["id"];
        try
        {
            cn.Open();
            SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.Default);
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    context.Response.ContentType = reader["TextFile"].ToString();
                    context.Response.BinaryWrite((byte[])reader["VoiceTextOfComplaint"]);
                }
            }
        }
        finally
        {
            cn.Close();
        }
    }
    public bool IsReusable { get { return false; } }

}