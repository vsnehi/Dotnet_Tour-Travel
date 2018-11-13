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

public partial class UserControls_EmployeeSearch : System.Web.UI.UserControl
{
    clsEmp emp = new clsEmp();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsg.Text = "";
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {
            divemp.Visible = true;
            DataSet ds = emp.GetSearchEmployeeName(txtName.Text);
            if (ds.Tables[0].Rows.Count != 0)
            {
                grdName.DataSource = ds.Tables[0];
                grdName.DataBind();
            }
            else
            {
                grdName.EmptyDataText = "Name not found";
                grdName.DataBind();
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void grdName_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            DataSet ds = (DataSet)ViewState["Data"];
            if (ds.Tables[0].Rows.Count != 0)
            {
                grdName.PageIndex = e.NewPageIndex;
                grdName.DataSource = ds.Tables[0];
                grdName.DataBind();
            }

        }
        catch (Exception ex)
        {

            lblMsg.Text = ex.Message; 
        }
    }
}
