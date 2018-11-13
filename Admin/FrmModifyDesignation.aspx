<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="FrmModifyDesignation.aspx.cs" Inherits="Admin_Designation_Master_FrmModifyDesignation" Title="Untitled Page" %>
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
                    <td colspan="3" class="style4">
                        Modify  Designation Details
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        Designation Name
                    </td>
                    <td align="left">
                        <asp:DropDownList ID="DdlDesgName" runat="server" AutoPostBack="true" onselectedindexchanged="DdlDesgName_SelectedIndexChanged" 
                            Width="153px">
                        </asp:DropDownList>  
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DdlDesgName"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g" 
                            InitialValue="Select">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        Designation Abbr</td>
                    <td align="left">
                        <asp:TextBox ID="txtDesgAbbr" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDesgAbbr"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
               
                <tr>
                    <td  valign="top" align="right">
                        Designation Desc</td>
                    <td align="left">
                        <asp:TextBox ID="txtDesgDesc" runat="server" TextMode="MultiLine" Width="153px"></asp:TextBox>
                    </td>
                    
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtDesgDesc"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
               
                
                <tr>
                <td align="right" colspan="2">
                    <asp:Button ID="BtnUpdate" runat="server" Height="24px" onclick="BtnUpdate_Click" 
                        Text="Update" Width="61px" ValidationGroup="g" BackColor="#FF9900" 
                        BorderColor="#FF9900" Font-Bold="True" Font-Size="Small" ForeColor="#333333" />
                        <asp:Button ID="BtnBack" runat="server" Height="24px" 
                        Text="Back" Width="61px"  BackColor="#FF9900" 
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
            
    </center>
</asp:Content>

