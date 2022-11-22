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

public partial class Admin_frmServiceCustomerDomainCustomers : System.Web.UI.Page
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

            ddlCustomerId.DataSource = objService.GetServiceCustomerDomainCustomerIds();
            ddlCustomerId.DataTextField = "ServiceCustomerName";
            ddlCustomerId.DataValueField = "ServiceCustomerId";
            ddlCustomerId.DataBind();
            ddlCustomerId.Items.Insert(0, "Select");

           
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
            objService.ServiceCustomerId = Convert.ToInt32(ddlCustomerId.SelectedItem.Value);

            objService.InsertServiceCustomerDomainCustomers();

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
        ddlCustomerId.SelectedIndex = 0;
        
    }

}
