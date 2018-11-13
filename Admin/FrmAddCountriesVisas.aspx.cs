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

public partial class Admin_Countires_And_Visas_FrmAddCountriesVisas : System.Web.UI.Page
{
    clsVisaType objVisaType = new clsVisaType();
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
            GridViewCountriesVisas.DataSource = objPassport.ShowCountriesAndVisas();
            GridViewCountriesVisas.DataBind();
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

            DdlTypeId.DataSource = objVisaType.ShowVisaType();
            DdlTypeId.DataTextField = "VisaTypeName";
            DdlTypeId.DataValueField = "VisaTypeId";
            DdlTypeId.DataBind();
            DdlTypeId.Items.Insert(0, "Select");

            DdlCountryId.DataSource = objVisaType.ShowCountries();
            DdlCountryId.DataTextField = "CountryName";
            DdlCountryId.DataValueField = "CountryId";
            DdlCountryId.DataBind();
            DdlCountryId.Items.Insert(0, "Select");
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

            objPassport.CountryId  = Convert.ToInt32(DdlCountryId.SelectedValue);
            objPassport.TypeId = Convert.ToInt32(DdlTypeId.SelectedValue);
            objPassport.PerCountry  = txtPerCountry.Text.Trim();
            objPassport.Desc = txtVisaTypeDesc.Text.Trim();
            objPassport.Documents = txtDocuments.Text.Trim();
            objPassport.Eligibility = DdlEligiblity.SelectedItem.Text;
            objPassport.Rules  = txtRules.Text.Trim();
            objPassport.GuideLines = (byte[])Session["FileContent"];
            objPassport.GuideFile = Session["FileName"].ToString();
            objPassport.Cost =Convert.ToDouble(txtCost.Text.Trim());
            objPassport.PermitTime = txtPermitTime.Text.Trim();
            objPassport.ApplicationForm = (byte[])Session["FileContent"];
            objPassport.FormFile = Session["FileName"].ToString();
            objPassport.Remarks = txtRemarks.Text.Trim();
            objPassport.Count = txtCount.Text.Trim();


            int Flag = objPassport.InsertCountriesAndVisas();
            if (Flag == 1)
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert('Countries&Visas Inserted')</script>");
                btnClear_Click(sender, e);
            }
            else if (Flag == 0)
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert('Bad Server Request, Try again')</script>");
                btnClear_Click(sender, e);
            }
            else if (Flag == 2)
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert(Countries Already Inserted')</script>");
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
            DdlCountryId.SelectedIndex = 0;
            DdlTypeId.SelectedIndex = 0;
            txtPerCountry.Text = "";
            txtVisaTypeDesc.Text = "";
            txtDocuments.Text = "";
            DdlEligiblity.SelectedIndex = 0;
            txtRules.Text = "";
            txtCost.Text = "";
            txtPermitTime.Text = "";
            txtRemarks.Text = "";
            txtCount.Text = "";
            DivCountriesVisas.Visible = false;
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
            DivCountriesVisas.Visible = true;
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }

}

