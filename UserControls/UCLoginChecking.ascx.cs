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

public partial class UserControls_UCLoginChecking : System.Web.UI.UserControl
{

    protected void Page_Load(object sender, EventArgs e)
    {
        txtUserName.Focus();
    }

    private string _strConnectionString;

    public string ConnectionString
    {
        get { return _strConnectionString; }
        set { _strConnectionString = value; }
    }
    private string _redirectPage;

    public string RedirectPage
    {
        get { return _redirectPage; }
        set { _redirectPage = value; }
    }

    public string GetConnection()
    {
        string strCon;
        if (!string.IsNullOrEmpty(_strConnectionString))
        {
            strCon =ConfigurationManager.ConnectionStrings["" + _strConnectionString + ""].ConnectionString;
        }
        else
            strCon = "Connetion Not Established";
        return strCon;
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        try
        {
            int i = UserLoginChecking();
            if (i == 1)
            {
                Session["UserName"] = txtUserName.Text.ToUpper();
                Session["UserId"] = UserId;
                Session["UserLoginDate"] = DateTime.Now.ToShortDateString();
                Session["UserLoginTime"] = DateTime.Now.ToShortTimeString();
                FormsAuthentication.RedirectFromLoginPage(txtUserName.Text, ChkRemember.Checked);
            }
            else if (i == 2)
            {
                lblError.Text = "User Not Exists";  
            }
            else if (i == 3)
            {
                lblError.Text = "Password is Wrong";  
            }
            else if(i==4)
            {
                lblError.Text = "User Name Wrong";  
            }
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }

    SqlCommand cmd;
    SqlConnection cn;
    static int UserId;

    public int UserLoginChecking()
    {
        try
        {
            cn = new SqlConnection(GetConnection());
            cn.Open();
            cmd = new SqlCommand("SpVerifyUserLogin", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserLoginId", txtUserName.Text.Trim());
            string s ;//= CryptUtil1.Encrypt(txtPassword.Text);
            //cmd.Parameters.AddWithValue("@Password", CryptUtil1.Encrypt(txtPassword.Text.Trim()));
            cmd.Parameters.Add("@UserId", SqlDbType.Int).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@Flag", SqlDbType.Int).Direction = ParameterDirection.Output;
            cmd.ExecuteNonQuery();
            
            int Flag = Convert.ToInt32(cmd.Parameters["@Flag"].Value);
            if (Flag == 1)
            {
                UserId = Convert.ToInt32(cmd.Parameters["@UserId"].Value);
            }
 
            return Flag;
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

    protected void btnForgot_Click(object sender, EventArgs e)
    {
        if (txtForgotUserName.Text.Length != 0)
        {
           Server.Transfer("~/FrmForgotPassword.aspx?UserName="+txtForgotUserName.Text);  
        }
    }

}
