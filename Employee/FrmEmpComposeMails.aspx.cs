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

public partial class Employee_FrmUserComposeMails : System.Web.UI.Page
{
    clsEmail objEmail = new clsEmail();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            if (!IsPostBack)
            {
                if (Session["UserId"] != null)
                {

                }
                ddlto.Items.Insert(0, "--Select EmailId--");
            }
        }
        catch (Exception ex)
        {

            lblMsg.Text = ex.Message;
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            objEmail.EmailSenderId = Convert.ToInt32(Session["Userid"]);
            objEmail.EMailBodyMsg = txtbody.Text;
            objEmail.EmailSubjectText = txtsubject.Text;
            objEmail.EmailReciptedId = Convert.ToInt32(ddlto.SelectedValue);

            int i = objEmail.InsertEmailData();
            if (i > 0)
            {
                ClearData();
                lblMsg.Text = "Sending Email Sucessfully..";
            }
            else
            {
                lblMsg.Text = "Sending Failed..";
            }
        }
        catch (Exception ex)
        {

            lblMsg.Text = ex.Message;
        }


    }

    public void ClearData()
    {
      
        txtsubject.Text = "";
        txtbody.Text = "";
        if (ddlto.SelectedIndex != 0)
            ddlto.SelectedIndex = 0;
        lblMsg.Text = "";
    }
    
    protected void rdbCustomer_CheckedChanged(object sender, EventArgs e)
    {
        try
        {
            DataSet ds = clsEmail.GetCustomerEmails();
            if (ds.Tables[0].Rows.Count != 0)
            {
                ddlto.DataSource = ds.Tables[0];
                ddlto.DataTextField = "Username";
                ddlto.DataValueField = "UserId";
                ddlto.DataBind();
                ddlto.Items.Insert(0, "--Select EmailId--");
            }
            else
            {
                ddlto.Items.Clear();
                ddlto.Items.Insert(0, "--Select EmailId--");
            }
            txtbody.Text = "";
            txtsubject.Text = "";
            lblMsg.Text = "";
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void BtnInBox_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("../Employee/FrmEmpInbox.aspx");
        }
        catch (Exception ex)
        {

            lblMsg.Text = ex.Message;
        }
    }
    protected void BtnOutBox_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("../Employee/FrmEmpOutbox.aspx");
        }
        catch (Exception ex)
        {

            lblMsg.Text = ex.Message;
        }
    }
}
