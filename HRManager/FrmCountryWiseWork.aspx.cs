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

public partial class Travel_Sheduling_FrmCountryWiseWork : System.Web.UI.Page
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
            DdlCountryId.DataSource = objVisaType.ShowCountries();
            DdlCountryId.DataTextField = "CountryName";
            DdlCountryId.DataValueField = "CountryId";
            DdlCountryId.DataBind();
            DdlCountryId.Items.Insert(0, "Select");

            DdlPermitId.DataSource = objVisaType.ShowEmployeeWork();
            DdlPermitId.DataTextField = "EmpWorkDescID";
            DdlPermitId.DataValueField = "EmpWorkDescID";
            DdlPermitId.DataBind();
            DdlPermitId.Items.Insert(0, "Select");
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
            objVisaType.EmpWorkDescId = Convert.ToInt32(DdlPermitId.SelectedValue);
            objVisaType.WorkPermitInfo = txtPermitInfo.Text.Trim();
            int Flag = objVisaType.InsertEmployeeWorkPermit();
            if (Flag == 1)
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert('Work Permit Inserted')</script>");
                btnClear_Click(sender, e);
            }
            else if (Flag == 0)
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert('Bad Server Request, Try again')</script>");
                btnClear_Click(sender, e);
            }
            else if (Flag == 2)
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert('Work Permit Already Inserted')</script>");
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
            DdlPermitId.SelectedIndex = 0;
            txtPermitInfo.Text = "";
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }

}
