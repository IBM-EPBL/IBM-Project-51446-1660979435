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

public partial class Customers_frmCustomerChatRoom : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            GetOnlineCustomerInfo();
            GetOnlineEmployeeInfo();
        }
    }

    #region Web Form Designer generated code

    override protected void OnInit(EventArgs e)
    {
        //
        // CODEGEN: This call is required by the ASP.NET Web Form Designer.
        //
        InitializeComponent();
        base.OnInit(e);
    }

    /// <summary>
    /// Required method for Designer support - do not modify
    /// the contents of this method with the code editor.
    /// </summary>
    /// 

    private void InitializeComponent()
    {

    }
    #endregion

    protected void BT_Send_Click(object sender, System.EventArgs e)
    {
        string sChannel = "1";
        string sUser = Session["UserName"].ToString() + "( " + Session["UserType"].ToString() + " )";
                
        if (TB_ToSend.Text.Length > 0)
        {
            Chat.AddMessage(sChannel,sUser,TB_ToSend.Text);
            TB_ToSend.Text = "";
        }
    }
    void GetOnlineCustomerInfo()
    {
        try
        {

            DataSet ds = clsLogin.GetOnlineCustomerData();
            if (ds.Tables[0].Rows.Count != 0)
            {
                grdCustomer.DataSource = ds.Tables[0];
                grdCustomer.DataBind();
            }
            else
            {
                grdCustomer.EmptyDataText = "No Customer is Online";
                grdCustomer.DataBind();
            }

        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
            
        }
    }

    void GetOnlineEmployeeInfo()
    {
        try
        {
            DataSet ds = clsLogin.GetOnlineEmployeeData();
            if (ds.Tables[0].Rows.Count != 0)
            {
                grdEmployee.DataSource = ds.Tables[0];
                grdEmployee.DataBind();
            }
            else
            {
                grdEmployee.EmptyDataText = "No Employee is Online";
                grdEmployee.DataBind();
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }

    

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        try
        {
            GetOnlineCustomerInfo();
            GetOnlineEmployeeInfo();
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
}
