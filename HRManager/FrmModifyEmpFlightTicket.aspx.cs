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

public partial class Travel_Sheduling_FrmModifyEmpFlightTicket : System.Web.UI.Page
{
    clsEmpFlightTicket objTicket = new clsEmpFlightTicket();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        try
        {
            if (!IsPostBack)
            {
                PopulateCombo();
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }

    public void PopulateCombo()
    {
        try
        {
            DdlEmpTIcketId.DataSource = objTicket.ShowEmployeeTickets();
            DdlEmpTIcketId.DataTextField = "EmployeeTicketId";
            DdlEmpTIcketId.DataValueField = "EmployeeTicketId";
            DdlEmpTIcketId.DataBind();
            DdlEmpTIcketId.Items.Insert(0, "Select");
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            objTicket.EmpTicketId = Convert.ToInt32(DdlEmpTIcketId.SelectedValue);
            objTicket.TicketNo = Convert.ToInt32(txtTicketNo.Text.Trim());
            objTicket.BookedDate = txtBookedDate.Text.Trim();
            objTicket.FromDate = txtFromDate.Text.Trim();
            objTicket.ToDate = txtTODate.Text.Trim();
            objTicket.TicketFrom = txtTicketFrom.Text.Trim();
            objTicket.TicketTo = txtTicketTo.Text.Trim();
            objTicket.SeatNo = txtSeatNo.Text.Trim();
            objTicket.Name = txtName.Text.Trim();
            objTicket.Bit = txtBit.Text.Trim();
            objTicket.TravelAgent = txtAgent.Text.Trim();
            objTicket.InchargePerson = txtInchargePerson.Text.Trim();
            objTicket.PersonImage = (byte[])Session["Photo"];
            objTicket.PersonFile = Session["FileName"].ToString();
            objTicket.ContactNo = txtContactNo.Text.Trim();

            int Flag = objTicket.ModifyEmployeeTickets();
            if (Flag == 1)
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert('Record is  Updated')</script>");

            }
            else
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert('Record is not Updated/script>");

            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }


    protected void DdlEmpTIcketId_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            int TcId = Convert.ToInt32(DdlEmpTIcketId.SelectedValue);
            DataSet ds = clsEmpFlightTicket.GetEmployeeDataByTicketId(TcId);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dRow = ds.Tables[0].Rows[0];
                txtTicketNo.Text = dRow[3].ToString();
                txtBookedDate.Text = dRow[4].ToString();
                txtFromDate.Text = dRow[5].ToString();
                txtTODate.Text = dRow[6].ToString();
                txtTicketFrom.Text = dRow[7].ToString();
                txtTicketTo.Text = dRow[8].ToString();
                txtSeatNo.Text = dRow[9].ToString();
                txtName.Text = dRow[10].ToString();
                txtBit.Text = dRow[11].ToString();
                txtAgent.Text = dRow[12].ToString();
                txtInchargePerson.Text = dRow[13].ToString();
                BrowseImage1.LaodImageByte = (byte[])dRow[14];
                BrowseImage1.LoadFileName = Convert.ToString(dRow[15]);
                BrowseImage1.LoadImage();
                txtContactNo.Text = dRow[16].ToString();
            }
            else
            {
                lblMsg.Text = "There is no data for the selected Tickets";
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }

    }
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("FrmAddEmpFlightTicket.aspx");
    }
}
