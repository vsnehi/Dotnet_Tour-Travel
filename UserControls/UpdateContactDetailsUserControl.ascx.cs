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

public partial class UpdateContactDetailsControl : System.Web.UI.UserControl
{

    #region Region for PageLoad event

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
         
            try
            {
               
                GetDataforAddress();
                GetDataforPhones();
                getAddAddressData();
                getAddPhoneData();
                Session["AddressOperationType"] = null;
                Session["PhoneOperationType"] = null;
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }
        lblMsg.Text = "";
        lblMsg1.Text = "";
    }

    #endregion

    #region Region for public properties and private fields


    private string _strCon;
    private string _strConnection;
    private int _intUserId;


    public string StrConnectionName
    {
        get { return _strConnection; }
        set { _strConnection = value; }
    }

    private string StrCon
    {
        get { return _strCon; }
        set { _strCon = value; }
    }

    public string GetCon()
    {
        string str;
        if (!String.IsNullOrEmpty(this._strConnection))
            this._strCon =ConfigurationManager.ConnectionStrings[_strConnection].ConnectionString;
        else
            this._strCon = "Connection not Established";
        str = _strCon;
        return str;
    }

    private string _strUserIdentifier;

    public string UserIdSession
    {
        get { return _strUserIdentifier; }
        set { _strUserIdentifier = value; }
    }

    void ConvertToInt()
    {
        try
        {
            string[] strS = this._strUserIdentifier.Split('"');
            string str = strS[1].ToString();
            string strSes = Session[str].ToString();
            this._intUserId = Convert.ToInt32(strSes);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
  
    private int UserId
    {
        get { return _intUserId; }
        set { _intUserId = value; }
    }

    SqlCommand sqlCmd;
    SqlDataAdapter sqlDa;
    DataSet ds;
    SqlDataReader sqlDr;
    SqlConnection sqlCon;
    #endregion

    #region Region fro Private methods

    private void GetDataforAddress()
    {
        try
        {
            ConvertToInt();
            string strtext = "select * from tbl_UserAddress where UserId=" + this.UserId + "";
            sqlCon = new SqlConnection(GetCon());
            sqlCon.Open();
            sqlDa = new SqlDataAdapter(strtext, sqlCon);
            ds = new DataSet();
            sqlDa.Fill(ds);
            grdAddressdetails.DataSource = ds.Tables[0];
            grdAddressdetails.DataBind();
            DataRow dRow = ds.Tables[0].Select("UserId=" + this.UserId)[0];
            Session["AddressId"] = dRow["UserAddressId"].ToString();
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
        finally
        {
            sqlCon.Close();
        }
    }

    private void GetDataforPhones()
    {
        try
        {
            ConvertToInt();
            string strtext = "select * from tbl_UserPhones where UserId=" + this.UserId + "";
            sqlCon = new SqlConnection(GetCon());
            sqlCon.Open();
            sqlDa = new SqlDataAdapter(strtext, sqlCon);
            ds = new DataSet();
            sqlDa.Fill(ds);
            grdPhoneDetails.DataSource = ds.Tables[0];
            grdPhoneDetails.DataBind();
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
        finally
        {
            sqlCon.Close();
        }
    }

    private void ClearTextboxforAddress()
    {
        txtCity.Text = "";
        txtCountry.Text = "";
        txtHno.Text = "";
        txtpin.Text = "";
        txtState.Text = "";
        txtStreet.Text = "";
    }

    private void ClearTextboxforPhone()
    {
        txtphoneno.Text = "";
    }

    private void getAddAddressData()
    {
        string str = "";
        Label lbltype;
        int i = 0;
        lnkAddAddress1.Text = "";
        lnkAddAddress2.Text = "";
        lblAddAddressMsg1.Text = "";
        lblAddAddressMsg1.Visible = false;
        foreach (GridViewRow dRow in grdAddressdetails.Rows)
        {
            lbltype = (Label)dRow.FindControl("lblAddType");
            if (i == 0)
                str = lbltype.Text;
            else
                str += "," + lbltype.Text;
            i = i + 1;
        }
        if (i == 1)
        {
            if (str == "Home")
            {
                lblAddAddressMsg1.Text = "You can add Two more address types.To Add click the link.";
                lnkAddAddress1.Text = "Office";
                lnkAddAddress2.Text = "Other";
                lnkAddAddress1.CommandArgument = "Office";
                lnkAddAddress2.CommandArgument = "Other";
                lnkAddAddress1.Visible = true;
                lnkAddAddress2.Visible = true;
            }
            if (str == "Office")
            {
                lblAddAddressMsg1.Text = "You can add Two more address types.To Add click the link.";
                lnkAddAddress1.Text = "Home";
                lnkAddAddress2.Text = "Other";
                lnkAddAddress1.CommandArgument = "Home";
                lnkAddAddress2.CommandArgument = "Other";
                lnkAddAddress1.Visible = true;
                lnkAddAddress2.Visible = true;
            }
            if (str == "Other")
            {
                lblAddAddressMsg1.Text = "You can add Two more address types.To Add click the link.";
                lnkAddAddress1.Text = "Home";
                lnkAddAddress2.Text = "Office";
                lnkAddAddress1.CommandArgument = "Home";
                lnkAddAddress2.CommandArgument = "Office";
                lnkAddAddress1.Visible = true;
                lnkAddAddress2.Visible = true;
            }
            lblAddAddressMsg1.Visible = true;
        }
        if (i == 2)
        {
            if (!str.Contains("Home"))
            {
                lblAddAddressMsg1.Text = "You can add Home address type.To Add click the link.";
                lnkAddAddress1.Text = "Home";
                lnkAddAddress1.CommandArgument = "Home";
                lnkAddAddress1.Visible = true;
            }
            if (!str.Contains("Office"))
            {
                lblAddAddressMsg1.Text = "You can add Office address type.To Add click the link.";
                lnkAddAddress1.Text = "Office";
                lnkAddAddress1.CommandArgument = "Office";
                lnkAddAddress1.Visible = true;
            }
            if (!str.Contains("Other"))
            {
                lblAddAddressMsg1.Text = "You can add Other address type.To Add click the link.";
                lnkAddAddress1.Text = "Other";
                lnkAddAddress1.CommandArgument = "Other";
                lnkAddAddress1.Visible = true;
            }
            lblAddAddressMsg1.Visible = true;
        }
    }

    private void getAddPhoneData()
    {
        string str = "";
        Label lbltype;
        int i = 0;
        lnkAddPhone1.Text = "";
        lnkAddPhone2.Text = "";
        lblAddPhoneMsg.Text = "";
        lblAddPhoneMsg.Visible = false;
        foreach (GridViewRow dRow in grdPhoneDetails.Rows)
        {
            lbltype = (Label)dRow.FindControl("lblPhoneType");
            if (i == 0)
                str = lbltype.Text;
            else
                str += "," + lbltype.Text;
            i = i + 1;
        }
        if (i == 1)
        {
            if (str == "Home")
            {
                lblAddPhoneMsg.Text = "You can add Two more Phone types.To Add click the link.";
                lnkAddPhone1.Text = "Office";
                lnkAddPhone2.Text = "Other";
                lnkAddPhone1.CommandArgument = "Office";
                lnkAddPhone2.CommandArgument = "Other";
                lnkAddPhone1.Visible = true;
                lnkAddPhone2.Visible = true;
            }
            if (str == "Office")
            {
                lblAddPhoneMsg.Text = "You can add Two more Phone types.To Add click the link.";
                lnkAddPhone1.Text = "Home";
                lnkAddPhone2.Text = "Other";
                lnkAddPhone1.CommandArgument = "Home";
                lnkAddAddress2.CommandArgument = "Other";
                lnkAddPhone1.Visible = true;
                lnkAddPhone2.Visible = true;
            }
            if (str == "Other")
            {
                lblAddPhoneMsg.Text = "You can add Two more Phone types.To Add click the link.";
                lnkAddPhone1.Text = "Home";
                lnkAddPhone2.Text = "Office";
                lnkAddPhone1.CommandArgument = "Home";
                lnkAddPhone2.CommandArgument = "Office";
                lnkAddPhone1.Visible = true;
                lnkAddPhone2.Visible = true;
            }
            lblAddPhoneMsg.Visible = true;
        }
        if (i == 2)
        {
            if (!str.Contains("Home"))
            {
                lblAddPhoneMsg.Text = "You can add Home Phonetype.To Add click the link.";
                lnkAddPhone1.Text = "Home";
                lnkAddPhone1.CommandArgument = "Home";
                lnkAddPhone1.Visible = true;
            }
            if (!str.Contains("Office"))
            {
                lblAddPhoneMsg.Text = "You can add Office Phonetype.To Add click the link.";
                lnkAddPhone1.Text = "Office";
                lnkAddPhone1.CommandArgument = "Office";
                lnkAddPhone1.Visible = true;
            }
            if (!str.Contains("Other"))
            {
                lblAddPhoneMsg.Text = "You can add Other Phonetype.To Add click the link.";
                lnkAddPhone1.Text = "Other";
                lnkAddPhone1.CommandArgument = "Other";
                lnkAddPhone1.Visible = true;
            }
            lblAddPhoneMsg.Visible = true;
        }
    }

    #endregion

    #region Region For gridview rowcommand events 

    protected void grdAddressdetails_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "ModifyAddress")
            {
                int i = Convert.ToInt32(e.CommandArgument);
                HiddenField hdnfield = new HiddenField();
                Label lblUserAddId, lblAddType1, lblHno, lblStreet, lblPin, lblCity, lblState, lblCountry;
                //find the data from grid view
                lblAddType1 = (Label)grdAddressdetails.Rows[i].FindControl("lblAddType");
                lblUserAddId = (Label)grdAddressdetails.Rows[i].FindControl("lblUseraddId");
                //Session["AddressID"] = lblUserAddId.Text;
                lblHno = (Label)grdAddressdetails.Rows[i].FindControl("lblHno");
                lblStreet = (Label)grdAddressdetails.Rows[i].FindControl("lblStreet");
                lblCity = (Label)grdAddressdetails.Rows[i].FindControl("lblCity");
                lblState = (Label)grdAddressdetails.Rows[i].FindControl("lblState");
                lblCountry = (Label)grdAddressdetails.Rows[i].FindControl("lblCountry");
                lblPin = (Label)grdAddressdetails.Rows[i].FindControl("lblPinCode");
                //assigning the data to textbox controls.
                lblAddType.Text = lblAddType1.Text;
                txtHno.Text = lblHno.Text;
                txtStreet.Text = lblStreet.Text;
                txtCity.Text = lblCity.Text;
                txtpin.Text = lblPin.Text;
                txtState.Text = lblState.Text;
                txtCountry.Text = lblCountry.Text;
                pnlAddress.Visible = true;
                Session["AddressOperationType"] = 0;
            }
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }

    protected void grdPhoneDetails_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "ModifyPhones")
            {
                int i = Convert.ToInt32(e.CommandArgument);
                Label lblPhoneNo, lblPhoneType;
                //find the data from grid view
                lblPhoneType = (Label)grdPhoneDetails.Rows[i].FindControl("lblPhoneType");
                //Session["UseraddId"] = (Label)grdAddressdetails.Rows[i].FindControl("lblUseraddId");
                lblPhoneNo = (Label)grdPhoneDetails.Rows[i].FindControl("lblPhoneNo");
                //assigning the data to textbox controls.
                lblPhone.Text = lblPhoneType.Text;
                txtphoneno.Text = lblPhoneNo.Text;
                pnlPhone.Visible = true;
                Session["PhoneOperationType"] = 0;
            }
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }

    #endregion

    //protected void imgbtnSubmit_Click(object sender, ImageClickEventArgs e)
    //{
    //    try
    //    {
    //        ConvertToInt();
    //        sqlCon = new SqlConnection(GetCon());
    //        sqlCon.Open();
    //        if (Session["AddressOperationType"] != null && Convert.ToInt32(Session["AddressOperationType"]) == 1)
    //            sqlCmd = new SqlCommand("spInsertOneAddressData", sqlCon);
    //        else
    //            sqlCmd = new SqlCommand("spUpdateAddressDetails", sqlCon);
    //        sqlCmd.CommandType = CommandType.StoredProcedure;

    //        sqlCmd.Parameters.AddWithValue("@UserId", this.UserId);

    //        if (Session["AddressOperationType"] != null && Convert.ToInt32(Session["AddressOperationType"]) == 1)
    //            sqlCmd.Parameters.AddWithValue("@UserAddressId", Convert.ToString(Session["AddressId"]));

    //        sqlCmd.Parameters.AddWithValue("@UserAddressType", Convert.ToString(lblAddType.Text.Trim()));
    //        sqlCmd.Parameters.AddWithValue("@Hno", Convert.ToString(txtHno.Text));
    //        sqlCmd.Parameters.AddWithValue("@Street", Convert.ToString(txtStreet.Text));
    //        sqlCmd.Parameters.AddWithValue("@City", Convert.ToString(txtCity.Text));
    //        sqlCmd.Parameters.AddWithValue("@State", Convert.ToString(txtState.Text));
    //        sqlCmd.Parameters.AddWithValue("@Country", Convert.ToString(txtCountry.Text));
    //        sqlCmd.Parameters.AddWithValue("@pincode", Convert.ToString(txtpin.Text));
    //        sqlCmd.Parameters.Add("@Msg", SqlDbType.VarChar, 50).Direction = ParameterDirection.Output;

    //        int i = sqlCmd.ExecuteNonQuery();
    //        if (i == 1)
    //        {
    //            if (Session["AddressOperationType"] != null && Convert.ToInt32(Session["AddressOperationType"]) == 1)
    //                lblMsg.Text = sqlCmd.Parameters["@Msg"].Value.ToString();
    //            else
    //                lblMsg.Text = "Your " + lblAddType.Text + " Address Details Modified.";
    //            ClearTextboxforAddress();
    //            pnlAddress.Visible = false;
    //            Session["AddressOperationType"] = null;
    //        }
    //        else
    //            lblMsg.Text = "Error While inserting Data.";
    //    }
    //    catch (Exception ex)
    //    {
    //        lblError.Text = ex.Message;
    //    }
    //    finally
    //    {
    //        GetDataforAddress();
    //        getAddAddressData();
    //    }
    //}

    //protected void imgbtnphoneSubmit_Click(object sender, ImageClickEventArgs e)
    //{
    //    try
    //    {
    //        ConvertToInt();
    //        sqlCon = new SqlConnection(GetCon());
    //        sqlCon.Open();

    //        if (Session["PhoneOperationType"] != null && Convert.ToInt32(Session["PhoneOperationType"]) == 1)
    //            sqlCmd = new SqlCommand("spInsertOnePhoneDetails", sqlCon);
    //        else
    //            sqlCmd = new SqlCommand("spUpdatePhoneDetails", sqlCon);
    //        sqlCmd.CommandType = CommandType.StoredProcedure;
    //        sqlCmd.Parameters.AddWithValue("@UserId", this.UserId);
    //        sqlCmd.Parameters.AddWithValue("@PhoneType", lblPhone.Text.Trim());
    //        sqlCmd.Parameters.AddWithValue("@PhoneNumber", txtphoneno.Text.Trim());
    //        sqlCmd.Parameters.Add("@Msg", SqlDbType.VarChar, 50).Direction = ParameterDirection.Output;

    //        int i = sqlCmd.ExecuteNonQuery();
    //        if (i == 1)
    //        {
    //            lblMsg1.Text = "Your " + lblPhone.Text + " Phone Details Modified.";
    //            if (Session["PhoneOperationType"] != null && Convert.ToInt32(Session["PhoneOperationType"]) == 1)
    //                lblMsg1.Text = sqlCmd.Parameters["@Msg"].Value.ToString();
    //            ClearTextboxforPhone();
    //            pnlPhone.Visible = false;
    //            Session["PhoneOperationType"] = null;
    //        }
    //        else
    //        {
    //            lblMsg1.Text = sqlCmd.Parameters["@Msg"].Value.ToString();
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        lblError.Text = ex.Message;
    //    }
    //    finally
    //    {
    //        GetDataforPhones();
    //        getAddPhoneData();
    //    }
    //}

    //private void ClearTextboxforAddress()
    //{
    //    txtCity.Text = "";
    //    txtCountry.Text = "";
    //    txtHno.Text = "";
    //    txtpin.Text = "";
    //    txtState.Text = "";
    //    txtStreet.Text = "";
    //}

    //private void ClearTextboxforPhone()
    //{
    //    txtphoneno.Text = "";
    //}

    //private void getAddAddressData()
    //{
    //    string str = "";
    //    Label lbltype;
    //    int i = 0;
    //    lnkAddAddress1.Text = "";
    //    lnkAddAddress2.Text = "";
    //    lblAddAddressMsg1.Text = "";
    //    lblAddAddressMsg1.Visible = false;
    //    foreach (GridViewRow dRow in grdAddressdetails.Rows)
    //    {
    //        lbltype = (Label)dRow.FindControl("lblAddType");
    //        if (i == 0)
    //            str = lbltype.Text;
    //        else
    //            str += "," + lbltype.Text;
    //        i = i + 1;
    //    }
    //    if (i == 1)
    //    {
    //        if (str == "Home")
    //        {
    //            lblAddAddressMsg1.Text = "You can add Two more address types.To Add click the link.";
    //            lnkAddAddress1.Text = "Office";
    //            lnkAddAddress2.Text = "Other";
    //            lnkAddAddress1.CommandArgument = "Office";
    //            lnkAddAddress2.CommandArgument = "Other";
    //            lnkAddAddress1.Visible = true;
    //            lnkAddAddress2.Visible = true;
    //        }
    //        if (str == "Office")
    //        {
    //            lblAddAddressMsg1.Text = "You can add Two more address types.To Add click the link.";
    //            lnkAddAddress1.Text = "Home";
    //            lnkAddAddress2.Text = "Other";
    //            lnkAddAddress1.CommandArgument = "Home";
    //            lnkAddAddress2.CommandArgument = "Other";
    //            lnkAddAddress1.Visible = true;
    //            lnkAddAddress2.Visible = true;
    //        }
    //        if (str == "Other")
    //        {
    //            lblAddAddressMsg1.Text = "You can add Two more address types.To Add click the link.";
    //            lnkAddAddress1.Text = "Home";
    //            lnkAddAddress2.Text = "Office";
    //            lnkAddAddress1.CommandArgument = "Home";
    //            lnkAddAddress2.CommandArgument = "Office";
    //            lnkAddAddress1.Visible = true;
    //            lnkAddAddress2.Visible = true;
    //        }
    //        lblAddAddressMsg1.Visible = true;
    //    }
    //    if (i == 2)
    //    {
    //        if (!str.Contains("Home"))
    //        {
    //            lblAddAddressMsg1.Text = "You can add Home address type.To Add click the link.";
    //            lnkAddAddress1.Text = "Home";
    //            lnkAddAddress1.CommandArgument = "Home";
    //            lnkAddAddress1.Visible = true;
    //        }
    //        if (!str.Contains("Office"))
    //        {
    //            lblAddAddressMsg1.Text = "You can add Office address type.To Add click the link.";
    //            lnkAddAddress1.Text = "Office";
    //            lnkAddAddress1.CommandArgument = "Office";
    //            lnkAddAddress1.Visible = true;
    //        }
    //        if (!str.Contains("Other"))
    //        {
    //            lblAddAddressMsg1.Text = "You can add Other address type.To Add click the link.";
    //            lnkAddAddress1.Text = "Other";
    //            lnkAddAddress1.CommandArgument = "Other";
    //            lnkAddAddress1.Visible = true;
    //        }
    //        lblAddAddressMsg1.Visible = true;
    //    }
    //}

    //private void getAddPhoneData()
    //{
    //    string str = "";
    //    Label lbltype;
    //    int i = 0;
    //    lnkAddPhone1.Text = "";
    //    lnkAddPhone2.Text = "";
    //    lblAddPhoneMsg.Text = "";
    //    lblAddPhoneMsg.Visible = false;
    //    foreach (GridViewRow dRow in grdPhoneDetails.Rows)
    //    {
    //        lbltype = (Label)dRow.FindControl("lblPhoneType");
    //        if (i == 0)
    //            str = lbltype.Text;
    //        else
    //            str += "," + lbltype.Text;
    //        i = i + 1;
    //    }
    //    if (i == 1)
    //    {
    //        if (str == "Home")
    //        {
    //            lblAddPhoneMsg.Text = "You can add Two more Phone types.To Add click the link.";
    //            lnkAddPhone1.Text = "Office";
    //            lnkAddPhone2.Text = "Other";
    //            lnkAddPhone1.CommandArgument = "Office";
    //            lnkAddPhone2.CommandArgument = "Other";
    //            lnkAddPhone1.Visible = true;
    //            lnkAddPhone2.Visible = true;
    //        }
    //        if (str == "Office")
    //        {
    //            lblAddPhoneMsg.Text = "You can add Two more Phone types.To Add click the link.";
    //            lnkAddPhone1.Text = "Home";
    //            lnkAddPhone2.Text = "Other";
    //            lnkAddPhone1.CommandArgument = "Home";
    //            lnkAddAddress2.CommandArgument = "Other";
    //            lnkAddPhone1.Visible = true;
    //            lnkAddPhone2.Visible = true;
    //        }
    //        if (str == "Other")
    //        {
    //            lblAddPhoneMsg.Text = "You can add Two more Phone types.To Add click the link.";
    //            lnkAddPhone1.Text = "Home";
    //            lnkAddPhone2.Text = "Office";
    //            lnkAddPhone1.CommandArgument = "Home";
    //            lnkAddPhone2.CommandArgument = "Office";
    //            lnkAddPhone1.Visible = true;
    //            lnkAddPhone2.Visible = true;
    //        }
    //        lblAddPhoneMsg.Visible = true;
    //    }
    //    if (i == 2)
    //    {
    //        if (!str.Contains("Home"))
    //        {
    //            lblAddPhoneMsg.Text = "You can add Home Phonetype.To Add click the link.";
    //            lnkAddPhone1.Text = "Home";
    //            lnkAddPhone1.CommandArgument = "Home";
    //            lnkAddPhone1.Visible = true;
    //        }
    //        if (!str.Contains("Office"))
    //        {
    //            lblAddPhoneMsg.Text = "You can add Office Phonetype.To Add click the link.";
    //            lnkAddPhone1.Text = "Office";
    //            lnkAddPhone1.CommandArgument = "Office";
    //            lnkAddPhone1.Visible = true;
    //        }
    //        if (!str.Contains("Other"))
    //        {
    //            lblAddPhoneMsg.Text = "You can add Other Phonetype.To Add click the link.";
    //            lnkAddPhone1.Text = "Other";
    //            lnkAddPhone1.CommandArgument = "Other";
    //            lnkAddPhone1.Visible = true;
    //        }
    //        lblAddPhoneMsg.Visible = true;
    //    }
    //}

    #region Region fro button controls events

    protected void imgbtnSubmit_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            ConvertToInt();
            sqlCon = new SqlConnection(GetCon());
            sqlCon.Open();
            if (Session["AddressOperationType"] != null && Convert.ToInt32(Session["AddressOperationType"]) == 1)
                sqlCmd = new SqlCommand("spInsertOneAddressData", sqlCon);
            else
                sqlCmd = new SqlCommand("spUpdateAddressDetails", sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;

            sqlCmd.Parameters.AddWithValue("@UserId", this.UserId);

            if (Session["AddressOperationType"] != null && Convert.ToInt32(Session["AddressOperationType"]) == 1)
                sqlCmd.Parameters.AddWithValue("@UserAddressId", Convert.ToString(Session["AddressId"]));

            sqlCmd.Parameters.AddWithValue("@UserAddressType", Convert.ToString(lblAddType.Text.Trim()));
            sqlCmd.Parameters.AddWithValue("@Hno", Convert.ToString(txtHno.Text));
            sqlCmd.Parameters.AddWithValue("@Street", Convert.ToString(txtStreet.Text));
            sqlCmd.Parameters.AddWithValue("@City", Convert.ToString(txtCity.Text));
            sqlCmd.Parameters.AddWithValue("@State", Convert.ToString(txtState.Text));
            sqlCmd.Parameters.AddWithValue("@Country", Convert.ToString(txtCountry.Text));
            sqlCmd.Parameters.AddWithValue("@pincode", Convert.ToString(txtpin.Text));
            sqlCmd.Parameters.Add("@Msg", SqlDbType.VarChar, 50).Direction = ParameterDirection.Output;

            int i = sqlCmd.ExecuteNonQuery();
            if (i == 1)
            {
                if (Session["AddressOperationType"] != null && Convert.ToInt32(Session["AddressOperationType"]) == 1)
                    lblMsg.Text = sqlCmd.Parameters["@Msg"].Value.ToString();
                else
                    lblMsg.Text = "Your " + lblAddType.Text + " Address Details Modified.";
                ClearTextboxforAddress();
                pnlAddress.Visible = false;
                Session["AddressOperationType"] = null;
            }
            else
                lblMsg.Text = "Error While inserting Data.";
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
        finally
        {
            GetDataforAddress();
            getAddAddressData();
        }
    }

    protected void imgbtnphoneSubmit_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            ConvertToInt();
            sqlCon = new SqlConnection(GetCon());
            sqlCon.Open();

            if (Session["PhoneOperationType"] != null && Convert.ToInt32(Session["PhoneOperationType"]) == 1)
                sqlCmd = new SqlCommand("spInsertOnePhoneDetails", sqlCon);
            else
                sqlCmd = new SqlCommand("spUpdatePhoneDetails", sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@UserId", this.UserId);
            sqlCmd.Parameters.AddWithValue("@PhoneType", lblPhone.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@PhoneNumber", txtphoneno.Text.Trim());
            sqlCmd.Parameters.Add("@Msg", SqlDbType.VarChar, 50).Direction = ParameterDirection.Output;

            int i = sqlCmd.ExecuteNonQuery();
            if (i == 1)
            {
                lblMsg1.Text = "Your " + lblPhone.Text + " Phone Details Modified.";
                if (Session["PhoneOperationType"] != null && Convert.ToInt32(Session["PhoneOperationType"]) == 1)
                    lblMsg1.Text = sqlCmd.Parameters["@Msg"].Value.ToString();
                ClearTextboxforPhone();
                pnlPhone.Visible = false;
                Session["PhoneOperationType"] = null;
            }
            else
            {
                lblMsg1.Text = sqlCmd.Parameters["@Msg"].Value.ToString();
            }
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
        finally
        {
            GetDataforPhones();
            getAddPhoneData();
        }
    }

    protected void imgbtnClose_Click(object sender, ImageClickEventArgs e)
    {
        pnlAddress.Visible = false;
        lblMsg.Text = "";
    }

    protected void imgbtnPhoneClose_Click(object sender, ImageClickEventArgs e)
    {
        pnlPhone.Visible = false;
        lblMsg1.Text = "";
    }

    #endregion 

    #region Region for linkbutton command events

    protected void lnkAddAddress1_Command(object sender, CommandEventArgs e)
    {
        pnlAddress.Visible = true;
        lblAddType.Text = e.CommandArgument.ToString();
        ClearTextboxforAddress();
        lblMsg.Text = "";
        Session["AddressOperationType"] = 1;
    }

    protected void lnkAddAddress2_Command(object sender, CommandEventArgs e)
    {
        pnlAddress.Visible = true;
        lblAddType.Text = e.CommandArgument.ToString();
        ClearTextboxforAddress();
        lblMsg.Text = "";
        Session["AddressOperationType"] = 1;
    }

    protected void lnkAddPhone1_Command(object sender, CommandEventArgs e)
    {
        pnlPhone.Visible = true;
        lblPhone.Text = e.CommandArgument.ToString();
        ClearTextboxforPhone();
        lblMsg1.Text = "";
        Session["PhoneOperationType"] = 1;
    }

    protected void lnkAddPhone2_Command(object sender, CommandEventArgs e)
    {
        pnlPhone.Visible = true;
        lblPhone.Text = e.CommandArgument.ToString();
        ClearTextboxforPhone();
        lblMsg1.Text = "";
        Session["PhoneOperationType"] = 1;
    }

    #endregion

    protected void txtHno_TextChanged(object sender, EventArgs e)
    {

    }

}
