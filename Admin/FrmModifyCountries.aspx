<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="FrmModifyCountries.aspx.cs" Inherits="Admin_Countries_Master_FrmModifyCountries" Title="Untitled Page" %>
<%@ Register Src="~/UserControls/BrowseImage.ascx"  TagName="BrowseImage" TagPrefix="Uc1" %>
<%@ Register Src="~/UserControls/BrowseImage1.ascx"  TagName="BrowseImage1" TagPrefix="Uc3" %>
<%@ Register Src="~/UserControls/BrowseVideoFile.ascx" TagName="VideoFile" TagPrefix="Uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .style5
        {
            font-size: large;
            font-weight: bold;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
<br />
<br />
<center>
<table>
        <div>
            <table style="border: medium groove #FF9900; background-color: #ffcc66;">
                <tr>
                    <td colspan="3" class="style5">
                        Modify  Country  Details
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        Country Name
                    </td>
                    <td align="left">
                        <asp:DropDownList ID="DdlCountryName" runat="server" AutoPostBack="true" 
                            Width="153px" onselectedindexchanged="DdlCountryName_SelectedIndexChanged"></asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DdlCountryName"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                 <tr>
                    <td align="right">
                        Country Abbr</td>
                    <td align="left">
                        <asp:TextBox ID="txtCountryAbbr" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCountryAbbr"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
               
               
                <tr>
                    <td valign="top">
                        Country Description</td>
                    <td align="left">
                        <asp:TextBox ID="txtCountryDesc" runat="server" TextMode="MultiLine" 
                            Width="153px"></asp:TextBox>
                    </td>
                    
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCountryDesc"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
               
                     <tr>
                    <td align="right" valign="top">
                        Country Map</td>
                    <td valign="top" align="left">
                     <Uc1:BrowseImage ID="BrowseImage1" runat="server" DefaultImageUrl="~/Images/NoImage.jpg"/>
                    </td>
                </tr>
                     <tr>
                    <td align="right"  valign="top">
                        Country Flag</td>
                    <td valign="top" align="left">
                    <Uc3:BrowseImage1 ID="BrowseImage2" runat="server" DefaultImageUrl="~/Images/NoImage.jpg" />
                    </td>
                       
                </tr>
                <tr>
                    <td align="right" valign="top">
                       Country Intro Video</td>
                    <td align="left" valign="top">
                      <Uc2:VideoFile ID="VIdeoFile1" runat="server" />
                    </td>
                    
                </tr>
                
                <tr>
                <td align="right" colspan="2">
                    <asp:Button ID="BtnUpdate" runat="server" Height="24px" onclick="BtnUpdate_Click" 
                        Text="Update" Width="61px" ValidationGroup="g" BackColor="#FF9900" 
                        BorderColor="#FF9900" Font-Bold="True" Font-Size="Small" ForeColor="#333333" />
                        <asp:Button ID="BtnBack" runat="server" Height="24px" 
                        Text="Back" Width="61px" BackColor="#FF9900" 
                        BorderColor="#FF9900" Font-Bold="True" Font-Size="Small" 
                        ForeColor="#333333" onclick="BtnBack_Click" />
                </td>
            </tr>
            <tr>
                <td align="right" colspan="2">
                    <asp:Label ID="lblMsg" runat="server" ForeColor="#FF3300"></asp:Label>
                </td>
            </tr>
            </table>
            
             <div style="overflow:scroll; width:450px" id="DivDesg" runat="server" visible="false">
        </div>
        
        </table>
    </center>
</asp:Content>


