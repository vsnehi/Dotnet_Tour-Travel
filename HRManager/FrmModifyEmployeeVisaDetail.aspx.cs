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

public partial class Travel_Sheduling_FrmModifyEmployeeVisaDetail : System.Web.UI.Page
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
            DdlDocumentId.DataSource = objPassport.ShowEmployeeAndVisaDetail();
            DdlDocumentId.DataTextField = "SupporativeDocumentId";
            DdlDocumentId.DataValueField = "SupporativeDocumentId";
            DdlDocumentId.DataBind();
            DdlDocumentId.Items.Insert(0, "Select");
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
            objPassport.DocumentId = Convert.ToInt32(DdlDocumentId.SelectedValue);
            objPassport.DocImage = (byte[])Session["Photo"];
            objPassport.DocFile = Session["FileName"].ToString();
            objPassport.FormImage = (byte[])Session["FlagPhoto"];
            objPassport.FormFile = Session["FlagFileName"].ToString();
            objPassport.Remarks = txtRemarks.Text.Trim();
            objPassport.Status = ChkStatus.Checked;
            objPassport.SubmitDate = txtDate.Text.Trim();

            int Flag = objPassport.ModifyEmployeeVisaDetail();
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

    protected void DdlDocumentId_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            int SpId = Convert.ToInt32(DdlDocumentId.SelectedValue);
            DataSet ds = clsPassport.GetEmployeeDataBySupporativeDocumnetId(SpId);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dRow = ds.Tables[0].Rows[0];

                BrowseImage1.LaodImageByte = (byte[])dRow[3];
                BrowseImage1.LoadFileName = Convert.ToString(dRow[4]);
                BrowseImage1.LoadImage();
                BrowseImage2.LaodImageByte = (byte[])dRow[5];
                BrowseImage2.LoadFileName = Convert.ToString(dRow[6]);
                BrowseImage2.LoadImage();
                txtRemarks.Text = dRow[7].ToString();
                ChkStatus.Checked = Convert.ToBoolean(dRow[8]);
                txtDate.Text = dRow[9].ToString();
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
        Response.Redirect("FrmAddEmployeeVisaDetail.aspx");
    }
}
