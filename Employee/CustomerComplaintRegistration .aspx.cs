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

public partial class Employee_CustomerComplaintRegistration_ : System.Web.UI.Page
{
    clsCustomerComplaints objComplaint = new clsCustomerComplaints();
    clsCustomer objCustomer = new clsCustomer();
    clsService objService = new clsService();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        if (!IsPostBack)
        {
           
            PopulateCombos();
        }

    }
   
    public void PopulateCombos()
    {
        try
        {
                ddlCustomerId.DataSource = objCustomer.GetAllCustomerIds();
                ddlCustomerId.DataValueField = "CustomerId";
                ddlCustomerId.DataTextField = "CustomerName";
                ddlCustomerId.DataBind();
                ddlCustomerId.Items.Insert(0, "--Select One--");

                ddlEmpId.DataSource = objCustomer.GetAllComplaintEmpIds();
                ddlEmpId.DataValueField = "EmpId";
                ddlEmpId.DataTextField = "Emp_FirstName";
                ddlEmpId.DataBind();
                ddlEmpId.Items.Insert(0, "--Select One--");

                ddlServiceCustomerDomainId.DataSource = objService.GetAllServiceCustomerDomainIds();
                ddlServiceCustomerDomainId.DataValueField = "ServiceCustomerDomainId";
                ddlServiceCustomerDomainId.DataTextField = "ServiceCustomerDomainId";
                ddlServiceCustomerDomainId.DataBind();
                ddlServiceCustomerDomainId.Items.Insert(0, "--Select One--");
        }
        catch (Exception ex)
        {
            
            lblMsg.Text=ex.Message;
        }
    }
    protected void BtnAdd_Click(object sender, EventArgs e)
    {
        string s = "";
        try
        {
            objComplaint.RegistrationDate = txtRegistrationDate.Text;
            string registrationTime = ddlHrs.SelectedItem.Value + ":" + ddlMins.SelectedItem.Value + ":" + ddlAm.SelectedItem.Value;
            objComplaint.RegistrationTime = registrationTime.ToString();
            objComplaint.CustomerId = Convert.ToInt32(ddlCustomerId.SelectedItem.Value);
            objComplaint.ServiceCustomerDomainId = Convert.ToInt32(ddlServiceCustomerDomainId.SelectedItem.Value);
            objComplaint.PhoneNo = txtPhoneNo.Text;
            objComplaint.TextComplaint = txtComplaint.Text;
            objComplaint.EmpId = Convert.ToInt32(ddlEmpId.SelectedItem.Value);
            if (Session["FileContent"] != null & Session["FileName"] != null)
            {
                objComplaint.VoiceText = (byte[])Session["FileContent"];
                objComplaint.TextFile = Session["FileName"].ToString();
            }
            else
            {
                System.Text.ASCIIEncoding encoding = new System.Text.ASCIIEncoding();
                byte[] data = encoding.GetBytes(s);
                objComplaint.VoiceText = data;
                objComplaint.TextFile = "No Files";
            }
            objComplaint.Status = txtStatus.Text;
            objComplaint.EscalatedStatus = txtEscalatedStatus.Text;
            objComplaint.Count = Convert.ToInt32(txtCount.Text);
            objComplaint.ResponseText = txtResponseText.Text;
            if (Session["ResponseFileContent"] != null & Session["ResponseFileName"] != null)
            {
                objComplaint.ResponseVoice = (byte[])Session["ResponseFileContent"];
                objComplaint.VoiceFile = Session["ResponseFileName"].ToString();
            }
            else
            {
                System.Text.ASCIIEncoding encoding = new System.Text.ASCIIEncoding();
                byte [] data  = encoding.GetBytes(s);
                objComplaint.ResponseVoice = data;
                objComplaint.VoiceFile = "No Files";
            }
            objComplaint.Severity = txtSeverity.Text;
            objComplaint.InsertCustomerComplaintsRegistration();
            ClearData();
            lblMsg.Text = "Record Inserted successfully..";
        }
        catch (Exception ex)
        {

            lblMsg.Text = ex.Message;
        }

    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        try
        {
          
            ClearData();
        }
        catch (Exception ex)
        {
            
           lblMsg.Text = ex.Message;
        }
    }
    public void ClearData()
    {
       
        txtRegistrationDate.Text = "";
        ddlCustomerId.SelectedIndex = 0;
        ddlEmpId.SelectedIndex = 0;
        ddlServiceCustomerDomainId.SelectedIndex = 0;
        txtPhoneNo.Text = "";
        txtComplaint.Text = "";
        txtStatus.Text = "";
        txtEscalatedStatus.Text = "";
        txtCount.Text = "";
        txtResponseText.Text = "";
        txtSeverity.Text = "";
    }
    
}
