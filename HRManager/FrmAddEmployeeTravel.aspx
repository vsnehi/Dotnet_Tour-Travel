<%@ Page Language="C#" MasterPageFile="~/HRManager/TravelMaster.master"   AutoEventWireup="true" CodeFile="FrmAddEmployeeTravel.aspx.cs" Inherits="Travel_Sheduling_FrmAddEmployeeTravel" Title="Untitled Page" %>
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
        <div style="width: 368px">
            <table style="width: 371px; background-color: #ffcc66;" 
                style="border: medium groove #FF9900;">
                <tr>
                    <td colspan="3" class="style4">
                        Add  Employee Travel Details
                    </td>
                </tr>
                <tr>
                    <td align="right">
                       Emp Name
                    </td>
                    <td align="left">
                        <asp:DropDownList ID="DdlEmpId" runat="server" Width="153px"></asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DdlEmpId"
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
                        <asp:TextBox ID="txtEndDate" runat="server" ></asp:TextBox>
                        <cc1:CalendarExtender ID="txtEndDate_CalendarExtender" runat="server" TargetControlID="txtEndDate">
                        </cc1:CalendarExtender>
                    </td>
                    
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtEndDate"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
               <tr>
                    <td align="right">
                        Country Name</td>
                   <td align="left">
                        <asp:DropDownList ID="DdlCountryId" runat="server" Width="153px"></asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DdlCountryId"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g" 
                            InitialValue="Select">*</asp:RequiredFieldValidator>
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
                        <asp:Button ID="BtnAdd" runat="server" OnClick="BtnAdd_Click" Text="Submit" 
                            ValidationGroup="g" BackColor="#FF9900" Font-Bold="true"
                            BorderColor="#FF9900" />
                        <asp:Button ID="btnClear" runat="server" OnClick="btnClear_Click" Text="Cancel" 
                            Width="57px" BackColor="#FF9900" BorderColor="#FF9900" Font-Bold="True" 
                            Font-Size="Small" />
                        <asp:Button ID="BtnView" runat="server" Text="Show" 
                            OnClick="BtnView_Click" BackColor="#FF9900" BorderColor="#FF9900" 
                            Font-Bold="True" Font-Size="Small"  />
                            <asp:Button ID="Btn_Modify" runat="server" Text="Modify" 
                             BackColor="#FF9900" BorderColor="#FF9900" 
                            Font-Bold="True" Font-Size="Small" onclick="Btn_Modify_Click" />
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
            
             <div style="overflow:scroll; width:365px" id="DivTravel" runat="server" 
                visible="false">
            <asp:GridView ID="GridViewTravel" runat="server" BackColor="LightGoldenrodYellow"
                BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None"
                Width="388px" style="margin-top: 1px">
                <FooterStyle BackColor="Tan" />
                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                <AlternatingRowStyle BackColor="PaleGoldenrod" />
            </asp:GridView>
                 &nbsp;</div>
        <tr>
        <td>
        <asp:Label ID="lblMsg" runat="server" 
         ForeColor="#FF5050" ></asp:Label>
         </td>
         </tr>
         </div> 
    </center>
</asp:Content>

