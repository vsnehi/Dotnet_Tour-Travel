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

public partial class Admin_Designation_Master_FrmModifyDesignation : System.Web.UI.Page
{
    clsDesignation desg = new clsDesignation();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        try
        {
            if (!IsPostBack)
            {
                PopulateDesgName();
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    public void PopulateDesgName()
    {
        try
        {
            DdlDesgName.DataSource = desg.ShowDesignation();
            DdlDesgName.DataTextField = "Desg_Name";
            DdlDesgName.DataValueField = "DesignationId";
            DdlDesgName.DataBind();
            DdlDesgName.Items.Insert(0, "Select");
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
            desg.DesignationId  = Convert.ToInt32(DdlDesgName.SelectedItem.Value);
            desg.Name = DdlDesgName.SelectedItem.Text;
            desg.Abbrevation = txtDesgAbbr.Text.Trim();
            desg.Description = txtDesgDesc.Text.Trim();

            int Result = desg.ModifyDesignationDetails();
            if (Result == 1)
            {
                lblMsg.Text = "Record Updated Successfully";
            }
            else
            {
                lblMsg.Text = "Record Not Updated ";
            }
        }

        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }



   
   
protected void  DdlDesgName_SelectedIndexChanged(object sender, EventArgs e)
{
        try
        {
            lblMsg.Text = "";
            int DesgId = Convert.ToInt32(DdlDesgName.SelectedValue);
            DataSet ds = clsDesignation.GetDesgDataByDesgId(DesgId);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dRow = ds.Tables[0].Rows[0];
                txtDesgAbbr.Text = dRow[2].ToString();
                txtDesgDesc.Text = dRow[3].ToString();

            }
            else
            {
                lblMsg.Text = "There is no data for the selected Company";
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }

protected void BtnBack_Click(object sender, EventArgs e)
{
    Response.Redirect("FrmAddDesignation.aspx");
}
}