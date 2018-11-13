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

public partial class Travel_Sheduling_FrmModifyEmployeeTravel : System.Web.UI.Page
{

    clsPassport objPassport = new clsPassport();
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
            DdlEmpTravelId.DataSource = objPassport.ShowEmployeeTravel();
            DdlEmpTravelId.DataTextField = "EmployeeTravelId";
            DdlEmpTravelId.DataTextField = "EmployeeTravelId";
            DdlEmpTravelId.DataValueField = "";
            DdlEmpTravelId.DataBind();
            DdlEmpTravelId.Items.Insert(0, "Select");
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
            objPassport.EmployeeTravelId = Convert.ToInt32(DdlEmpTravelId.SelectedItem.Value);
            objPassport.StartDate = txtStartDate.Text.Trim();
            objPassport.EndDate = txtEndDate.Text.Trim();
            objPassport.Special = txtSpecial.Text.Trim();

            int Flag = objPassport.ModifyEmployeeTravelDetails();
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

    protected void DdlEmpTravelId_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {

            int TvId = Convert.ToInt32(DdlEmpTravelId.SelectedValue);
            DataSet ds = clsPassport.GetTravelDataByEmployeeTravelId(TvId);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dRow = ds.Tables[0].Rows[0];
                txtStartDate.Text = dRow[2].ToString();
                txtEndDate.Text = dRow[3].ToString();
                txtSpecial.Text = dRow[5].ToString();
            }
            else
            {
                lblMsg.Text = "There is no data for the selected Emp Travels";
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }

    }
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("FrmAddEmployeeTravel.aspx");
    }
}
