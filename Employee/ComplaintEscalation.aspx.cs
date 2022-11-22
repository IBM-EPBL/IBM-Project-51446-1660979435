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

public partial class Employee_ComplaintEscalation : System.Web.UI.Page
{
    clsCustomerComplaints objComplaint = new clsCustomerComplaints();
    clsCustomer objCustomer = new clsCustomer();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        btnCloseGrid.Visible = false;
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
                ddlComplaintRegistrationId.Items.Clear();
                ddlEmpId.Items.Clear();
                ddlComplaintRegistrationId.Enabled = true;
                ddlHrs.Visible = true;
                ddlMins.Visible = true;
                ddlAm.Visible = true;
                ddlEmpId.Enabled = true;
                btnSubmit.Text = "Submit new record";
                btnSubmit.Enabled = true;
                BindComplaintRegistrationIds();
                BindEmpIds();
                if (ddlComplaintRegistrationId.Items.Count != 0)
                    ddlComplaintRegistrationId.SelectedIndex = 0;
                if (ddlEmpId.Items.Count != 0)
                    ddlEmpId.SelectedIndex = 0;
                ddlComplaintEscalationId.Enabled = false;
                txtEscalationTime.Visible = false;

            }
            else if (RadioButtonList1.SelectedIndex == 1)
            {
                ddlComplaintRegistrationId.Items.Clear();
                ddlEmpId.Items.Clear();
                grdAllComplaintEscalation.Visible = false;
                btnCloseGrid.Visible = false;
                ClearData();
                BindComplaintEscalationIds();
                btnSubmit.Text = "Modify record";
                btnSubmit.Enabled = true;
                ddlComplaintEscalationId.Enabled = true;
                txtEscalationTime.Visible = true;
                ddlComplaintRegistrationId.Enabled = false;
                ddlEmpId.Enabled = false;
                ddlHrs.Visible = false;
                ddlMins.Visible = false;
                ddlAm.Visible = false;
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void ddlComplaintEscalationId_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (ddlComplaintRegistrationId.SelectedIndex != 0)
            {
                grdAllComplaintEscalation.Visible = false;
                btnCloseGrid.Enabled = false;
                objComplaint.ComplaintEscalationId = Convert.ToInt32(ddlComplaintEscalationId.SelectedItem.Value);
                DataSet ds = objComplaint.GetComplaintEscalationDataByComplaintEscalationId();
                DataRow dr = ds.Tables[0].Rows[0];
                if (ds.Tables[0].Rows.Count != 0)
                {
                    txtEscalationDate.Text = dr[1].ToString();
                    txtEscalationTime.Text = dr[2].ToString();
                    ddlComplaintRegistrationId.Items.Add(dr[3].ToString());
                    ddlEmpId.Items.Add(dr[4].ToString());
                    txtEscalationText.Text = dr[5].ToString();
                    txtPhoneNo.Text = dr[6].ToString();
                    if (Session["FileContent"] == null || Session["FileName"] == null)
                    {
                        ViewState["FileContent"] = (byte[])dr[7];
                        ViewState["FileName"] = (string)dr[8];
                    }
                    txtResponseText.Text = dr[9].ToString();
                    if (Session["FileContent"] == null || Session["FileName"] == null)
                    {
                        ViewState["FileContent"] = (byte[])dr[10];
                        ViewState["FileName"] = (string)dr[11];
                    }
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
            divEscalation.Visible = true;
            ClearData();
            btnCloseGrid.Enabled = true;
            if (ddlComplaintEscalationId.Items.Count != 0)
                ddlComplaintEscalationId.SelectedIndex = 0;
            DataSet ds = objComplaint.GetAllComplaintEscalationData();
            ViewState["Data"] = ds;
            if (ds.Tables[0].Rows.Count != 0)
            {
                grdAllComplaintEscalation.DataSource = ds.Tables[0];
                grdAllComplaintEscalation.DataBind();
                grdAllComplaintEscalation.Visible = true;
                btnCloseGrid.Visible = true;
            }
            else
            {
                grdAllComplaintEscalation.EmptyDataText = "No Records Found..";
                grdAllComplaintEscalation.DataBind();
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }

    public void ClearData()
    {
        txtEscalationDate.Text = "";
        txtEscalationTime.Text = "";
        txtEscalationText.Text = "";
        txtPhoneNo.Text = "";
        txtResponseText.Text = "";

    }
    public void BindComplaintRegistrationIds()
    {
        try
        {
            DataSet ds = objComplaint.GetAllComplaintRegistrationIds();
            if (ds.Tables[0].Rows.Count != 0)
            {
                ddlComplaintRegistrationId.DataSource = ds.Tables[0];
                ddlComplaintRegistrationId.DataValueField = "ComplaintRegistrationId";
                ddlComplaintRegistrationId.DataTextField = "ComplaintRegistrationId";
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
    public void BindEmpIds()
    {
        try
        {
            DataSet ds = objComplaint.ShowComplaints();
            if (ds.Tables[0].Rows.Count != 0)
            {
                ddlEmpId.DataSource = ds.Tables[0];
                ddlEmpId.DataValueField = "EmpId";
                ddlEmpId.DataTextField = "Emp_FirstName";
                ddlEmpId.DataBind();
                ddlEmpId.Items.Insert(0, "--Select One--");
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
    public void BindComplaintEscalationIds()
    {
        try
        {
            DataSet ds = objComplaint.GetAllComplaintEscalationIds();
            if (ds.Tables[0].Rows.Count != 0)
            {
                ddlComplaintEscalationId.DataSource = ds.Tables[0];
                ddlComplaintEscalationId.DataValueField = "ComplaintEscalationId";
                ddlComplaintEscalationId.DataTextField = "ComplaintEscalationId";
                ddlComplaintEscalationId.DataBind();
                ddlComplaintEscalationId.Items.Insert(0, "--Select One--");
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
                objComplaint.EscalationDate  = txtEscalationDate.Text;
                string escalationTime = ddlHrs.SelectedItem.Value + ":" + ddlMins.SelectedItem.Value + ":" + ddlAm.SelectedItem.Value;
                objComplaint.EscalationTime = escalationTime.ToString();
                objComplaint.ComplaintRegistrationId  = Convert.ToInt32(ddlComplaintRegistrationId .SelectedItem.Value);
                objComplaint.EmpId  = Convert.ToInt32(ddlEmpId.SelectedItem.Value);
                objComplaint.EscalationText  = txtEscalationText.Text;
                objComplaint.PhoneNo = txtPhoneNo.Text;
                if (Session["FileContent"] != null & Session["FileName"] != null)
                {
                    objComplaint.VoiceText = (byte[])Session["FileContent"];
                    objComplaint.TextFile = Session["FileName"].ToString();
                }
                else
                {
                    System.Text.ASCIIEncoding encoding = new System.Text.ASCIIEncoding();
                    byte[] data = encoding.GetBytes(s);
                    objComplaint.ResponseVoice = data;
                    objComplaint.VoiceFile = "No Files";
                }
                objComplaint.ResponseText = txtResponseText.Text;
                if (Session["FileContent"] != null & Session["FileName"] != null)
                {
                    objComplaint.ResponseVoice = (byte[])Session["FileContent"];
                    objComplaint.VoiceFile = Session["FileName"].ToString();
                }
                else
                {
                    System.Text.ASCIIEncoding encoding = new System.Text.ASCIIEncoding();
                    byte[] data = encoding.GetBytes(s);
                    objComplaint.ResponseVoice = data;
                    objComplaint.VoiceFile = "No Files";
                }

                objComplaint.InsertComplaintEscalation();
                lblMsg.Text = "Record Inserted successfully..";
            }
            else
                if (RadioButtonList1.SelectedIndex == 1 && btnSubmit.Text == "Modify record")
                {
                    objComplaint.ComplaintEscalationId = Convert.ToInt32(ddlComplaintEscalationId.SelectedItem.Value);
                    objComplaint.EscalationDate = txtEscalationDate.Text;
                    objComplaint.EscalationTime = txtEscalationTime.Text;
                    objComplaint.EscalationText = txtEscalationText.Text;
                    objComplaint.PhoneNo = txtPhoneNo.Text;
                    if (Session["FileContent"] != null || Session["FileName"] != null)
                    {
                        objComplaint.VoiceText = (byte[])Session["FileContent"];
                        objComplaint.TextFile = Session["FileName"].ToString();
                    }
                    else
                    {
                        objComplaint.VoiceText = (byte[])ViewState["FileContent"];
                        objComplaint.TextFile = ViewState["FileName"].ToString();
                    }

                    //objComplaint.VoiceText = (byte[])Session["FileContent"];
                   // objComplaint.TextFile = Session["FileName"].ToString();
                    objComplaint.ResponseText = txtResponseText.Text;
                    if (Session["FileContent"] != null || Session["FileName"] != null)
                    {
                        objComplaint.ResponseVoice = (byte[])Session["FileContent"];
                        objComplaint.VoiceFile = Session["FileName"].ToString();
                    }
                    else
                    {
                        objComplaint.ResponseVoice = (byte[])ViewState["FileContent"];
                        objComplaint.VoiceFile = ViewState["FileName"].ToString();
                    }
                    //objComplaint.ResponseVoice = (byte[])Session["FileContent"];
                    //objComplaint.VoiceFile = Session["FileName"].ToString();
                    objComplaint.UpdateComplaintEscalation();
                    lblMsg.Text = "Record Updated Successfully";
                    ddlComplaintEscalationId.SelectedIndex = 0;
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
                ddlComplaintRegistrationId.Items.Clear();
                ddlEmpId.Items.Clear();
            }
            else
            {
                ClearData();
                ddlComplaintEscalationId.SelectedIndex = 0;
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
            grdAllComplaintEscalation.Visible = false;
            btnCloseGrid.Visible = false;
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void grdAllComplaintEscalation_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            DataSet ds = (DataSet)ViewState["Data"];
            if (ds.Tables[0].Rows.Count != 0)
            {
                grdAllComplaintEscalation.PageIndex = e.NewPageIndex;
                grdAllComplaintEscalation.DataSource = ds.Tables[0];
                grdAllComplaintEscalation.DataBind();
                grdAllComplaintEscalation.Visible = true;
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
