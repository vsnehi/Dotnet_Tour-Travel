<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BrowseIcon.ascx.cs" Inherits="BrowseImage" %>
<style type="text/css">
    .style4
    {
        width: 192px;
        text-align: right;
    }
</style>
<table style="width: 284px; height: 65px;">
    <tr>
        <td class="style4" height="3px">
            <asp:FileUpload ID="Upload1" runat="server" Font-Names="Verdana" 
                Font-Size="10px"  />
        </td>
        <td rowspan="3" style="text-align: left">
            <asp:Image ID="imgMyPhoto" BorderStyle="Dashed" BorderWidth="1" runat="server" 
                Height="61px" Width="78px" />
        </td>
    </tr>
    <tr>
        <td class="style4" height="3px">
            <asp:Button ID="btnShowImg" CausesValidation="false" runat="server" Text="Attach Icon" 
                OnClick="btnShowImg_Click" Font-Names="Verdana" Font-Size="10px" 
                Height="20px" Width="85px" />
        </td>
    </tr>
    <tr>
        <td class="style4">
        
        </td>
    </tr>
    <tr>
    <td colspan="3"><div id="msg" style="width:275px; overflow:auto" >
<asp:Label ID="lblMessage" runat="server" Font-Names="Verdana" Font-Size="10px" 
            ForeColor="Red" ></asp:Label></div></td>
    </tr>
    </table>
    <br />
