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

public partial class Services_frmServiceCustomerDomainPhone : System.Web.UI.Page
{
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
            ddlServiceCustomerDomainId.DataSource = objService.GetAllServiceCustomerDomainIds();
            ddlServiceCustomerDomainId.DataTextField = "ServiceCustomerDomainId";
            ddlServiceCustomerDomainId.DataValueField = "ServiceCustomerDomainId";
            ddlServiceCustomerDomainId.DataBind();
            ddlServiceCustomerDomainId.Items.Insert(0, "Select");
           
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void BtnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            objService.ServiceCustomerDomainId = Convert.ToInt32(ddlServiceCustomerDomainId.SelectedItem.Value);
            objService.PhoneNo1 = txtPhoneNo1.Text;
            objService.PhoneNo2 = txtPhoneNo2.Text;
            objService.PhoneNo3 = txtPhoneNo3.Text;
            objService.InsertServiceCustomerDomainPhoneNos();

            lblMsg.Text = "Record Inserted Successfully...";
            ClearData();
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
        ddlServiceCustomerDomainId.SelectedIndex = 0;
        txtPhoneNo1.Text = "";
        txtPhoneNo2.Text = "";
        txtPhoneNo3.Text = "";
    }

}
