<%@ Page Language="C#" MasterPageFile="~/HRManager/TravelMaster.master"    AutoEventWireup="true" CodeFile="FrmAddEmployeeVisa.aspx.cs" Inherits="Travel_Sheduling_FrmAddEmployeeVisa" Title="Untitled Page" %>
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
        <div style="border: medium groove #FF9900;">
            <table style="background-color: #ffcc66">
                <tr>
                    <td colspan="6">
                    <center class="style4">
                        Add  Employee Visa Details
                        </center>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                       Visa Apply Date
                    </td>
                    <td  align="left">
                       <asp:TextBox ID="txtApplyDate" runat="server"></asp:TextBox>
                        <cc1:CalendarExtender ID="txtApplyDate_CalendarExtender" runat="server" TargetControlID="txtApplyDate">
                        </cc1:CalendarExtender>
                        </td> 
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtApplyDate"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                    <td align="right">
                        Emp Name</td>
                    <td  align="left">
                        <asp:DropDownList ID="DdlEmpId" runat="server" Width="153px"></asp:DropDownList>
                        </td> 
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DdlEmpId"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g" 
                                InitialValue="Select">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
               
                <tr>
                    <td align="right">
                      PassportId</td>
                    <td  align="left">
                        <asp:DropDownList ID="DdlPassportId" runat="server" Width="153px"></asp:DropDownList>
                    </td>
                    
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DdlPassportId"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g" 
                                InitialValue="Select">*</asp:RequiredFieldValidator>
                    </td>
                     <td align="right">
                       Visa Type Name
                    </td>
                    <td  align="left">
                        <asp:DropDownList ID="DdlVisaTypeId" runat="server" Width="153px"></asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="DdlVisaTypeId"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g" 
                            InitialValue="Select">*</asp:RequiredFieldValidator>
                    </td>
                   
                       </tr>
                     <tr>
                     
                     <td align="right">
                      Country Name</td>
                    <td  align="left">
                       
                          <asp:DropDownList ID="DdlCountryId" runat="server" Width="153px"></asp:DropDownList>
                            
                            </td> 
                            <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DdlCountryId"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g" InitialValue="Select">*</asp:RequiredFieldValidator>
                    </td>
                   <td align="right">
                       Visa Status</td>
                   <td  align="left">
                        <asp:CheckBox ID ="ChkStatus" runat="server" />
                    </td>
                        <td>
                        
                    </td>
                    
                </tr>
                
                   <tr>
                   
                  <td align="right" valign="top">
                        Remarks</td>
                        <td  align="left">
                   <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine" ></asp:TextBox>
                        
                    </td>
                     <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtRemarks"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                   
                    <td align="right" valign="top">
                       Reasons
                       </td>
                    <td  align="left">
                      <asp:TextBox ID="txtReasons"  runat="server" TextMode="MultiLine" />
                    </td>
                        <td>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtReasons"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                    
                    
                </tr>
                   <tr>
                    <td align="right">
                        Visa From Date</td>
                        <td  align="left">
                  <asp:TextBox ID="txtFromDate" runat="server"></asp:TextBox>
                        <cc1:CalendarExtender ID="txtFromDate_CalendarExtender" runat="server" TargetControlID="txtFromDate">
                        </cc1:CalendarExtender>
                        
                    </td>
                    <td>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtFromDate"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>  
                    </td>
                 <td align="right">
                         Visa To Date</td>
                        <td  align="left">
                        <asp:TextBox ID="txtToDate" runat="server"></asp:TextBox>
                        <cc1:CalendarExtender ID="txtToDate_CalendarExtender" runat="server" TargetControlID="txtToDate">
                        </cc1:CalendarExtender>
                            </td>
                          <td>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtToDate"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>  
                        </td> 
                </tr>
                       <tr>
                    <td align="right">
                        Emp Date Relieved</td>
                    <td  align="left">
                       <asp:TextBox ID="txtRelieved" runat="server"></asp:TextBox>
                        <cc1:CalendarExtender ID="txtRelieved_CalendarExtender" runat="server" TargetControlID="txtRelieved">
                        </cc1:CalendarExtender>
                       </td>
                                             <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtRelieved"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                     <td align="right">
                        Emp Date Rejoined</td>
                    <td  align="left">
                       <asp:TextBox ID="txtRejoined" runat="server"></asp:TextBox>
                        <cc1:CalendarExtender ID="txtRejoined_CalendarExtender" runat="server" TargetControlID="txtRejoined">
                        </cc1:CalendarExtender>
                       </td>
                                             <td class="style14">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtRejoined"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                    
                </tr>
                    <tr>
                    <td align="right" valign="top">
                        Emp Deputation</td>
                    <td  align="left">
                       <asp:TextBox ID="txtDeputation" runat="server" TextMode="MultiLine"></asp:TextBox>
                       
                       </td>
                                             <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtDeputation"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                     <td align="right" valign="top">
                        Supporative Documets</td>
                    <td  align="left">
                       <asp:TextBox ID="txtSupporative" runat="server" TextMode="MultiLine"> </asp:TextBox>
                        
                       </td>
                                             <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtSupporative"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                    
                </tr>
                    <tr>
                    <td align="right" valign="top">
                        Emp Name & Address</td>
                    <td  align="left">
                       <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                       
                       </td>
                                             <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtAddress"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
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
            
             <div style="overflow:scroll; width:697px" id="DivEmployeeVisa" runat="server" 
                visible="false">
            <asp:GridView ID="GridViewEmployeeVisa" runat="server" BackColor="LightGoldenrodYellow"
                BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None"
                Width="697px" style="margin-top: 1px" Height="122px">
                <FooterStyle BackColor="Tan" />
                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                <AlternatingRowStyle BackColor="PaleGoldenrod" />
            </asp:GridView>
        </div>
        <tr>
        <td  colspan="4">
        <asp:Label ID="lblMsg" runat="server" 
         ForeColor="#FF5050" ></asp:Label>
         </td>
         </tr>
         </div> 
</asp:Content>
