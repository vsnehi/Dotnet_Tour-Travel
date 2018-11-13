<%@ Page Language="C#" MasterPageFile="~/HRManager/TravelMaster.master"   AutoEventWireup="true" CodeFile="FrmModifyEmployeeStay.aspx.cs" Inherits="Travel_Sheduling_FrmModifyEmployeeStay" Title="Untitled Page" %>
<%@ Register Src="~/UserControls/BrowseImage.ascx" TagName="BrowseImage" TagPrefix="Uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .style5
        {
            font-size: large;
            font-weight: bold;
        }
        .style6
        {
            width: 165px;
        }
        .style7
        {
            width: 295px;
        }
        .style8
        {
            width: 19px;
        }
        .style9
        {
            width: 2px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
<br />
<br />
        <div style="overflow:scroll; width: 858px;">
            <table style="border: medium groove #FF9900; background-color: #ffcc66; width: 914px;">
                <tr>
                    <td colspan="6">
                    <center class="style5">
                        Modify Employee Stay Details
                        </center>
                    </td>
                </tr>
                <tr>
                    <td  align="right" class="style6">
                       Employee Stay Id
                    </td>
                    <td align="left" class="style7">
                        <asp:DropDownList ID="DdlEmpStayId" runat="server" Width="153px" 
                            AutoPostBack="true" 
                            onselectedindexchanged="DdlEmpStayId_SelectedIndexChanged"> 
                        </asp:DropDownList>
                    </td>
                    <td class="style9">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DdlEmpStayId"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g" 
                            InitialValue="Select">*</asp:RequiredFieldValidator>
                    </td>
                    
                </tr>
               
                <tr>
                    <td  align="right" class="style6">
                      Room Number</td>
                    <td align="left" class="style7">
                        <asp:TextBox ID="txtRoomNo" runat="server" ></asp:TextBox>
                    </td>
                    
                        <td class="style9">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtRoomNo"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                    <td  align="right">
                      Reservation Number
                    </td>
                    <td align="left">
                        <asp:TextBox ID ="txtReservationNo" runat="server"></asp:TextBox>
                    </td>
                    <td class="style8">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtReservationNo"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                   
                       </tr>
                     <tr>
                     
                      <td  align="right" class="style6">
                      PickUp Status</td>
                   <td align="left" class="style7">
                         
                            <asp:CheckBox ID="ChkStatus" runat="server" />
                            
                            </td> 
                            <td class="style9">
                       
                    </td>
                   <td  align="right">
                       Vehicle Number</td>
                   <td align="left">
                        <asp:TextBox ID="txtVehicleNo" runat="server"></asp:TextBox>
                       
                    </td>
                        <td class="style8">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtVehicleNo"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                    
                </tr>
                
                   <tr>
                   
                   <td  align="right" class="style6">
                       Person Contact No.</td>
                        <td align="left" class="style7">
                   <asp:TextBox ID="txtContact" runat="server"></asp:TextBox>
                        
                    </td>
                     <td class="style9">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtContact"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                   
                   <td  align="right">
                       Person  Name
                       </td>
                     <td align="left">
                      <asp:TextBox ID="txtName"  runat="server" />
                    </td>
                        <td class="style8">
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtName"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                    
                    
                </tr>
                   <tr>
                    <td  align="right" valign="top" class="style6">
                       Person Image</td>
                        <td align="left" valign="top" class="style7">
                  <Uc1:BrowseImage ID ="BrowseImage1" runat="server" DefaultImageUrl="~/Images/NoImage.jpg" />
                        
                    </td>
                 
                </tr>
                  <tr>
                <td align="right" colspan="2">
                    <asp:Button ID="BtnUpdate" runat="server" onclick="BtnUpdate_Click" 
                        Text="Update" ValidationGroup="g" BackColor="#FF9900" 
                        BorderColor="#FF9900" Font-Bold="True" Font-Size="Small" />
                         <asp:Button ID="BtnBack" runat="server" Height="24px"  
                        Text="Back" Width="61px" BackColor="#FF9900" 
                        BorderColor="#FF9900" Font-Bold="True" Font-Size="Small" 
                        onclick="BtnBack_Click"/>
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

