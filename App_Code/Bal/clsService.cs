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
/// Summary description for clsService
/// </summary>
public class clsService:Connection 
{
	public clsService()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public int ServiceCustomerId { get; set; }
    public string ServiceCustomerName { get; set; }
    public DateTime  ServiceCustomerDOR { get; set; }
    public string  Address { get; set; }
    public string PhoneNo { get; set; }
    public string Email { get; set; }
    public int InChargeId { get; set; }
    public string  Description { get; set; }

    public int ServiceCustomerDomainId { get; set; }
    public int ServiceCustomerDomainMasterId { get; set; }
    public string ServiceCustomerDomainPhone { get; set; }
    public string ServiceCustomerDomainManagerName { get; set; }

    public int EmpId { get; set; }
    public int ComplaintTypeId { get; set; }
    public string  PhoneNo1 { get; set; }
    public string PhoneNo2 { get; set; }
    public string PhoneNo3{ get; set; }

    
    
    public string InsertServiceCustomers()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[8];
            p[0] = new SqlParameter("@ServiceCustomerName", ServiceCustomerName);
            p[1] = new SqlParameter("@ServiceCustomerDOR", ServiceCustomerDOR);
            p[2] = new SqlParameter("@CustomerAddress", Address);
            p[3] = new SqlParameter("@CustomerPhoneNO", PhoneNo);
            p[4] = new SqlParameter("@CustomerEmail", Email);
            p[5] = new SqlParameter("@ServiceCustomerInChargeId", InChargeId);
            p[6] = new SqlParameter("@ServiceCustomerDesc", Description);
            p[7] = new SqlParameter("@Message", SqlDbType.VarChar, 250);
            p[7].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "sp_InsertServiceCustomers", p);
            return p[7].Value.ToString();
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public string InsertServiceCustomerDomain()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[9];
            p[0] = new SqlParameter("@ServiceCustomerId", ServiceCustomerId);
            p[1] = new SqlParameter("@ServiceCustomerDomainMasterId", ServiceCustomerDomainMasterId);
            p[2] = new SqlParameter("@ServiceCustomerDomainPhone", ServiceCustomerDomainPhone);
            p[3] = new SqlParameter("@ServiceCustomerDomainInChargeId", InChargeId);
            p[4] = new SqlParameter("@ServiceCustomerDomainManagerName", ServiceCustomerDomainManagerName);
            p[5] = new SqlParameter("@ServiceCustomerDomainEmail", Email);
            p[6] = new SqlParameter("@ServiceCustomerDomainAddress", Address);
            p[7] = new SqlParameter("@ServiceCustomerDomainDesc",Description);
            p[8] = new SqlParameter("@Message", SqlDbType.VarChar, 250);
            p[8].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "sp_InsertServiceCustomerDomain", p);
            return p[8].Value.ToString();
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public string InsertServiceCustomerDomainEmpInCharges()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[4];
            p[0] = new SqlParameter("@ServiceCustomerDomainId", ServiceCustomerDomainId);
            p[1] = new SqlParameter("@ServiceCustomerDomainInChargeId", InChargeId);
            p[2] = new SqlParameter("@EmpId", EmpId);
            p[3] = new SqlParameter("@Message", SqlDbType.VarChar, 250);
            p[3].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "sp_InsertServiceCustomerDomainEmpInCharges", p);
            return p[3].Value.ToString();
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public string InsertServiceCustomerDomainComplaintType()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[3];
            p[0] = new SqlParameter("@ServiceCustomerDomainId", ServiceCustomerDomainId);
            p[1] = new SqlParameter("@ComplaintTypeId", ComplaintTypeId);
            p[2] = new SqlParameter("@Message", SqlDbType.VarChar, 250);
            p[2].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "sp_InsertServiceCustomerDomainComplaintType", p);
            return p[2].Value.ToString();
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public string InsertServiceCustomerDomainPhoneNos()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[5];
            p[0] = new SqlParameter("@ServiceCustomerDomainId", ServiceCustomerDomainId);
            p[1] = new SqlParameter("@PhoneNo1", PhoneNo1);
            p[2] = new SqlParameter("@PhoneNo2", PhoneNo2);
            p[3] = new SqlParameter("@PhoneNo3", PhoneNo3);
            p[4] = new SqlParameter("@Message", SqlDbType.VarChar, 250);
            p[4].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "sp_InsertServiceCustomerDomainPhoneNos", p);
            return p[4].Value.ToString();
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public string InsertServiceCustomerDomainCustomers()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[3];
            p[0] = new SqlParameter("@ServiceCustomerDomainId", ServiceCustomerDomainId);
            p[1] = new SqlParameter("@CustomerId", ServiceCustomerId);
            p[2] = new SqlParameter("@Message", SqlDbType.VarChar, 250);
            p[2].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "sp_InsertServiceCustomerDomainCustomers", p);
            return p[2].Value.ToString();
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    





    public string UpdateServiceCustomers()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[8];
            p[0] = new SqlParameter("@ServiceCustomerId", ServiceCustomerId);
            p[1] = new SqlParameter("@ServiceCustomerName", ServiceCustomerName);
            p[2] = new SqlParameter("@ServiceCustomerDOR", ServiceCustomerDOR);
            p[3] = new SqlParameter("@CustomerAddress", Address);
            p[4] = new SqlParameter("@CustomerPhoneNO", PhoneNo);
            p[5] = new SqlParameter("@CustomerEmail", Email);
            p[6] = new SqlParameter("@ServiceCustomerDesc", Description);
            p[7] = new SqlParameter("@Message", SqlDbType.VarChar, 250);
            p[7].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "sp_UpdateServiceCustomers", p);
            return p[7].Value.ToString();
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public string UpdateServiceCustomerDomain()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[7];
            p[0] = new SqlParameter("@ServiceCustomerDomainId", ServiceCustomerDomainId);
            p[1] = new SqlParameter("@ServiceCustomerDomainPhone", ServiceCustomerDomainPhone);
            p[2] = new SqlParameter("@ServiceCustomerDomainManagerName", ServiceCustomerDomainManagerName);
            p[3] = new SqlParameter("@ServiceCustomerDomainEmail", Email);
            p[4] = new SqlParameter("@ServiceCustomerDomainAddress", Address);
            p[5] = new SqlParameter("@ServiceCustomerDomainDesc", Description);
            p[6] = new SqlParameter("@Message", SqlDbType.VarChar, 250);
            p[6].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "sp_UpdateServiceCustomerDomain", p);
            return p[6].Value.ToString();
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }


    public DataSet GetAllServiceCustomerIds()
    {
        try
        {
            string str = "select * from tbl_ServiceCustomers";
            return SqlHelper.ExecuteDataset(con, CommandType.Text, str);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    
    public DataSet GetServiceCustomerInchargeIds()
    {
        try
        {
            string str = "SELECT e.Emp_FirstName,s.ServiceCustomerInChargeId From tbl_Employee e,tbl_ServiceCustomers s where s.ServiceCustomerInChargeId=e.EmpId";
            return SqlHelper.ExecuteDataset(con, CommandType.Text,str);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
     public DataSet GetServiceCustomerEmpIds()
    {
        try
        {
           
            return SqlHelper.ExecuteDataset(con, CommandType.Text,"GetServiceCustomerEmpIds",null);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    

   public DataSet GetServiceCustomerDomainCustomerIds()
    {
        try
        {
           
            return SqlHelper.ExecuteDataset(con, CommandType.Text,"sp_GetServiceCustomerDomainCustomerIds",null);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetAllServiceCustomerDomainIds()
    {
        try
        {
            string str = "select * from tbl_ServiceCustomerDomain";
            return SqlHelper.ExecuteDataset(con, CommandType.Text, str);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetAllDomainIds()
    {
        try
        {
            string str = "select * from tbl_Domain";
            return SqlHelper.ExecuteDataset(con, CommandType.Text, str);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    



    public DataSet GetServiceCustomerDataByServiceCustomersId()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@ServiceCustomerId", ServiceCustomerId);
            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "sp_GetServiceCustomerDataByServiceCustomersId", p);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetServiceCustomerDomainDataByServiceCustomerDomainId()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@ServiceCustomerDomainId", ServiceCustomerDomainId);
            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "sp_GetServiceCustomerDomainDataByServiceCustomerDomainId", p);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetAllSerCustomerInChargeIds()
    {
        try
        {
            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "GetAllSerCustomerInChargeIds", null);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

    public DataSet GetAllServiceCustomerData()
    {
        try
        {
            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "sp_GetAllServiceCustomerData", null);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetAllServiceCustomerDomain()
    {
        try
        {
            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "sp_GetAllServiceCustomerDomain", null);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

    public DataSet GetShowEmpIncharges()
    {
        try
        {
            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "sp_GetShowEmpIncharges", null);
        }

        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

}
