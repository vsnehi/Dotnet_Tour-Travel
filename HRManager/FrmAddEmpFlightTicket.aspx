<%@ Page Language="C#" MasterPageFile="~/HRManager/TravelMaster.master" AutoEventWireup="true" CodeFile="FrmAddEmpFlightTicket.aspx.cs" Inherits="Travel_Sheduling_FrmAddEmpFlightTicket" Title="Untitled Page" %>
<%@ Register Src="~/UserControls/BrowseImage.ascx" TagName="BrowseImage" TagPreFix="Uc1" %>
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
        <div style="border: medium groove #FF9900; width: 809px; overflow:scroll; margin-right: 0px;">
            <table style="background-color: #ffcc66; width: 803px;">
                <tr>
                    <td colspan="6">
                    <center class="style5">
                        Add  Employee Ticket Details
                        </center>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                     Employee Travel Id
                    </td>
                    <td align="left">
                        <asp:DropDownList ID="DdlEmpTravelId" runat="server" Width="153px">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DdlEmpTravelId"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g" 
                            InitialValue="Select">*</asp:RequiredFieldValidator>
                    </td>
                    <td align="right" >
                        Employee Id</td>
                    <td align="left">
                        <asp:DropDownList ID="DdlEmpId" runat="server" Width="153px">
                        </asp:DropDownList>
                        </td> 
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DdlEmpId"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g" 
                                InitialValue="Select">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
               
                <tr>
                    <td align="right">
                      Ticket No</td>
                    <td align="left">
                        <asp:TextBox ID="txtTicketNo" runat="server" ></asp:TextBox>
                    </td>
                    
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtTicketNo"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                     <td align="right">
                      Ticket Booked Date
                    </td>
                    <td align="left">
                       <asp:TextBox ID="txtBookedDate" runat="server" ></asp:TextBox>
                        <cc1:CalendarExtender ID="txtBookedDate_CalendarExtender" runat="server" TargetControlID="txtBookedDate">
                        </cc1:CalendarExtender>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtBookedDate"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                   
                       </tr>
                     <tr>
                     
                      <td align="right">
                     Ticket Available Date(From) </td>
               <td align="left">
                        <asp:TextBox ID="txtFromDate" runat="server" ></asp:TextBox>
                            <cc1:CalendarExtender ID="txtFromDate_CalendarExtender" runat="server" TargetControlID="txtFromDate">
                            </cc1:CalendarExtender>
                            
                            </td> 
                            <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtFromDate"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                    <td align="right">
                       Ticket Available Date(To)</td>
                    <td align="left">
                        <asp:TextBox ID="txtTODate" runat="server"></asp:TextBox>
                        <cc1:CalendarExtender ID="txtToDate_CalendarExtender1" runat="server" TargetControlID="txtTODate">
                        </cc1:CalendarExtender>
                    </td>
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtTODate"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                    
                </tr>
                
                   <tr>
                   <td align="right">
                        Ticket From</td>
                        <td align="left">
                   <asp:TextBox ID="txtTicketFrom" runat="server"></asp:TextBox>
                        
                    </td>
                     <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtTicketFrom"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                  
                    <td align="right">
                      Ticket To
                       </td>
                    <td align="left">
                      <asp:TextBox ID="txtTicketTo"  runat="server" />
                    </td>
                        <td>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtTicketTo"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                    
                    
                </tr>
                   <tr>
                   <td align="right">
                      Seat No</td>
                        <td align="left">
                <asp:TextBox ID="txtSeatNo" runat="server"></asp:TextBox>
                        
                    </td>
                    <td>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtSeatNo"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>  
                    </td>
                    <td align="right">
                       Flight  Name</td>
                       <td align="left">
                       <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                            </td>
                          <td>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtName"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>  
                        </td> 
                </tr>
                       <tr>
                    <td align="right">
                       Flight Bit</td>
                   <td align="left">
                 <asp:TextBox ID="txtBit" runat="server"></asp:TextBox>
                       </td>
                                             <td class="style14">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtBit"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                    
                     <td align="right" valign="top">
                        Travel Agent Address </td>
                    <td align="left">
                 <asp:TextBox ID="txtAgent" runat="server" TextMode="MultiLine" Width="153px"></asp:TextBox>
                       </td>
                                             <td class="style14">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtAgent"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                    
                </tr>
                
                    <tr>
                    <td align="right" valign="top">
                        Incharge Person</td>
                    <td align="left" valign="top">
                 <asp:TextBox ID="txtInchargePerson" runat="server"></asp:TextBox>
                       </td>
                                             <td valign="top">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtInchargePerson"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                    
                     <td align="right" valign="top">
                        Person Image</td>
                   <td align="left" valign="top">
                      <Uc1:BrowseImage ID ="BrowseImage2" runat="server" DefaultImageUrl="~/Images/NoImage.jpg" />
                       </td>
                                             <td class="style14">
                    </td>
                    
                </tr>
                 <tr>
                    <td align="right">
                        Contact No</td>
                    <td align="left">
                 <asp:TextBox ID="txtContactNo" runat="server"></asp:TextBox>
                       </td>
                                             <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtContactNo"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                    </tr> 
                <tr>
                    <td align="right" colspan="4">
                        <asp:Button ID="BtnAdd" runat="server" OnClick="BtnAdd_Click" Text="Submit" ValidationGroup="g"  
                            BorderColor="#FF9900" BackColor="#FF9900" Font-Bold="True" />
                        <asp:Button ID="btnClear" runat="server" OnClick="btnClear_Click" Text="Cancel" 
                            BackColor="#FF9900" BorderColor="#FF9900" Font-Bold="True" 
                            Font-Size="Small" />
                        <asp:Button ID="BtnView" runat="server" Text="Show"
                            OnClick="BtnView_Click" BackColor="#FF9900" BorderColor="#FF9900" 
                            Font-Bold="True" Font-Size="Small" />
                            <asp:Button ID="BtnModify" runat="server" Text="Modify"
                             BackColor="#FF9900" BorderColor="#FF9900" 
                            Font-Bold="True" Font-Size="Small" onclick="BtnModify_Click"  />
                    </td>
                   
                </tr>
            </table>
            
             <div style="width:837px; height: 120px;" id="DivTickets" runat="server" 
                visible="false">
            <asp:GridView ID="GridViewTickets" runat="server" BackColor="LightGoldenrodYellow"
                BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None"
                Width="825px" style="margin-top: 1px" Height="122px">
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

