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

public partial class Employee_DisplayTicketInformationt : System.Web.UI.Page
{
    clsEmpFlightTicket objTickets = new clsEmpFlightTicket();
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
            DataSet ds = objTickets.DisplayFlightTickets();
            if (ds.Tables[0].Rows.Count != 0)
            {
                GridViewTickets.DataSource = ds.Tables[0];
                GridViewTickets.DataBind();
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
}
