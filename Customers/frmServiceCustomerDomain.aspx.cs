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

public partial class Services_frmServiceCustomerDomain : System.Web.UI.Page
{
    clsService objService = new clsService();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        btnCloseGrid.Visible = false;
        if (!IsPostBack)
        {
        }
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (RadioButtonList1.SelectedIndex == 0)
            {

                ClearData();
                ddlServiceCustomerId.Items.Clear();
                ddlDomainId.Items.Clear();
                ddlInChargeId.Items.Clear();
                ddlServiceCustomerId.Enabled = true;
                ddlDomainId.Enabled = true;
                ddlInChargeId.Enabled = true;
                btnSubmit.Text = "Submit new record";
                btnSubmit.Enabled = true;
                BindServiceCustomerIds();
                BindDomainIds();
                BindInchargeIds();
                if (ddlServiceCustomerId.Items.Count != 0)
                    ddlServiceCustomerId.SelectedIndex = 0;
                if (ddlDomainId.Items.Count != 0)
                    ddlDomainId.SelectedIndex = 0;
                if (ddlInChargeId.Items.Count != 0)
                    ddlInChargeId.SelectedIndex = 0;
                ddlServiceCustomerDomainId.Enabled = false;
            }
            else if (RadioButtonList1.SelectedIndex == 1)
            {
                ddlServiceCustomerId.Items.Clear();
                ddlDomainId.Items.Clear();
                ddlInChargeId.Items.Clear();
                grdAllServiceCustomerDomain.Visible = false;
                btnCloseGrid.Visible = false;
                ClearData();
                BindServiceCustomerDomainIds();
                btnSubmit.Text = "Modify record";
                btnSubmit.Enabled = true;
                ddlServiceCustomerDomainId.Enabled = true;
                ddlServiceCustomerId.Enabled = false;
                ddlDomainId.Enabled = false;
                ddlInChargeId.Enabled = false;
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void ddlServiceCustomerDomainId_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if(ddlServiceCustomerDomainId.SelectedIndex !=0)
            {
                grdAllServiceCustomerDomain.Visible = false;
                btnCloseGrid.Enabled = false;
                objService.ServiceCustomerDomainId  = Convert.ToInt32(ddlServiceCustomerDomainId.SelectedItem.Value);
                DataSet ds = objService.GetServiceCustomerDomainDataByServiceCustomerDomainId();
                DataRow dr = ds.Tables[0].Rows[0];
                if (ds.Tables[0].Rows.Count != 0)
                {
                    txtPhone.Text =dr[3].ToString();
                    txtManagerName.Text =dr[5].ToString();
                    txtEmail.Text =dr[6].ToString();
                    txtAddress.Text =dr[7].ToString();
                    txtDesc.Text =dr[8].ToString();
                }
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void btnShowAll_Click(object sender, EventArgs e)
    {
        try
        {
            ClearData();
            btnCloseGrid.Enabled = true;
            if (ddlServiceCustomerDomainId.Items.Count != 0)
                ddlServiceCustomerDomainId.SelectedIndex = 0;
            DataSet ds = objService.GetAllServiceCustomerDomain();
            ViewState["Data"] = ds;
            if (ds.Tables[0].Rows.Count != 0)
            {
                grdAllServiceCustomerDomain.DataSource = ds.Tables[0];
                grdAllServiceCustomerDomain.DataBind();
                grdAllServiceCustomerDomain.Visible = true;
                btnCloseGrid.Visible = true;
            }
            else
            {
                grdAllServiceCustomerDomain.EmptyDataText = "No Records Found..";
                grdAllServiceCustomerDomain.DataBind();
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    public void ClearData()
    {
        txtPhone.Text = "";
        txtManagerName.Text = "";
        txtEmail.Text = "";
        txtAddress.Text = "";
        txtDesc.Text = "";
    }
    public void BindInchargeIds()
    {
        try
        {
            lblMsg.Text = "";
            DataSet ds = objService.GetServiceCustomerInchargeIds();
            if (ds.Tables[0].Rows.Count != 0)
            {
                ddlInChargeId.DataSource = ds.Tables[0];
                ddlInChargeId.DataValueField = "ServiceCustomerInChargeId";
                ddlInChargeId.DataTextField = "Emp_FirstName";
                ddlInChargeId.DataBind();
                ddlInChargeId.Items.Insert(0, "--Select One--");
            }
            else
            {
                lblMsg.Text = "No Records Found..";

            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    public void BindServiceCustomerIds()
    {
        try
        {
            lblMsg.Text = "";
            DataSet ds = objService.GetAllServiceCustomerIds();
            if (ds.Tables[0].Rows.Count != 0)
            {
                ddlServiceCustomerId.DataSource = ds.Tables[0];
                ddlServiceCustomerId.DataValueField = "ServiceCustomerId";
                ddlServiceCustomerId.DataTextField = "ServiceCustomerName";
                ddlServiceCustomerId.DataBind();
                ddlServiceCustomerId.Items.Insert(0, "--Select One--");
            }
            else
            {
                lblMsg.Text = "No Records Found..";

            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    public void BindServiceCustomerDomainIds()
    {
        try
        {
            lblMsg.Text = "";
            DataSet ds = objService.GetAllServiceCustomerDomain();
            if (ds.Tables[0].Rows.Count != 0)
            {
                ddlServiceCustomerDomainId.DataSource = ds.Tables[0];
                ddlServiceCustomerDomainId.DataValueField = "ServiceCustomerDomainId";
                ddlServiceCustomerDomainId.DataTextField = "ServiceCustomerDomainId";
                ddlServiceCustomerDomainId.DataBind();
                ddlServiceCustomerDomainId.Items.Insert(0, "--Select One--");
            }
            else
            {
                lblMsg.Text = "No Records Found..";

            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }

    public void BindDomainIds()
    {
        try
        {
            lblMsg.Text = "";
            DataSet ds = objService.GetAllDomainIds();
            if (ds.Tables[0].Rows.Count != 0)
            {
                ddlDomainId.DataSource = ds.Tables[0];
                ddlDomainId.DataValueField = "DomainId";
                ddlDomainId.DataTextField = "DomainName";
                ddlDomainId.DataBind();
                ddlDomainId.Items.Insert(0, "--Select One--");
            }
            else
            {
                lblMsg.Text = "No Records Found..";

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
            if (RadioButtonList1.SelectedIndex == 0 && btnSubmit.Text == "Submit new record")
            {
                objService.ServiceCustomerId = Convert.ToInt32(ddlServiceCustomerId.SelectedItem.Value);
                objService.ServiceCustomerDomainMasterId = Convert.ToInt32(ddlDomainId.SelectedItem.Value);
                objService.ServiceCustomerDomainPhone  = txtPhone.Text;
                objService.InChargeId = Convert.ToInt32(ddlInChargeId.SelectedItem.Value);
                objService.ServiceCustomerDomainManagerName = txtManagerName.Text;
                objService.Email = txtEmail.Text;
                objService.Address = txtAddress.Text;
                objService.Description = txtDesc.Text;
                objService.InsertServiceCustomerDomain();
                lblMsg.Text = "Record Inserted successfully..";
            }
            else 
            if (RadioButtonList1.SelectedIndex == 1 && btnSubmit.Text == "Modify record")
            {
                objService.ServiceCustomerDomainId = Convert.ToInt32(ddlServiceCustomerDomainId.SelectedItem.Value);
                objService.ServiceCustomerDomainPhone = txtPhone.Text;
                objService.ServiceCustomerDomainManagerName = txtManagerName.Text;
                objService.Email = txtEmail.Text;
                objService.Address = txtAddress.Text;
                objService.Description = txtDesc.Text;
                objService.UpdateServiceCustomerDomain();
                lblMsg.Text = "Record Updated successfully..";

                ddlServiceCustomerDomainId.SelectedIndex = 0;
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        try
        {
            if (RadioButtonList1.SelectedIndex == 0)
            {
                ClearData();
                ddlServiceCustomerId.Items.Clear();
                ddlDomainId.Items.Clear();
                ddlInChargeId.Items.Clear();
            }
            else
            {
                ClearData();
                ddlServiceCustomerDomainId.SelectedIndex = 0;
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void btnCloseGrid_Click(object sender, EventArgs e)
    {
        try
        {
            grdAllServiceCustomerDomain.Visible = false;
            btnCloseGrid.Visible = false;
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void grdAllServiceCustomerDomain_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            DataSet ds = (DataSet)ViewState["Data"];
            if (ds.Tables[0].Rows.Count != 0)
            {
                grdAllServiceCustomerDomain.PageIndex = e.NewPageIndex;
                grdAllServiceCustomerDomain.DataSource = ds.Tables[0];
                grdAllServiceCustomerDomain.DataBind();
                grdAllServiceCustomerDomain.Visible = true;
                btnCloseGrid.Visible = true;
            }
            else
            {
                lblMsg.Text = "No Records Found..";
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
}
