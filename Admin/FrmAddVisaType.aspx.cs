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

public partial class Admin_VisaType_Master_FrmAddVisaType : System.Web.UI.Page
{
    clsVisaType objVisaType = new clsVisaType();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        if (!IsPostBack)
        {
            PopulateData();
        }
    }
    public void PopulateData()
    {
        try
        {
            GridViewVisa.DataSource = objVisaType.ShowVisaType();
            GridViewVisa.DataBind();
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
            objVisaType.Name = txtVisaName.Text.Trim();
            objVisaType.Abbreviation = txtVisaAbbr.Text.Trim();
            objVisaType.Description = txtVisaDesc.Text.Trim();
            int Flag = objVisaType.InsertVisaType();
            if (Flag == 1)
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert('Visa Types Inserted')</script>");
                btnClear_Click(sender, e);
            }
            else if (Flag == 0)
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert('Bad Server Request, Try again')</script>");
                btnClear_Click(sender, e);
            }
            else if (Flag == 2)
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert(Visa Type Already Inserted')</script>");
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
             txtVisaName.Text = "";
             txtVisaAbbr.Text = "";
             txtVisaDesc.Text = "";
             txtVisaName.Focus();
             DivVisa.Visible = false;
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
            DivVisa.Visible = true;
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }

    protected void BtnModify_Click(object sender, EventArgs e)
    {
        Response.Redirect("FrmModifyVisaType.aspx");
    }
}
