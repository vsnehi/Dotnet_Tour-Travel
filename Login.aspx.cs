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

public partial class Login : System.Web.UI.Page
{
    clsLogin objLogin = new clsLogin();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
            string str1 = null;
            string[] UserName = null;
        try
        {
            if (txtUserName.Text.Contains("@"))
            {
                string str = txtUserName.Text;
                UserName = str.Split('@');
                clsLogin.UserName = UserName[0].ToString();
                str1 = UserName[0].ToString();
            }
            else
            {
                clsLogin.UserName = txtUserName.Text.Trim();
                str1 = txtUserName.Text.Trim();
            }
            clsLogin.Password = txtPassword.Text.Trim();
            string Role = objLogin.GetUserLogin();

            if (Role == "NoUser")
                lblMsg.Text = "User Name and password mismatch. Try again.";
            else
                if (Role == "Admin")
                {
                    Session["UserName"] = str1;
                   Response.Redirect("~/Admin/AdminHome.aspx");
                }
                else if (Role == "Manager")
                {
                    Session["UserName"] = str1;
                    Response.Redirect("~/HRManager/ManagerHome.aspx");
                }
                else if (Role == "Employee")
                {
                    Session["UserName"] = str1;
                    Response.Redirect("~/Employee/EmployeeHome.aspx");

                }

            }
        
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
            
        }
    }
}
