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
using System.Xml.Linq;

public partial class LogOut : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["UserType"].ToString() == "Employee")
                clsLogin.InActiveEmployeeOnlineStatus(Convert.ToInt32(Session["Emp_Cus_Id"]));
            if (Session["UserType"].ToString() == "Customer")
                clsLogin.InActiveCustomerOnlineStatus(Convert.ToInt32(Session["UserId"]));
            Session.Abandon();
            Session.Clear();
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void lnkLogOut_Click(object sender, EventArgs e)
    {
        try
        {
            
            Response.Redirect("Login.aspx");
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
}
