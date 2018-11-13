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

public partial class Travel_Sheduling_FrmModifyEmployeeStay : System.Web.UI.Page
{
    clsVisaType objVisaType = new clsVisaType();
    protected void Page_Load(object sender, EventArgs e)
    {

        lblMsg.Text = "";
        try
        {
            if (!IsPostBack)
            {
                PopulateCombo();
            }
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
            DdlEmpStayId.DataSource = objVisaType.ShowEmployeeStay();
            DdlEmpStayId.DataTextField = "EmployeeStayId";
            DdlEmpStayId.DataTextField = "EmployeeStayId";
            DdlEmpStayId.DataValueField = "";
            DdlEmpStayId.DataBind();
            DdlEmpStayId.Items.Insert(0, "Select");
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
            objVisaType.EmployeeStayId = Convert.ToInt32(DdlEmpStayId.SelectedItem.Value);
            objVisaType.RoomNo = txtRoomNo.Text.Trim();
            objVisaType.Reservation = txtReservationNo.Text.Trim();
            objVisaType.Status = ChkStatus.Checked;
            objVisaType.VehicleNo = txtVehicleNo.Text.Trim();
            objVisaType.Contact = txtContact.Text.Trim();
            objVisaType.Name = txtName.Text.Trim();
            objVisaType.PersonImage = (byte[])Session["Photo"];
            objVisaType.PersonFile = Session["FileName"].ToString();

            int Flag = objVisaType.ModifyEmployeeStay();
            if (Flag == 1)
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert('Record is Updated')</script>");

            }
            else
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert('Record is not Updated/script>");

            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }

    protected void DdlEmpStayId_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {

            int StId = Convert.ToInt32(DdlEmpStayId.SelectedValue);
            DataSet ds = clsVisaType.GetEmployeeStayDataByEmployeeStayId(StId);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dRow = ds.Tables[0].Rows[0];
                txtRoomNo.Text = dRow[3].ToString();
                txtReservationNo.Text = dRow[4].ToString();
                ChkStatus.Checked = Convert.ToBoolean(dRow[5]);
                txtVehicleNo.Text = dRow[6].ToString();
                txtContact.Text = dRow[9].ToString();
                txtName.Text = dRow[8].ToString();
                BrowseImage1.LaodImageByte = (byte[])dRow[10];
                BrowseImage1.LoadFileName = dRow[11].ToString();
                BrowseImage1.LoadImage();
            }
            else
            {
                lblMsg.Text = "There is no data for the selected Emp Stays";
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("FrmAddEmployeeStay.aspx");
    }
}
