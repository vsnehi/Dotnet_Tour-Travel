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

public partial class Admin_UPD_EMP_FrmModifyDept : System.Web.UI.Page
{
    clsEmp emp = new clsEmp();
    clsDept dept = new clsDept();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PopulateCombos();
        }
    }
    public void PopulateCombos()
    {
        try
        {
            DdlEmpName.DataSource = emp.ShowEmp();
            DdlEmpName.DataTextField = "Emp_FirstName";
            DdlEmpName.DataValueField = "EmpId";
            DdlEmpName.DataBind();
            DdlEmpName.Items.Insert(0, "--Select Emp--");

            DdlDept.DataSource = dept.ShowDepartment();
            DdlDept.DataTextField = "DeptName";
            DdlDept.DataValueField = "DepartmentId";
            DdlDept.DataBind();
            DdlDept.Items.Insert(0, "--Select Dept--");

        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }

    protected void DdlEmpName_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
        
            lblMsg.Text = "";
            if (DdlEmpName.SelectedIndex != 0)
            {
                int EmpId = Convert.ToInt32(DdlEmpName.SelectedValue);

                DataSet ds = clsEmp.GetEmpDataByDeptName(EmpId);
                if (ds.Tables[0].Rows.Count != 0)
                {
                    DataRow dRow = ds.Tables[0].Rows[0];
                    for (int i = 0; i < DdlDept.Items.Count; i++)
                    {
                        if (DdlDept.Items[i].Text.ToString() == dRow[2].ToString())
                        {
                            DdlDept.Items[i].Selected = true;
                           
                        }
                        else
                            DdlDept.Items[i].Selected = false;
                    }
                }
                else
                {
                    lblMsg.Text = "There is no data ";
                }
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }


    protected void BtnDeptUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            emp.EmpId = Convert.ToInt32(DdlEmpName.SelectedValue);
            emp.Dept = Convert.ToInt32(DdlDept.SelectedValue);
            int Result = emp.ModifyDepartmentDetails();

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
  

}