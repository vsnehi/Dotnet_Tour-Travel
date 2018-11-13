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

public partial class Travel_Sheduling_FrmAddEmployeeVisaDetail : System.Web.UI.Page
{
    clsVisaType objVisaType = new clsVisaType();
    clsPassport objPassport = new clsPassport();
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
            DataSet ds = objPassport.DisplayVisaDetail();
            if (ds.Tables[0].Rows.Count != 0)
            {
                GridViewVisaDetail.DataSource = ds.Tables[0];
                GridViewVisaDetail.DataBind();
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
            DdlEmpId.DataSource = objPassport.ShowVisaEmployeeIds();
            DdlEmpId.DataTextField = "Emp_FirstName";
            DdlEmpId.DataValueField = "EmployeeId";
            DdlEmpId.DataBind();
            DdlEmpId.Items.Insert(0, "Select");

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

    protected void BtnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            objPassport.EmpId = Convert.ToInt32(DdlEmpId.SelectedValue);
            objPassport.VisaApplyId = Convert.ToInt32(DdlVisaApplyId.SelectedValue);
            objPassport.DocImage = (byte[])Session["Photo"];
            objPassport.DocFile = Session["FileName"].ToString();
            objPassport.FormImage = (byte[])Session["FlagPhoto"];
            objPassport.FormFile = Session["FlagFileName"].ToString();
            objPassport.Remarks = txtRemarks.Text.Trim();
            objPassport.Status = ChkStatus.Checked;
            objPassport.SubmitDate = txtDate.Text.Trim();



            int Flag = objPassport.InsertEmployeeAndVisaDetail();
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
            DdlEmpId.SelectedIndex = 0;
            DdlVisaApplyId.SelectedIndex = 0;
            txtRemarks.Text = "";
            txtDate.Text = "";
            DivVisaDetail.Visible = false;
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
            DivVisaDetail.Visible = true;
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }

    protected void BtnModify_Click(object sender, EventArgs e)
    {
        Response.Redirect("FrmModifyEmployeeVisaDetail.aspx");
    }
}
