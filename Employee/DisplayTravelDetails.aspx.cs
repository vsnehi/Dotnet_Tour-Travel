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

public partial class Employee_DisplayTravelDetails : System.Web.UI.Page
{
    clsPassport objPassport = new clsPassport();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        if (!IsPostBack)
        {
            PopulateData();
        }
    }
    public void PopulateData()
    {
        try
        {
            DataSet ds = objPassport.DisplayEmployeeTravel();
            if (ds.Tables[0].Rows.Count != 0)
            {
                GridViewTravel.DataSource = ds.Tables[0];
                GridViewTravel.DataBind();
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }

}
