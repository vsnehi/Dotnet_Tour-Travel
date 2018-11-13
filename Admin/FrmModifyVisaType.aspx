<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="FrmModifyVisaType.aspx.cs" Inherits="Admin_VisaType_Master_FrmModifyVisaType" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .style4
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
            <table style="border: medium groove #FF9900; background-color: #ffcc66;">
                <tr>
                    <td colspan="3">
                        <span class="style4">Modify Visa Type Details</span>
                    </td>
                </tr>
                <tr>
                    <td  align="right" >
                        Visa Type Name
                    </td>
                    <td align="left">
                        <asp:DropDownList ID="DdlVisaName" runat="server" AutoPostBack="true"  
                            Width="153px" onselectedindexchanged="DdlVisaName_SelectedIndexChanged">
                        </asp:DropDownList>  
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DdlVisaName"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g" 
                            InitialValue="Select">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        Visa Type Abbr</td>
                    <td align="left">
                        <asp:TextBox ID="txtVisaAbbr" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtVisaAbbr"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
               
                <tr>
                    <td  valign="top" align="right">
                        Visa Type Desc</td>
                    <td align="left">
                        <asp:TextBox ID="txtVisaDesc" runat="server" TextMode="MultiLine" Width="153px"></asp:TextBox>
                    </td>
                    
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtVisaDesc"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
               
                
                <tr>
                <td align="right" colspan="2">
                    <asp:Button ID="BtnUpdate" runat="server" Height="24px" onclick="BtnUpdate_Click" 
                        Text="Update" Width="61px" ValidationGroup="g" BackColor="#FF9900" 
                        BorderColor="#FF9900" Font-Bold="True" Font-Size="Small" />
                         <asp:Button ID="BtnBack" runat="server" Height="24px" 
                        Text="Back" Width="61px"  BackColor="#FF9900" 
                        BorderColor="#FF9900" Font-Bold="True" Font-Size="Small" 
                        onclick="BtnBack_Click1" />
            </tr>
            <tr>
                <td align="right" colspan="2">
                    <asp:Label ID="lblMsg" runat="server" ForeColor="#FF3300"></asp:Label>
                </td>
            </tr>
            </table>
    </center>
</asp:Content>


