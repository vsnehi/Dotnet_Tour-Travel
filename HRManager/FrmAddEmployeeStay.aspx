<%@ Page Language="C#" MasterPageFile="~/HRManager/TravelMaster.master"   AutoEventWireup="true" CodeFile="FrmAddEmployeeStay.aspx.cs" Inherits="Travel_Sheduling_FrmAddEmployeeStay" Title="Untitled Page" %>
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
        <div style="border: medium groove #FF9900; width: 817px; overflow:scroll;">
           <table style="background-color: #ffcc66; width: 802px;">
                <tr>
                    <td colspan="6">
                    <center class="style5">
                        Add  Employee Stay Details
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
                    <td align="right">
                        Hotel Name</td>
                     <td align="left">
                        <asp:DropDownList ID="DdlHotelId" runat="server" Width="153px"></asp:DropDownList>
                        </td> 
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DdlHotelId"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g" 
                                InitialValue="Select">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
               
                <tr>
                    <td align="right">
                      Room Number</td>
                      <td align="left">
                        <asp:TextBox ID="txtRoomNo" runat="server" ></asp:TextBox>
                    </td>
                    
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtRoomNo"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                     <td align="right">
                      Reservation Number
                    </td>
                      <td align="left">
                        <asp:TextBox ID ="txtReservationNo" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtReservationNo"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                   
                       </tr>
                     <tr>
                     
                      <td align="right">
                      PickUp Status</td>
                      <td align="left">
                         
                            <asp:CheckBox ID="ChkStatus" runat="server" />
                            
                            </td> 
                            <td>
                       
                    </td>
                    <td align="right">
                       Vehicle Number</td>
                     <td align="left">
                        <asp:TextBox ID="txtVehicleNo" runat="server"></asp:TextBox>
                       
                    </td>
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtVehicleNo"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                    
                </tr>
                
                   <tr>
                   
                  <td align="right">
                       Person Contact No.</td>
                        <td align="left">
                   <asp:TextBox ID="txtContact" runat="server"></asp:TextBox>
                        
                    </td>
                     <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtContact"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                   
                    <td align="right">
                       Person  Name
                       </td>
                      <td align="left">
                      <asp:TextBox ID="txtName"  runat="server" />
                    </td>
                        <td>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtName"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                    
                    
                </tr>
                   <tr>
                    <td align="right" valign="top">
                       Person Image</td>
                          <td align="left" valign="top">
                  <Uc1:BrowseImage ID ="BrowseImage1" runat="server" DefaultImageUrl="~/Images/NoImage.jpg" />
                        
                    </td>
                    <td></td>
                    <td align="right" valign="top">
                       Country Name
                    </td>
                    <td align="left" valign="top">
                        <asp:DropDownList ID="DdlCountryId" runat="server" Width="153px">
                        </asp:DropDownList>
                    </td>
                    <td valign="top">
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DdlCountryId"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g" 
                             InitialValue="Select">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                       
                <tr>
                    <td align="right" colspan="4">
                        <asp:Button ID="BtnAdd" runat="server" OnClick="BtnAdd_Click" Text="Submit" 
                            ValidationGroup="g" BackColor="#FF9900" Font-Bold="true"
                            BorderColor="#FF9900" />
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
            
             <div style="width:752px; height: 123px;" id="DivStay" runat="server" 
                visible="false">
            <asp:GridView ID="GridViewStay" runat="server" BackColor="LightGoldenrodYellow"
                BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None"
                Width="754px" style="margin-top: 1px" Height="122px">
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




