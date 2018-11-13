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
/// Summary description for clsEmp
/// </summary>
public class clsEmp:Connection 
{
    public static DataSet ds;
	public clsEmp()
	{
		
	}


    string _Name;

    public string Name
    {
        get { return _Name; }
        set { _Name = value; }
    }

    private int _EmpId, _Dept, _Desg;

    public int Desg
    {
        get { return _Desg; }
        set { _Desg = value; }
    }

    public int Dept
    {
        get { return _Dept; }
        set { _Dept = value; }
    }

    
    public int EmpId
    {
        get { return _EmpId; }
        set { _EmpId = value; }
    }

    public int ModifyDesgDetails()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[2];

            p[0] = new SqlParameter("@EmpId", this._EmpId);
            p[0].DbType = DbType.Int32;

            p[1] = new SqlParameter("@Designation", this._Desg);
            p[1].DbType = DbType.Int32;




            int Result = SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "sp_Modify_EmpDesg", p);
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
            SqlParameter[] p = new SqlParameter[2];

            p[0] = new SqlParameter("@EmpId", this._EmpId);
            p[0].DbType = DbType.Int32;

            p[1] = new SqlParameter("@Department", this._Dept);
            p[1].DbType = DbType.Int32;




            int Result = SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "sp_Modify_EmpDept", p);
            return Result;
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

    public DataSet ShowEmp()
    {
        try
        {
            ds = new DataSet();
            ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_Show_Emp");
            return ds;
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

    public DataSet GetSearchEmployeeName(string a)
    {
        try
        {
          
            string str = "SELECT [Emp_FirstName],[Emp_DOB], [Emp_DOJ], [Emp_HighestQual], [Emp_Gender],[Emp_MaritalStatus] FROM [tbl_Emp_Master] WHERE [Emp_FirstName] LIKE ('%"+a+"%')";
            return SqlHelper.ExecuteDataset(con, CommandType.Text,str);
          
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
            ds = new DataSet();
            ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "spReportEmployee");
            return ds;
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

    public DataSet ShowReportEmployeeWork()
    {
        try
        {
            ds = new DataSet();
            ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "spReportEmployeeWork");
            return ds;
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet ShowReportEmployeeVisa()
    {
        try
        {
            ds = new DataSet();
            ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "spReportEmployeeVisa");
            return ds;
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    
    public static DataSet GetEmpDataByEmpId(int EmpId)
    {
        try
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@EmpId", EmpId);

            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "GetEmpDataByEmpId", p);

        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public static DataSet GetEmpDataByDeptName(int EmpId)
    {
        try
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@EmpId", EmpId);
          
            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "GetEmpDataByDeptName", p);

        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

    

    public static DataSet GetEmpDataByDesgName(int EmpId)
    {
        try
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@EmpId", EmpId);

            return SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "GetEmpDataByDesgName", p);

        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }


}


