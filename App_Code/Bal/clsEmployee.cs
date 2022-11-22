using System;
using System.Data;
using System.Configuration;
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

/// <summary>
/// Summary description for clsEmployee
/// </summary>
public class clsEmployee:Connection 
{
	public clsEmployee()
	{
		//
		// TODO: Add constructor logic here
		//
	}
   
    public int DeptId { get; set; }
    public string DeptName { get; set; }
    public string Abbreviation { get; set; }
    public string Description  { get; set; }
    public int DeptInChargeId { get; set; }

    public int DesgId { get; set; }
    public string DesgName { get; set; }
    public int DesgInChargeId { get; set; }
    public int SuperiorDesgId { get; set; }

    public string InsertDeptMaster()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[4];
            p[0] = new SqlParameter("@DeptName", DeptName);
            p[1] = new SqlParameter("@Abbreviation", Abbreviation);
            p[2] = new SqlParameter("@Description", Description);
            p[3] = new SqlParameter("@Message", SqlDbType.VarChar, 250);
            p[3].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "sp_InsertDeptMaster", p);
            return p[3].Value.ToString();
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public string UpdateDeptMaster()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[6];
            p[0] = new SqlParameter("@DeptId", DeptId);
            p[1] = new SqlParameter("@DeptName", DeptName);
            p[2] = new SqlParameter("DeptInChargeId", DeptInChargeId);
            p[3] = new SqlParameter("@Abbreviation", Abbreviation);
            p[4] = new SqlParameter("@Description", Description);
            p[5] = new SqlParameter("@Message", SqlDbType.VarChar, 250);
            p[5].Direction = ParameterDirection.Output;

            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "sp_UpdateDeptMaster", p);
            return p[5].Value.ToString();
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetAllDeptIds()
    {
        try
        {
            string str = "select * from tbl_Department";
            return SqlHelper.ExecuteDataset(con, CommandType.Text, str);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetDeptMasterDataByDeptId()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@DeptId", DeptId);
            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "sp_GetDeptMasterDataByDeptId", p);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    
   public DataSet GetAllDeptInChargeIds()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@DeptId", DeptId);
            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "sp_GetAllDeptInChargeIds", p);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
   public DataSet GetAllDesgInChargeIds()
   {
       try
       {
           SqlParameter[] p = new SqlParameter[1];
           p[0] = new SqlParameter("@DesgId", DesgId);
           return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "sp_GetAllDesgInChargeIds", p);
       }

       catch (Exception ex)
       {
           throw new ArgumentException(ex.Message);
       }
   }
    
   public DataSet GetAllSuperiorDesgIds()
    {
        try
        {
            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "sp_GetAllSuperiorDesgIds", null);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetSuperiorEmpId()
    {
        try
        {
            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "sp_GetSuperiorEmpId", null);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    
    public DataSet GetAllDeptMasterData()
    {
        try
        {
            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "sp_GetAllDeptMasterData", null);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }


    public string InsertDesgMaster()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[4];
            p[0] = new SqlParameter("@DesgName", DesgName);
            p[1] = new SqlParameter("@Abbreviation", Abbreviation);
            p[2] = new SqlParameter("@Description", Description);
            p[3] = new SqlParameter("@Message", SqlDbType.VarChar, 250);
            p[3].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "sp_InsertDesgMaster", p);
            return p[3].Value.ToString();
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public string UpdateDesgMaster()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[7];
            p[0] = new SqlParameter("@DesgId", DesgId);
            p[1] = new SqlParameter("@DesgName", DesgName);
            p[2] = new SqlParameter("@Abbreviation", Abbreviation);
            p[3] = new SqlParameter("@DesgInchargeId",DesgInChargeId);
            p[4] = new SqlParameter("@SuperiorDesgId",SuperiorDesgId);
            p[5] = new SqlParameter("@Description", Description);
            p[6] = new SqlParameter("@Message", SqlDbType.VarChar, 250);
            p[6].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "sp_UpdateDesgMaster", p);
            return p[6].Value.ToString();
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetAllDesgIds()
    {
        try
        {
            string str = "select DesignationId,Desg_Name from tbl_Designation";
            return SqlHelper.ExecuteDataset(con, CommandType.Text, str);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

    public DataSet GetDesgMasterDataByDesgId()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@DesgId", DesgId);
            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "GetDesgDataByDesgId", p);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetAllDesgMasterData()
    {
        try
        {
            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "sp_GetAllDesgMasterData", null);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet ShowReportEmployee()
    {
        try
        {
            
           return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "spReportEmployee");
             
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }





    public DataSet GetDeptID()
    {
        try
        {
            string strText = "select * from tbl_Department";
            DataSet ds = SqlHelper.ExecuteDataset(con, CommandType.Text, strText, null);
            return ds;
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetDesignation()
    {
        try
        {
            string strText = "select * from tbl_Designation";
            DataSet ds = SqlHelper.ExecuteDataset(con, CommandType.Text, strText, null);
            return ds;
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    

    

   
}
