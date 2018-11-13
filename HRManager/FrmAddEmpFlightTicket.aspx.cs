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

public partial class Travel_Sheduling_FrmAddEmpFlightTicket : System.Web.UI.Page
{
    clsEmpFlightTicket objTicket = new clsEmpFlightTicket();
    clsPassport objPassport = new clsPassport();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            lblMsg.Text = "";
            if (!IsPostBack)
            {
                PopulateData();
                PopulateCombos();
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    public void PopulateData()
    {
        try
        {
            DataSet ds = objTicket.DisplayFlightTickets();
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
    public void PopulateCombos()
    {
        try
        {
            DdlEmpId.DataSource = objPassport.ShowEmployeeTravel();
            DdlEmpId.DataTextField = "EmployeeId";
            DdlEmpId.DataValueField = "EmployeeId";
            DdlEmpId.DataBind();
            DdlEmpId.Items.Insert(0, "Select");

            DdlEmpTravelId.DataSource = objPassport.ShowEmployeeTravel();
            DdlEmpTravelId.DataTextField = "EmployeeTravelId";
            DdlEmpTravelId.DataValueField = "EmployeeTravelId";
            DdlEmpTravelId.DataBind();
            DdlEmpTravelId.Items.Insert(0, "Select");

        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }

    protected void BtnAdd_Click(object sender, EventArgs e)
    {
        try
        {

            objTicket.EmpTravelId = Convert.ToInt32(DdlEmpTravelId.SelectedValue);
            objTicket.EmpId = Convert.ToInt32(DdlEmpId.SelectedValue);
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
            objTicket.ContactNo =txtContactNo.Text.Trim();

            int Flag = objTicket.InsertEmployeeTickets();
            if (Flag == 1)
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert('Ticket Inserted')</script>");
                btnClear_Click(sender, e);
            }
            else if (Flag == 0)
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert('Bad Server Request, Try again')</script>");
                btnClear_Click(sender, e);
            }
            else if (Flag == 2)
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert(Ticket Already Inserted')</script>");
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        try
        {
            DdlEmpTravelId.SelectedIndex = 0;
            DdlEmpId.SelectedIndex = 0;
            txtTicketNo.Text = "";
            txtBookedDate.Text = "";
            txtFromDate.Text = "";
            txtTODate.Text = "";
            txtTicketFrom.Text = "";
            txtTicketTo.Text = "";
            txtSeatNo.Text = "";
            txtName.Text = "";
            txtBit.Text = "";
            txtAgent.Text = "";
            txtInchargePerson.Text = "";
            txtContactNo.Text = "";

            DivTickets.Visible = false;
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void BtnView_Click(object sender, EventArgs e)
    {
        try
        {
            PopulateData();
            DivTickets.Visible = true;
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void BtnModify_Click(object sender, EventArgs e)
    {
        Response.Redirect("FrmModifyEmpFlightTicket.aspx");
    }
}

