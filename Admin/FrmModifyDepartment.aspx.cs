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

public partial class Admin_Department_Master_FrMModifyDepartment : System.Web.UI.Page
{
    clsDept Dept = new clsDept();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        try
        {
            if (!IsPostBack)
            {
                PopulateDeptName();
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    public void PopulateDeptName()
    {
        try
        {
            DdlDeptName.DataSource = Dept.ShowDepartment();
            DdlDeptName.DataTextField = "DeptName";
            DdlDeptName.DataValueField = "DepartmentId";
            DdlDeptName.DataBind();
            DdlDeptName.Items.Insert(0, "Select");
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
            Dept.DepartmentId  = Convert.ToInt32(DdlDeptName.SelectedItem.Value);
            Dept.Name = DdlDeptName.SelectedItem.Text;
            Dept.Abbrevation = txtDeptAbbr.Text.Trim();
            Dept.Loc = txtDeptLoc.Text.Trim();
            Dept.Description = txtDeptDesc.Text.Trim();

            int Result = Dept.ModifyDepartmentDetails();
            if (Result == 1)
            {
                lblMsg.Text = "Record Updated Successfully";
            }
            else
            {
                lblMsg.Text = "Record Not Updated ";
            }
        }

        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }

    
    
protected void  DdlDeptName_SelectedIndexChanged(object sender, EventArgs e)
{
        try
        {
            lblMsg.Text = "";
            int DeptId = Convert.ToInt32(DdlDeptName.SelectedValue);
            DataSet ds = clsDept.GetDeptDataByDeptId(DeptId);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dRow = ds.Tables[0].Rows[0];
                txtDeptAbbr.Text = dRow[2].ToString();
                txtDeptLoc.Text = dRow[3].ToString();
                txtDeptDesc.Text = dRow[4].ToString();
                
            }
            else
            {
                lblMsg.Text = "There is no data for the selected Company";
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }

protected void BtnBack_Click(object sender, EventArgs e)
{
    Response.Redirect("FrmAddDepartment.aspx");
}
}
