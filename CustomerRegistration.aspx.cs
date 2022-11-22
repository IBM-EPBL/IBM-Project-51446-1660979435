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

public partial class CustomerRegistration : System.Web.UI.Page
{
    clsCustomer objCustomer = new clsCustomer();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            txtCustomerName.Focus();
            objCustomer.CustomerName = txtCustomerName.Text;
            objCustomer.CustomerDOB = Convert.ToDateTime(txtCustomerDOB.Text);
            objCustomer.CustomerPhoneNo = txtPhoneNo.Text;
            objCustomer.CustomerEmailId = txtEmailId.Text;
            objCustomer.CustomerDesc = txtDesc.Text;
            objCustomer.CustomerDOR = System.DateTime.Now;
            objCustomer.CustomerAddress = txtAddress.Text;
            objCustomer.UserName = txtUserName.Text;
            objCustomer.Password = txtPassword.Text;
            objCustomer.InsertCustomer();
            ClearData();
            lblMsg.Text = "You Have Successfully Registration..";
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }

    }
    public void ClearData()
    {
        try
        {
            txtCustomerName.Text = "";
            txtCustomerDOB.Text = "";
            txtPhoneNo.Text = "";
            txtEmailId.Text = "";
            txtAddress.Text = "";
            txtUserName.Text = "";
            txtPassword.Text = "";
        }
        catch (Exception ex)

        {
            lblMsg.Text = ex.Message;   
        }
    }
}
