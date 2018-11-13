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

public partial class Travel_Sheduling_FrmModifyEmployeeWork : System.Web.UI.Page
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
            DdlEmpWorkId.DataSource = objVisaType.ShowEmployeeWork();
            DdlEmpWorkId.DataTextField = "EmpWorkDescId";
            DdlEmpWorkId.DataValueField = "EmpWorkDescId";
            DdlEmpWorkId.DataBind();
            DdlEmpWorkId.Items.Insert(0, "Select");
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
            objVisaType.EmpWorkDescId = Convert.ToInt32(DdlEmpWorkId.SelectedItem.Value);
            objVisaType.Project = txtProject.Text.Trim();
            objVisaType.Reason = txtReasons.Text.Trim();
            objVisaType.Response = txtResponse.Text.Trim();

            int Flag = objVisaType.ModifyEmployeeWorkDescription();
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


    protected void DdlEmpWorkId_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {

            int WkId = Convert.ToInt32(DdlEmpWorkId.SelectedValue);
            DataSet ds = clsVisaType.GetEmployeeWorkDataByEmployeeWorkId(WkId);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dRow = ds.Tables[0].Rows[0];
                txtProject.Text = dRow[2].ToString();
                txtReasons.Text = dRow[3].ToString();
                txtResponse.Text = dRow[4].ToString();

            }
            else
            {
                lblMsg.Text = "There is no data for the selected Works";
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("FrmAddEmployeeWork.aspx");
    }
}
