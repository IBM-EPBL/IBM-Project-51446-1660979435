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

public partial class Admin_frmComplaintType : System.Web.UI.Page
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
                ddlInChargeId.Enabled = true;
                txtComplaintTypeName.Focus();
                btnSubmit.Text = "Submit new record";
                btnSubmit.Enabled = true;
                BindInchargeIds();
                if (ddlComplaintTypeId.Items.Count != 0)
                    ddlComplaintTypeId.SelectedIndex = 0;
                if (ddlInChargeId.Items.Count != 0)
                    ddlInChargeId.SelectedIndex = 0;
                ddlComplaintTypeId.Enabled = false;
                txtComplaintTypeName.ReadOnly = false;
            }
            else if (RadioButtonList1.SelectedIndex == 1)
            {
                ddlInChargeId.Items.Clear();
                grdAllComplaintTypes.Visible = false;
                btnCloseGrid.Visible = false;
                ClearData();
                BindComplaintTypeIds();
                btnSubmit.Text = "Modify record";
                btnSubmit.Enabled = true;
                ddlComplaintTypeId.Enabled = true;
                ddlInChargeId.Enabled = false;
            }
            
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }

    }
    protected void ddlComplaintTypeId_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (ddlComplaintTypeId.SelectedIndex != 0)
            {
                grdAllComplaintTypes.Visible = false;
                btnCloseGrid.Enabled = false;
                objCustomer.ComplaintTypeId  = Convert.ToInt32(ddlComplaintTypeId.SelectedItem.Value);
                DataSet ds = objCustomer.GetComplaintTypeDataByComplaintTypeId();
                DataRow dr = ds.Tables[0].Rows[0];
                if (ds.Tables[0].Rows.Count != 0)
                {
                    txtComplaintTypeName.Text = dr[1].ToString();
                    txtComplaintTypeAbbr.Text = dr[2].ToString();
                    txtDesc.Text = dr[3].ToString();
                    ddlInChargeId.Items.Add(dr[4].ToString());
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
            if (ddlComplaintTypeId.Items.Count != 0)
                ddlComplaintTypeId.SelectedIndex = 0;
            DataSet ds = objCustomer.ShowComplaintType();
            ViewState["Data"] = ds;
            if (ds.Tables[0].Rows.Count != 0)
            {
                grdAllComplaintTypes.DataSource = ds.Tables[0];
                grdAllComplaintTypes.DataBind();
                grdAllComplaintTypes.Visible = true;
                btnCloseGrid.Visible = true;
            }
            else
            {
                grdAllComplaintTypes.EmptyDataText = "No Records Found..";
                grdAllComplaintTypes.DataBind();
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }

    }
    public void ClearData()
    {
        txtComplaintTypeName.Text = "";
        txtComplaintTypeAbbr.Text = "";
        txtDesc.Text = "";
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
    public void BindComplaintTypeIds()
    {
        try
        {
            lblMsg.Text = "";
            DataSet ds = objCustomer.GetAllComplaintTypeIds();
            if (ds.Tables[0].Rows.Count != 0)
            {
                ddlComplaintTypeId.DataSource = ds.Tables[0];
                ddlComplaintTypeId.DataValueField = "ComplaintTypeId";
                ddlComplaintTypeId.DataTextField = "ComplaintTypeName";
                ddlComplaintTypeId.DataBind();
                ddlComplaintTypeId.Items.Insert(0, "--Select One--");
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
                
                txtComplaintTypeName.Focus();
                objCustomer.ComplaintTypeName = txtComplaintTypeName .Text;
                objCustomer.ComplaintTypeAbbr  = txtComplaintTypeAbbr.Text;
                objCustomer.ComplaintTypeDesc = txtDesc.Text;
                objCustomer.InChargeId = Convert.ToInt32(ddlInChargeId.SelectedItem.Value);
                objCustomer.InsertComplaintType();
                lblMsg.Text = "Record Inserted successfully..";


            }

            else if (RadioButtonList1.SelectedIndex == 1 && btnSubmit.Text == "Modify record")
            {
                objCustomer.ComplaintTypeId  = Convert.ToInt32(ddlComplaintTypeId.SelectedItem.Value);
                objCustomer.ComplaintTypeName = txtComplaintTypeName.Text;
                objCustomer.ComplaintTypeAbbr = txtComplaintTypeAbbr.Text;
                objCustomer.ComplaintTypeDesc = txtDesc.Text;
                objCustomer.UpdateComplaintType();
                lblMsg.Text = "Record Updated successfully..";

                ddlComplaintTypeId.SelectedIndex = 0;
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
                txtComplaintTypeName.Focus();
                ddlInChargeId.Items.Clear();
            }
            else
            {
                ClearData();
                ddlComplaintTypeId.SelectedIndex = 0;
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
            grdAllComplaintTypes.Visible = false;
            btnCloseGrid.Visible = false;
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }

    protected void grdAllComplaintTypes_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            DataSet ds = (DataSet)ViewState["Data"];
            if (ds.Tables[0].Rows.Count != 0)
            {
                grdAllComplaintTypes.PageIndex = e.NewPageIndex;
                grdAllComplaintTypes.DataSource = ds.Tables[0];
                grdAllComplaintTypes.DataBind();
                grdAllComplaintTypes.Visible = true;
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
