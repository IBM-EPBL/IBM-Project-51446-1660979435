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

public partial class Admin_frmServiceCustomerDomainComplaint : System.Web.UI.Page
{
    clsService objService = new clsService();
    clsCustomer objCustomer = new clsCustomer();
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

            ddlComplaintType.DataSource = objCustomer.GetAllComplaintTypeIds();
            ddlComplaintType.DataTextField = "ComplaintTypeName";
            ddlComplaintType.DataValueField = "ComplaintTypeId";
            ddlComplaintType.DataBind();
            ddlComplaintType.Items.Insert(0, "Select");

            
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
            objService.ComplaintTypeId  = Convert.ToInt32(ddlComplaintType.SelectedItem.Value);

            objService.InsertServiceCustomerDomainComplaintType();

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
        ddlComplaintType.SelectedIndex = 0;
        
    }

}
