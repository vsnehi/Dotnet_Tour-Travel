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
using System.Data.Common;
using System.IO;
public partial class UserControls_RegistrationCotrol : System.Web.UI.UserControl
{

    #region PageLoad Event
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblTitle.Text = HeaderText;
            lblError.Text = "";
            lblAvail.Text = "";
            lblPhonetype.Text = "";
            lblAddressMsg.Text = "";
            clearSessions();
        }
        lblPhonetype.Text = "";
        lblAddressMsg.Text = "";
    }
    #endregion

    #region private variables
    private string _HeaderText;
    byte[] imageData = null;
    private string _strTableName;
    private string _strConnection;
    string _strCon;
    SqlCommand cmd;
    SqlConnection cn;
    SqlDataReader dr;
    SqlParameter p;
    int i;
    private string _strColName;
    #endregion
    private string _RedirectPage;

    

    #region Public properties

    public string RedirectPage
    {
        get { return _RedirectPage; }
        set { _RedirectPage = value; }
    }

    public string GetCon()
    {
        if (!String.IsNullOrEmpty(this._strConnection))
            _strCon = ConfigurationManager.ConnectionStrings[_strConnection].ConnectionString;
        else
            _strCon = "Connection Not Established";
        return _strCon;
    }
    public string StrCon
    {
        get { return _strCon; }
        set { _strCon = value; }
    }
    public string ConnectionName
    {
        get { return _strConnection; }
        set { _strConnection = value; }
    }
    public string HeaderText
    {
        get { return _HeaderText; }
        set { _HeaderText = value; }
    }
    public string TableName
    {
        get { return _strTableName; }
        set { _strTableName = value; }
    }
    public string ColumnName
    {
        get { return _strColName; }
        set { _strColName = value; }
    }
    #endregion

    #region form button Events
    protected void btnCheck_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtUserName.Text == "")
                lblAvail.Text = "Enter Desired LoginName To Check";
            else
            {
                if (!String.IsNullOrEmpty(this._strTableName))
                {
                    if (!String.IsNullOrEmpty(this._strColName))
                    {
                        int j = GetAvailability();
                        if (j == 1)
                        {
                            lblAvail.Text = "Already In Use";
                        }
                        else
                        {
                            lblAvail.Text = "You can Use This";
                        }
                    }
                    else
                        Page.RegisterClientScriptBlock("", "<script>alert('Set the Column Name Property')</script>");
                }
                else
                    Page.RegisterClientScriptBlock("", "<script>alert('Set the Table Name Property')</script>");
            }
        }
        catch (Exception ex)
        {
            lblAvail.Text = "Error In Code";
        }
    }
    protected void btnSubmit_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            InsertUserDetails();
        }
        catch (Exception ex)
        {
            lblError.Text = "Error " + ex.Message;
        }
    }
    #endregion

    #region insert registration Data into Database
    private void InsertUserDetails()
    {
        try
        {
            cn = new SqlConnection(GetCon());
            cn.Open();
            cmd = new SqlCommand("spInsertUserDetails", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@FirstName", Convert.ToString(txtFirstName.Text.Trim()));
            cmd.Parameters.AddWithValue("@LastName", Convert.ToString(txtLastName.Text.Trim()));
            cmd.Parameters.AddWithValue("@Gender", Convert.ToString(ddlGender.SelectedItem.Text.Trim()));
            cmd.Parameters.AddWithValue("@UserDOB", Convert.ToDateTime(txtDob.Text));
            cmd.Parameters.AddWithValue("@EmailId", Convert.ToString(txtEmailID.Text.Trim()));
            if (txtAltEmailID.Text != "")
                cmd.Parameters.AddWithValue("@AlternateEmailId", Convert.ToString(txtAltEmailID.Text.Trim()));
            else
                cmd.Parameters.AddWithValue("@AlternateEmailId", Convert.ToString("AlternatemailId Not Mentioned."));
            byte[] imageConData = null;
            if (Session["Photo"] != null && Session["FileName"] != null)
            {
                imageConData = (byte[])Session["Photo"];
                cmd.Parameters.AddWithValue("@UserPhoto", imageConData);
                cmd.Parameters.AddWithValue("@ImageFileName", Convert.ToString(Session["FileName"].ToString()));
            }
            else
            {
                imageConData = UIUtilities.ReadImageFile("~/Images/NoImage.jpg", new string[] { ".jpg" });
                cmd.Parameters.AddWithValue("@UserPhoto", imageConData);
                cmd.Parameters.AddWithValue("@ImageFileName", "NoImage.jpg");
            }

            cmd.Parameters.AddWithValue("@UserLoginId", Convert.ToString(txtUserName.Text.Trim()));
            cmd.Parameters.AddWithValue("@Password", Convert.ToString(txtConfirm.Text.Trim()));
            cmd.Parameters.AddWithValue("@HintQuestion", Convert.ToString(ddlSecQues.SelectedItem.Text.Trim()));
            cmd.Parameters.AddWithValue("@HintAnswer", Convert.ToString(txtSecAns.Text.Trim()));

            cmd.Parameters.AddWithValue("@FaxNo", Convert.ToString(txtFaxNo.Text.Trim()));
            cmd.Parameters.Add("@Flag", SqlDbType.Int).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@PhoneFlag", SqlDbType.Int).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@AddressFlag", SqlDbType.Int).Direction = ParameterDirection.Output;

            cmd.Parameters.AddWithValue("@AddressCount", Convert.ToString(Session["AddressCount"]));
            cmd.Parameters.AddWithValue("@Address1", Convert.ToString(Session["Address1"]));
            cmd.Parameters.AddWithValue("@Address2", Convert.ToString(Session["Address2"]));
            cmd.Parameters.AddWithValue("@Address3", Convert.ToString(Session["Address3"]));

            cmd.Parameters.AddWithValue("@PhoneCount", Convert.ToString(Session["PhoneCount"]));
            cmd.Parameters.AddWithValue("@PhoneString1", Convert.ToString(Session["Phone1"]));
            cmd.Parameters.AddWithValue("@PhoneString2", Convert.ToString(Session["Phone2"]));
            cmd.Parameters.AddWithValue("@PhoneString3", Convert.ToString(Session["Phone3"]));

            cmd.ExecuteNonQuery();
            int j = Convert.ToInt32(cmd.Parameters["@Flag"].Value);
            string strAddressError = Convert.ToString(cmd.Parameters["@AddressFlag"].Value);
            string strPhoneError = Convert.ToString(cmd.Parameters["@PhoneFlag"].Value);

            if (j == 1)
            {
                Session["FileName"] = null;
                Session["Photo"] = null;
                clearSessions();
                _addCount = 0;
                _PhoneCount = 0;
                 Server.Transfer(RedirectPage);
            }
            else
            {
                lblError.Text = "Error :" + Convert.ToString(strAddressError) + Convert.ToString(strPhoneError);
            }
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
        finally
        {
            cn.Close();
        }
    }
    #endregion

    #region Get The User Desired LoginName Exsistance
    public int GetAvailability()
    {
        try
        {
            string strText = "select " + this._strColName + " from " + this._strTableName + " where " + this._strColName + "='" + txtUserName.Text.Trim() + "'";
            cn = new SqlConnection(GetCon());
            cn.Open();
            cmd = new SqlCommand(strText, cn);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                if (dr.HasRows)
                {
                    i = 1;
                }
            }
            else
            {
                i = 0;
            }
            return i;
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
        finally
        {
            cn.Close();
        }
    }
    #endregion

    #region Utility Class for Converting Image data
    public class UIUtilities
    {
        static DbProviderFactory ProviderFactory = DbProviderFactories.GetFactory("System.Data.SqlClient");
        static DbConnection con = null;

        #region ReadImageFile to Convert Binary
        /// <summary>
        /// Get the Uploaded file and convert to binary for storing in Db
        /// </summary>
        /// <param name="PostedFileName">Uploaded file</param>
        /// <returns>Byte[] object</returns>
        public static byte[] ReadImageFile(string PostedFileName, string[] filetype)
        {
            bool isAllowedFileType = false;
            try
            {
                FileInfo file = new FileInfo(PostedFileName);

                foreach (string strExtensionType in filetype)
                {
                    if (strExtensionType == file.Extension)
                    {
                        isAllowedFileType = true;
                        break;
                    }
                }
                if (isAllowedFileType)
                {
                    //Create a new filestream object based on the file chosen in the FileUpload control

                    FileStream fs = new FileStream(PostedFileName, FileMode.Open, FileAccess.Read);

                    //Create a binary reader object to read the binary contents of the file to upload

                    BinaryReader br = new BinaryReader(fs);

                    //dump the bytes read into a new byte variable named image

                    byte[] image = br.ReadBytes((int)fs.Length);

                    //close the binary reader

                    br.Close();

                    //close the filestream

                    fs.Close();

                    return image;
                }
                return null;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        #endregion

        #region GetTempFolderName
        /// <summary>
        /// returns the Temp Folder Name to store Images & resumes
        /// </summary>
        /// <returns>string Folder Name</returns>
        public static string GetTempFolderName()
        {
            string strTempFolderName = Environment.GetFolderPath(Environment.SpecialFolder.InternetCache) + @"\";

            if (Directory.Exists(strTempFolderName))
            {
                return strTempFolderName;
            }
            else
            {
                Directory.CreateDirectory(strTempFolderName);
                return strTempFolderName;
            }
        }
        #endregion
    }
    #endregion

    #region for address

    private int _addCount = 0;

    protected void imgBtnAddAddress_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            _addCount = Convert.ToInt32(Session["AddressCount"]) + 1;
            Session["AddressCount"] = _addCount;
            string strText = Convert.ToString(ddlAddType.SelectedItem.Text.Trim())
                    + "^" + Convert.ToString(txtDNO.Text.Trim()) + "^" + Convert.ToString(txtStreet.Text.Trim())
                     + "^" + Convert.ToString(txtCity.Text.Trim()) + "^" + Convert.ToString(txtPin.Text.Trim())
                     + "^" + Convert.ToString(txtState.Text.Trim()) + "^" + Convert.ToString(txtCountry.Text.Trim());

            if (_addCount == 1)
            {
                Session["Address1"] = strText;
                lblAddressMsg.Text = "Your " + ddlAddType.SelectedItem.Text + " Address Added. To add another select AddressType and Enter Address fields then click Add.";
                ddlAddType.Focus();
            }
            else if (_addCount == 2)
            {
                Session["Address2"] = strText;
                lblAddressMsg.Text = "Your " + ddlAddType.SelectedItem.Text + " Address also Added.";
                ddlAddType.Focus();
            }
            else if (_addCount == 3)
            {
                Session["Address3"] = strText;
                lblAddressMsg.Text = "Thanks for giving three types of address.";
                imgBtnAddAddress.Enabled = false;
                ddlPhonetype.Focus();
            }
            ddlAddType.Items.RemoveAt(ddlAddType.SelectedIndex);
            ClearAddressTextFields();
            if (_addCount != 0)
                imgbtnAddPhoneNo.Enabled = true;
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }

    void ClearAddressTextFields()
    {
        txtDNO.Text = ""; txtCity.Text = ""; txtState.Text = "";
        txtStreet.Text = ""; txtPin.Text = ""; txtCountry.Text = "";
    }
    #endregion

    void clearSessions()
    {
        Session["AddressCount"] = null;
        Session["Address1"] = null;
        Session["Address2"] = null;
        Session["Address3"] = null;

        Session["PhoneCount"] = null;
        Session["Phone1"] = null;
        Session["Phone2"] = null;
        Session["Phone3"] = null;
    }

    #region  for phone numbers

    private int _PhoneCount = 0;
    protected void imgbtnAddPhoneNo_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            _PhoneCount = Convert.ToInt32(Session["PhoneCount"]) + 1;
            Session["PhoneCount"] = _PhoneCount;
            string strText = Convert.ToString(ddlPhonetype.SelectedItem.Text.Trim())
                              + "^" + Convert.ToString(txtPhoneNo.Text.Trim());
            if (_PhoneCount == 1)
            {
                Session["Phone1"] = strText;
                lblPhonetype.Text = "Your " + ddlPhonetype.SelectedItem.Text + " Phone No Added. Add to anther Select 'PhoneType' and enter 'Phone Number' add click add button.";
                ddlPhonetype.Focus();
            }
            else if (_PhoneCount == 2)
            {
                Session["Phone2"] = strText;
                lblPhonetype.Text = "Your " + ddlPhonetype.SelectedItem.Text + " Phone No also Added.";
                ddlPhonetype.Focus();
            }
            else if (_PhoneCount == 3)
            {
                Session["Phone3"] = strText;
                lblPhonetype.Text = " Thanks for giving three types of phone numbers.";
                imgbtnAddPhoneNo.Enabled = false;
                txtUserName.Focus();
            }
            ddlPhonetype.Items.RemoveAt(ddlPhonetype.SelectedIndex);
            txtPhoneNo.Text = "";
            if (_PhoneCount != 0)
                btnSubmit.Enabled = true;
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }
    #endregion
    #region for LastUserId
    public void GetUserId()
    {
        try
        {
            cn = new SqlConnection(GetCon());
            cn.Open();
            cmd = new SqlCommand("select max(UserId) from tbl_UserMaster", cn);
           int id= Convert.ToInt32(cmd.ExecuteScalar());
           Session["UserId"] = id; 
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message.ToString();    
        }
    }
#endregion
}
