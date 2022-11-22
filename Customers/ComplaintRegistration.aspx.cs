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

using Microsoft.VisualBasic;
using Microsoft.VisualBasic.Devices;
using System.Runtime.InteropServices;
using System.Data.SqlClient;
using System.IO;

public partial class Customers_ComplaintRegistration : System.Web.UI.Page
{
    clsCustomerComplaints objComplaint = new clsCustomerComplaints();
    clsService objService = new clsService();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            lblMsg.Text = "";
            if (!IsPostBack)
            {
                if (Session["Emp_Cus_Id"] != null)
                {
                }
                PopulateCombos();
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    public void PopulateCombos()
    {
        try
        {
                ddlServiceCustomerDomainId.DataSource = objService.GetAllServiceCustomerDomainIds();
                ddlServiceCustomerDomainId.DataValueField = "ServiceCustomerDomainId";
                ddlServiceCustomerDomainId.DataTextField = "ServiceCustomerDomainId";
                ddlServiceCustomerDomainId.DataBind();
                ddlServiceCustomerDomainId.Items.Insert(0, "--Select One--");
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void BtnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            string fileName = "";
            byte[] fileContent;
            if (i == 1)
            {
                string path="c:\\cvrec.wav";
                mciSendString("save recsound " + path, "", 0, 0);
                mciSendString("close recsound ", "", 0, 0);
                Computer c = new Computer();
                c.Audio.Stop();
                fileName = "cvrec.wav";
                fileContent = ConvertData(path);
            }
            else
            {
                string str = "";
                System.Text.ASCIIEncoding encoding = new System.Text.ASCIIEncoding();
                fileContent = encoding.GetBytes(str);
                fileName = "No voicefile";
            }

            objComplaint.CustomerId = Convert.ToInt32(Session["Emp_Cus_Id"]);
            objComplaint.ServiceCustomerDomainId = Convert.ToInt32(ddlServiceCustomerDomainId.SelectedItem.Value);
            objComplaint.PhoneNo = txtPhoneNo.Text;
            if (txtComplaint.Text != "")
                objComplaint.TextComplaint = txtComplaint.Text;
            else
                objComplaint.TextComplaint = "";
            objComplaint.VoiceText = fileContent;
            objComplaint.VoiceFile = fileName;
            objComplaint.InsertCustomerComplaintsRegistration();
            ClearData();
            lblMsg.Text = "Your Complient has been submitted...";
            i = 0;
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }

    public byte[] ConvertData(string file)
    {
        FileStream fs = new FileStream(file, FileMode.Open, FileAccess.Read);

        //Create a binary reader object to read the binary contents of the file to upload

        BinaryReader br = new BinaryReader(fs);

        //dump the bytes read into a new byte variable named image

        byte[] Data = br.ReadBytes((int)fs.Length);

        //close the binary reader

        br.Close();

        //close the filestream

        fs.Close();

        return Data;

    }

    public void ClearData()
    {
        try
        {
            ddlServiceCustomerDomainId.SelectedIndex = 0;
            txtPhoneNo.Text = "";
            txtComplaint.Text = "";
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }

    [DllImport("winmm.dll", EntryPoint = "mciSendStringA", CharSet = CharSet.Ansi, SetLastError = true, ExactSpelling = true)]
    private static extern int mciSendString(string lpstrCommand, string lpstrReturnString, int uReturnLength, int hwndCallback);

    static int i = 0;
    
    protected void btnRecord_Click1(object sender, EventArgs e)
    {
        mciSendString("open new Type waveaudio Alias recsound", "", 0, 0);
        mciSendString("record recsound", "", 0, 0);
        i = 1;
    }
}
