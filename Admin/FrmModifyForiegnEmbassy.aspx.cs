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

public partial class Admin_Foriegn_Embassy_Master_FrmModifyForiegnEmbassy : System.Web.UI.Page
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
            DdlEmbassyId.DataSource = objVisaType.ShowForiegnEmbassy();
            DdlEmbassyId.DataTextField = "ForiegnEmbassyId";
            DdlEmbassyId.DataValueField = "ForiegnEmbassyId";
            DdlEmbassyId.DataBind();
            DdlEmbassyId.Items.Insert(0, "Select");
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
            objVisaType.ForiegnEmbassyId = Convert.ToInt32(DdlEmbassyId.SelectedItem.Value);
            objVisaType.Address = txtAddress.Text.Trim();
            objVisaType.Name = txtName.Text.Trim();
            objVisaType.Phone = txtPhone.Text.Trim();

            int Flag = objVisaType.ModifyForiegnEmbassyDetails();
            if (Flag == 1)
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert('Record is Updated')</script>");

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
    
protected void  DdlEmbassyId_SelectedIndexChanged(object sender, EventArgs e)
{
    try
    {

        int FgId = Convert.ToInt32(DdlEmbassyId.SelectedValue);
        DataSet ds = clsVisaType.GetForiegnEmbassyDataByForiegnEmbassyId(FgId);
        if (ds.Tables[0].Rows.Count != 0)
        {
            DataRow dRow = ds.Tables[0].Rows[0];
            txtAddress.Text = dRow[2].ToString();
            txtName.Text = dRow[3].ToString();
            txtPhone.Text = dRow[4].ToString();
        }
        else
        {
            lblMsg.Text = "There is no data for the selected Foriegn Embassy";
        }
    }
    catch (Exception ex)
    {
        lblMsg.Text = ex.Message;
    }

}
protected void BtnBack_Click(object sender, EventArgs e)
{
    Response.Redirect("FrmAddForiegnEmbassy.aspx");
}
}
