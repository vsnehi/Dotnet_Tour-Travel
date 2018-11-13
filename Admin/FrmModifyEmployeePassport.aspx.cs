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

public partial class Admin_Employees_Passport_Master_FrmModifyEmployeePassport : System.Web.UI.Page
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
            DdlPassportNo.DataSource = objPassport.ShowEmployeePassport();
            DdlPassportNo.DataTextField = "PassportNo";
            DdlPassportNo.DataValueField = "PassportNo";
            DdlPassportNo.DataBind();
            DdlPassportNo.Items.Insert(0, "Select");

            DdlPassportId.DataSource = objPassport.ShowEmployeePassport();
            DdlPassportId.DataTextField = "PassportId";
            DdlPassportId.DataValueField = "PassportId";
            DdlPassportId.DataBind();
            DdlPassportId.Items.Insert(0, "Select");
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
            objPassport.PassPortId = Convert.ToInt32(DdlPassportId.SelectedValue);
            objPassport.PassPortNo = DdlPassportNo.SelectedItem.Text;
            objPassport.Place = txtPlace.Text.Trim();
            objPassport.Address = txtAddress.Text.Trim();
            objPassport.IssuedDate = txtIssuedDate.Text.Trim();
            objPassport.ExpiryDate = txtExpiryDate.Text.Trim();
            objPassport.Status = ChkStatus.Checked;
            objPassport.Idetification = txtMarks.Text.Trim();
            objPassport.Pages = Convert.ToInt32(txtPages.Text.Trim());
            objPassport.Country = txtCountry.Text.Trim();
            objPassport.CitizenShip = txtCitizen.Text.Trim();
            objPassport.Image = (byte[])Session["Photo"];
            objPassport.ScannedFile = Session["FileName"].ToString();


            int Flag = objPassport.ModifyEmployeePassport();
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

    protected void DdlPassportId_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            int PPId = Convert.ToInt32(DdlPassportId.SelectedValue);
            DataSet ds = clsPassport.GetPassportDataByPassportId(PPId);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dRow = ds.Tables[0].Rows[0];
                DdlPassportNo.SelectedItem.Text = dRow[1].ToString();
                txtPlace.Text = dRow[3].ToString();
                txtAddress.Text = dRow[4].ToString();
                txtIssuedDate.Text = dRow[5].ToString();
                txtExpiryDate.Text = dRow[6].ToString();
                txtMarks.Text = dRow[8].ToString();
                txtPages.Text = dRow[9].ToString();
                txtCountry.Text = dRow[10].ToString();
                txtCitizen.Text = dRow[11].ToString();
                BrowseImage1.LaodImageByte = (byte[])dRow[12];
                BrowseImage1.LoadFileName = Convert.ToString(dRow[13]);
                BrowseImage1.LoadImage();

            }
            else
            {
                lblMsg.Text = "There is no data for the selected Passports";
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("FrmAddEmpPassport.aspx");
    }
}