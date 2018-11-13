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
using TravelDesk.DAL;

/// <summary>
/// Summary description for clsDept
/// </summary>
public class clsDept1:Connection 
{
	public clsDept1()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public DataSet GetDeptID()
    {
        try
        {
            string strText = "select * from tbl_Dept_Master";
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
            string strText = "select * from tbl_DesignationMaster";
            DataSet ds = SqlHelper.ExecuteDataset(con , CommandType.Text, strText, null);
            return ds;
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    
    public DataSet GetEmpIDsByDeptId(int p)
    {
        throw new NotImplementedException();
    }
}
