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

public partial class UserControls_TicketSearch : System.Web.UI.UserControl
{
    clsEmpFlightTicket objTicket = new clsEmpFlightTicket();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsg.Text = "";
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {
            divTicket.Visible  = true;
            int TicketNo=Convert.ToInt32(txtTicketNo.Text);
            DataSet ds = clsEmpFlightTicket.GetTicketSearch(TicketNo);
            if (ds.Tables[0].Rows.Count != 0)
            {
                grdTicket.DataSource = ds.Tables[0];
                grdTicket.DataBind();
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void grdTicket_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            DataSet ds = (DataSet)ViewState["Data"];
            if (ds.Tables[0].Rows.Count != 0)
            {
                grdTicket.PageIndex = e.NewPageIndex;
                grdTicket.DataSource = ds.Tables[0];
                grdTicket.DataBind();
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
}
