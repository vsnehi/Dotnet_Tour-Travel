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

public partial class Travel_Sheduling_FrmModifyEmployeeVisa : System.Web.UI.Page
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
            DdlVisaApplyId.DataSource = objPassport.ShowEmployeeAndVisa();
            DdlVisaApplyId.DataTextField = "VisaApplyId";
            DdlVisaApplyId.DataValueField = "VisaApplyId";
            DdlVisaApplyId.DataBind();
            DdlVisaApplyId.Items.Insert(0, "Select");
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
            objPassport.VisaApplyId = Convert.ToInt32(DdlVisaApplyId.SelectedValue);
            objPassport.ApplyDate = txtApplyDate.Text.Trim();
            objPassport.Status = ChkStatus.Checked;
            objPassport.Remarks = txtRemarks.Text.Trim();
            objPassport.Reason = txtReasons.Text.Trim();
            objPassport.FromDate = txtFromDate.Text.Trim();
            objPassport.ToDate = txtToDate.Text.Trim();
            objPassport.Relieved = txtRelieved.Text.Trim();
            objPassport.Rejoined = txtRejoined.Text.Trim();
            objPassport.Deputation = txtDeputation.Text.Trim();
            objPassport.Documents = txtSupporative.Text.Trim();
            objPassport.Address = txtAddress.Text.Trim();

            int Flag = objPassport.ModifyEmployeeVisa();
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
    protected void DdlVisaApplyId_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            int ApId = Convert.ToInt32(DdlVisaApplyId.SelectedValue);
            DataSet ds = clsPassport.GetEmployeeDataByVisaApplyId(ApId);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dRow = ds.Tables[0].Rows[0];

                txtApplyDate.Text = dRow[1].ToString();
                ChkStatus.Checked = Convert.ToBoolean(dRow[6]);
                txtRemarks.Text = dRow[7].ToString();
                txtReasons.Text = dRow[8].ToString();
                txtFromDate.Text = dRow[9].ToString();
                txtToDate.Text = dRow[10].ToString();
                txtRelieved.Text = dRow[11].ToString();
                txtRejoined.Text = dRow[12].ToString();
                txtDeputation.Text = dRow[13].ToString();
                txtSupporative.Text = dRow[14].ToString();
                txtAddress.Text = dRow[15].ToString();
            }
            else
            {
                lblMsg.Text = "There is no data for the selected Employees";
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }

    }
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("FrmAddEmployeeVisa.aspx");
    }
}
