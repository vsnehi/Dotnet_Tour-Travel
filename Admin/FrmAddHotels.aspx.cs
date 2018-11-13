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

public partial class Admin_Hotels_Master_FrmAddHotels : System.Web.UI.Page
{
    clsVisaType objVisaType = new clsVisaType();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            lblMsg.Text = "";
            if (!IsPostBack)
            {
                PopulateData();
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
            GridViewHotel.DataSource = objVisaType.ShowHotels(); ;
            GridViewHotel.DataBind();
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
            objVisaType.HotelName = txtHotelName.Text.Trim();
            objVisaType.Address = txtHotelAddr.Text.Trim();
            objVisaType.Phone = txtPhone.Text.Trim();
            objVisaType.Name = txtPName.Text.Trim();
            objVisaType.MinCharge = Convert.ToDouble(txtMinCharge.Text.Trim());
            objVisaType.MaxCharge = Convert.ToDouble(txtMaxCharge.Text.Trim());

            int Flag = objVisaType.InsertHotels();
            if (Flag == 1)
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert('Hotels Inserted')</script>");
                btnClear_Click(sender, e);
            }
            else if (Flag == 0)
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert('Bad Server Request, Try again')</script>");
                btnClear_Click(sender, e);
            }
            else if (Flag == 2)
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert(Hotels Already Inserted')</script>");
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
            txtHotelName.Text = "";
            txtHotelAddr.Text = "";
            txtPhone.Text = "";
            txtPName.Text = "";
            txtMinCharge.Text = "";
            txtMaxCharge.Text = "";
            txtHotelName.Focus();
            DivHotel.Visible = false;
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
            DivHotel.Visible = true;
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("FrmModifyHotels.aspx");
    }
}
