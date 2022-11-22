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

public partial class Admin_CustomerFeedBack : System.Web.UI.Page
{
    clsCustomer objCustomer = new clsCustomer();
    clsCustomerComplaints objComplaint = new clsCustomerComplaints();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        btnCloseGrid.Visible =false;
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
                ddlCustomerId.Items.Clear();
                ddlComplaintRegistrationId.Items.Clear();
                ddlCustomerId.Enabled = true;
                ddlComplaintRegistrationId.Enabled = true;
                btnSubmit.Text = "Submit new record";
                btnSubmit.Enabled = true;
                BindCustomerIds();
                BindComplaintRegistrationIds();
                if (ddlFeedBackId.Items.Count != 0)
                    ddlFeedBackId.SelectedIndex = 0;
                if (ddlCustomerId.Items.Count != 0)
                    ddlCustomerId.SelectedIndex = 0;
                if (ddlComplaintRegistrationId.Items.Count != 0)
                    ddlComplaintRegistrationId.SelectedIndex = 0;
                ddlFeedBackId.Enabled = false;
                
            }
            else if (RadioButtonList1.SelectedIndex == 1)
            {
                ddlCustomerId.Items.Clear();
                ddlComplaintRegistrationId.Items.Clear();
                grdAllCustomerFeedBack.Visible = false;
                btnCloseGrid.Visible = false;
                ClearData();
                BindFeedBackIds();
                btnSubmit.Text = "Modify record";
                btnSubmit.Enabled = true;
                ddlFeedBackId.Enabled = true;
                ddlCustomerId.Enabled = false;
                ddlComplaintRegistrationId.Enabled = false;
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
            if (ddlFeedBackId.Items.Count != 0)
                ddlFeedBackId.SelectedIndex = 0;
            DataSet ds = objCustomer.GetAllFeedBackData();
            ViewState["Data"] = ds;
            if (ds.Tables[0].Rows.Count != 0)
            {
                grdAllCustomerFeedBack.DataSource = ds.Tables[0];
                grdAllCustomerFeedBack.DataBind();
                grdAllCustomerFeedBack.Visible = true;
                btnCloseGrid.Visible = true;
            }
            else
            {
                grdAllCustomerFeedBack.EmptyDataText = "No Records Found..";
                grdAllCustomerFeedBack.DataBind();
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }

    public void ClearData()
    {
        txtFeedBackDate.Text = "";
        txtFeedBackText.Text = "";
        txtEmailId.Text = "";
    }
    public void BindCustomerIds()
    {
        try
        {
            DataSet ds = objCustomer.GetAllCustomerIds();
            if (ds.Tables[0].Rows.Count != 0)
            {
                ddlCustomerId.DataSource = ds.Tables[0];
                ddlCustomerId.DataTextField = "CustomerName";
                ddlCustomerId.DataValueField = "CustomerId";
                ddlCustomerId.DataBind();
                ddlCustomerId.Items.Insert(0, "--Select One--");
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
    public void BindComplaintRegistrationIds()
    {
        try
        {
            DataSet ds = objComplaint.GetAllComplaintRegistrationIds();
            if (ds.Tables[0].Rows.Count != 0)
            {
                ddlComplaintRegistrationId.DataSource = ds.Tables[0];
                ddlComplaintRegistrationId.DataTextField = "ComplaintRegistrationId";
                ddlComplaintRegistrationId.DataValueField = "ComplaintRegistrationId";
                ddlComplaintRegistrationId.DataBind();
                ddlComplaintRegistrationId.Items.Insert(0, "--Select One--");
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
    public void BindFeedBackIds()
    {
        try
        {
            DataSet ds = objCustomer.GetAllFeedBackIds();
            if (ds.Tables[0].Rows.Count != 0)
            {
                ddlFeedBackId.DataSource = ds.Tables[0];
                ddlFeedBackId.DataTextField = "FeedBackId";
                ddlFeedBackId.DataValueField = "FeedBackId";
                ddlFeedBackId.DataBind();
                ddlFeedBackId.Items.Insert(0, "--Select One--");
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
            string s = "";
            if (RadioButtonList1.SelectedIndex == 0 && btnSubmit.Text == "Submit new record")
            {
                objCustomer.CustomerId = Convert.ToInt32(ddlCustomerId.SelectedItem.Value);
                objCustomer.FeedBackDate = txtFeedBackDate .Text;
                objCustomer.FeedBackText  = txtFeedBackText.Text;
                objCustomer.EmailId = txtEmailId.Text;
                objCustomer.VoiceFile = (byte[])Session["FileContent"];
                objCustomer.FileName = Session["FileName"].ToString();
                objCustomer.ComplaintRegistrationId  = Convert.ToInt32(ddlComplaintRegistrationId.SelectedItem.Value);
                objCustomer.InsertCustomerFeedBack();
                lblMsg.Text = "Record Inserted successfully..";
            }

            else if (RadioButtonList1.SelectedIndex == 1 && btnSubmit.Text == "Modify record")
            {
                objCustomer.FeedBackId  = Convert.ToInt32(ddlFeedBackId.SelectedItem.Value);
                objCustomer.FeedBackDate = txtFeedBackDate.Text;
                objCustomer.FeedBackText = txtFeedBackText.Text;
                objCustomer.EmailId = txtEmailId.Text;
                if (Session["FileContent"] != null & Session["FileName"] != null)
                {
                    objCustomer.VoiceFile = (byte[])Session["FileContent"];
                    objCustomer.FileName = Session["FileName"].ToString();
                }
                else
                {
                    System.Text.ASCIIEncoding encoding = new System.Text.ASCIIEncoding();
                    byte[] data = encoding.GetBytes(s);
                    objCustomer.VoiceFile = data;
                    objCustomer.FileName = "No Files";
                }
                objCustomer.UpdateCustomerFeedBack();
                lblMsg.Text = "Record Updated successfully..";

                ddlFeedBackId.SelectedIndex = 0;
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
                ddlCustomerId.Items.Clear();
                ddlComplaintRegistrationId.Items.Clear();
            }
            else
            {
                ClearData();
                ddlFeedBackId.SelectedIndex = 0;
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
            grdAllCustomerFeedBack.Visible = false;
            btnCloseGrid.Visible = false;
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void grdAllCustomerFeedBack_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            DataSet ds = (DataSet)ViewState["Data"];
            if (ds.Tables[0].Rows.Count != 0)
            {
                grdAllCustomerFeedBack.PageIndex = e.NewPageIndex;
                grdAllCustomerFeedBack.DataSource = ds.Tables[0];
                grdAllCustomerFeedBack.DataBind();
                grdAllCustomerFeedBack.Visible = true;
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
    protected void ddlFeedBackId_SelectedIndexChanged1(object sender, EventArgs e)
    {
        try
        {
            if (ddlFeedBackId.SelectedIndex != 0)
            {
                grdAllCustomerFeedBack.Visible = false;
                btnCloseGrid.Enabled = false;
                objCustomer.FeedBackId  = Convert.ToInt32(ddlFeedBackId.SelectedItem.Value);
                DataSet ds = objCustomer.GetFeedBackDataByFeedBackId();
                DataRow dr = ds.Tables[0].Rows[0];
                if (ds.Tables[0].Rows.Count != 0)
                {
                    ddlCustomerId.Items.Add(dr[1].ToString());
                    txtFeedBackDate.Text = dr[2].ToString();
                    txtFeedBackText.Text = dr[3].ToString();
                    txtEmailId.Text = dr[4].ToString();
                    if (Session["FileContent"] == null || Session["FileName"] == null)
                    {
                        ViewState["FileContent"] = (byte[])dr[5];
                        ViewState["FileName"] = (string)dr[6];
                    }

                    ddlComplaintRegistrationId.Items.Add(dr[7].ToString());

                }
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
}
