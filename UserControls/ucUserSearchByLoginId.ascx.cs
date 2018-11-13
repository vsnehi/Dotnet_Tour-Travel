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

public partial class UserControls_ucUserSearchByLoginId : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        { 
        
        }
        txtLoginId.Focus() ;
        btnPrint.Visible = false;
    }
    string _strCon, _strConName;
    
    

    public string StrCon
    {
        get { return _strCon; }
        set { _strCon = value; }
    }

    public string StrConName
    {
        get { return _strConName; }
        set { _strConName = value; }
    }

  
    public string GetCon()
    {
        string str;
        if (!String.IsNullOrEmpty(this.StrConName))
            this._strCon = ConfigurationManager.ConnectionStrings[_strConName].ConnectionString;
        else
            this._strCon = "Connection not established..";
        str = _strCon;
        return str;
    }
    

    SqlConnection sqlcon;
    SqlDataAdapter sqlda;
    DataSet ds;
    SqlCommand sqlcmd;

    public void GetUserDetails()
    {
        try
        {
            
            lblmsg.Visible = false;
            gvLoginId.Visible = false;
            gv2.Visible = false;
            sqlcon = new SqlConnection(GetCon());
            sqlcon.Open();
            sqlcmd = new SqlCommand("spGetUserDetailsByLoginId", sqlcon);
            sqlcmd.CommandType = CommandType.StoredProcedure;
            sqlcmd.Parameters.AddWithValue("@LoginId", txtLoginId.Text);
            sqlda = new SqlDataAdapter(sqlcmd);
            ds = new DataSet();
            sqlda.Fill(ds);
            Cache["tbl1"] = ds;
            if (ds.Tables[0].Rows.Count != 0)
            {
                gvLoginId.DataSource = ds.Tables[0];
                gvLoginId.DataBind();
                gvLoginId.Visible = true;
                btnPrint.Visible = true;
            }
            else 
            {
                lblmsg.Visible = true;
                lblmsg.Text = "No records found";
            }
        }
        catch (Exception ex)
        {
            lblmsg.Text=ex.Message;
        }
       
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtLoginId.Text != null)
            {
                GetUserDetails();
            }
            else
                lblmsg.Text = "Enter LoginId..";
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    protected void gvLoginId_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        DataTable dt = new DataTable("phone");
        dt.Columns.Add("User Id");
        dt.Columns.Add("Phone Type");
        dt.Columns.Add("Phone No");
        DataRow drow1 = dt.NewRow();

        if (e.CommandName.ToString() == "Contact")
        {
            int id = Convert.ToInt32(e.CommandArgument);
            DataSet ds = (DataSet)Cache["tbl1"];
            int c = ds.Tables[1].Rows.Count;

            for (int i = 0; i < c; i++)
            {
                DataRow dRow = ds.Tables[1].Select()[i];
                if (Convert.ToInt32(dRow["UserId"]) == id)
                {
                    DataRow rec = dt.NewRow();
                    DataRow dRow1 = ds.Tables[1].Select()[i];
                    rec[0] = dRow1[0].ToString();
                    rec[1] = dRow1[1].ToString();
                    rec[2] = dRow1[2].ToString();
                    dt.Rows.Add(rec);
                }
            }
            gv2.DataSource = dt;
            gv2.DataBind();
            gv2.Visible = true;
            btnPrint.Visible = true;
        }

        DataTable dta = new DataTable("Address");
        dta.Columns.Add("User Id");
        dta.Columns.Add("Address Type");
        dta.Columns.Add("HNo");
        dta.Columns.Add("City");
        dta.Columns.Add("State");
        dta.Columns.Add("Country");
        dta.Columns.Add("Pin Code");
        DataRow drowa = dta.NewRow();

        if (e.CommandName.ToString() == "Address")
        {
            int id = Convert.ToInt32(e.CommandArgument);
            DataSet ds = (DataSet)Cache["tbl1"];
            int c = ds.Tables[2].Rows.Count;

            for (int i = 0; i < c; i++)
            {
                DataRow adRow = ds.Tables[2].Select()[i];
                if (Convert.ToInt32(adRow["UserId"]) == id)
                {
                    DataRow arec = dta.NewRow();
                    DataRow adRow1 = ds.Tables[2].Select()[i];
                    arec[0] = adRow1[0].ToString();
                    arec[1] = adRow1[1].ToString();
                    arec[2] = adRow1[2].ToString();
                    arec[3] = adRow1[3].ToString();
                    arec[4] = adRow1[4].ToString();
                    arec[5] = adRow1[5].ToString();
                    arec[6] = adRow1[6].ToString();
                    dta.Rows.Add(arec);
                }
            }
            gv2.DataSource = dta    ;
            gv2.DataBind();
            gv2.Visible = true;
            btnPrint.Visible = true;
        }
                                               
    }
    
}
