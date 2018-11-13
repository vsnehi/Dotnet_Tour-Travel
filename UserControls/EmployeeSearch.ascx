<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EmployeeSearch.ascx.cs" Inherits="UserControls_EmployeeSearch" %>
<center>
    <table>
        <tr>
            <td>
                Enter Employee Name&nbsp;
            </td>
            <td>
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="btnSearch" runat="server" Text="Search" BackColor="#FF9900" BorderColor="#FF9900" Font-Bold="true"
                    OnClick="btnSearch_Click" />
            </td>
            <td>
                <asp:RequiredFieldValidator ControlToValidate="txtName" ID="RequiredFieldValidator1"
                    runat="server" ErrorMessage="Enter Name"></asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
</center>
<center>
    <br />
    <br />
    <div id="divemp" runat="server" style="overflow:scroll" visible="false">
    <asp:GridView ID="grdName" runat="server" CellPadding="2" ForeColor="Black" GridLines="None"
        AllowPaging="True" PageSize="5" BackColor="LightGoldenrodYellow" 
        BorderColor="Tan" BorderWidth="1px" Width="325px" 
            onpageindexchanging="grdName_PageIndexChanging">
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
