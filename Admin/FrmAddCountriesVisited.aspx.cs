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

public partial class Admin_Countries_Visited_FrmAddCountriesVisited : System.Web.UI.Page
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
            GridViewCountries.DataSource = objVisaType.ShowCountriesVisited();
            GridViewCountries.DataBind();
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

            DdlPasportId.DataSource = objPassport.ShowEmployeePassport();
            DdlPasportId.DataTextField = "PassportId";
            DdlPasportId.DataValueField = "PassportId";
            DdlPasportId.DataBind();
            DdlPasportId.Items.Insert(0, "Select");
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

            objVisaType.PassportId = Convert.ToInt32(DdlPasportId.SelectedValue);
            objVisaType.StampedDate = txtStampedDate.Text.Trim();
            objVisaType.Embassy = txtEmbrasy.Text.Trim();
            objVisaType.VisaTypeId = Convert.ToInt32(DdlVisaTypeId.SelectedValue);
            objVisaType.FromDate = txtFromDate.Text.Trim();
            objVisaType.ToDate = txtTODate.Text.Trim();
            objVisaType.CountryStamped = txtCountryStamped.Text.Trim();
            objVisaType.Remarks = txtRemarks.Text.Trim();
            objVisaType.VisaStamp = (byte[])Session["Photo"];
            objVisaType.StampFile = Session["FileName"].ToString();
            objVisaType.VisaPaper = (byte[])Session["Photo"];
            objVisaType.PaperFile = Session["FileName"].ToString();
            objVisaType.EmpId = Convert.ToInt32(DdlEmpId.SelectedValue);

            int Flag = objVisaType.InsertCountriesVisited();
            if (Flag == 1)
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert('Countries Inserted')</script>");
                btnClear_Click(sender, e);
            }
            else if (Flag == 0)
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert('Bad Server Request, Try again')</script>");
                btnClear_Click(sender, e);
            }
            else if (Flag == 2)
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert(Countries Already Inserted')</script>");
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
            DdlPasportId.SelectedIndex = 0;
            txtStampedDate.Text = "";
            txtEmbrasy.Text = "";
            DdlVisaTypeId.SelectedIndex = 0;
            txtFromDate.Text = "";
            txtTODate.Text = "";
            txtCountryStamped.Text = "";
            txtRemarks.Text = "";
            DdlEmpId.SelectedIndex = 0;
            
            DivCountries.Visible  = false;
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
            DivCountries.Visible = true;
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void BtnModify_Click(object sender, EventArgs e)
    {
        Response.Redirect("FrmModifyCountriesVisited.aspx");
    }
}

