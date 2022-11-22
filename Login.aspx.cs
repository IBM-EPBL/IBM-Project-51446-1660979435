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

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsg.Text = "";
    }
    clsLogin objLogin = new clsLogin();
    
    protected void ImgBtnEmail_Click(object sender, EventArgs e)
    {
        string str1 = null;
        string[] UserName = null;
        try
        {
            if (txtusername.Text.Contains("@"))
            {
                string str = txtusername.Text;
                UserName = str.Split('@');
                clsLogin.UserName = UserName[0].ToString();
                str1 = UserName[0].ToString();
            }
            else
            {
                clsLogin.UserName = txtusername.Text.Trim();
                str1 = txtusername.Text.Trim();
            }
            clsLogin.Password = txtpassword.Text.Trim();
            string Role = clsLogin.GetUserLogin();

            if (Role == "NoUser")
                lblMsg.Text = "User Name and password mismatch. Try again.";
            else
            {
                Session["UserId"] = clsLogin.UserId;
                Session["Emp_Cus_Id"] = clsLogin.Emp_Cus_Id;
                if (Role == "Admin")
                {
                    Session["UserName"] = str1;
                    Response.Redirect("~/Admin/AdminHome.aspx");
                    //FormsAuthentication.RedirectFromLoginPage("Admin", false);
                }
                else if (Role == "Employee")
                {
                    Session["UserName"] = str1;
                    clsLogin.ActiveEmployeeOnlineStatus(Convert.ToInt32(Session["Emp_Cus_Id"]));
                    Session["UserType"] = "Employee";
                    Response.Redirect("~/Employee/EmployeeHome.aspx");
                    //FormsAuthentication.RedirectFromLoginPage("Employee", false);
                    
                }
                else if (Role == "Customer")
                {
                    Session["UserName"] = str1;
                    clsLogin.ActiveCustomerOnlineStatus(Convert.ToInt32(Session["UserId"]));
                    Session["UserType"] = "Customer";
                    Response.Redirect("~/Customers/ServicesHome.aspx");
                    //FormsAuthentication.RedirectFromLoginPage("Customer", false);
                }
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
 }
