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

public partial class Travel_Sheduling_FrmAddEmployeeWork : System.Web.UI.Page
{
    clsVisaType objVisaType = new clsVisaType();
    clsEmp objEmp = new clsEmp();
    clsDesignation objDesg = new clsDesignation();
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
            GridViewWork.DataSource = objEmp.ShowReportEmployeeWork();
            GridViewWork.DataBind();
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

            DdlDesignationId.DataSource = objDesg.ShowDesignation();
            DdlDesignationId.DataTextField = "Desg_Name";
            DdlDesignationId.DataValueField = "DesignationId";
            DdlDesignationId.DataBind();
            DdlDesignationId.Items.Insert(0, "Select");
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
            objVisaType.EmpId = Convert.ToInt32(DdlEmpId.SelectedValue);
            objVisaType.Project = txtProject.Text.Trim();
            objVisaType.Reason = txtReasons.Text.Trim();
            objVisaType.Response = txtResponse.Text.Trim();
            objVisaType.DesgId = Convert.ToInt32(DdlDesignationId.Text.Trim());

            int Flag = objVisaType.InsertEmployeeWorkDescription();
            if (Flag == 1)
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert('Work Data Inserted')</script>");
                btnClear_Click(sender, e);
            }
            else if (Flag == 0)
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert('Bad Server Request, Try again')</script>");
                btnClear_Click(sender, e);
            }
            else if (Flag == 2)
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert('Work Data Already Inserted')</script>");
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
            txtProject.Text = "";
            txtReasons.Text = "";
            txtResponse.Text = "";
            DivWork.Visible = false;
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
            DivWork.Visible = true;
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }

    protected void BtnModify_Click(object sender, EventArgs e)
    {
        Response.Redirect("FrmModifyEmployeeWork.aspx");
    }
}
