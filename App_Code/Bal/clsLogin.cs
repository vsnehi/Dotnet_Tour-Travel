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
using TravelDesk.DAL;
using System.Data.SqlClient;
/// <summary>
/// Summary description for clsLogin
/// </summary>
public class clsLogin:Connection
{
	public clsLogin()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public static  string UserName { get; set; }
    public static string Password { get; set; }
    public static string Role { get; set; }
     DataSet ds = null;

    public string GetUserLogin()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[3];

            p[0] = new SqlParameter("@UserName", UserName);
            p[1] = new SqlParameter("@Password", Password );
            p[2] = new SqlParameter("@Role", SqlDbType.VarChar, 50);
            p[2].Direction = ParameterDirection.Output;
            
           
             SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "spLoginChecking", p);
             Role = Convert.ToString(p[2].Value);
             return Role;
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public  DataSet GetEmpCargoStatus(int EmpId)
    {
        try
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@EmpId", EmpId);
            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "sp_GetEmpCargoStatus", p);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);     
        }
    }
    
    
}
