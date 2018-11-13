<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LogOut.aspx.cs" Inherits="LogOut" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            height: 19px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
<br />
<br />
    <center>
    <asp:Panel ID="pnlLogin" runat ="server" Width ="300px" BorderStyle="Groove" 
        Height="139px" >
<table style="background-color: #ffcc66; width: 299px; height: 137px;">
<tr>
<td>
</td>
</tr>
<tr>
<td>
 <asp:Label ID="lblLogOut" runat="server" style="color: #FF00FF; font-size:large; font-weight: 700"></asp:Label>
</td>
</tr>
<tr>
<td class="style2">
<asp:LinkButton ID="lnkLogOut" runat="server" Text="Do U Want Login Again" 
        ForeColor="Blue" onclick="lnkLogOut_Click"></asp:LinkButton>
</td>
</tr>

</table>
</asp:Panel> 
</center> 
</asp:Content>

