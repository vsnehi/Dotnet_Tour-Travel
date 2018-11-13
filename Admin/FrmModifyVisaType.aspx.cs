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

public partial class Admin_VisaType_Master_FrmModifyVisaType : System.Web.UI.Page
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
        catch(Exception ex)
        {
            lblMsg.Text = ex.Message;   
        }

    }

    public void PopulateCombo()
    {
        try
        {
            DdlVisaName.DataSource = objVisaType.ShowVisaType();
            DdlVisaName.DataTextField = "VisaTypeName";
            DdlVisaName.DataValueField = "VisaTypeId";
            DdlVisaName.DataBind();
            DdlVisaName.Items.Insert(0, "Select");
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
            objVisaType.VisaTypeId = Convert.ToInt32(DdlVisaName.SelectedItem.Value);
            objVisaType.Name = DdlVisaName.SelectedItem.Text;
            objVisaType.Abbreviation = txtVisaAbbr.Text.Trim();
            objVisaType.Description = txtVisaDesc.Text.Trim();

            int Flag = objVisaType.ModifyVisaTypeDetails();
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
    protected void DdlVisaName_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
           
            int VtId = Convert.ToInt32(DdlVisaName.SelectedValue);
            DataSet ds = clsVisaType.GetVisaTypeDataByVisaTypeId(VtId);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dRow = ds.Tables[0].Rows[0];
                txtVisaAbbr.Text = dRow[2].ToString();
                txtVisaDesc.Text = dRow[3].ToString();

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
    protected void BtnBack_Click1(object sender, EventArgs e)
    {
        Response.Redirect("FrmAddVisaType.aspx");
    }
}
