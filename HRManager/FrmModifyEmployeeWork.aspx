<%@ Page Language="C#" MasterPageFile="~/HRManager/TravelMaster.master"  AutoEventWireup="true" CodeFile="FrmModifyEmployeeWork.aspx.cs" Inherits="Travel_Sheduling_FrmModifyEmployeeWork" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .style4
        {
            font-size: large;
            font-weight: bold;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
<br />
<br />
<center>
        <div>
            <table style="border: medium groove #FF9900; background-color: #ffcc66;">
                <tr>
                    <td colspan="3" class="style4">
                       Modify  Employee Work Details
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        Emp WorkId
                    </td>
                    <td align="left">
                        <asp:DropDownList ID="DdlEmpWorkId" runat="server" Height="16px" Width="173px" 
                            AutoPostBack="true" 
                            onselectedindexchanged="DdlEmpWorkId_SelectedIndexChanged"></asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DdlEmpWorkId"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g" 
                            InitialValue="Select">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" valign="top">
                        Project Details</td>
                   <td align="left">
                        <asp:TextBox ID="txtProject" runat="server" TextMode="MultiLine" Height="79px" 
                            Width="175px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtProject"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
               
               
                <tr>
                    <td align="right" valign="top">
                      Reasons Deputation</td>
                   <td align="left">
                        <asp:TextBox ID="txtReasons" runat="server" TextMode="MultiLine" Height="93px"></asp:TextBox>
                    </td>
                    
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtReasons"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
               
                <tr>
                    <td align="right" valign="top">
                       Deputation Responsiblities</td> 
                        <td align="left">
                        <asp:TextBox ID="txtResponse" runat="server" TextMode="MultiLine" Height="94px"></asp:TextBox>
                    </td>
                    
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtResponse"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                             <tr>
                <td align="right" colspan="2">
                    <asp:Button ID="BtnUpdate" runat="server" Height="24px" onclick="BtnUpdate_Click" 
                        Text="Update" Width="61px" ValidationGroup="g" BackColor="#FF9900" 
                        BorderColor="#FF9900" Font-Bold="True" Font-Size="Small"/>
                         <asp:Button ID="Button1" runat="server" Height="24px" 
                        Text="Back" Width="61px" BackColor="#FF9900" 
                        BorderColor="#FF9900" Font-Bold="True" Font-Size="Small" 
                        onclick="Button1_Click" />
                </td>
            </tr>
            <tr>
                <td align="right" colspan="2">
                    <asp:Label ID="lblMsg" runat="server" ForeColor="#FF3300"></asp:Label>
                </td>
            </tr>
                       </table>
         </div> 
    </center>
</asp:Content>

