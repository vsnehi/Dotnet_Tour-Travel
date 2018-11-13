<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucUserSearchByName.ascx.cs" Inherits="UserControls_ucUserSearchByName" %>
<style type="text/css">
    .frmbody
{
background-color:#A5C8EF;
border-color:Black;
font-family:Verdana;
font-size:10px;
font-weight:normal;
	width: 542px;
}
.button
{
background-color:#FBEDAB;
font-family:Verdana;
font-size:10px;
font-weight:bold;
	color: #000000;
}
</style>
<div>
    <center>
    <asp:Label ID="lblTitle" runat="server" Font-Bold="true" Font-Size="Large" ForeColor="#0066FF"></asp:Label>
    <br />
    <br />
    <table class="frmbody">
    <tr><td colspan="7" align="left"  ><asp:Label ID="lblNote" runat="server"  ForeColor="Red">* You have to enter both fields</asp:Label></td></tr>
    <tr>
    <td>First Name</td><td><asp:TextBox ID="txtFName"  runat="server" ValidationGroup="d"></asp:TextBox></td>
    <td>
        <asp:RequiredFieldValidator ID="rfvFName" runat="server" ErrorMessage="*" 
            ForeColor="Red" ControlToValidate="txtFName" ValidationGroup="d"></asp:RequiredFieldValidator></td>
    <td>Last Name</td><td><asp:TextBox ID="txtLName" runat="server" ValidationGroup="d"></asp:TextBox></td>
    <td>
        <asp:RequiredFieldValidator ID="rfvLName" runat="server" ErrorMessage="*" 
            ForeColor="Red" ControlToValidate="txtLName" ValidationGroup="d"></asp:RequiredFieldValidator></td>
    <td><asp:Button ID="btnSearch" CssClass="button" runat="server" Text="Search" 
            Width="63px" onclick="btnSearch_Click" Height="23px" ValidationGroup="d" /></td>
    </tr>
    </table>
    </center>
    </div>
    <br />
        <div>
    <center>
    <table style="width: 576px">
    <tr><td>
        <asp:GridView ID="gvName" runat="server" AllowPaging="true" AutoGenerateColumns ="False" 
            CellPadding="4" ForeColor="#333333" GridLines="None" 
            onrowcommand="gvName_RowCommand" PageSize="5" Width="631px">
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#EFF3FB" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
        <Columns>
        <asp:TemplateField HeaderText="UserId">
        <ItemTemplate>
        <asp:Label ID="lblUserId" runat="server" Text='<%#Eval("UserId") %>'></asp:Label>
        </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="First Name">
        <ItemTemplate>
        <asp:Label ID="lblFName" runat="server" Text='<%#Eval("FirstName") %>'></asp:Label>
        </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Last Name">
        <ItemTemplate>
        <asp:Label ID="lblLName" runat="server" Text='<%#Eval("LastName") %>'></asp:Label>
        </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Login Id">
        <ItemTemplate>
        <asp:Label ID="lblLoginId" runat="server" Text='<%#Eval("UserLoginId") %>'></asp:Label>
        </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="EmailId">
        <ItemTemplate>
        <asp:Label ID="lblEmailId" runat="server" Text='<%#Eval("EmailId") %>'></asp:Label>
        </ItemTemplate>
        </asp:TemplateField>
         <asp:TemplateField HeaderText="Contact">
        <ItemTemplate>
        <asp:LinkButton ID="lbtnContactDetails" runat="server" Text="ContactDetails" CommandArgument ='<%#Eval("UserId") %>' CommandName ="Contact"></asp:LinkButton>
        </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Address">
        <ItemTemplate>
        <asp:LinkButton ID="lbtnAddressDetails" runat="server" Text="AddressDetails" CommandArgument ='<%#Eval("UserId") %>' CommandName ="Address"></asp:LinkButton>
        </ItemTemplate>
        </asp:TemplateField>
        
        </Columns>
        </asp:GridView></td>
        
    </tr>
    <tr>
    <td>
    <asp:GridView ID="gv2" runat="server" CellPadding="4" ForeColor="#333333" 
            GridLines="None">
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#EFF3FB" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
    </td>
    </tr>
    <tr><td><asp:Label ID="lblmsg" runat="server" ForeColor="Red"></asp:Label></td></tr>
    <tr><td align="center"><asp:Button ID="btnPrint" runat="server" CssClass="button" 
            Text="Print" Width="69px" /></td></tr>
    </table>
    </center>
    </div>
