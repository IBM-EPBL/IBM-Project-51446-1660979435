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

public partial class Admin_frmDepartmentMaster : System.Web.UI.Page
{
    clsEmployee objEmp = new clsEmployee();
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
            lblMsg.Text = "";
            if (RadioButtonList1.SelectedIndex == 0)
            {
               
                ClearData();
                txtName.Focus();
                btnSubmit.Text = "Submit new record";
                btnSubmit.Enabled = true;
                if(ddlDeptId.Items.Count !=0)
                ddlDeptId.SelectedIndex = 0;
                ddlDeptId.Enabled = false;
                ddlInChargeId.Enabled = false;
                txtName.ReadOnly = false;
               
            }
            else if (RadioButtonList1.SelectedIndex == 1)
            {
                grdAllDepts.Visible = false;
                btnCloseGrid.Visible = false;
                if (ddlInChargeId.Items.Count != 0)
                    ddlInChargeId.SelectedIndex = 0;
                ClearData();
                BindDeptIds();
               // BindDeptInChargeIds();
                btnSubmit.Text = "Modify record";
                btnSubmit.Enabled = true;
                ddlDeptId.Enabled = true;
                ddlInChargeId.Enabled = true;
                
            }
            
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void ddlDeptId_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            lblMsg.Text = "";
            if (ddlDeptId.SelectedIndex != 0)
            {
                grdAllDepts.Visible = false;
                btnCloseGrid.Enabled = false;
                objEmp.DeptId = Convert.ToInt32(ddlDeptId.SelectedItem.Value);
                BindDeptInChargeIds();
                DataSet ds = objEmp.GetDeptMasterDataByDeptId();
                DataRow dr = ds.Tables[0].Rows[0];
                if (ds.Tables[0].Rows.Count != 0)
                {
                    txtName.Text = dr[1].ToString();
                    txtAbbreviation.Text = dr[2].ToString();
                    ddlInChargeId.SelectedValue = dr[3].ToString();
                    txtDesc.Text = dr[4].ToString();
                    
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
            if(ddlDeptId.Items.Count !=0)
            ddlDeptId.SelectedIndex = 0;
            if (ddlInChargeId.Items.Count != 0)
                ddlInChargeId.SelectedIndex = 0;
            DataSet ds = objEmp.GetAllDeptMasterData();
            ViewState["Data"] = ds;
            if (ds.Tables[0].Rows.Count != 0)
            {
                grdAllDepts.DataSource = ds.Tables[0];
                grdAllDepts.DataBind();
                grdAllDepts.Visible = true;
                btnCloseGrid.Visible = true;
            }
            else
            {
                grdAllDepts.EmptyDataText = "No Records Found..";
                grdAllDepts.DataBind();
            }
           
        }
        catch (Exception ex)
        {
            lblMsg.Text = "Error:Contact System Admin" + ex.Message;
        }
    }
    void ClearData()
    {
        txtName.Text = "";
        txtAbbreviation.Text = "";
        txtDesc.Text = "";
       
    }
    void BindDeptIds()
    {
        try
        {
            DataSet ds = objEmp.GetAllDeptIds();
            if (ds.Tables[0].Rows.Count != 0)
            {
                ddlDeptId.DataSource = ds.Tables[0];
                ddlDeptId.DataValueField = "DepartmentId";
                ddlDeptId.DataTextField = "DeptName";
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
    void BindDeptInChargeIds()
    {
        try
        {
            objEmp.DeptId  = Convert.ToInt32(ddlDeptId.SelectedValue);
            DataSet ds = objEmp.GetAllDeptInChargeIds();
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
   
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {

            if (RadioButtonList1.SelectedIndex == 0 && btnSubmit.Text == "Submit new record")
            {
                rfvName.Enabled = false;
                txtName.Focus();
                objEmp.DeptName = txtName.Text;
                objEmp.Abbreviation = txtAbbreviation.Text;
                objEmp.Description = txtDesc.Text;
                objEmp.InsertDeptMaster();
                lblMsg.Text = "Record Inserted successfully..";
                
                BindDeptIds();                
                
            }

            else if (RadioButtonList1.SelectedIndex == 1 && btnSubmit.Text == "Modify record")
            {
                lblMsg.Text = "";
                rfvName.Enabled = true;
                objEmp.DeptId = Convert.ToInt32(ddlDeptId.SelectedItem.Value);
                objEmp.DeptName = txtName.Text;
                objEmp.Abbreviation = txtAbbreviation.Text;
                objEmp.DeptInChargeId = Convert.ToInt32(ddlInChargeId.SelectedValue);
                objEmp.Description = txtDesc.Text;
                objEmp.UpdateDeptMaster();
                lblMsg.Text = "Record Updated successfully..";
                
                ddlDeptId.SelectedIndex = 0;
            }
        }

        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedIndex == 0)
        {
            ClearData();
            txtName.Focus();
            lblMsg.Text = "";
        }
        else
        {
            ClearData();
            ddlDeptId.SelectedIndex = 0;
            lblMsg.Text = "";
        }
    }
    protected void btnCloseGrid_Click(object sender, EventArgs e)
    {
        try
        {
            lblMsg.Text = "";
            grdAllDepts.Visible = false;
            btnCloseGrid.Visible = false;
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    
    protected void grdAllDepts_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            DataSet ds=(DataSet) ViewState["Data"];
            if (ds.Tables[0].Rows.Count != 0)
            {
                grdAllDepts.PageIndex = e.NewPageIndex;
                grdAllDepts.DataSource = ds.Tables[0];
                grdAllDepts.DataBind();
                grdAllDepts.Visible = true;
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
