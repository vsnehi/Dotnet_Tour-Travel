<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="FrmAddCountriesHotels.aspx.cs" Inherits="Admin_CountriesHotels_FrmAddCountriesHotels" Title="Untitled Page" %>
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
<center style="height: 300px">
        <div style="height: 139px; width: 308px">
            <table style="border: medium groove #FF9900; height: 121px; width: 311px; background-color: #ffcc66;">
                <tr>
                    <td colspan="3" class="style4">
                        Countries & Hotels Details
                    </td>
                </tr>
                <tr>
                    <td  align="right">
                       Country Name
                    </td>
                    <td align="left">
                        <asp:DropDownList ID="DdlCountryName" runat="server" Height="16px" Width="88px"></asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DdlCountryName"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" >
                        Hotel Name</td>
                    <td align="left">
                       <asp:DropDownList ID="DdlHotelName" runat="server" Height="16px" Width="88px"></asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DdlHotelName"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                
                <tr>
                    <td align="right" colspan="2">
                        <asp:Button ID="BtnAdd" runat="server" Height="24px" OnClick="BtnAdd_Click" Text="Submit"
                            Width="51px" ValidationGroup="g" BackColor="#FF9900" 
                            BorderColor="#FF9900" Font-Bold="True" />
                        <asp:Button ID="btnClear" runat="server" OnClick="btnClear_Click" Text="Clear" 
                            Width="57px" BackColor="#FF9900" BorderColor="#FF9900" Font-Bold="True" 
                            Font-Size="Small" />
                    </td>
                    <td>
                    </td>
                </tr>
                 <tr>
        <td>
        <asp:Label ID="lblMsg" runat="server" 
         ForeColor="#FF5050" ></asp:Label>
         </td>
         </tr>
            </table>
         </div> 
    </center>
</asp:Content>

