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

public partial class Admin_UPD_EMP_FrmModifyDesg : System.Web.UI.Page
{
    clsEmp emp = new clsEmp();
    clsDesignation desg = new clsDesignation();
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

            DdlDesg.DataSource = desg.ShowDesignation();
            DdlDesg.DataTextField = "Desg_Name";
            DdlDesg.DataValueField = "DesignationId";
            DdlDesg.DataBind();
            DdlDesg.Items.Insert(0, "--Select Desg--");


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

                DataSet ds = clsEmp.GetEmpDataByDesgName(EmpId);
                if (ds.Tables[0].Rows.Count != 0)
                {
                    DataRow dRow = ds.Tables[0].Rows[0];
                    for(int i=0; i<DdlDesg.Items.Count;i++)
                    {
                      if(DdlDesg.Items[i].Text.ToString()==dRow[2].ToString())
                      {
                        DdlDesg.Items[i].Selected=true;
                      }
                    else
                    
                       DdlDesg.Items[i].Selected=false;
                    
                }
                    
                }
                else
                {
                    lblMsg.Text = "There is no data";
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
            emp.Desg = Convert.ToInt32(DdlDesg.SelectedValue);

            int Result = emp.ModifyDesgDetails();

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