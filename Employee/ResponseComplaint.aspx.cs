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
using System.Runtime.InteropServices;
using System.IO;
using Microsoft.VisualBasic.Devices;
using Microsoft.VisualBasic;

public partial class Employee_ResponseComplaint : System.Web.UI.Page
{
    clsCustomerComplaints objComplaint = new clsCustomerComplaints();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            lblMsg.Text = "";
            if (!IsPostBack)
            {
                if (Session["Emp_Cus_Id"] != null)
                {
                    binData();
                }
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }


    void binData()
    {
        try
        {
            SqlConnection cn = new SqlConnection(Connection.con);
            SqlCommand cmd = new SqlCommand("select * from tbl_CustomerComplaintsRegistration where ComplaintRegistrationId=@id", cn);
            cmd.Parameters.Add("@id", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["id"]);
            cn.Open();
            SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.Default);
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    if (reader["TextFile"].ToString() != "No voicefile")
                    {
                        ViewState["voicefileName"] = reader["TextFile"].ToString();
                        ViewState["voicefile"] = (byte[])reader["VoiceTextOfComplaint"];
                    }
                    else
                        btnPlay.Text = "Vioce file not attached..";
                }
            }
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
                string path = "c:\\evrec.wav";
                mciSendString("save recsound " + path, "", 0, 0);
                mciSendString("close recsound ", "", 0, 0);
                Computer c = new Computer();
                c.Audio.Stop();
                fileName = "evrec.wav";
                fileContent = ConvertData(path);
            }
            else if (i == 2)
            {
                string path = "c:\\evrec.wav";
                fileName = "evrec.wav";
                fileContent = ConvertData(path);
            }
            else
            {
                string str = "";
                System.Text.ASCIIEncoding encoding = new System.Text.ASCIIEncoding();
                fileContent = encoding.GetBytes(str);
                fileName = "No voicefile";
            }
            objComplaint.ComplaintRegistrationId = Convert.ToInt32(Request.QueryString["id"]);
            objComplaint.EmpId = Convert.ToInt32(Session["Emp_Cus_Id"]);
            objComplaint.Status = txtStatus.Text;
            objComplaint.EscalatedStatus = txtEscalatedStatus.Text;
            objComplaint.Count = Convert.ToInt32(txtCount.Text);
            objComplaint.ResponseText = txtComplaintResponse.Text;
            objComplaint.Severity = txtSeverity.Text;
            objComplaint.ResponseVoice = fileContent;
            objComplaint.VoiceFile = fileName;
            objComplaint.InsertCustomerComplaintsResponse();
            ClearData();
            lblMsg.Text = "Response As Send..";
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
            txtStatus.Text = "";
            txtEscalatedStatus.Text = "";
            txtCount.Text = "";
            txtComplaintResponse.Text = "";
            txtSeverity.Text = "";
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("ReceiveComplaint.aspx");
        }
        catch (Exception ex)
        {
            lblMsg.Text = "";
        }
    }
    
    //protected void btnPlay_Click(object sender, EventArgs e)
    //{
    //    if (btnPlay.Text != "Vioce file not attached..")
    //    {
    //        if (ViewState["voicefileName"].ToString() != "No voicefile")
    //        {
    //            string strCmd = "select * from tbl_CustomerComplaintsRegistration where ComplaintRegistrationId=" + Convert.ToInt32(Request.QueryString["id"]);
    //            DataSet ds = SqlHelper.ExecuteDataset(Connection.con, CommandType.Text, strCmd);
    //            if (ds.Tables[0].Rows.Count != 0)
    //            {
    //                datalistaudio.DataSource = ds.Tables[0];
    //                datalistaudio.DataBind();
    //            }
    //        }
    //        else
    //            lblMsg.Text = "No voice file from this customer...";
    //    }
    //}

    static int i = 0;
    [DllImport("winmm.dll", EntryPoint = "mciSendStringA", CharSet = CharSet.Ansi, SetLastError = true, ExactSpelling = true)]
    private static extern int mciSendString(string lpstrCommand, string lpstrReturnString, int uReturnLength, int hwndCallback);

    protected void btnResponce_Click(object sender, EventArgs e)
    {
        mciSendString("open new Type waveaudio Alias recsound", "", 0, 0);
        mciSendString("record recsound", "", 0, 0);
        i = 1;
    }
    static string fileName = "";
    static byte[] fileContent;
    protected void btnPlay_Click(object sender, EventArgs e)
    {
        if (i == 1)
        {
            string path = "c:\\evrec.wav";
            mciSendString("save recsound " + path, "", 0, 0);
            mciSendString("close recsound ", "", 0, 0);
            Computer c = new Computer();
            c.Audio.Stop();
            c.Audio.Play(path, AudioPlayMode.Background);
            i = 2;
        }
    }
}
