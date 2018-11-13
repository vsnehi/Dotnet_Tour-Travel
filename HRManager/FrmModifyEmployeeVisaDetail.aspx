<%@ Page Language="C#" MasterPageFile="~/HRManager/TravelMaster.master"   AutoEventWireup="true" CodeFile="FrmModifyEmployeeVisaDetail.aspx.cs" Inherits="Travel_Sheduling_FrmModifyEmployeeVisaDetail" Title="Untitled Page" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/BrowseImage.ascx"  TagName="BrowseImage" TagPrefix="Uc1" %>
<%@ Register Src="~/UserControls/BrowseImage1.ascx" TagName="BrowseImage1" TagPrefix="Uc2" %>
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
        <div>
            <table  style="border: medium groove #FF9900; background-color: #ffcc66;">
                <tr>
                    <td colspan="3" class="style5">
                        Modify Employee Visas Details
                    </td>
                </tr>
                <tr>
                    <td align="right">
                       Document Id
                    </td>
                   <td align="left">
                       <asp:DropDownList ID="DdlDocumentId" runat="server" Width="153px" Height="16px" 
                            AutoPostBack="true" 
                           onselectedindexchanged="DdlDocumentId_SelectedIndexChanged"></asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DdlDocumentId"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g" 
                            InitialValue="Select">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
               
                <tr>
                    <td align="right" valign="top">
                       Document Images</td>
                    <td align="left">
                      <Uc1:BrowseImage ID ="BrowseImage1" runat="server" DefaultImageUrl="~/Images/NoImage.jpg" />
                    </td>
                        
                </tr>
                      <tr>
                    <td align="right" valign="top">
                      Form Info. Image</td>
                   <td align="left">
                      <Uc2:BrowseImage1 ID ="BrowseImage2" runat="server" DefaultImageUrl="~/Images/NoImage.jpg" />
                    </td>
                        
                </tr>
                 <tr>
                    <td align="right" valign="top">
                        Remarks</td>
                    <td align="left">
                       <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine" Height="55px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtRemarks"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                      <tr>
                    <td align="right">
                        Approved Status</td>
                    <td align="left">
                       <asp:CheckBox ID="ChkStatus" runat="server" />
                    </td>
                    
                        </tr> 
                        <tr>
                    <td align="right">
                        Submitted Date</td>
                    <td align="left">
                       <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
                       <cc1:CalendarExtender ID="CalendarExtender1" TargetControlID="txtDate"
                           runat="server">
                       </cc1:CalendarExtender>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtRemarks"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
           <tr>
                <td align="right" colspan="2">
                    <asp:Button ID="BtnUpdate" runat="server" Height="24px" onclick="BtnUpdate_Click" 
                        Text="Update" Width="61px" ValidationGroup="g" BackColor="#FF9900" 
                        BorderColor="#FF9900" Font-Bold="True" Font-Size="Small"  />
                        <asp:Button ID="BtnBack" runat="server" Height="24px" 
                        Text="Back" Width="61px"  BackColor="#FF9900" 
                        BorderColor="#FF9900" Font-Bold="True" Font-Size="Small" 
                        onclick="BtnBack_Click" />
                </td>
            </tr>
            <tr>
                <td align="right" colspan="2">
                    <asp:Label ID="lblMsg" runat="server" ForeColor="#FF3300"></asp:Label>
                </td>
            </tr>
            </table>
         </div> 
    </center>
</asp:Content>

