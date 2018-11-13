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

public partial class Admin_FrmAddDepartment : System.Web.UI.Page
{
    clsDept dept = new clsDept();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        try
        {
            if (!IsPostBack)
            {
                PopulateDeptData();
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }

    }
    public void PopulateDeptData()
    {
        try
        {
            GridViewDept.DataSource = dept.ShowDepartment();
            GridViewDept.DataBind();
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
            dept.Name = txtDeptName.Text.Trim();
            dept.Abbrevation = txtDeptAbbr.Text.Trim();
            dept.Loc = txtDeptLoc.Text.Trim();
            dept.Description = txtDeptDesc .Text.Trim();

            int Result = dept.InsertDepartment();

            ClearData();
            if (Result == 1)
            {
                lblMsg.Text = "Reord Inserted Successfully";
            }
            else
            {
                lblMsg.Text = "Not Inserting data";
            }

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
            PopulateDeptData();
            DivDept.Visible = true;
            lblMsg.Text = "";
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }

    public void ClearData()
    {
        try
        {
            txtDeptName.Text = "";
            txtDeptAbbr.Text = "";
            txtDeptLoc.Text = "";
            txtDeptDesc.Text = "";
            lblMsg.Text = "";
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
            ClearData();
            DivDept.Visible = false;
            txtDeptName.Focus();
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }

    }
    protected void BtnModify_Click(object sender, EventArgs e)
    {
        Response.Redirect("FrmModifyDepartment.aspx");
    }
}
