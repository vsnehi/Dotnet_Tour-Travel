<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="FrmAddEmpPassport.aspx.cs" Inherits="Admin_Employees_Passport_Master_FrmAddEmpPassport" Title="Untitled Page" %>
<%@ Register Src="~/UserControls/BrowseImage.ascx" TagName="BrowseImage" TagPrefix="Uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
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
        <div style="border: medium groove #FF9900; overflow:scroll; width: 794px;">
            <table style="background-color: #FFCC66; width: 766px;">
                <tr>
                    <td colspan="6">
                    <center class="style5">
                        Add  Employee Passport Details
                        </center>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                       PassPortNo
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtPassportNo" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPassportNo"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                    <td align="right">
                        Employee Name</td>
                    <td align="left">
                        <asp:DropDownList ID="DdlEmpId" runat="server" Height="16px" Width="153px"></asp:DropDownList><td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DdlEmpId"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g" 
                            InitialValue="Select">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
               
                <tr>
                    <td align="right">
                      Place Of Passport</td>
                    <td align="left">
                        <asp:TextBox ID="txtPlace" runat="server" ></asp:TextBox>
                    </td>
                    
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPlace"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                    <td  valign="top" align="right">
                       Address </td>
                    <td align="left">
                        <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Height="34px" 
                            Width="153px" ></asp:TextBox>
                            </td> 
                            <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAddress"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                       </tr>
                     <tr>
                    <td align="right">
                       Passport Issued Date</td>
                    <td align="left">
                        <asp:TextBox ID="txtIssuedDate" runat="server"></asp:TextBox>
                        <cc1:CalendarExtender ID="txtIssuedDate_CalendarExtender1" runat="server" TargetControlID="txtIssuedDate">
                        </cc1:CalendarExtender>
                    </td>
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtIssuedDate"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                    <td  align="right">
                        Passport Expiry Date</td>
                        <td align="left">
                   <asp:TextBox ID="txtExpiryDate" runat="server"></asp:TextBox>
                        <cc1:CalendarExtender ID="txtExpiryDate_CalendarExtender" runat="server" TargetControlID="txtExpiryDate">
                        </cc1:CalendarExtender>
                    </td>
                     <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtExpiryDate"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                
                   <tr>
                    <td  align="right">
                       ECNR Status</td>
                    <td align="left">
                      <asp:CheckBox ID="ChkStatus" runat="server" />
                    </td>
                        <td>
                        
                    </td>
                    <td  align="right">
                       Identification Marks</td>
                        <td align="left">
                   <asp:TextBox ID="txtMarks" runat="server" TextMode="MultiLine" Width="153px"></asp:TextBox>
                        
                    </td>
                     <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtMarks"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                   <tr>
                    <td  align="right">
                       No. Of Pages</td>
                    <td align="left">
                    <asp:TextBox ID="txtPages" runat="server"></asp:TextBox>
                       </td>
                                             <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtPages"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                    <td  align="right">
                      PassPort Country </td>
                        <td align="left">
                   <asp:TextBox ID ="txtCountry" runat="server"></asp:TextBox>
                        
                    </td>
                          <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtCountry"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                       <tr>
                    <td  align="right" valign="top">
                       CitizenShip Of Employee</td>
                    <td align="left" valign="top">
                    <asp:TextBox ID="txtCitizen" runat="server"></asp:TextBox>
                       </td>
                                             <td valign="top">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtCitizen"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                   <td>
                   </td>
                         
                </tr>
                <tr>
                 <td  align="right" valign="top">
                      Image Of Passport </td>
                        <td align="left" valign="top">
                  
                        <Uc1:BrowseImage ID="BrowseImage1" runat="server" DefaultImageUrl="~/Images/NoImage.jpg" />
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="4">
                        <asp:Button ID="BtnAdd" runat="server" OnClick="BtnAdd_Click" Text="Submit" 
                            ValidationGroup="g" BackColor="#FF9900" 
                            BorderColor="#FF9900" Font-Bold="True" />
                        <asp:Button ID="btnClear" runat="server" OnClick="btnClear_Click" Text="Cancel" 
                            BackColor="#FF9900" BorderColor="#FF9900" Font-Bold="True" 
                            Font-Size="Small" />
                        <asp:Button ID="BtnView" runat="server" Text="Show"
                            OnClick="BtnView_Click" BackColor="#FF9900" BorderColor="#FF9900" 
                            Font-Bold="True" Font-Size="Small" />
                             <asp:Button ID="BtnModify" runat="server" Text="Modify"
                             BackColor="#FF9900" BorderColor="#FF9900" 
                            Font-Bold="True" Font-Size="Small" onclick="BtnModify_Click" />
                    </td>
                   
                </tr>
            </table>
            
             <div style="overflow:scroll; width:820px" id="DivPassport" runat="server" 
                visible="false">
            <asp:GridView ID="GridViewPassport" runat="server" BackColor="LightGoldenrodYellow"
                BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None"
                Width="821px" style="margin-top: 1px" Height="122px">
                <FooterStyle BackColor="Tan" />
                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                <AlternatingRowStyle BackColor="PaleGoldenrod" />
            </asp:GridView>
        </div>
        <tr>
        <td align="center">
        <asp:Label ID="lblMsg" runat="server" 
         ForeColor="#FF5050" ></asp:Label>
         </td>
         </tr>
         </div> 
</asp:Content>


