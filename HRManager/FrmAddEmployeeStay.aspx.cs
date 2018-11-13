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

public partial class Travel_Sheduling_FrmAddEmployeeStay : System.Web.UI.Page
{
    clsPassport objPassport = new clsPassport();
    clsVisaType objVisaType = new clsVisaType();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        if (!IsPostBack)
        {
            PopulateData();
            PopulateCombos();
        }
    }
    public void PopulateData()
    {
        try
        {
            DataSet ds = objVisaType.DisplayEmployeeStay();
            if (ds.Tables[0].Rows.Count != 0)
            {
                GridViewStay.DataSource = ds.Tables[0];
                GridViewStay.DataBind();
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
            DdlEmpTravelId.DataSource = objPassport.ShowEmployeeTravel();
            DdlEmpTravelId.DataTextField = "EmployeeTravelId";
            DdlEmpTravelId.DataValueField = "EmployeeTravelId";
            DdlEmpTravelId.DataBind();
            DdlEmpTravelId.Items.Insert(0, "Select");

            DdlCountryId.DataSource = objVisaType.ShowCountries();
            DdlCountryId.DataTextField = "CountryName";
            DdlCountryId.DataValueField = "CountryId";
            DdlCountryId.DataBind();
            DdlCountryId.Items.Insert(0, "Select");

            DdlHotelId.DataSource = objVisaType.ShowHotels();
            DdlHotelId.DataTextField = "HotelName";
            DdlHotelId.DataValueField = "HotelId";
            DdlHotelId.DataBind();
            DdlHotelId.Items.Insert(0, "Select");
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
            objVisaType.EmployeeTravelId = Convert.ToInt32(DdlEmpTravelId.SelectedValue);
            objVisaType.HotelId = Convert.ToInt32(DdlHotelId.SelectedValue);
            objVisaType.RoomNo = txtRoomNo.Text.Trim();
            objVisaType.Reservation = txtReservationNo.Text.Trim();
            objVisaType.Status = ChkStatus.Checked;
            objVisaType.VehicleNo = txtVehicleNo.Text.Trim();
            objVisaType.CountryId = Convert.ToInt32(DdlCountryId.SelectedValue);
            objVisaType.Name = txtName.Text.Trim();
            objVisaType.Contact = txtContact.Text.Trim();
            objVisaType.PersonImage = (byte[])Session["Photo"];
            objVisaType.PersonFile = Session["FileName"].ToString();

            int Flag = objVisaType.InsertEmployeeStay();
            if (Flag == 1)
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert('Emp Stay Inserted')</script>");
                btnClear_Click(sender, e);
            }
            else if (Flag == 0)
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert('Bad Server Request, Try again')</script>");
                btnClear_Click(sender, e);
            }
            else if (Flag == 2)
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert('Emp Stay Already Inserted')</script>");
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
            DdlHotelId.SelectedIndex = 0;
            txtRoomNo.Text = "";
            txtReservationNo.Text = "";
            txtVehicleNo.Text = "";
            DdlCountryId.SelectedIndex = 0;
            txtContact.Text = "";
            txtName.Text = "";
            DivStay.Visible = false;
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
            DivStay.Visible = true;
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }

    protected void BtnModify_Click(object sender, EventArgs e)
    {
        Response.Redirect("FrmModifyEmployeeStay.aspx");
    }
}
