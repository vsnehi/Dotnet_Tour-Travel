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

public partial class UserControls_PassportSearch : System.Web.UI.UserControl
{
    clsPassport objPassport = new clsPassport();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsg.Text = "";
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {
            divpassport.Visible = true;
            DataSet ds = objPassport.GetPassportSearch(txtPassportNo.Text);
                if(ds.Tables[0].Rows.Count !=0)
                {
                    grdPassport.DataSource =ds.Tables[0];
                    grdPassport.DataBind();
                }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void grdPassport_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            DataSet ds = (DataSet)ViewState["Data"];
            if (ds.Tables[0].Rows.Count != 0)
            {
                grdPassport.PageIndex = e.NewPageIndex;
                grdPassport.DataSource = ds.Tables[0];
                grdPassport.DataBind();
            }
        }
        catch (Exception ex)
        {

            lblMsg.Text = ex.Message;
        }
    }
}
