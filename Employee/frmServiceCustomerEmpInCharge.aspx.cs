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

public partial class Employee_frmServiceCustomerEmpInCharge : System.Web.UI.Page
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

            ddlInChargeId.DataSource = objService.GetServiceCustomerInchargeIds();
            ddlInChargeId.DataTextField = "Emp_FirstName";
            ddlInChargeId.DataValueField = "ServiceCustomerInchargeId";
            ddlInChargeId.DataBind();
            ddlInChargeId.Items.Insert(0, "Select");

            ddlEmpId.DataSource = objService.GetServiceCustomerEmpIds();
            ddlEmpId.DataTextField = "Emp_FirstName";
            ddlEmpId.DataValueField = "EmpId";
            ddlEmpId.DataBind();
            ddlEmpId.Items.Insert(0, "Select");
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
            objService.InChargeId  = Convert.ToInt32(ddlInChargeId.SelectedItem.Value);
            objService.EmpId = Convert.ToInt32(ddlEmpId.SelectedItem.Value);
            objService.InsertServiceCustomerDomainEmpInCharges();

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
        ddlInChargeId.SelectedIndex = 0;
        ddlEmpId.SelectedIndex = 0;
    }
   
}
