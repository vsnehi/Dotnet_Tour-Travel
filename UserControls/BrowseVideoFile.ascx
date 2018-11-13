<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BrowseVideoFile.ascx.cs" Inherits="UserControls_BrowseVideo" %>
<table style="width: 216px; height: 46px;">
    <tr>
        <td valign="bottom" >
            <asp:FileUpload ID="Upload1" runat="server" Font-Names="Verdana" Font-Size="10px"
                Height="18px" Width="191px" />
        </td>
        <td valign="bottom">
            <asp:Button ID="btnShowImg" CausesValidation="false" runat="server" Text="Attach File"
                OnClick="btnShowImg_Click" Height="21px" Font-Names="Verdana" 
                Font-Size="10px" Width="65px" />
        </td>
    </tr>
    <tr>
        <td valign="bottom" colspan="2">
            <asp:Label ID="lblMessage" Height="20px" runat="server" Font-Names="Verdana" Font-Size="10px"
                ForeColor="Red"></asp:Label>
        </td>
        
    </tr>
</table>