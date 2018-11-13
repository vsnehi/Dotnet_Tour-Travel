<%@ Page Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" Title="Untitled Page" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center style="height: 389px">
<br /><br /><br />
<asp:Panel ID="pnlLogin" runat ="server" Width ="300px" BorderStyle="Groove" style="background-color: #ffcc66"
        Height="139px" >
<h5 class="style2">Login Here</h5>
<table style="background-color: #ffcc66">
<tr>
<td align ="right" ><b>User Name</b></td>
<td align ="left" ><asp:TextBox ID="txtUserName" runat ="server" Width="135px" ></asp:TextBox></td>
<td><asp:RequiredFieldValidator ID="RFVUserName" runat ="server" ControlToValidate="txtUserName" ErrorMessage ="*"></asp:RequiredFieldValidator></td>
</tr>
<tr>
<td  align ="right"><b>Password</b></td>
<td  align ="left"><asp:TextBox ID="txtPassword" runat ="server" 
        TextMode="Password" Width="135px" ></asp:TextBox></td>
<td><asp:RequiredFieldValidator ID="RFVPassword" ControlToValidate ="txtPassword" runat ="server" ErrorMessage ="*"></asp:RequiredFieldValidator></td>
</tr>
<tr>
<td colspan ="3"><asp:Button ID="btnSubmit" runat ="server" Text ="Login" 
        onclick="btnSubmit_Click" BackColor="#FF9900" BorderColor="#FF9900" 
        Font-Bold="True" /></td>
</tr>
<tr>
<td colspan ="3">
<asp:Label ID="lblMsg" runat ="server" ForeColor="Red" ></asp:Label>
</td>
</tr>
</table>
</asp:Panel>
</center>

</asp:Content>



