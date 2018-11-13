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

public partial class Admin_Foriegn_Embassy_Master_FrmAddForiegnEmbassy : System.Web.UI.Page
{
    clsVisaType objVisaType = new clsVisaType();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        if (!IsPostBack)
        {
            PopulateData();
            PopulateCombo();
        }
    }
    
    public void PopulateData()
    {
        try
        {
            GridViewEmbassy.DataSource = objVisaType.ShowForiegnEmbassy();
            GridViewEmbassy.DataBind();
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
            objVisaType.CountryId = Convert.ToInt32(DdlCountryId.SelectedValue);
            objVisaType.Address = txtAddress.Text.Trim();
            objVisaType.Name = txtName.Text.Trim();
            objVisaType.Phone = txtPhone.Text.Trim();
            int Flag = objVisaType.InsertForiegnEmbassy();
            if (Flag == 1)
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert('Foriegn Embassy Inserted')</script>");
                btnClear_Click(sender, e);
            }
            else if (Flag == 0)
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert('Bad Server Request, Try again')</script>");
                btnClear_Click(sender, e);
            }
            else if (Flag == 2)
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert(Foriegn Embassy Already Inserted')</script>");
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
            txtAddress.Text = "";
            txtName.Text = "";
            txtPhone.Text = "";
            DivEmbassy.Visible = false;
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
            DivEmbassy.Visible = true;
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }

    protected void BtnModify_Click(object sender, EventArgs e)
    {
        Response.Redirect("FrmModifyForiegnEmbassy.aspx");
    }
}
