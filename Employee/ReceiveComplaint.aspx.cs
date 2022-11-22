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
using CustomerDesk.DAL;

public partial class Employee_ReceiveComplaint : System.Web.UI.Page
{
    clsCustomerComplaints objComplaint = new clsCustomerComplaints();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        try
        {
            PopulateData();
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }

    public void PopulateData()
    {
        try
        {
            objComplaint.CustomerId = Convert.ToInt32(Session[""]);
            GridView1.DataSource = objComplaint.ShowComplaints();
            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.ToString() == "Play")
            {
                int Id = Convert.ToInt32(e.CommandArgument);
                string strCmd = "select * from tbl_CustomerComplaintsRegistration where ComplaintRegistrationId=" + Id;
                DataSet ds = SqlHelper.ExecuteDataset(Connection.con, CommandType.Text, strCmd);
                if (ds.Tables[0].Rows.Count != 0)
                {
                    string str = ds.Tables[0].Rows[0][9].ToString();
                    if (str != "No voicefile")
                    {
                        datalistaudio.DataSource = ds.Tables[0];
                        datalistaudio.DataBind();
                    }
                    else
                        lblMsg.Text = "No Audio support for this complaint.";
                }
            }
            else if (e.CommandName.ToString() == "Reply")
                Response.Redirect("ResponseComplaint.aspx?id=" + e.CommandArgument.ToString());
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
}
