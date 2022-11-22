<%@ WebHandler Language="C#" Class="MyHnd" %>

using System;
using System.Web;
using System.Data.SqlClient;
using System.Data;

public class MyHnd : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
       // context.Response.ContentType = "text/plain";
       // context.Response.Write("Hello World");
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["CustomerDeskConnectionString"].ConnectionString;
        SqlConnection cn = new SqlConnection(connectionString);
        // SqlConnection cn = new SqlConnection("user id=sa;pwd=123;database=Recording;server=server2");
        SqlCommand cmd = new SqlCommand("select * from tbl_CustomerComplaintsRegistration where ComplaintRegistrationId=@id", cn);
        cmd.Parameters.Add("@id", System.Data.SqlDbType.Int).Value = context.Request.QueryString["id"];
        try
        {
            cn.Open();
            SqlDataReader reader = cmd.ExecuteReader(System.Data.CommandBehavior.Default);
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
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}