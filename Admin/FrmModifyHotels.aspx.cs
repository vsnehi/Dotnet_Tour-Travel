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

public partial class Admin_Hotels_Master_FrmModifyHotels : System.Web.UI.Page
{
    clsVisaType objVisaType = new clsVisaType();
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
    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            objVisaType.HotelId  = Convert.ToInt32(DdlHotelName.SelectedItem.Value);
            objVisaType.HotelName = DdlHotelName.SelectedItem.Text;
            objVisaType.Address = txtHotelAddr.Text.Trim();
            objVisaType.Phone =txtPhone.Text.Trim();
            objVisaType.Name = txtPName.Text.Trim();
            objVisaType.MinCharge = Convert.ToDouble(txtMinCharge.Text.Trim());
            objVisaType.MaxCharge = Convert.ToDouble(txtMaxCharge.Text.Trim());

            int Flag = objVisaType.ModifyHotels();
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
   protected void DdlHotelName_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {

            int HtId = Convert.ToInt32(DdlHotelName.SelectedValue);
            DataSet ds = clsVisaType.GetHotelDataByHotelId(HtId);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dRow = ds.Tables[0].Rows[0];
                txtHotelAddr.Text = dRow[2].ToString();
                txtPhone.Text = dRow[3].ToString();
                txtPName.Text = dRow[4].ToString();
                txtMinCharge.Text = dRow[5].ToString();
                txtMaxCharge.Text = dRow[6].ToString();

            }
            else
            {
                lblMsg.Text = "There is no data for the selected VisaTypes";
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
   protected void BtnBack_Click(object sender, EventArgs e)
   {
       Response.Redirect("FrmAddHotels.aspx");
   }
}

