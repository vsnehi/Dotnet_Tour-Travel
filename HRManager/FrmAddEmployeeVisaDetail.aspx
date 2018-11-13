<%@ Page Language="C#" MasterPageFile="~/HRManager/TravelMaster.master"   AutoEventWireup="true" CodeFile="FrmAddEmployeeVisaDetail.aspx.cs" Inherits="Travel_Sheduling_FrmAddEmployeeVisaDetail" Title="Untitled Page" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@  Register Src="~/UserControls/BrowseImage.ascx" TagName="BrowseImage" TagPrefix="Uc1" %>
<%@ Register Src="~/UserControls/BrowseImage1.ascx" TagName="BrowseImage1" TagPrefix="Uc2"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .style5
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
            <table  style="border: medium groove #FF9900; background-color: #ffcc66;">
                <tr>
                    <td colspan="3" class="style5">
                        Add  Employee Visas Details
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        Visa Apply Id
                    </td>
                    <td align="left">
                       <asp:DropDownList ID="DdlVisaApplyId" runat="server" Width="153px"></asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DdlVisaApplyId"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g" 
                            InitialValue="Select">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        Employee Name</td>
                    <td align="left">
                       <asp:DropDownList ID="DdlEmpId" runat="server" Width="153px"></asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DdlEmpId"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g" 
                            InitialValue="Select">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
               
                <tr>
                   <td align="right" valign="top">
                       Document Images</td>
                   <td align="left">
                       <Uc1:BrowseImage ID ="BrowseImage1" runat="server" DefaultImageUrl="~/Images/NoImage.jpg" />
                    </td>
                        
                </tr>
                      <tr>
                    <td align="right" valign="top">
                      Form Info. Image</td>
                    <td align="left">
                       <Uc2:BrowseImage1 ID="BrowseImage2" runat="server" DefaultImageUrl="~/Images/NoImage.jpg" />
                    </td>
                        
                </tr>
                 <tr>
                    <td align="right" valign="top">
                        Remarks</td>
                    <td align="left">
                       <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtRemarks"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                      <tr>
                    <td align="right">
                        Approved Status</td>
                   <td align="left">
                       <asp:CheckBox ID="ChkStatus" runat="server" />
                    </td>
                    
                        </tr> 
                        <tr>
                    <td align="right">
                        Submitted Date</td>
                   <td align="left">
                       <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
                       <cc1:CalendarExtender ID="CalendarExtender1" TargetControlID="txtDate"
                           runat="server">
                       </cc1:CalendarExtender>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtDate"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="2">
                        <asp:Button ID="BtnAdd" runat="server" OnClick="BtnAdd_Click" Text="Submit" 
                            ValidationGroup="g" BackColor="#FF9900" Font-Bold="true"
                            BorderColor="#FF9900" />
                        <asp:Button ID="btnClear" runat="server" OnClick="btnClear_Click" Text="Cancel" 
                            BackColor="#FF9900" BorderColor="#FF9900" Font-Bold="True" 
                            Font-Size="Small"/>
                        <asp:Button ID="BtnView" runat="server" Text="Show" 
                            OnClick="BtnView_Click" BackColor="#FF9900" BorderColor="#FF9900" 
                            Font-Bold="True" Font-Size="Small"  />
                            <asp:Button ID="BtnModify" runat="server" Text="Modify" 
                            OnClick="BtnModify_Click" BackColor="#FF9900" BorderColor="#FF9900" 
                            Font-Bold="True" Font-Size="Small" />
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
            
             <div style="border: medium groove #FF9900; width:466px" 
                id="DivVisaDetail" runat="server" 
                visible="false">
            <asp:GridView ID="GridViewVisaDetail" runat="server" BackColor="LightGoldenrodYellow"
                BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None"
                Width="452px" style="margin-top: 1px">
                <FooterStyle BackColor="Tan" />
                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                <AlternatingRowStyle BackColor="PaleGoldenrod" />
            </asp:GridView>
        </div>
        <tr>
        <td>
        <asp:Label ID="lblMsg" runat="server" 
         ForeColor="#FF5050" ></asp:Label>
         </td>
         </tr>
         </div> 
    </center>
</asp:Content>

