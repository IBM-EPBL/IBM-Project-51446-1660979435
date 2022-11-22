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

public partial class Admin_frmReportEmployee : System.Web.UI.Page
{
    clsEmployee objEmp = new clsEmployee();
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    

    protected void BtnWord_Click(object sender, EventArgs e)
    {
        try
        {
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }

    }
    protected void BtnExcel_Click(object sender, EventArgs e)
    {
        try
        {
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }

    }
   
}
