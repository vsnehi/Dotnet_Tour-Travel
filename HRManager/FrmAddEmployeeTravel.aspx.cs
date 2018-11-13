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

public partial class Travel_Sheduling_FrmAddEmployeeTravel : System.Web.UI.Page
{
    clsPassport objPassport = new clsPassport();
    clsVisaType objVisaType = new clsVisaType();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        if (!IsPostBack)
        {
            PopulateData();
            PopulateCombos();
        }
    }
    public void PopulateData()
    {
        try
        {
            DataSet ds = objPassport.DisplayEmployeeTravel();
            if (ds.Tables[0].Rows.Count != 0)
            {
                GridViewTravel.DataSource = ds.Tables[0];
                GridViewTravel.DataBind();
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
            DdlEmpId.DataSource = objPassport.ShowEmployeeName();
            DdlEmpId.DataTextField = "Emp_FirstName";
            DdlEmpId.DataValueField = "EmployeeId";
            DdlEmpId.DataBind();
            DdlEmpId.Items.Insert(0, "Select");

            DdlCountryId.DataSource = objPassport.ShowCountryName();
            DdlCountryId.DataTextField = "CountryName";
            DdlCountryId.DataValueField = "CountryId";
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
            objPassport.EmpId = Convert.ToInt32(DdlEmpId.SelectedValue);
            objPassport.StartDate = txtStartDate.Text.Trim();
            objPassport.EndDate = txtEndDate.Text.Trim();
            objPassport.CountryId = Convert.ToInt32(DdlCountryId.SelectedValue);
            objPassport.Special = txtSpecial.Text.Trim();

            int Flag = objPassport.InsertEmployeeTravel();
            if (Flag == 1)
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert('Emp Travel Inserted')</script>");
                btnClear_Click(sender, e);
            }
            else if (Flag == 0)
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert('Bad Server Request, Try again')</script>");
                btnClear_Click(sender, e);
            }
            else if (Flag == 2)
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert('Emp Travel Already Inserted')</script>");
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
            DdlEmpId.SelectedIndex = 0;
            txtStartDate.Text = "";
            txtEndDate.Text = "";
            DdlCountryId.SelectedIndex = 0;
            txtSpecial.Text = "";
            DivTravel.Visible = false;
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
            DivTravel.Visible = true;
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }

    protected void Btn_Modify_Click(object sender, EventArgs e)
    {
        Response.Redirect("FrmModifyEmployeeTravel.aspx");
    }
}
