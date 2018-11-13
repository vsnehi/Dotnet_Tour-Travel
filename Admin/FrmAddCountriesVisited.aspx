<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="FrmAddCountriesVisited.aspx.cs" Inherits="Admin_Countries_Visited_FrmAddCountriesVisited" Title="Untitled Page" %>
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
        <div style="border: medium groove #FF9900; overflow:scroll; height: 480px; width: 623px;">
            <table style="background-color: #FFCC66; width: 959px;">
                <tr>
                    <td colspan="6">
                    <center class="style5">
                        Add  Countries Visited Details
                        </center>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                       PassportId
                    </td>
                    <td align="left">
                        <asp:DropDownList ID="DdlPasportId" runat="server" Height="16px" Width="118px">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DdlPasportId"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                    <td align="right">
                        Visa Stamped Date</td>
                    <td align="left">
                        <asp:TextBox ID="txtStampedDate" runat="server"></asp:TextBox>
                        <cc1:CalendarExtender ID="txtStampedDate_CalendarExtender" runat="server" TargetControlID="txtStampedDate">
                        </cc1:CalendarExtender>
                        </td> 
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtStampedDate"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
               
                <tr>
                    <td align="right">
                      Embassy Details</td>
                    <td align="left">
                        <asp:TextBox ID="txtEmbrasy" runat="server" ></asp:TextBox>
                    </td>
                    
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtEmbrasy"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                     <td align="right">
                       Visa TypeName
                    </td>
                    <td align="left">
                        <asp:DropDownList ID="DdlVisaTypeId" runat="server" Height="16px" Width="114px"></asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="DdlVisaTypeId"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                   
                       </tr>
                     <tr>
                     
                      <td align="right">
                      Visa Valid Date(From) </td>
                    <td align="left">
                        <asp:TextBox ID="txtFromDate" runat="server"  Height="28px" 
                            Width="174px" ></asp:TextBox>
                            <cc1:CalendarExtender ID="txtFromDate_CalendarExtender" runat="server" TargetControlID="txtFromDate">
                            </cc1:CalendarExtender>
                            
                            </td> 
                            <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtFromDate"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                    <td align="right">
                       Visa Valid Date(To)</td>
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
                        Counries Stamped</td>
                        <td align="left">
                   <asp:TextBox ID="txtCountryStamped" runat="server"></asp:TextBox>
                        
                    </td>
                     <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtCountryStamped"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                   
                    <td align="right">
                       Remarks
                       </td>
                    <td align="left">
                      <asp:TextBox ID="txtRemarks"  runat="server" TextMode="MultiLine" />
                    </td>
                        <td>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtRemarks"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                    
                    
                </tr>
                   <tr>
                    <td align="right" valign="top">
                       Image of Visa Stamp</td>
                        <td align="left" valign="top">
                  <Uc1:BrowseImage ID ="BrowseImage1" runat="server" DefaultImageUrl="~/Images/NoImage.jpg" />
                        
                    </td>
                    <td>
                        
                    </td>
                    <td valign="top" align="right">
                         Image of Visa Paper</td>
                        <td valign="top" align="left">
                        <Uc1:BrowseImage ID ="BrowseImage2" runat="server" DefaultImageUrl="~/Images/NoImage.jpg" />
                            </td>
                          <td>
                        </td> 
                </tr>
                       <tr>
                    <td align="right">
                        EmpId</td>
                    <td align="left">
                  <asp:DropDownList ID="DdlEmpId" runat="server" Height="16px" Width="126px" ></asp:DropDownList>
                       </td>
                                             <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="DdlEmpId"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                    
                </tr>
                <tr>
                    <td align="right" colspan="4">
                        <asp:Button ID="BtnAdd" runat="server" Height="24px" OnClick="BtnAdd_Click" Text="Submit"
                            Width="51px" ValidationGroup="g" BackColor="#FF9900" 
                            BorderColor="#FF9900" Font-Bold="True" />
                        <asp:Button ID="btnClear" runat="server" OnClick="btnClear_Click" Text="Clear" 
                            Width="57px" BackColor="#FF9900" BorderColor="#FF9900" Font-Bold="True" 
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
            
             <div id="DivCountries" runat="server" 
                visible="false">
            <asp:GridView ID="GridViewCountries" runat="server" BackColor="LightGoldenrodYellow"
                BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None"
                Width="865px" style="margin-top: 1px" Height="122px">
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




