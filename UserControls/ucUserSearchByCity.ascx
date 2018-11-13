<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucUserSearchByCity.ascx.cs" Inherits="UserControls_ucUserSearchByCity" %>
<style type="text/css">
    .frmbody
{
background-color:#A5C8EF;
border-color:Black;
font-family:Verdana;
font-size:10px;
font-weight:normal;
	width: 597px;
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
    <asp:Label ID="lblTitle" runat="server" Font-Bold="true" Font-Size="Larger" ForeColor="#0066FF"></asp:Label>
    <br />
    <br />
    <table class="frmbody">
    <tr><td>Country</td>
    <td><asp:DropDownList ID="ddlCountry" runat="server" 
            onselectedindexchanged="ddlCountry_SelectedIndexChanged" 
            ValidationGroup="a"><asp:ListItem>--Select--</asp:ListItem></asp:DropDownList>
                    </td><td>
        <asp:RequiredFieldValidator ID="rfvCountry" runat="server" ErrorMessage="*" ForeColor="Red" 
                            ControlToValidate="ddlCountry" ValidationGroup="a"></asp:RequiredFieldValidator></td>
    <td>State</td><td><asp:DropDownList ID="ddlState" runat="server" 
                        onselectedindexchanged="ddlState_SelectedIndexChanged" 
                        ValidationGroup="a" ><asp:ListItem>--Select--</asp:ListItem></asp:DropDownList>
                    </td><td>
        <asp:RequiredFieldValidator ID="rfvState" runat="server" ErrorMessage="*" ForeColor="Red" 
                            ControlToValidate="ddlState" ValidationGroup="a"></asp:RequiredFieldValidator></td>
    <td>City</td><td><asp:DropDownList ID="ddlCity" runat="server" ValidationGroup="a" ><asp:ListItem>--Select--</asp:ListItem></asp:DropDownList>
                    </td><td>
        <asp:RequiredFieldValidator ID="rfvCity" runat="server" ErrorMessage="*" ForeColor="Red" 
                            ControlToValidate="ddlCity" ValidationGroup="a"></asp:RequiredFieldValidator></td>
        <td >
            <asp:Button ID="btnSearch" CssClass="button" runat="server" Text="Search" 
                Width="63px" onclick="btnSearch_Click" Height="23px" ValidationGroup="a" /></td>
        </tr>
    </table>
    </center>
    </div>
    <br />
            <div>
    <center>
    <table>
    <tr><td>
        <asp:GridView ID="gvCity" runat="server" AllowPaging="true" AutoGenerateColumns ="False" 
            CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="5" 
            onrowcommand="gvCity_RowCommand" 
            onpageindexchanging="gvCity_PageIndexChanging" >
            
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
        <asp:TemplateField HeaderText="AddressType">
        <ItemTemplate>
        <asp:Label ID="lblAddressType" runat="server" Text='<%#Eval("UserAddressType") %>'></asp:Label>
        </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="HNo">
        <ItemTemplate>
        <asp:Label ID="lblHNo" runat="server" Text='<%#Eval("HNo") %>'></asp:Label>
        </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Street">
        <ItemTemplate>
        <asp:Label ID="lblStreet" runat="server" Text='<%#Eval("Street") %>'></asp:Label>
        </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="PinCode">
        <ItemTemplate>
        <asp:Label ID="lblPinCode" runat="server" Text='<%#Eval("PinCode") %>'></asp:Label>
        </ItemTemplate>
        </asp:TemplateField>
         <asp:TemplateField HeaderText="Conatact">
        <ItemTemplate>
        <asp:LinkButton ID="lbtnContactDetails" runat="server" Text="ContactDetails" CommandArgument ='<%#Eval("UserId") %>' CommandName ="Contact"></asp:LinkButton>
        </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Personal">
        <ItemTemplate>
        <asp:LinkButton ID="lbtnPersonalDetails" runat="server" Text="PersonalDetails" CommandArgument ='<%#Eval("UserId") %>' CommandName ="Personal"></asp:LinkButton>
        </ItemTemplate>
        </asp:TemplateField>
        </Columns>
        </asp:GridView></td>
        
    </tr>
    <tr><td>
        <asp:GridView ID="gv2" runat="server" CellPadding="4" ForeColor="#333333" 
            GridLines="None" PageSize="5">
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#EFF3FB" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
        </asp:GridView></td></tr>
    <tr><td><asp:Label ID="lblmsg" runat="server" ForeColor="Red"></asp:Label></td></tr>
    <tr><td align="center"><asp:Button id="btnPrint" CssClass="button"  runat="server" 
            Text="Print" Width="84px" onclick="btnPrint_Click" /></td></tr>
    </table>
    </center>
    </div>
