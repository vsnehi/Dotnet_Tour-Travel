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

public partial class UserControls_ucUserSearchByCity : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
        }
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
        if (!String.IsNullOrEmpty(this._strConName))
        {
            this._strCon = ConfigurationManager.ConnectionStrings[_strConName].ConnectionString;
        }
        else
            this._strCon = "Connection not established..";
        str = _strCon;
        return str;
    }

    SqlConnection sqlcon;
    SqlDataAdapter sqlda;
    DataSet ds;
    SqlCommand sqlcmd;
    string strCountry;
    string strState ;
    string strCity ;

    public void BindData()
    {
        sqlcon = new SqlConnection(GetCon());
        sqlcon.Open();
        string strText = "select Country,state,city from tbl_useraddress";
        sqlda = new SqlDataAdapter(strText, sqlcon);
        ds = new DataSet();
        sqlda.Fill(ds);

        int rc=ds.Tables[0].Rows.Count;

        for (int i = 0; i < rc; i++)
        {
            DataRow drow = ds.Tables[0].Select()[i];

            if (String.IsNullOrEmpty(strCountry) && String.IsNullOrEmpty(strState) && String.IsNullOrEmpty(strCity))
            {
                strCountry = drow["Country"].ToString().ToUpper();
                strState = drow["State"].ToString().ToUpper();
                strCity = drow["City"].ToString().ToUpper();
            }
            else
            {
                if (!strCountry.Contains(drow["Country"].ToString().ToUpper()) && !String.IsNullOrEmpty(drow["Country"].ToString()) )
                {
                    strCountry = strCountry + "," + drow["Country"].ToString ().ToUpper();
                }
                if (!strState.Contains(drow["State"].ToString().ToUpper())&& !String.IsNullOrEmpty(drow["State"].ToString()) )
                {
                    strState = strState + "," + drow["State"].ToString().ToUpper();
                }
                if (!strCity.Contains(drow["City"].ToString().ToUpper()) && !String.IsNullOrEmpty(drow["City"].ToString()))
                {
                    strCity = strCity + "," + drow["City"].ToString().ToUpper();
                }
            }
        }

        string[] strsplitCountry = strCountry.Split(',');
        string[] strsplitState = strState.Split(',');
        string[] strsplitCity = strCity.Split(',');
       
        if (strCountry.Contains(","))
          {
           for (int i = 0; i<strsplitCountry.Count() ; i++)
              {
                    ddlCountry.Items.Add(strsplitCountry[i]);
              }
          }
        else
        {
            ddlCountry.Items.Add(strCountry.ToString());
            
        }

        if (strState.Contains(","))
        {
            for (int i = 0; i < strsplitState.Count(); i++)
            {
                ddlState.Items.Add(strsplitState[i]);
            }
        }
        else
        {
            ddlState.Items.Add(strState.ToString());
        }
        if (strCity.Contains(","))
        {
            for (int i = 0; i < strsplitCity.Count(); i++)
            {
                ddlCity.Items.Add(strsplitCity[i]);
            }
        }
        else
        {
            ddlCity.Items.Add(strCity.ToString());
        }
     }

    

    public void GetUserDetails()
    {
        try
        {
            btnPrint.Visible = false;
            gvCity.Visible = false;
            lblmsg.Visible = false;
            gv2.Visible = false;
            sqlcon = new SqlConnection(GetCon());
            sqlcon.Open();
           
            sqlcmd = new SqlCommand("spGetUserDetailsByCity",sqlcon);
            sqlcmd.CommandType = CommandType.StoredProcedure;
            sqlcmd.Parameters.AddWithValue("@Country", ddlCountry.SelectedItem.Text);
            sqlcmd.Parameters.AddWithValue("@State", ddlState.SelectedItem.Text);
            sqlcmd.Parameters.AddWithValue("@City", ddlCity.SelectedItem.Text);
            sqlda = new SqlDataAdapter(sqlcmd);
            ds = new DataSet();             
            sqlda.Fill(ds);
            Cache["tbl1"] = ds;
            if (ds.Tables[0].Rows.Count != 0)
            {
                gvCity.DataSource = ds.Tables[0];
                gvCity.DataBind();
                gvCity.Visible = true;
                btnPrint.Visible = true;
            }
            else
            {
                btnPrint.Visible = false;
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
            if (ddlCountry.SelectedItem.Text != null)
            {
                if (ddlState.SelectedItem.Text != null)
                {
                    if (ddlCity.SelectedItem.Text != null)
                    {
                        GetUserDetails();
                    }
                    else
                        lblmsg.Text = "Select City..";
                }
                else
                    lblmsg.Text = "Select State..";
            }
            else
                lblmsg.Text = "Select Country..";
        }
        catch (Exception ex)
        {
            lblmsg.Text= ex.Message;
        }
    }
    protected void gvCity_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        

        if (e.CommandName.ToString() == "Contact")
        {
            DataTable dt = new DataTable("phone");
            dt.Columns.Add("User Id");
            dt.Columns.Add("Phone Type");
            dt.Columns.Add("Phone No");
            DataRow drow1 = dt.NewRow();

            int id = Convert.ToInt32(e.CommandArgument);
            DataSet ds = (DataSet)Cache["tbl1"];
            int c = ds.Tables[1].Rows.Count;
            string strPhoneType = null;

            for (int i = 0; i < c; i++)
            {
                DataRow dRow = ds.Tables[1].Select()[i];
                if (String.IsNullOrEmpty(strPhoneType))
                {
                    if (Convert.ToInt32(dRow["UserId"]) == id)
                    {
                        strPhoneType = dRow["UserPhoneType"].ToString();
                        DataRow rec = dt.NewRow();
                        DataRow dRow1 = ds.Tables[1].Select()[i];
                        rec[0] = dRow1[0].ToString();
                        rec[1] = dRow1[1].ToString();
                        rec[2] = dRow1[2].ToString();
                        dt.Rows.Add(rec);
                    }

                    gv2.DataSource = dt;
                    gv2.DataBind();
                    gv2.Visible = true;
                    btnPrint.Visible = true;
                }
                else
                {
                   if (!strPhoneType.Contains(dRow["UserPhoneType"].ToString()) && Convert.ToInt32(dRow["UserId"]) == id)
                        
                       {
                            strPhoneType = strPhoneType + "," + dRow["UserPhoneType"].ToString();

                            DataRow rec = dt.NewRow();
                            //rec[0] = dRow[0].ToString();
                            rec[1] = dRow[1].ToString();
                            rec[2] = dRow[2].ToString();
                            dt.Rows.Add(rec);
                            gv2.DataSource = dt;
                            gv2.DataBind();
                            gv2.Visible = true;
                        }                    
                }
            }

        }

        DataRow pRow;

        if (e.CommandName.ToString() == "Personal")
        {
            DataTable dtp = new DataTable("Personal");
            dtp.Columns.Add("User Id");
            dtp.Columns.Add("First Name");
            dtp.Columns.Add("Last Name");
            dtp.Columns.Add("User LoginId");
            dtp.Columns.Add("EmailId");
            DataRow drowa = dtp.NewRow();

            int id = Convert.ToInt32(e.CommandArgument);
            DataSet ds = (DataSet)Cache["tbl1"];
            int c = ds.Tables[2].Rows.Count;
            string strUserid=null;

            for (int i = 0; i < c; i++)
            {
                pRow = ds.Tables[2].Select()[i];
                if (String.IsNullOrEmpty(strUserid))
                {
                    if (Convert.ToInt32(pRow["UserId"]) == id)
                    {
                        strUserid = pRow["UserId"].ToString();
                        DataRow prec = dtp.NewRow();
                        DataRow pRow1 = ds.Tables[2].Select()[i];
                        prec[0] = pRow1[0].ToString();
                        prec[1] = pRow1[1].ToString();
                        prec[2] = pRow1[2].ToString();
                        prec[3] = pRow1[3].ToString();
                        prec[4] = pRow1[4].ToString();

                        dtp.Rows.Add(prec);
                    }
                    gv2.DataSource = dtp;
                    gv2.DataBind();
                    gv2.Visible = true;
                    btnPrint.Visible = true;
                }
                else
                {
                    if (!strUserid.Contains(pRow["UserId"].ToString()))
                    {
                        strUserid = strUserid + "," + pRow["UserId"].ToString();
                    }
                }
            }
           // string[] splituserid = strUserid.Split(',');
        }
    }

    protected void gvCity_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        ds = (DataSet)Cache["tbl1"]; 
        gvCity.PageIndex = e.NewPageIndex;
        gvCity.DataSource = ds.Tables[0];
        gvCity.DataBind();
        gvCity.Visible = true;
        gv2.Visible = false;
        btnPrint.Visible = true;
        
    }
    protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
           // GetState();
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message.ToString());
        }
    }
    protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void btnPrint_Click(object sender, EventArgs e)
    {

    }

}
