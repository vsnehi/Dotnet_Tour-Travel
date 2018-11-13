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

public partial class Admin_Designation_Master_FrmAddDesignation : System.Web.UI.Page
{
    clsDesignation desg = new clsDesignation();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        try
        {
            if (!IsPostBack)
            {
                PopulateDesgData();
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    public void PopulateDesgData()
    {
        try
        {
            GridViewDesg.DataSource = desg.ShowDesignation();
            GridViewDesg.DataBind();
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
            desg.Name = txtDesgName.Text.ToString();
            desg.Abbrevation = txtDesgAbbr.Text.ToString();
            desg.Description = txtDesgDesc.Text.ToString();

            int Result = desg.InsertDesignation();

            ClearData();
            if (Result == 1)
            {
                lblMsg.Text = "Reord Inserted Successfully";
            }
            else
            {
                lblMsg.Text = "Not Inserting data";
            }

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
            PopulateDesgData();
            DivDesg.Visible = true;
            lblMsg.Text = "";
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }

    public void ClearData()
    {
        try
        {
            txtDesgName.Text = "";
            txtDesgAbbr.Text = "";
            txtDesgDesc.Text = "";
            lblMsg.Text = "";
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
            ClearData();
            DivDesg.Visible = false;
            txtDesgName.Focus();
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }

    }
    protected void BtnModify_Click(object sender, EventArgs e)
    {
        Response.Redirect("FrmModifyDesignation.aspx");
    }
}
