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
using CustomerDesk.DAL;




public partial class Recording : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [DllImport("winmm.dll", EntryPoint = "mciSendStringA", CharSet = CharSet.Ansi, SetLastError = true, ExactSpelling = true)]
    private static extern int mciSendString(string lpstrCommand, string lpstrReturnString, int uReturnLength, int hwndCallback);
    
    protected void Button3_Click(object sender, EventArgs e)
    {
        Computer computer = new Computer();
        // string path = Server.MapPath("record.wav");
        //string path = Server.MapPath("~/song/g.wav");
        string path = "c:\\record.wav";
        computer.Audio.Play(path, AudioPlayMode.Background);
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        mciSendString("open new Type waveaudio Alias recsound", "", 0, 0);
        mciSendString("record recsound", "", 0, 0);
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        //string path = Server.MapPath("~/song/g.wav");
        string path = "c:\\record.wav";
        mciSendString("save recsound " + path, "", 0, 0);
        mciSendString("close recsound ", "", 0, 0); 
        Computer c = new Computer();
        c.Audio.Stop();
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
       
        string fileName = "g.wav";
        byte[] fileContent = ConvertData(Server.MapPath("~/song/g.wav"));
        string strCmd = "sp_InsertData";
        SqlParameter[] p = new SqlParameter[2];
        p[0] = new SqlParameter("@FileName", SqlDbType.VarChar);
        p[0].Value = fileName;
        p[1] = new SqlParameter("@FileContent", SqlDbType.VarBinary);
        p[1].Value = fileContent;
        int i=1 ;//= SqlHelper.ExecuteNonQuery(Connection.con, CommandType.StoredProcedure, strCmd, p);
        if (i > 0)
        {
            Response.Write("inserted");
        }
        else
            Response.Write("not inserted");
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
    

    public static string GetTempFolderName()
    {
        string strTempFolderName = Environment.GetFolderPath(Environment.SpecialFolder.InternetCache) + @"\";

        if (Directory.Exists(strTempFolderName))
        {
            return strTempFolderName;
        }
        else
        {
            Directory.CreateDirectory(strTempFolderName);
            return strTempFolderName;
        }
    }
    

    public string LoadFileContent(byte[] FileContent, string FileName)
    {
        string strFileName = null;
        if (FileContent != null && FileContent.Length > 1)
        {
            System.Drawing.Image newImage;
            

            //get the temporary internet folder path of the system to store the image file
            //strFileName = clsUtilities.GetTempFolderName() + FileName;    //PhotoExtension;

            //write the binary data to memory stream 
            using (MemoryStream stream = new MemoryStream(FileContent))
            {
                newImage = System.Drawing.Image.FromStream(stream);
                //save the image file to temporary folder
                newImage.Save(strFileName);
            }
        }
        return strFileName;
    }
}
