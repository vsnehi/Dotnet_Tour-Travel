<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BrowseImage1.ascx.cs" Inherits="BrowseImage1" %>
<style type="text/css">
    .style4
    {
        width: 330px;
        text-align: right;
    }
</style>



<table style="width: 316px; height: 100px;">
    <tr>
        <td class="style4" height="3px">
            <asp:FileUpload ID="Upload1" runat="server" Font-Names="Verdana" 
                Font-Size="10px"  />
        </td>
        <td rowspan="3">
            <asp:Image ID="imgMyPhoto" BorderStyle="Dashed" BorderWidth="1" runat="server" 
                Height="84px" Width="117px" />
        </td>
    </tr>
    <tr>
        <td class="style4" height="3px">
            <asp:Button ID="btnShowImg" CausesValidation="false" runat="server" Text="Show My Photo" 
                OnClick="btnShowImg_Click" Font-Names="Verdana" Font-Size="10px" />
        </td>
    </tr>
    <tr>
        <td class="style4">
<asp:Label ID="lblMessage" runat="server" Font-Names="Verdana" Font-Size="10px" 
            ForeColor="Red" ></asp:Label>
        </td>
    </tr>
    </table>
    <br />
