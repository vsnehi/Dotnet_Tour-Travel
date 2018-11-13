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

public partial class Travel_Sheduling_FrmAddEmployeeVisa : System.Web.UI.Page
{
    clsVisaType objVisaType = new clsVisaType();
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
                PopulateCombos();
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
            DataSet ds = objPassport.DispalyEmployeeVisa();
            if (ds.Tables[0].Rows.Count != 0)
            {
                GridViewEmployeeVisa.DataSource = ds.Tables[0];
                GridViewEmployeeVisa.DataBind();
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    public void PopulateCombos()
    {
        try
        {
            DdlEmpId.DataSource = objEmp.ShowEmp();
            DdlEmpId.DataTextField = "Emp_FirstName";
            DdlEmpId.DataValueField = "EmpId";
            DdlEmpId.DataBind();
            DdlEmpId.Items.Insert(0, "Select");

            DdlVisaTypeId.DataSource = objVisaType.ShowVisaType();
            DdlVisaTypeId.DataTextField = "VisaTypeName";
            DdlVisaTypeId.DataValueField = "VisaTypeId";
            DdlVisaTypeId.DataBind();
            DdlVisaTypeId.Items.Insert(0, "Select");

            DdlPassportId.DataSource = objPassport.ShowEmployeePassport();
            DdlPassportId.DataTextField = "PassportId";
            DdlPassportId.DataValueField = "PassportId";
            DdlPassportId.DataBind();
            DdlPassportId.Items.Insert(0, "Select");

            DdlCountryId.DataSource = objVisaType.ShowCountries();
            DdlCountryId.DataTextField = "CountryName";
            DdlCountryId.DataValueField = "COuntryId";
            DdlCountryId.DataBind();
            DdlCountryId.Items.Insert(0, "Select");
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
            objPassport.ApplyDate = txtApplyDate.Text.Trim();
            objPassport.EmpId = Convert.ToInt32(DdlEmpId.SelectedValue);
            objPassport.PassPortId = Convert.ToInt32(DdlPassportId.SelectedValue);
            objPassport.CountryId = Convert.ToInt32(DdlCountryId.SelectedValue);
            objPassport.TypeId = Convert.ToInt32(DdlVisaTypeId.SelectedValue);
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


            int Flag = objPassport.InsertEmployeeAndVisa();
            if (Flag == 1)
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert('Employee & Visa Inserted')</script>");
                btnClear_Click(sender, e);
            }
            else if (Flag == 0)
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert('Bad Server Request, Try again')</script>");
                btnClear_Click(sender, e);
            }
            else if (Flag == 2)
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert(Employee Already Inserted')</script>");
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
            txtApplyDate.Text = "";
            DdlEmpId.SelectedIndex = 0;
            DdlPassportId.SelectedIndex = 0;
            DdlCountryId.SelectedIndex = 0;
            DdlVisaTypeId.SelectedIndex = 0;
            txtRemarks.Text = "";
            txtReasons.Text = "";
            txtFromDate.Text = "";
            txtToDate.Text = "";
            txtRelieved.Text = "";
            txtRejoined.Text = "";
            txtDeputation.Text = "";
            txtSupporative.Text = "";
            txtAddress.Text = "";


            DivEmployeeVisa.Visible = false;
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
            DivEmployeeVisa.Visible = true;
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void BtnModify_Click(object sender, EventArgs e)
    {
        Response.Redirect("FrmModifyEmployeeVisa.aspx");
    }
}
