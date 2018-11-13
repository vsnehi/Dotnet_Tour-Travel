<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="FrmModifyForiegnEmbassy.aspx.cs" Inherits="Admin_Foriegn_Embassy_Master_FrmModifyForiegnEmbassy" Title="Untitled Page" %>
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
            <table 
                style="border: medium groove #FF9900; background-color: #ffcc66;">
                <tr>
                    <td colspan="3" class="style4">
                        Modify  Foriegn Embassy Details
                    </td>
                </tr>
                <tr>
                    <td align="right">
                       Foriegn Embassy Id
                    </td>
                    <td align="left">
                        <asp:DropDownList ID="DdlEmbassyId" runat="server" AutoPostBack="true"  
                            Width="153px" onselectedindexchanged="DdlEmbassyId_SelectedIndexChanged">
                        </asp:DropDownList>  
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DdlEmbassyId"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" valign="top" >
                        Embassy Address</td>
                    <td align="left">
                        <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Height="42px" 
                            Width="153px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAddress"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
               
                <tr>
                    <td align="right">
                      Embassy Contact Person</td>
                    <td align="left">
                        <asp:TextBox ID="txtName" runat="server" style="margin-left: 0px"></asp:TextBox>
                    </td>
                    
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtName"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                   <tr>
                    <td align="right">
                      Embassy Phone No</td>
                    <td align="left">
                        <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                    </td>
                    
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPhone"
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
                        onclick="BtnBack_Click" />
                </td>
            </tr>
            <tr>
                <td align="right" colspan="2">
                    <asp:Label ID="lblMsg" runat="server" ForeColor="#FF3300"></asp:Label>
                </td>
            </tr>
            </table>
    </center>
</asp:Content>

