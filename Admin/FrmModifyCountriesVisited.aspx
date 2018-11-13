<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="FrmModifyCountriesVisited.aspx.cs" Inherits="Admin_Countries_Visited_FrmModifyCountrisVisited" Title="Untitled Page" %>
<%@ Register Src="~/UserControls/BrowseImage.ascx" TagName="BrowseImage" TagPrefix="Uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .style5
        {
            width: 139px;
        }
        .style6
        {
            width: 146px;
        }
        .style7
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
        <div style="overflow:scroll; width: 612px;">
            <table style="border: medium groove #FF9900; height: 345px; width: 961px; background-color: #ffcc66;">
                <tr>
                    <td colspan="6">
                    <center class="style7">
                      Modify Countries Visited Details
                        </center>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="style5">
                        Countries Visited Id</td>
                    <td align="left">
                        <asp:DropDownList ID="DdlCountryVisitedId" runat="server" AutoPostBack="true" 
                            onselectedindexchanged="DdlCountryVisitedId_SelectedIndexChanged" 
                            Height="16px" Width="126px">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DdlCountryVisitedId"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                    <td align="right" class="style6">
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
                    <td align="right" class="style5">
                      Embassy Details</td>
                    <td align="left">
                        <asp:TextBox ID="txtEmbrasy" runat="server" ></asp:TextBox>
                    </td>
                    
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtEmbrasy"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                     <td class="style6">
                         &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                   
                       </tr>
                     <tr>
                     
                      <td align="right" class="style5">
                      Visa Valid Date(From) </td>
                    <td align="left">
                        <asp:TextBox ID="txtFromDate" runat="server"  Height="18px" 
                            Width="128px" ></asp:TextBox>
                            <cc1:CalendarExtender ID="txtFromDate_CalendarExtender" runat="server" TargetControlID="txtFromDate">
                            </cc1:CalendarExtender>
                            
                            </td> 
                            <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtFromDate"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                    <td align="right" class="style6">
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
                   
                   <td align="right" class="style5">
                        Counries Stamped</td>
                        <td align="left">
                   <asp:TextBox ID="txtCountryStamped" runat="server"></asp:TextBox>
                        
                    </td>
                     <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtCountryStamped"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                   
                    <td  align="right" class="style6" valign="top">
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
                    <td align="right" valign="top" class="style5">
                       Image of Visa Stamp</td>
                        <td valign="top" align="left">
                  <Uc1:BrowseImage ID ="BrowseImage1" runat="server" DefaultImageUrl="~/Images/NoImage.jpg" />
                        
                    </td>
                    <td>
                        
                    </td>
                    <td align="right" valign="top" class="style6">
                         Image of Visa Paper</td>
                        <td align="left" valign="top">
                        <Uc1:BrowseImage ID ="BrowseImage2" runat="server" DefaultImageUrl="~/Images/NoImage.jpg" />
                            </td>
                          <td>
                        </td> 
                </tr>
                     
                <tr>
                    <td align="right" colspan="4">
                        <asp:Button ID="BtnUpdate" runat="server" Height="20px" OnClick="BtnUpdate_Click"
                            Text="Update" Width="87px" ValidationGroup="g" BackColor="#FF9900" BorderColor="#FF9900"
                            Font-Bold="True" Font-Size="Small" />
                             <asp:Button ID="BtnBack" runat="server" Height="20px" 
                            Text="Back" Width="87px"  BackColor="#FF9900" BorderColor="#FF9900"
                            Font-Bold="True" Font-Size="Small" onclick="BtnBack_Click" />
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="4">
                        <asp:Label ID="lblMsg" runat="server" ForeColor="#FF3300"></asp:Label>
                    </td>
                </tr>
            
            </table>
      
         </div> 
</asp:Content>

