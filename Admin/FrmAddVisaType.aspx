<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="FrmAddVisaType.aspx.cs" Inherits="Admin_VisaType_Master_FrmAddVisaType" Title="Untitled Page" %>
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
        <div>
            <table style="border: medium groove #FF9900; height: 151px; width: 337px; background-color: #ffcc66;">
                <tr>
                    <td colspan="3" class="style4">
                        Add  Visa Type Details
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        Visa Type Name
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtVisaName" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtVisaName"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
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
                    <td align="right" valign="top">
                        Visa Type Desc</td>
                    <td align="left">
                        <asp:TextBox ID="txtVisaDesc" runat="server" TextMode="MultiLine" Height="57px" 
                            Width="153px" ></asp:TextBox>
                    </td>
                    
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtVisaDesc"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
               
                
                <tr>
                    <td align="right" colspan="2">
                        <asp:Button ID="BtnAdd" runat="server" OnClick="BtnAdd_Click" Text="Submit" 
                            ValidationGroup="g" BackColor="#FF9900" 
                            BorderColor="#FF9900" Font-Bold="True" />
                        <asp:Button ID="btnClear" runat="server" OnClick="btnClear_Click" Text="Cancel" 
                            BackColor="#FF9900" BorderColor="#FF9900" Font-Bold="True" 
                            Font-Size="Small" />
                        <asp:Button ID="BtnView" runat="server" Text="Show" 
                            OnClick="BtnView_Click" BackColor="#FF9900" BorderColor="#FF9900" 
                            Font-Bold="True" Font-Size="Small" />
                            <asp:Button ID="BtnModify" runat="server" Text="Modify"
                             BackColor="#FF9900" BorderColor="#FF9900" 
                            Font-Bold="True" Font-Size="Small" onclick="BtnModify_Click" />
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
            
             <div style="border: medium groove #FF9900; overflow:scroll; width:334px" 
                id="DivVisa" runat="server" 
                visible="false">
            <asp:GridView ID="GridViewVisa" runat="server" BackColor="LightGoldenrodYellow"
                BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None"
                Width="337px" style="margin-top: 1px">
                <FooterStyle BackColor="Tan" />
                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                <AlternatingRowStyle BackColor="PaleGoldenrod" />
            </asp:GridView>
        &nbsp;</div>
        <tr>
        <td>
        <asp:Label ID="lblMsg" runat="server" 
         ForeColor="#FF5050" ></asp:Label>
         </td>
         </tr>
         </div> 
    </center>
</asp:Content>

