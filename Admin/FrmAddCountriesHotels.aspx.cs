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

public partial class Admin_CountriesHotels_FrmAddCountriesHotels : System.Web.UI.Page
{
    clsVisaType objVisaType = new clsVisaType();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        if (!IsPostBack)
        {
           
            PopulateCombos();
        }
    }
    
    public void PopulateCombos()
    {
        try
        {
            DdlCountryName.DataSource = objVisaType.ShowCountries();
            DdlCountryName.DataTextField = "CountryName";
            DdlCountryName.DataValueField = "CountryId";
            DdlCountryName.DataBind();
            DdlCountryName.Items.Insert(0, "Select");

            DdlHotelName.DataSource = objVisaType.ShowHotels();
            DdlHotelName.DataTextField = "HotelName";
            DdlHotelName.DataValueField = "HotelId";
            DdlHotelName.DataBind();
            DdlHotelName.Items.Insert(0, "Select");
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
            objVisaType.CountryId = Convert.ToInt32(DdlCountryName.SelectedItem.Text);
            objVisaType.HotelId =Convert.ToInt32(DdlHotelName.SelectedItem.Text);
            int Flag = objVisaType.InsertCountriesHotels();
            if (Flag == 1)
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert('Record Inserted')</script>");
                btnClear_Click(sender, e);
            }
            else if (Flag == 0)
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert('Bad Server Request, Try again')</script>");
                btnClear_Click(sender, e);
            }
            else if (Flag == 2)
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert('Record Already There')</script>");
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
            DdlCountryName.SelectedIndex = 0;
            DdlHotelName.SelectedIndex = 0;
            
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
 
}
