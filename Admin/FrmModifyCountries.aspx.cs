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

public partial class Admin_Countries_Master_FrmModifyCountries : System.Web.UI.Page
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
            DdlCountryName.DataSource = objVisaType.ShowCountries();
            DdlCountryName.DataTextField = "CountryName";
            DdlCountryName.DataValueField = "CountryId";
            DdlCountryName.DataBind();
            DdlCountryName.Items.Insert(0, "Select");
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
            objVisaType.CountryId = Convert.ToInt32(DdlCountryName.SelectedItem.Value);
            objVisaType.Name = DdlCountryName.SelectedItem.Text;
            objVisaType.Abbreviation = txtCountryAbbr.Text.Trim();
            objVisaType.Description = txtCountryDesc.Text.Trim();
            objVisaType.Map = (byte[])Session["Photo"];
            objVisaType.MapFile = Session["FileName"].ToString();
            objVisaType.Flag = (byte[])Session["FlagPhoto"];
            objVisaType.FlagFile = Session["FlagFileName"].ToString();
            if (Session["VideoFileContent"] != null || Session["VideoFileName"] != null)
            {
                objVisaType.Video = (byte[])Session["VideoFileContent"];
                objVisaType.VideoFile = Session["VideoFileName"].ToString();
            }
            else
            {
                objVisaType.Video = (byte[])ViewState["VideoFileContent"];
                objVisaType.VideoFile = ViewState["VideoFileName"].ToString();
            }
            int Flag = objVisaType.ModifyCountries();
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
   
    protected void DdlCountryName_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {

          objVisaType.CountryId = Convert.ToInt32(DdlCountryName.SelectedValue);
            DataSet ds = objVisaType.GetCountryDataByCountryId();
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dRow = ds.Tables[0].Rows[0];
                txtCountryAbbr.Text = dRow[2].ToString();
                txtCountryDesc.Text = dRow[3].ToString();
                BrowseImage1.LaodImageByte = (byte[])dRow[4];
                BrowseImage1.LoadFileName = Convert.ToString(dRow[5]);
                BrowseImage1.LoadImage();
                BrowseImage2.LaodImageByte = (byte[])dRow[6];
                BrowseImage2.LoadFileName = Convert.ToString(dRow[7]);
                BrowseImage2.LoadImage();
                if (Session["VideoFileContent"] == null || Session["VidoeFileName"] == null)
                {
                    ViewState["VideoFileContent"] = (byte[])dRow[8];
                    ViewState["VideoFileName"] = (string)dRow[9];
                }
               
            }
            else
            {
                lblMsg.Text = "There is no data";
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("FrmAddCountries.aspx");
    }
}

