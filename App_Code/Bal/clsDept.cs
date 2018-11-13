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
/// Summary description for clsDept
/// </summary>
public class clsDept:Connection 
{
    public static DataSet ds;
	public  clsDept()
    {
    }


    string _Name, _Abbr, _Desc, _Loc;

    public string Loc
    {
        get { return _Loc; }
        set { _Loc = value; }
    }

    public string Name
    {
        get { return _Name; }
        set { _Name = value; }
    }
    public string Abbrevation
    {
        get { return _Abbr; }
        set { _Abbr = value; }
    }
    public string Description
    {
        get { return _Desc; }
        set { _Desc = value; }
    }


    private int _DepartmentId;

    public int DepartmentId
    {
        get { return _DepartmentId; }
        set { _DepartmentId = value; }
    }

    public int InsertDepartment()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[4];
            p[0] = new SqlParameter("@DeptName", this._Name);
            p[0].DbType = DbType.String;

            p[1] = new SqlParameter("@Abbreviation", this._Abbr);
            p[1].DbType = DbType.String;

            p[2] = new SqlParameter("@DeptLocation", this._Loc);
            p[2].DbType = DbType.String;

            p[3] = new SqlParameter("@DeptDescription", this._Desc);
            p[3].DbType = DbType.String;


            int Result = SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "sp_InsertDeptMaster", p);
            return Result;
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

    public int ModifyDepartmentDetails()
    {

        try
        {
            SqlParameter[] p = new SqlParameter[5];

            p[0] = new SqlParameter("@DeptId", this.DepartmentId);
            p[0].DbType = DbType.Int32;

            p[1] = new SqlParameter("@DeptName", this._Name);
            p[1].DbType = DbType.String;

            p[2] = new SqlParameter("@Abbreviation", this._Abbr);
            p[2].DbType = DbType.String;

            p[3] = new SqlParameter("@DeptLocation", this._Loc);
            p[3].DbType = DbType.String;

            p[4] = new SqlParameter("@DeptDesc", this._Desc);
            p[4].DbType = DbType.String;

            int Result = SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "sp_UpdateDeptMaster", p);
            return Result;
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }


    public DataSet ShowDepartment()
    {
        try
        {
            ds = new DataSet();
            ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_Show_Department");
            return ds;
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public static DataSet GetDeptDataByDeptId(int DeptId)
    {
        try
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@DeptId", DeptId);

            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "GetDeptDataByDeptId", p);

        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
}