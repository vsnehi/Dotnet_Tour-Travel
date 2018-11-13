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

public partial class Admin_frmReportEmployeeVisa : System.Web.UI.Page
{
    clsEmp emp = new clsEmp();
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
            DataSet ds = emp.ShowReportEmployeeVisa();
            if (ds.Tables[0].Rows.Count != 0)
            {
                GridViewVisa.DataSource = ds.Tables[0];
                GridViewVisa.DataBind();
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
}
