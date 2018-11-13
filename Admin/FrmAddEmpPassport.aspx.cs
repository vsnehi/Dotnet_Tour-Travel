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

public partial class Admin_Employees_Passport_Master_FrmAddEmpPassport : System.Web.UI.Page
{
    clsPassport objPassport = new clsPassport();
    clsEmp objEmp = new clsEmp();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            lblMsg.Text = "";
            if (!IsPostBack)
            {
                PopulateData();
                PopulateCombo();
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    public void PopulateData()
    {
        try
        {
            GridViewPassport.DataSource = objPassport.DisplayEmployeePassport();
            GridViewPassport.DataBind();
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
            DdlEmpId.DataSource =objEmp.ShowEmp();
            DdlEmpId.DataTextField = "Emp_FirstName";
            DdlEmpId.DataValueField = "EmpId";
            DdlEmpId.DataBind();
            DdlEmpId.Items.Insert(0, "Select");
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
            objPassport.PassPortNo = txtPassportNo.Text.Trim();
            objPassport.EmpId = Convert.ToInt32(DdlEmpId.SelectedValue);
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

            int Flag = objPassport.InsertEmployeePassport();
            if (Flag == 1)
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert('PassPort Inserted')</script>");
                btnClear_Click(sender, e);
            }
            else if (Flag == 0)
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert('Bad Server Request, Try again')</script>");
                btnClear_Click(sender, e);
            }
            else if (Flag == 2)
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert(Passport Already Inserted')</script>");
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
            txtPassportNo.Text = "";
            DdlEmpId.SelectedIndex = 0;
            txtPlace.Text = "";
            txtAddress.Text = "";
            txtIssuedDate.Text = "";
            txtExpiryDate.Text = "";
            txtMarks.Text = "";
            txtCountry.Text = "";
            txtCitizen.Text = "";
            txtPages.Text = "";
                
            DivPassport.Visible = false;
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
            DivPassport.Visible = true;
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void BtnModify_Click(object sender, EventArgs e)
    {
        Response.Redirect("FrmModifyEmployeePassport.aspx");
    }
}
