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

public partial class Admin_frmDomainMaster : System.Web.UI.Page
{
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
                ddlDeptId.Items.Clear();
                ddlInChargeId.Enabled = true;
                ddlDeptId.Enabled = true;
                txtDomainName.Focus();
                btnSubmit.Text = "Submit new record";
                btnSubmit.Enabled = true;
                 BindInchargeIds();
                 BindDeptIds();
                 if (ddlDomainId.Items.Count != 0)
                     ddlDomainId.SelectedIndex = 0;
                if (ddlDeptId.Items.Count != 0)
                    ddlDeptId.SelectedIndex = 0;
                if (ddlInChargeId.Items.Count != 0)
                    ddlInChargeId.SelectedIndex = 0;
                ddlDomainId.Enabled = false;
                txtDomainName.ReadOnly = false;
            }
            else if (RadioButtonList1.SelectedIndex == 1)
            {
                ddlDeptId.Items.Clear();
                ddlInChargeId.Items.Clear();
                grdAllDomains.Visible = false;
                btnCloseGrid.Visible = false;
                ClearData();
                BindDomainIds();
                btnSubmit.Text = "Modify record";
                btnSubmit.Enabled = true;
                ddlDomainId.Enabled = true;
                ddlInChargeId.Enabled = false;
                ddlDeptId.Enabled = false;
            }
            
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }

    }
    protected void ddlDomainId_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (ddlDomainId.SelectedIndex != 0)
            {
                grdAllDomains.Visible = false;
                btnCloseGrid.Enabled = false;
                objCustomer.DomainId = Convert.ToInt32(ddlDomainId.SelectedItem.Value);
                DataSet ds = objCustomer.GetDomainDataByDomainId();
                DataRow dr = ds.Tables[0].Rows[0];
                if (ds.Tables[0].Rows.Count != 0)
                {
                    txtDomainName.Text = dr[1].ToString();
                    txtAbbreviation.Text = dr[2].ToString();
                    txtDomainDesc.Text = dr[3].ToString();
                    ddlInChargeId.Items.Add(dr[4].ToString());
                    ddlDeptId.Items.Add(dr[5].ToString());
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
            if (ddlDomainId.Items.Count != 0)
                ddlDomainId.SelectedIndex = 0;
            DataSet ds = objCustomer.ShowDomain();
            ViewState["Data"] = ds;
            if (ds.Tables[0].Rows.Count != 0)
            {
                grdAllDomains.DataSource = ds.Tables[0];
                grdAllDomains.DataBind();
                grdAllDomains.Visible = true;
                btnCloseGrid.Visible = true;
            }
            else
            {
                grdAllDomains.EmptyDataText = "No Records Found..";
                grdAllDomains.DataBind();
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    public void ClearData()
    {
        txtDomainName.Text = "";
        txtAbbreviation.Text = "";
        txtDomainDesc.Text = "";
    }

   public void BindDeptIds()
    {
        try
        {
            DataSet ds = objCustomer.GetAllDeptIds();
            if (ds.Tables[0].Rows.Count != 0)
            {
                ddlDeptId.DataSource = ds.Tables[0];
                ddlDeptId.DataTextField = "DeptName";
                ddlDeptId.DataValueField = "DepartmentId";
                ddlDeptId.DataBind();
                ddlDeptId.Items.Insert(0, "--Select One--");
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
 public void BindInchargeIds()
    {
        try
        {
            lblMsg.Text = "";
            DataSet ds = objCustomer.GetAllDomainInchargeIds();
            if (ds.Tables[0].Rows.Count != 0)
            {
                ddlInChargeId.DataSource = ds.Tables[0];
                ddlInChargeId.DataValueField = "EmpId";
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
 public void BindDomainIds()
 {
     try
     {
         lblMsg.Text = "";
         DataSet ds = objCustomer.GetAllDomainIds();
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
                lblMsg.Text = "";
                txtDomainName.Focus();
                objCustomer.DomainName = txtDomainName.Text;
                objCustomer.DomainAbbr = txtAbbreviation.Text;
                objCustomer.DomainDesc = txtDomainDesc.Text;
                objCustomer.InChargeId = Convert.ToInt32(ddlInChargeId.SelectedItem.Value);
                objCustomer.DepartmentId = Convert.ToInt32(ddlDeptId.SelectedItem.Value);
                objCustomer.InsertDomain();

                lblMsg.Text = "Record Inserted successfully..";
                ClearData();
                ddlInChargeId.SelectedIndex = 0;
                ddlDeptId.SelectedIndex = 0;

            }

            else if (RadioButtonList1.SelectedIndex == 1 && btnSubmit.Text == "Modify record")
            {
                objCustomer.DomainId = Convert.ToInt32(ddlDomainId.SelectedItem.Value);
                objCustomer.DomainName = txtDomainName.Text;
                objCustomer.DomainAbbr = txtAbbreviation.Text;
                objCustomer.DomainDesc = txtDomainDesc.Text;
                objCustomer.UpdateDomain();
                lblMsg.Text = "Record Updated successfully..";

                ddlDomainId.SelectedIndex = 0;
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
                txtDomainName.Focus();
                ddlInChargeId.Items.Clear();
                ddlDeptId.Items.Clear();
            }
            else
            {
                ClearData();
                ddlDomainId.SelectedIndex = 0;
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
            grdAllDomains.Visible = false;
            btnCloseGrid.Visible = false;
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void grdAllDomains_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            DataSet ds = (DataSet)ViewState["Data"];
            if (ds.Tables[0].Rows.Count != 0)
            {
                grdAllDomains.PageIndex = e.NewPageIndex;
                grdAllDomains.DataSource = ds.Tables[0];
                grdAllDomains.DataBind();
                grdAllDomains.Visible = true;
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
