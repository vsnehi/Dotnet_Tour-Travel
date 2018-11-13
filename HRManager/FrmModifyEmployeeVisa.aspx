<%@ Page Language="C#" MasterPageFile="~/HRManager/TravelMaster.master"   AutoEventWireup="true" CodeFile="FrmModifyEmployeeVisa.aspx.cs" Inherits="Travel_Sheduling_FrmModifyEmployeeVisa" Title="Untitled Page" %>
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
        <div>
            <table style="border: medium groove #FF9900; background-color: #ffcc66;">
                <tr>
                    <td colspan="6">
                    <center class="style4">
                        Modify  Employee Visa Details
                        </center>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                       Visa Apply Id</td>
                    <td class="style6">
                        <asp:DropDownList ID="DdlVisaApplyId" runat="server" AutoPostBack="true" 
                            Width="153px" onselectedindexchanged="DdlVisaApplyId_SelectedIndexChanged"></asp:DropDownList>
                            </td> 
                            <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DdlVisaApplyId"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g" InitialValue="Select">*</asp:RequiredFieldValidator>
                    </td>
                    
                </tr>
               
            
                     <tr>
                      <td align="right">
                          Visa Apply Date</td>
                    <td align="left">
                       
                       <asp:TextBox ID="txtApplyDate" runat="server"></asp:TextBox>
                        <cc1:CalendarExtender ID="txtApplyDate_CalendarExtender" runat="server" TargetControlID="txtApplyDate">
                        </cc1:CalendarExtender>
                            
                            </td> 
                            <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtApplyDate"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                    <td align="right">
                       Visa Status</td>
                  <td align="left">
                        <asp:CheckBox ID ="ChkStatus" runat="server" />
                    </td>
                        <td>
                        
                    </td>
                    
                </tr>
                
                   <tr>
                   
                 <td align="right">
                        Remarks</td>
                       <td align="left">
                   <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine" ></asp:TextBox>
                        
                    </td>
                     <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtRemarks"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                   
                    <td align="right">
                       Reasons
                       </td>
                    <td align="left">
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
                        <td align="left">
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
                        <td align="left">
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
                    <td align="left">
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
                    <td align="left">
                       <asp:TextBox ID="txtRejoined" runat="server"></asp:TextBox>
                        <cc1:CalendarExtender ID="txtRejoined_CalendarExtender" runat="server" TargetControlID="txtRejoined">
                        </cc1:CalendarExtender>
                       </td>
                                             <td align="left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtRejoined"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                    
                </tr>
                    <tr>
                    <td align="right">
                        Emp Deputation</td>
                    <td align="left">
                       <asp:TextBox ID="txtDeputation" runat="server" TextMode="MultiLine"></asp:TextBox>
                       
                       </td>
                                             <td class="style14">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtDeputation"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                     <td align="right">
                        Supporative Documets</td>
                    <td align="left">
                       <asp:TextBox ID="txtSupporative" runat="server" TextMode="MultiLine"> </asp:TextBox>
                        
                       </td>
                                             <td class="style14">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtSupporative"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                    
                </tr>
                    <tr>
                    <td align="right">
                        Emp Name & Address</td>
                    <td align="left">
                       <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                       
                       </td>
                                             <td class="style14">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtAddress"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                  <tr>
                <td align="right" colspan="2">
                    <asp:Button ID="BtnUpdate" runat="server" Height="24px" onclick="BtnUpdate_Click" 
                        Text="Update" Width="61px" ValidationGroup="g" BackColor="#FF9900" 
                        BorderColor="#FF9900" Font-Bold="True" Font-Size="Small"  />
                        <asp:Button ID="BtnBack" runat="server" Height="24px" 
                        Text="Back" Width="61px" ValidationGroup="g" BackColor="#FF9900" 
                        BorderColor="#FF9900" Font-Bold="True" Font-Size="Small" 
                        onclick="BtnBack_Click" />
                </td>
            </tr>
            <tr>
                <td align="right" colspan="2">
                    <asp:Label ID="lblMsg" runat="server" ForeColor="#FF3300"></asp:Label>
                </td>
            </tr>
            </table>
         </div> 
</asp:Content>

