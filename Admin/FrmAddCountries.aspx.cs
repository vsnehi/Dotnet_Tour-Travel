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

public partial class Admin_Countries_Master_FrmAddCountries : System.Web.UI.Page
{
    clsVisaType objVisaType = new clsVisaType();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            lblMsg.Text = "";
            if (!IsPostBack)
            {
                PopulateData();
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
            GridViewCountry.DataSource = objVisaType.ShowCountries();
            GridViewCountry.DataBind();
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
            objVisaType.Name = txtCountryName.Text.Trim();
            objVisaType.Abbreviation = txtCountryAbbr.Text.Trim();
            objVisaType.Description = txtCountryDesc.Text.Trim();
            objVisaType.Map = (byte[])Session["Photo"];
            objVisaType.MapFile = Session["FileName"].ToString();
            objVisaType.Flag = (byte[])Session["FlagPhoto"];
            objVisaType.FlagFile = Session["FlagFileName"].ToString();
            objVisaType.Video = (byte[])Session["VideoFileContent"];
            objVisaType.VideoFile = Session["VideoFileName"].ToString();

            int Flag = objVisaType.InsertCountries();
            if (Flag == 1)
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert('Country Inserted')</script>");
                btnClear_Click(sender, e);
            }
            else if (Flag == 0)
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert('Bad Server Request, Try again')</script>");
                btnClear_Click(sender, e);
            }
            else if (Flag == 2)
            {
                Page.RegisterClientScriptBlock("Travel", "<script>alert(Country Already Inserted')</script>");
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
            txtCountryName.Text = "";
            txtCountryAbbr.Text = "";
            txtCountryDesc.Text = "";
            txtCountryName.Focus();
            DivCountry.Visible = false;
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
            DivCountry.Visible = true;
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void BtnModify_Click(object sender, EventArgs e)
    {
        Response.Redirect("FrmModifyCountries.aspx");
    }
    protected void GridViewCountry_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            objVisaType.CountryId = Convert.ToInt32(e.CommandArgument);
            DataSet ds = objVisaType.GetCountryDataByCountryId();
            byte[] VideoFileContent = (byte[])ds.Tables[0].Rows[0][8];
            string VideoFileName = (string)ds.Tables[0].Rows[0][9];
            string[] fileSplit = VideoFileName.Split('.');
            int Loc = fileSplit.Length;
            string FileExtention = "." + fileSplit[Loc - 1].ToUpper();

            int i = 0;
            if (FileExtention == ".DOC" || FileExtention == ".DOCX")
            {
                Response.ContentType = "application/vnd.ms-word";
                Response.AddHeader("content-disposition", "inline;filename=" + VideoFileName);
                i = 1;
            }
            else if (FileExtention == ".XL" || FileExtention == ".XLS" || FileExtention == ".XLSX")
            {
                Response.ContentType = "application/vnd.ms-excel";
                Response.AddHeader("content-disposition", "inline;filename=" + VideoFileName);
                i = 1;
            }
            else if (FileExtention == ".PDF")
            {
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "inline;filename=" + VideoFileName);
                i = 1;
            }
            else if (FileExtention == ".TXT")
            {
                Response.ContentType = "application/octet-stream";
                Response.AddHeader("content-disposition", "inline;filename=" + VideoFileName);
                i = 1;
            }
            else if (FileExtention == ".WMV")
            {
                Response.ContentType = "application/wmv";
                Response.AddHeader("content-disposition", "inline;filename=" + VideoFileName);
                i = 1;
            }
            if (i == 1)
            {
                Response.Charset = "";
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.BinaryWrite(VideoFileContent);
                Response.End();
            }
            else
                lblMsg.Text = "Problem in downloading the file..";
        }
        
        
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message; 
        }
    }
}