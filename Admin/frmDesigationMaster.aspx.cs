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

public partial class Admin_frmDesigationMaster : System.Web.UI.Page
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

            if (RadioButtonList1.SelectedIndex == 0)
            {
                lblMsg.Text = "";
                ClearData();
                txtName.Focus();
                btnSubmit.Text = "Submit new record";
                btnSubmit.Enabled = true;
                ddlDesgId.Enabled = false;
                ddlDesgInChargeId.Enabled = false;
                ddlSuperiorDesgId.Enabled = false;
                if (ddlDesgId.Items.Count != 0)
                    ddlDesgId.SelectedIndex = 0;

            }
            else if (RadioButtonList1.SelectedIndex == 1)
            {
                lblMsg.Text = "";
                grdAllDesignations.Visible = false;
                btnCloseGrid.Visible = false;
                ClearData();
                btnSubmit.Text = "Modify record";
                btnSubmit.Enabled = true;
                BindDesignationIds();
                ddlDesgId.Enabled = true;
                ddlDesgInChargeId.Enabled = true;
                ddlSuperiorDesgId.Enabled = true;
                if (ddlDesgId.Items.Count != 0)
                    ddlDesgId.SelectedIndex = 0;
                if (ddlDesgInChargeId.Items.Count != 0)
                    ddlDesgInChargeId.SelectedIndex = 0;
                if (ddlSuperiorDesgId.Items.Count != 0)
                    ddlSuperiorDesgId.SelectedIndex = 0;
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
            if (ddlDesgId.Items.Count != 0)
                ddlDesgId.SelectedIndex = 0;
            if (ddlDesgInChargeId.Items.Count != 0)
                ddlDesgInChargeId.SelectedIndex = 0;
            if (ddlSuperiorDesgId.Items.Count != 0)
                ddlSuperiorDesgId.SelectedIndex = 0;
            DataSet ds = objEmp.GetAllDesgMasterData();
            ViewState["Data"] = ds;
            if (ds.Tables[0].Rows.Count != 0)
            {
                grdAllDesignations.DataSource = ds.Tables[0];
                grdAllDesignations.DataBind();
                grdAllDesignations.Visible = true;
                btnCloseGrid.Visible = true;
            }
            else
            {
                grdAllDesignations.EmptyDataText = "No Records Found..";
                grdAllDesignations.DataBind();
            }
            
        }
        catch (Exception ex)
        {
            
            lblMsg.Text = "Error:Contact System Admin" + ex.Message;
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (RadioButtonList1.SelectedIndex == 0 && btnSubmit.Text == "Submit new record")
            {
                objEmp.DesgName = txtName.Text;
                objEmp.Abbreviation = txtAbbreviation.Text;
                objEmp.Description = txtDesc.Text;
                
                lblMsg.Text = objEmp.InsertDesgMaster();
                lblMsg.Text = "Record Inserted successfully..";
                BindDesignationIds();
                ClearData();
                txtName.Focus();
            }

            else if (RadioButtonList1.SelectedIndex == 1 && btnSubmit.Text == "Modify record")
            {
                objEmp.DesgId = Convert.ToInt32(ddlDesgId.SelectedItem.Value);
                objEmp.DesgName = txtName.Text;
                objEmp.Abbreviation = txtAbbreviation.Text;
                objEmp.DesgInChargeId = Convert.ToInt32(ddlDesgInChargeId.SelectedItem.Value);
                objEmp.SuperiorDesgId = Convert.ToInt32(ddlSuperiorDesgId.SelectedItem.Value);
                objEmp.Description = txtDesc.Text;

                lblMsg.Text = objEmp.UpdateDesgMaster();
                lblMsg.Text = "Record Updated successfully..";
                ClearData();
                ddlDesgId.SelectedIndex = 0;
                ddlDesgInChargeId.SelectedIndex = 0;
                ddlSuperiorDesgId.SelectedIndex = 0;
            }

        }

        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }

    void ClearData()
    {
        txtName.Text = "";
        txtAbbreviation.Text = "";
        txtDesc.Text = "";
    

    }
    void BindDesignationIds()
    {
        try
        {
           
            DataSet ds = objEmp.GetAllDesgIds();
            if (ds.Tables[0].Rows.Count != 0)
            {
                ddlDesgId.DataSource = ds.Tables[0];
                ddlDesgId.DataValueField = "DesignationId";
                ddlDesgId.DataTextField = "desg_Name";
                ddlDesgId.DataBind();
                ddlDesgId.Items.Insert(0, "--Select One--");
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
    
    void BindDesgInChargeIds()
    {
        try
        {

            objEmp.DesgId = Convert.ToInt32(ddlDesgId.SelectedValue);
            DataSet ds = objEmp.GetAllDesgInChargeIds();
            if (ds.Tables[0].Rows.Count != 0)
            {
                ddlDesgInChargeId.DataSource = ds.Tables[0];
                ddlDesgInChargeId.DataValueField = "EmpId";
                ddlDesgInChargeId.DataTextField = "Emp_FirstName";
                ddlDesgInChargeId.DataBind();
                ddlDesgInChargeId.Items.Insert(0, "--Select One--");
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
    void BindSuperiorDesgIds()
    {
        try
        {

            DataSet ds = objEmp.GetSuperiorEmpId();
            if (ds.Tables[0].Rows.Count != 0)
            {
                ddlSuperiorDesgId.DataSource = ds.Tables[0];
                ddlSuperiorDesgId.DataValueField = "EmpId";
                ddlSuperiorDesgId.DataTextField = "Emp_FirstName";
                ddlSuperiorDesgId.DataBind();
                ddlSuperiorDesgId.Items.Insert(0, "--Select One--");
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
            ddlDesgId.SelectedIndex = 0;
            lblMsg.Text = "";
        }

    }
    protected void btnCloseGrid_Click(object sender, EventArgs e)
    {
        try
        {
            lblMsg.Text = "";
            grdAllDesignations.Visible = false;
            btnCloseGrid.Visible = false;
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }

    
   
    protected void grdAllDesgination_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            DataSet ds = (DataSet)ViewState["Data"];
            if (ds.Tables[0].Rows.Count != 0)
            {
                grdAllDesignations.PageIndex = e.NewPageIndex;
                grdAllDesignations.DataSource = ds.Tables[0];
                grdAllDesignations.DataBind();
                grdAllDesignations.Visible = true;
                btnCloseGrid.Visible = true;
            }
            else
            {
                lblMsg.Text = "No Data Found..";
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void ddlDesgId_SelectedIndexChanged1(object sender, EventArgs e)
    {
        try
        {
            if (ddlDesgId.SelectedIndex != 0)
            {
                lblMsg.Text = "";

                objEmp.DesgId = Convert.ToInt32(ddlDesgId.SelectedItem.Value);
                DataSet ds = objEmp.GetDesgMasterDataByDesgId();
                BindDesgInChargeIds();
                BindSuperiorDesgIds();
                //DataSet   = ds.Tables[0];
                if (ds.Tables[0].Rows.Count != 0)
                {
                    DataRow dr = ds.Tables[0].Rows[0];
                    txtName.Text = dr["Desg_Name"].ToString();
                    txtAbbreviation.Text = dr["Abbreviation"].ToString();
                    ddlDesgInChargeId.SelectedItem.Text = dr["emp_firstname"].ToString();
                    ddlSuperiorDesgId.SelectedItem.Text = dr["emp_firstname"].ToString();
                    txtDesc.Text = dr["Description"].ToString();
                    


                }
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
}
