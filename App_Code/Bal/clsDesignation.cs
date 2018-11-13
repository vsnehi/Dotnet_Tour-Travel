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
/// Summary description for clsDesignation
/// </summary>
public class clsDesignation:Connection 
{
    public static DataSet ds;
	public clsDesignation()
	{
		
	}
    string _Name, _Abbr, _Desc;

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


    private int _DesignationId;

    public int DesignationId
    {
        get { return _DesignationId; }
        set { _DesignationId = value; }
    }



    public int InsertDesignation()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[3];
            p[0] = new SqlParameter("@DesgName", this._Name);
            p[0].DbType = DbType.String;

            p[1] = new SqlParameter("@Abbreviation", this._Abbr);
            p[1].DbType = DbType.String;

            p[2] = new SqlParameter("@DesgDescription", this._Desc);
            p[2].DbType = DbType.String;

            int Result = SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "sp_InsertDesgMaster", p);
            return Result;
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

    public int ModifyDesignationDetails()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[4];

            p[0] = new SqlParameter("@DesgId", this._DesignationId);
            p[0].DbType = DbType.Int32;

            p[1] = new SqlParameter("@DesgName", this._Name);
            p[1].DbType = DbType.String;

            p[2] = new SqlParameter("@Abbreviation", this._Abbr);
            p[2].DbType = DbType.String;

            p[3] = new SqlParameter("@DesgDesc", this._Desc);
            p[3].DbType = DbType.String;


            int Result = SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "sp_UpdateDesgMaster", p);
            return Result;
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }


    public DataSet ShowDesignation()
    {
        try
        {
            ds = new DataSet();
            ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_Show_Designation");
            return ds;
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public static DataSet GetDesgDataByDesgId(int DesgId)
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
}
