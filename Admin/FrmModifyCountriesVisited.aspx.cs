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

public partial class Admin_Countries_Visited_FrmModifyCountrisVisited : System.Web.UI.Page
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
            DdlCountryVisitedId.DataSource = objVisaType.ShowCountriesVisited();
            DdlCountryVisitedId.DataTextField = "CountryVisitId";
            DdlCountryVisitedId.DataValueField = "CountryVisitId";
            DdlCountryVisitedId.DataBind();
            DdlCountryVisitedId.Items.Insert(0, "Select");
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
            objVisaType.CountryVisitedId = Convert.ToInt32(DdlCountryVisitedId.SelectedValue);
            objVisaType.StampedDate = txtStampedDate.Text.Trim();
            objVisaType.Embassy  = txtEmbrasy.Text.Trim();
            objVisaType.FromDate = txtFromDate.Text.Trim();
            objVisaType.ToDate  = txtTODate.Text.Trim();
            objVisaType.CountryStamped = txtCountryStamped.Text.Trim();
            objVisaType.Remarks = txtRemarks.Text.Trim();
            objVisaType.VisaStamp  = (byte[])Session["Photo"];
            objVisaType.StampFile  = Session["FileName"].ToString();
            objVisaType.VisaPaper = (byte[])Session["Photo"];
            objVisaType.PaperFile  = Session["FileName"].ToString();


            int Flag = objVisaType.ModifyCountriesVisited();
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
  
    protected void DdlCountryVisitedId_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            int CtId = Convert.ToInt32(DdlCountryVisitedId.SelectedValue);
            DataSet ds = clsVisaType.GetCountryVisitedDataByCountryVisitedId(CtId);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dRow = ds.Tables[0].Rows[0];

                txtStampedDate.Text = dRow[2].ToString();
                txtEmbrasy.Text = dRow[3].ToString();
                txtFromDate.Text = dRow[5].ToString();
                txtTODate.Text = dRow[6].ToString();
                txtCountryStamped.Text = dRow[7].ToString();
                txtRemarks.Text = dRow[8].ToString();
                BrowseImage1.LaodImageByte = (byte[])dRow[9];
                BrowseImage1.LoadFileName = Convert.ToString(dRow[10]);
                BrowseImage1.LoadImage();
                BrowseImage2.LaodImageByte = (byte[])dRow[11];
                BrowseImage2.LoadFileName = Convert.ToString(dRow[12]);
                BrowseImage2.LoadImage();
            }
            else
            {
                lblMsg.Text = "There is no data for the selected Countries";
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("FrmAddCountriesVisited.aspx");
    }
}
