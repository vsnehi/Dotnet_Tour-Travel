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

public partial class UpdatePersonalDetails : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                BindData();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }
        lblError.Text = "";
        lblMsg.Text = "";
    }
    
    private string _HeaderText;
    private string _strCon;
    private string _strConnection;
    private int _intUserId;

    public string HeaderText
    {
        get { return _HeaderText; }
        set { _HeaderText = value; }
    }

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
            this._strCon= ConfigurationManager.ConnectionStrings[_strConnection].ConnectionString;
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
    DataSet sqlDs;
    SqlDataReader sqlDr;
    SqlConnection sqlCon;
    private void BindData()
    {
        try
        {
            ConvertToInt();
            string strCmdText = "select * from tbl_UserMaster where UserId=" + this.UserId;
            sqlCon = new SqlConnection(GetCon());
            sqlCon.Open();
            sqlCmd = new SqlCommand(strCmdText, sqlCon);
            sqlDr = sqlCmd.ExecuteReader();
            if (sqlDr.HasRows)
            {
                sqlDr.Read();
                txtEmailId.Text = sqlDr["EmailId"].ToString();
                if (sqlDr["AlternateEmailId"] != null)
                    txtAltMail.Text = sqlDr["AlternateEmailId"].ToString();
                else
                    txtFaxNo.Text = "Not Given";
                txtFaxNo.Text = sqlDr["FaxNo"].ToString();
                if (sqlDr["UserPhoto"] != null)
                {
                    BrowseImage1.LaodImageByte = (byte[])sqlDr["UserPhoto"];
                    BrowseImage1.LoadFileName = sqlDr["ImageFileName"].ToString();
                }
            }
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }


    private string _strTableName;

    public string TableName
    {
        get { return _strTableName; }
        set { _strTableName = value; }
    }

   
    protected void imgbtnSubmit_Click(object sender, ImageClickEventArgs e)
    {
        try 
        {
           // byte[] imageData;
            ConvertToInt();
            sqlCon = new SqlConnection(GetCon());
            sqlCon.Open();
            sqlCmd = new SqlCommand("spUpdateUserPersonalDetails",sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("UserId", Convert.ToInt32(this.UserId));
            sqlCmd.Parameters.AddWithValue("@EmailId", Convert.ToString(txtEmailId.Text.Trim()));
            sqlCmd.Parameters.AddWithValue("@faxNo", Convert.ToString(txtFaxNo.Text.Trim()));
            if (txtAltMail .Text != "")
                sqlCmd.Parameters.AddWithValue("@AlternateEmailId", Convert.ToString(txtAltMail.Text.Trim()));
            else
                sqlCmd.Parameters.AddWithValue("@AlternateEmailId", Convert.ToString("Not Mentioned."));
           
            if (Session["Photo"] != null && Session["FileName"] != null)
            {
                sqlCmd.Parameters.AddWithValue("@UserPhoto",(byte[])Session["Photo"]);
                sqlCmd.Parameters.AddWithValue("@ImageFileName", Convert.ToString(Session["FileName"].ToString()));
            }
            int i = sqlCmd.ExecuteNonQuery();
            if (i == 1)
            {
                lblMsg.Text = "Your Personal Details Modified.";
            }
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }

    //#region Utility Class for Converting Image data
    //public class UIUtilities
    //{
    //    static DbProviderFactory ProviderFactory = DbProviderFactories.GetFactory("System.Data.SqlClient");
    //    static DbConnection con = null;

    //    #region ReadImageFile to Convert Binary
    //    /// <summary>
    //    /// Get the Uploaded file and convert to binary for storing in Db
    //    /// </summary>
    //    /// <param name="PostedFileName">Uploaded file</param>
    //    /// <returns>Byte[] object</returns>
    //    public static byte[] ReadImageFile(string PostedFileName, string[] filetype)
    //    {
    //        bool isAllowedFileType = false;
    //        try
    //        {
    //            FileInfo file = new FileInfo(PostedFileName);

    //            foreach (string strExtensionType in filetype)
    //            {
    //                if (strExtensionType == file.Extension)
    //                {
    //                    isAllowedFileType = true;
    //                    break;
    //                }
    //            }
    //            if (isAllowedFileType)
    //            {
    //                //Create a new filestream object based on the file chosen in the FileUpload control

    //                FileStream fs = new FileStream(PostedFileName, FileMode.Open, FileAccess.Read);

    //                //Create a binary reader object to read the binary contents of the file to upload

    //                BinaryReader br = new BinaryReader(fs);

    //                //dump the bytes read into a new byte variable named image

    //                byte[] image = br.ReadBytes((int)fs.Length);

    //                //close the binary reader

    //                br.Close();

    //                //close the filestream

    //                fs.Close();

    //                return image;
    //            }
    //            return null;
    //        }
    //        catch (Exception ex)
    //        {
    //            throw ex;
    //        }

    //    }
    //    #endregion

    //    #region GetTempFolderName
    //    /// <summary>
    //    /// returns the Temp Folder Name to store Images & resumes
    //    /// </summary>
    //    /// <returns>string Folder Name</returns>
    //    public static string GetTempFolderName()
    //    {
    //        string strTempFolderName = Environment.GetFolderPath(Environment.SpecialFolder.InternetCache) + @"\";

    //        if (Directory.Exists(strTempFolderName))
    //        {
    //            return strTempFolderName;
    //        }
    //        else
    //        {
    //            Directory.CreateDirectory(strTempFolderName);
    //            return strTempFolderName;
    //        }
    //    }
    //    #endregion
    //}
    //#endregion
}
