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

public partial class Services_ServiceCustomers : System.Web.UI.Page
{
    clsService objService = new clsService();
    clsCustomer objCustomer = new clsCustomer();
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
                ddlInChargeId.Items.Clear();
                ddlInChargeId.Enabled = true;
                txtServiceCustomerName.Focus();
                btnSubmit.Text = "Submit new record";
                btnSubmit.Enabled = true;
                BindInchargeIds();
                if (ddlServiceCustomerId.Items.Count != 0)
                    ddlServiceCustomerId.SelectedIndex = 0;
                if (ddlInChargeId.Items.Count != 0)
                    ddlInChargeId.SelectedIndex = 0;
                ddlServiceCustomerId.Enabled = false;
                txtServiceCustomerName.ReadOnly = false;
            }
            else if (RadioButtonList1.SelectedIndex == 1)
            {
                ddlInChargeId.Items.Clear();
                grdAllServiceCustomers.Visible = false;
                btnCloseGrid.Visible = false;
                ClearData();
                BindServiceCustomerIds();
                btnSubmit.Text = "Modify record";
                btnSubmit.Enabled = true;
                ddlServiceCustomerId.Enabled = true;
                ddlInChargeId.Enabled = false;
            }
            
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void ddlServiceCustomerId_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (ddlServiceCustomerId.SelectedIndex != 0)
            {
                grdAllServiceCustomers.Visible = false;
                btnCloseGrid.Enabled = false;
                objService.ServiceCustomerId = Convert.ToInt32(ddlServiceCustomerId.SelectedItem.Value);
                DataSet ds = objService.GetServiceCustomerDataByServiceCustomersId();
                DataRow dr = ds.Tables[0].Rows[0];
                if (ds.Tables[0].Rows.Count != 0)
                {
                    txtServiceCustomerName.Text = dr[1].ToString();
                    txtServiceCustomerDOR.Text = dr[2].ToString();
                    txtAddress.Text = dr[3].ToString();
                    txtServiceCustomerPhoneNo.Text = dr[4].ToString();
                    txtServiceCustomerEmail.Text = dr[5].ToString();
                    txtDesc.Text = dr[7].ToString();
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
            if (ddlServiceCustomerId.Items.Count != 0)
                ddlServiceCustomerId.SelectedIndex = 0;
            DataSet ds = objService.GetAllServiceCustomerData();
            ViewState["Data"] = ds;
            if (ds.Tables[0].Rows.Count != 0)
            {
                grdAllServiceCustomers.DataSource = ds.Tables[0];
                grdAllServiceCustomers.DataBind();
                grdAllServiceCustomers.Visible = true;
                btnCloseGrid.Visible = true;
            }
            else
            {
                grdAllServiceCustomers.EmptyDataText = "No Records Found..";
                grdAllServiceCustomers.DataBind();
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }

    public void ClearData()
    {
        txtServiceCustomerName.Text = "";
        txtServiceCustomerDOR.Text = "";
        txtAddress.Text = "";
        txtServiceCustomerPhoneNo.Text = "";
        txtServiceCustomerEmail.Text = "";
        txtDesc.Text = "";
    }

    public void BindInchargeIds()
    {
        try
        {
           
            DataSet ds = objService.GetAllSerCustomerInChargeIds();
            //DataSet ds = objCustomer.GetAllDomainInchargeIds();
            if (ds.Tables[0].Rows.Count != 0)
            {
                ddlInChargeId.DataSource = ds.Tables[0];
                ddlInChargeId.DataValueField = "DomainInChargeId";
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
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (RadioButtonList1.SelectedIndex == 0 && btnSubmit.Text == "Submit new record")
            {

                txtServiceCustomerName.Focus();
                objService.ServiceCustomerName = txtServiceCustomerName.Text;
                objService.ServiceCustomerDOR  = Convert.ToDateTime(txtServiceCustomerDOR.Text);
                objService.Address  = txtAddress.Text;
                objService.PhoneNo = txtServiceCustomerPhoneNo.Text;
                objService.Email = txtServiceCustomerEmail.Text;
                objService.InChargeId = Convert.ToInt32(ddlInChargeId.SelectedItem.Value);
                objService.Description = txtDesc.Text;
                objService.InsertServiceCustomers();
                lblMsg.Text = "Record Inserted successfully..";


            }

            else if (RadioButtonList1.SelectedIndex == 1 && btnSubmit.Text == "Modify record")
            {
                objService.ServiceCustomerId  = Convert.ToInt32(ddlServiceCustomerId.SelectedItem.Value);
                objService.ServiceCustomerName = txtServiceCustomerName.Text;
                objService.ServiceCustomerDOR =  Convert.ToDateTime(txtServiceCustomerDOR.Text);
                objService.Address = txtAddress.Text;
                objService.PhoneNo = txtServiceCustomerPhoneNo.Text;
                objService.Email = txtServiceCustomerEmail.Text;
                objService.Description = txtDesc.Text;
                objService.UpdateServiceCustomers();
                lblMsg.Text = "Record Updated successfully..";

                ddlServiceCustomerId.SelectedIndex = 0;
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
                txtServiceCustomerName.Focus();
                ddlInChargeId.Items.Clear();
            }
            else
            {
                ClearData();
                ddlServiceCustomerId.SelectedIndex = 0;
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
            btnCloseGrid.Visible = false;
            grdAllServiceCustomers.Visible = false;
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void grdAllServiceCustomers_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            DataSet ds = (DataSet)ViewState["Data"];
            if (ds.Tables[0].Rows.Count != 0)
            {
                grdAllServiceCustomers.PageIndex = e.NewPageIndex;
                grdAllServiceCustomers.DataSource = ds.Tables[0];
                grdAllServiceCustomers.DataBind();
                grdAllServiceCustomers.Visible = true;
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
