<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TicketSearch.ascx.cs" Inherits="UserControls_TicketSearch" %>
<center>
    <table>
        <tr>
            <td>
                Enter Ticket No
            </td>
            <td>
                <asp:TextBox ID="txtTicketNo" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="btnSearch" runat="server" Text="Search" BackColor="#FF9900" BorderColor="#FF9900" Font-Bold="true"
                    OnClick="btnSearch_Click" />
            </td>
            <td>
                <asp:RequiredFieldValidator ControlToValidate="txtTicketNo" ID="RequiredFieldValidator1"
                    runat="server" ErrorMessage="Enter TicketNo."></asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
</center>
<center>
    <br />
    <br />
    <div id="divTicket" style="overflow:scroll; height: 163px; width: 569px;" 
        runat="server" visible="false">
    <asp:GridView ID="grdTicket" runat="server" CellPadding="2" ForeColor="Black" GridLines="None"
        AllowPaging="True" PageSize="5" BackColor="LightGoldenrodYellow" 
        BorderColor="Tan" BorderWidth="1px" Height="146px" Width="558px" 
            onpageindexchanging="grdTicket_PageIndexChanging">
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