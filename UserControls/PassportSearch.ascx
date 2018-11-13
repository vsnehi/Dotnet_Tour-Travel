<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PassportSearch.ascx.cs" Inherits="UserControls_PassportSearch" %>
<center>
    <table>
        <tr>
            <td>
                Enter Passport No.&nbsp;
            </td>
            <td>
                <asp:TextBox ID="txtPassportNo" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="btnSearch" runat="server" Text="Search" BackColor="#FF9900" BorderColor="#FF9900" Font-Bold="true"
                    OnClick="btnSearch_Click" />
            </td>
            <td>
                <asp:RequiredFieldValidator ControlToValidate="txtPassportNo" ID="RequiredFieldValidator1"
                    runat="server" ErrorMessage="Enter PassportNo"></asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
</center>
<center>
    <br />
    <br />
    <div id="divpassport" style="overflow:scroll; height: 160px; width: 569px;" 
        runat="server" visible="false">
    <asp:GridView ID="grdPassport" runat="server" CellPadding="2" ForeColor="Black" GridLines="None"
        AllowPaging="True" PageSize="5" BackColor="LightGoldenrodYellow" 
        BorderColor="Tan" BorderWidth="1px" Height="128px" Width="558px" 
            onpageindexchanging="grdPassport_PageIndexChanging">
        <FooterStyle BackColor="Tan" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
            HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
    </asp:GridView>
    </div> 
    <br />
    <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
</center>

