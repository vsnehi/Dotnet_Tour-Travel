<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true"
    CodeFile="FrmModifyEmployeePassport.aspx.cs" Inherits="Admin_Employees_Passport_Master_FrmModifyEmployeePassport"
    Title="Untitled Page" %>
<%@ Register Src="~/UserControls/BrowseImage.ascx" TagName="BrowseImage" TagPrefix="Uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    
    <style type="text/css">
        .style5
        {
            font-size: large;
            font-weight: bold;
        }
        .style6
        {
            width: 25px;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
<br />
<br />
    <div style="border: medium groove #FF9900; overflow:scroll; width: 824px; height: 360px;">
        <table style="background-color: #ffcc66; width: 878px;">
            <tr>
                <td colspan="6">
                    <center class="style5">
                        Modify Employee Passport Details
                    </center>
                </td>
            </tr>
                 <tr>
                <td align="right">
                    PassPortId
                </td>
                <td align="left">
                    <asp:DropDownList ID="DdlPassportId" runat="server" AutoPostBack="true" onselectedindexchanged="DdlPassportId_SelectedIndexChanged" 
                        Width="153px">
                    </asp:DropDownList>
                </td>
                <td class="style6">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DdlPassportId"
                        ErrorMessage="RequiredFieldValidator" ValidationGroup="g" 
                        InitialValue="Select">*</asp:RequiredFieldValidator>
                </td>
            
                <td align="right">
                    PassPortNo
                </td>
                <td align="left">
                    <asp:DropDownList ID="DdlPassportNo" runat="server" Height="16px" Width="153px">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DdlPassportNo"
                        ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                </td>
                   
            </tr>
            <tr>
                <td  align="right">
                    Place Of Passport
                </td>
                <td align="left">
                    <asp:TextBox ID="txtPlace" runat="server"></asp:TextBox>
                </td>
                <td class="style6">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPlace"
                        ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                </td>
                <td align="right" valign="top">
                    Address
                </td>
                <td align="left">
                    <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Width="153px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAddress"
                        ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td  align="right">
                    Passport Issued Date
                </td>
                <td align="left">
                    <asp:TextBox ID="txtIssuedDate" runat="server"></asp:TextBox>
                    <cc1:CalendarExtender ID="txtIssuedDate_CalendarExtender1" runat="server" TargetControlID="txtIssuedDate">
                    </cc1:CalendarExtender>
                </td>
                <td class="style6">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtIssuedDate"
                        ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                </td>
                <td align="right">
                    Passport Expiry Date
                </td>
                <td align="left">
                    <asp:TextBox ID="txtExpiryDate" runat="server"></asp:TextBox>
                    <cc1:CalendarExtender ID="txtExpiryDate_CalendarExtender" runat="server" TargetControlID="txtExpiryDate">
                    </cc1:CalendarExtender>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtExpiryDate"
                        ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td  align="right">
                    ECNR Status
                </td>
                <td align="left">
                    <asp:CheckBox ID="ChkStatus" runat="server" />
                </td>
                <td class="style6">
                </td>
                <td align="right">
                    Identification Marks
                </td>
                <td align="left">
                    <asp:TextBox ID="txtMarks" runat="server" TextMode="MultiLine" Width="153px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtMarks"
                        ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td  align="right">
                    No. Of Pages
                </td>
                <td align="left">
                    <asp:TextBox ID="txtPages" runat="server"></asp:TextBox>
                </td>
                <td class="style6">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtPages"
                        ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                </td>
                <td  align="right">
                    PassPort Country
                </td>
                <td align="left">
                    <asp:TextBox ID="txtCountry" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtCountry"
                        ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td  align="right" valign="top">
                    CitizenShip Of Employee
                </td>
                <td align="left" valign="top">
                    <asp:TextBox ID="txtCitizen" runat="server"></asp:TextBox>
                </td>
                <td align="left" class="style6" valign="top">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtCitizen"
                        ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                </td>
                <td  valign="top" align="right">
                    Image Of Passport
                </td>
                <td align="left" valign="top">
                    <Uc1:BrowseImage ID="BrowseImage1" runat="server" DefaultImageUrl="~/Images/NoImage.jpg" />
                </td>
                <tr>
                    <td align="right" colspan="4">
                        <asp:Button ID="BtnUpdate" runat="server" OnClick="BtnUpdate_Click"
                            Text="Update" ValidationGroup="g" BackColor="#FF9900" BorderColor="#FF9900"
                            Font-Bold="True" Font-Size="Small" />
                            <asp:Button ID="BtnBack" runat="server" 
                            Text="Back"  BackColor="#FF9900" BorderColor="#FF9900"
                            Font-Bold="True" Font-Size="Small" onclick="BtnBack_Click" />
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="4">
                        <asp:Label ID="lblMsg" runat="server" ForeColor="#FF3300"></asp:Label>
                    </td>
                </tr>
        </table>
    </div>
</asp:Content>
