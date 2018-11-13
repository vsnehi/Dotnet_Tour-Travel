<%@ Page Language="C#" MasterPageFile="~/HRManager/TravelMaster.master"   AutoEventWireup="true" CodeFile="FrmModifyEmployeeTravel.aspx.cs" Inherits="Travel_Sheduling_FrmModifyEmployeeTravel" Title="Untitled Page" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
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
            <table style="width: 364px; background-color: #ffcc66;" 
                style="border: medium groove #FF9900;">
                <tr>
                    <td colspan="3" class="style4">
                        Modify  Employee Travel Details
                    </td>
                </tr>
                <tr>
                    <td align="right">
                       Employee Travel Id
                    </td>
                   <td align="left">
                        <asp:DropDownList ID="DdlEmpTravelId" runat="server" AutoPostBack="true" onselectedindexchanged="DdlEmpTravelId_SelectedIndexChanged" 
                            Width="153px"></asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DdlEmpTravelId"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g" 
                            InitialValue="Select">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                   <td align="right">
                        Travel Start Date</td>
                    <td align="left">
                        <asp:TextBox ID="txtStartDate" runat="server"></asp:TextBox>
                        <cc1:CalendarExtender ID="txtStartDate_CalendarExtender" runat="server" TargetControlID="txtStartDate">
                        </cc1:CalendarExtender>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtStartDate"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
               
               
                <tr>
                    <td align="right">
                        Travel End Date</td>
                    <td align="left">
                        <asp:TextBox ID="txtEndDate" runat="server"></asp:TextBox>
                        <cc1:CalendarExtender ID="txtEndDate_CalendarExtender" runat="server" TargetControlID="txtEndDate">
                        </cc1:CalendarExtender>
                    </td>
                    
                        <td class="style13">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtEndDate"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
        
                      <tr>
                    <td align="right">
                       Special Instruction
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtSpecial" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtSpecial"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
              <tr>
                <td align="right" colspan="2">
                    <asp:Button ID="BtnUpdate" runat="server" Height="24px" onclick="BtnUpdate_Click" 
                        Text="Update" Width="61px" ValidationGroup="g" BackColor="#FF9900" 
                        BorderColor="#FF9900" Font-Bold="True" Font-Size="Small"/>
                        <asp:Button ID="BtnBack" runat="server" Height="24px"
                        Text="Back" Width="61px" ValidationGroup="g" BackColor="#FF9900" 
                        BorderColor="#FF9900" Font-Bold="True" Font-Size="Small" 
                        onclick="BtnBack_Click"  />
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

