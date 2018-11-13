<%@ Control Language="C#" AutoEventWireup="true" CodeFile="VideoUpload.ascx.cs" Inherits="VideoUpload" %>
<style type="text/css">
    .style4
    {
        width: 330px;
        text-align: left;
    }
</style>


  
<table style="width: 300px" >
    <tr>
        <td >
            <asp:FileUpload ID="Upload1" runat="server" Font-Names="Verdana" 
                Font-Size="10px"  />
        </td>
        <td rowspan="3" style="text-align: left">
            <asp:Image ID="imgMyPhoto" BorderStyle="Dashed" BorderWidth="1" runat="server" 
                Height="75px" Width="131px" />
        </td>
    </tr>
    <tr>
        <td style="text-align: right" >
            <asp:Button ID="btnShowImg" CausesValidation="false" runat="server" Text="Upload" 
                OnClick="btnShowImg_Click" Font-Names="Verdana" Font-Size="10px" 
                style="height: 20px" />
        </td>
    </tr>
    <tr>
        <td >

        </td>
    </tr>
    <tr>
    <td colspan="3" style="text-align: left"><asp:Label ID="lblMessage" runat="server" Font-Names="Verdana" Font-Size="10px" 
            ForeColor="Red" ></asp:Label></td>
    </tr>
    </table>
 