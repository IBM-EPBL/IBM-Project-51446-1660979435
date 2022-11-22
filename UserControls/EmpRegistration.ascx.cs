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
using System.Data.SqlClient;
using CustomerDesk.DAL;

public partial class UserControls_EmpRegistration : System.Web.UI.UserControl
{
    #region private variables
    private string _HeaderText;
    byte[] imageData = null;
    private string _strTableName;
    private string _strConnection;
    string _strCon;




    SqlCommand cmd;
    SqlConnection cn;
    SqlDataReader dr;
    SqlParameter p;
    int i;
    private string _strColName;
    #endregion
    #region Public properties


    public string GetCon()
    {
        if (!String.IsNullOrEmpty(this._strConnection))
            _strCon = ConfigurationManager.ConnectionStrings[_strConnection].ConnectionString;
        else
            _strCon = "Connection Not Established";
        return _strCon;
    }

    public string ConnectionName
    {
        get { return _strConnection; }
        set { _strConnection = value; }
    }
    public string HeaderText
    {
        get { return _HeaderText; }
        set { _HeaderText = value; }
    }

    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        try
        {
            if (!IsPostBack)
            {
                GetDepartments();
                GetDesignation();
                GetSupEmployee();
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }

    }

    
    #region insert registration Data into Database

    private void InsertEmpDetails()
    {
        try
        {
            cn = new SqlConnection(GetCon());
            cn.Open();
            cmd = new SqlCommand("sp_InsertEmpDetails", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@FirstName", Convert.ToString(txtFName.Text.Trim()));
            cmd.Parameters.AddWithValue("@MiddleName", Convert.ToString(txtMidName.Text.Trim()));
            cmd.Parameters.AddWithValue("@LastName", Convert.ToString(txtLastName.Text.Trim()));
            cmd.Parameters.AddWithValue("@EmpDob", Convert.ToString(txtDob.Text));
            cmd.Parameters.AddWithValue("@EmpDoj", Convert.ToString(txtDOJ.Text));
            cmd.Parameters.AddWithValue("@Address", Convert.ToString(txtAddress.Text.Trim()));
            cmd.Parameters.AddWithValue("@Email", Convert.ToString(txtEmail.Text.Trim()));
            cmd.Parameters.AddWithValue("@Phone", Convert.ToString(txtPhone.Text.Trim()));

            if (Session["Photo"] != null && Session["FileName"] != null)
            {
                cmd.Parameters.AddWithValue("@EmpPhoto", (byte[])Session["Photo"]);
                cmd.Parameters.AddWithValue("@EmpPhotoFileName", Convert.ToString(Session["FileName"].ToString()));
            }

            cmd.Parameters.AddWithValue("@EmpDeptId", Convert.ToInt32(ddlDept.SelectedValue.Trim()));
            cmd.Parameters.AddWithValue("@EmpDesgId", Convert.ToInt32(ddlDesg.SelectedValue.Trim()));
            cmd.Parameters.AddWithValue("@SupEmp", Convert.ToInt32(ddlSupEmp.SelectedValue.Trim()));
            cmd.Parameters.AddWithValue("@UserName", Convert.ToString(txtUserName.Text.Trim()));
            cmd.Parameters.AddWithValue("@Password", Convert.ToString(txtPassword.Text.Trim()));
            cmd.Parameters.Add("@Flag", SqlDbType.Int).Direction = ParameterDirection.Output;
            cmd.ExecuteNonQuery();

            lblMsg.Text = "You Registered Successfully.Thanks For Registration!";
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
        finally
        {
            cn.Close();
        }
    }

    #endregion

    protected void btnSubmit_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            InsertEmpDetails();
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }

    #region binding data on pageload
    clsEmployee  objEmp;

    private void GetDepartments()
    {
        objEmp = new clsEmployee();
        DataSet ds = objEmp.GetDeptID();
        ddlDept.DataSource = ds.Tables[0];
        ddlDept.DataTextField = "DeptName";
        ddlDept.DataValueField = "DepartmentId";
        ddlDept.DataBind();
        ddlDept.Items.Insert(0, "--Select One--");
    }

    private void GetDesignation()
    {
        objEmp = new clsEmployee();
        DataSet ds = objEmp.GetDesignation();
        Cache["DesgData"] = ds;
        ddlDesg.DataSource = ds.Tables[0];
        ddlDesg.DataTextField = "Desg_Name";
        ddlDesg.DataValueField = "DesignationId";
        ddlDesg.DataBind();
        ddlDesg.Items.Insert(0, "--Select One--");
    }
    private void GetSupEmployee()
    {
        objEmp = new clsEmployee();
        DataSet ds = objEmp.GetSuperiorEmpId();
        ddlSupEmp.DataSource = ds.Tables[0];
        ddlSupEmp.DataTextField = "Emp_FirstName";
        ddlSupEmp.DataValueField = "EmpId";
        ddlSupEmp.DataBind();
        ddlSupEmp.Items.Insert(0, "--Select One--");

    }


    #endregion
    protected void ddlDesg_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void ddlDept_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

}
