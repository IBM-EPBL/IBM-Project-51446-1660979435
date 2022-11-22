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

public partial class Admin_FeedbackEvaluation : System.Web.UI.Page
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
                ddlEmpId.Items.Clear();
                ddlFeedBackId.Items.Clear();
                ddlEmpId.Enabled = true;
                ddlFeedBackId.Enabled = true;
                btnSubmit.Text = "Submit new record";
                btnSubmit.Enabled = true;
                BindEmpIds();
                BindFeedBackIds();
                if (ddlFeedBackEvaluationId.Items.Count != 0)
                    ddlFeedBackEvaluationId.SelectedIndex = 0;
                if (ddlEmpId.Items.Count != 0)
                    ddlEmpId.SelectedIndex = 0;
                if (ddlFeedBackId.Items.Count != 0)
                    ddlFeedBackId.SelectedIndex = 0;
                ddlFeedBackEvaluationId.Enabled = false;

            }
            else if (RadioButtonList1.SelectedIndex == 1)
            {
                ddlEmpId.Items.Clear();
                ddlFeedBackId.Items.Clear();
                grdAllFeedBackEvaluation.Visible = false;
                btnCloseGrid.Visible = false;
                ClearData();
                BindFeedBackEvaluationIds();
                btnSubmit.Text = "Modify record";
                btnSubmit.Enabled = true;
                ddlFeedBackEvaluationId.Enabled = true;
                ddlEmpId.Enabled = false;
                ddlFeedBackId.Enabled = false;
            }
            
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }

    }
    protected void ddlFeedBackEvaluationId_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (ddlFeedBackEvaluationId.SelectedIndex != 0)
            {
                grdAllFeedBackEvaluation.Visible = false;
                btnCloseGrid.Enabled = false;
                objCustomer.FeedBackEvaluationId = Convert.ToInt32(ddlFeedBackEvaluationId.SelectedItem.Value);
                DataSet ds = objCustomer.GetFeedBackEvaluationDataByFeedBackEvaluationId();
                DataRow dr = ds.Tables[0].Rows[0];
                if (ds.Tables[0].Rows.Count != 0)
                {
                    txtFeedBackEvaluationDate.Text = dr[1].ToString();
                    ddlEmpId.Items.Add(dr[2].ToString());
                    ddlFeedBackId.Items.Add(dr[3].ToString());
                    txtEvaluationText.Text = dr[4].ToString();

                    if (Session["FileContent"] == null || Session["FileName"] == null)
                    {
                        ViewState["FileContent"] = (byte[])dr[5];
                        ViewState["FileName"] = (string)dr[6];
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
            ClearData();
            btnCloseGrid.Enabled = true;
            if (ddlFeedBackEvaluationId.Items.Count != 0)
                ddlFeedBackEvaluationId.SelectedIndex = 0;
            DataSet ds = objCustomer.ShowFeedBackEvaluation();
            ViewState["Data"] = ds;
            if (ds.Tables[0].Rows.Count != 0)
            {
                grdAllFeedBackEvaluation.DataSource = ds.Tables[0];
                grdAllFeedBackEvaluation.DataBind();
                grdAllFeedBackEvaluation.Visible = true;
                btnCloseGrid.Visible = true;
                
            }
            else
            {
                grdAllFeedBackEvaluation.EmptyDataText = "No Records Found..";
                grdAllFeedBackEvaluation.DataBind();
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }

    public void ClearData()
    {
        txtFeedBackEvaluationDate.Text = "";
        txtEvaluationText.Text = "";
    }
    public void BindEmpIds()
    {
        try
        {
            DataSet ds = objCustomer.GetAllDomainInchargeIds();
            if (ds.Tables[0].Rows.Count != 0)
            {
                ddlEmpId.DataSource = ds.Tables[0];
                ddlEmpId.DataTextField = "Emp_FirstName";
                ddlEmpId.DataValueField = "EmpId";
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
    public void BindFeedBackEvaluationIds()
    {
        try
        {
            DataSet ds = objCustomer.GetAllFeedBackEvaluationIds();
            if (ds.Tables[0].Rows.Count != 0)
            {
                ddlFeedBackEvaluationId.DataSource = ds.Tables[0];
                ddlFeedBackEvaluationId.DataTextField = "FeedBackEvaluationId";
                ddlFeedBackEvaluationId.DataValueField = "FeedBackEvaluationId";
                ddlFeedBackEvaluationId.DataBind();
                ddlFeedBackEvaluationId.Items.Insert(0, "--Select One--");
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
                objCustomer.FeedBackEvaluationDate  = txtFeedBackEvaluationDate.Text;
                objCustomer.EmpInchargeId = Convert.ToInt32(ddlEmpId.SelectedItem.Value);
                objCustomer.FeedBackId = Convert.ToInt32(ddlFeedBackId.SelectedItem.Value);
                objCustomer.EvaluationText  = txtEvaluationText.Text;
                objCustomer.EvaluationLinkFile = (byte[])Session["FileContent"];
                objCustomer.LinkFile = Session["FileName"].ToString();
                objCustomer.InsertFeedBackEvaluation();
                lblMsg.Text = "Record Inserted successfully..";
            }

            else if (RadioButtonList1.SelectedIndex == 1 && btnSubmit.Text == "Modify record")
            {
                objCustomer.FeedBackEvaluationId  = Convert.ToInt32(ddlFeedBackEvaluationId.SelectedItem.Value);
                objCustomer.FeedBackEvaluationDate = txtFeedBackEvaluationDate.Text;
                objCustomer.EvaluationText = txtEvaluationText.Text;
                if (Session["FileContent"] != null || Session["FileName"] != null)
                {
                    objCustomer.EvaluationLinkFile = (byte[])Session["FileContent"];
                    objCustomer.LinkFile = Session["FileName"].ToString();
                }
                else
                {
                    objCustomer.EvaluationLinkFile = (byte[])ViewState["FileContent"];
                    objCustomer.LinkFile = ViewState["FileName"].ToString();
                }
              
                objCustomer.UpdateFeedBackEvaluation();
                lblMsg.Text = "Record Updated successfully..";

                ddlFeedBackEvaluationId.SelectedIndex = 0;
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
                ddlEmpId.Items.Clear();
                ddlFeedBackId.Items.Clear();
            }
            else
            {
                ClearData();
                ddlFeedBackEvaluationId.SelectedIndex = 0;
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
            grdAllFeedBackEvaluation.Visible = false;
            btnCloseGrid.Visible = false;
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void grdAllFeedBackEvaluation_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            DataSet ds = (DataSet)ViewState["Data"];
            if (ds.Tables[0].Rows.Count != 0)
            {
                grdAllFeedBackEvaluation.PageIndex = e.NewPageIndex;
                grdAllFeedBackEvaluation.DataSource = ds.Tables[0];
                grdAllFeedBackEvaluation.DataBind();
                grdAllFeedBackEvaluation.Visible = true;
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
    protected void grdAllFeedBackEvaluation_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
                objCustomer.FeedBackEvaluationId = Convert.ToInt32(e.CommandArgument);
                DataSet ds = objCustomer.GetFeedBackEvaluationDataByFeedBackEvaluationId();
                byte[] FileContent = (byte[])ds.Tables[0].Rows[0][5];
                string FileName = (string)ds.Tables[0].Rows[0][6];
                string[] fileSplit = FileName.Split('.');
                int Loc = fileSplit.Length;
                string FileExtention = "." + fileSplit[Loc - 1].ToUpper();

                int i = 0;
                if (FileExtention == ".DOC" || FileExtention == ".DOCX")
                {
                    Response.ContentType = "application/vnd.ms-word";
                    Response.AddHeader("content-disposition", "inline;filename=" + FileName);
                    i = 1;
                }
                else if (FileExtention == ".XL" || FileExtention == ".XLS" || FileExtention == ".XLSX")
                {
                    Response.ContentType = "application/vnd.ms-excel";
                    Response.AddHeader("content-disposition", "inline;filename=" + FileName);
                    i = 1;
                }
                else if (FileExtention == ".PDF")
                {
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-disposition", "inline;filename=" + FileName);
                    i = 1;
                }
                else if (FileExtention == ".TXT")
                {
                    Response.ContentType = "application/octet-stream";
                    Response.AddHeader("content-disposition", "inline;filename=" + FileName);
                    i = 1;
                }
                else if (FileExtention == ".WMV")
                {
                    Response.ContentType = "application/wmv";
                    Response.AddHeader("content-disposition", "inline;filename=" + FileName);
                    i = 1;
                }
                if (i == 1)
                {
                    Response.Charset = "";
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.BinaryWrite(FileContent);
                    Response.End();
                }
                else
                    lblMsg.Text = "Problem in downloading the file..";
            }
        
        
        catch (Exception ex)
        {

            lblMsg.Text = ex.Message;
        }
    }
}
