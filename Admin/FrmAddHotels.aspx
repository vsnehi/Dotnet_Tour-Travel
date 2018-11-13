<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="FrmAddHotels.aspx.cs" Inherits="Admin_Hotels_Master_FrmAddHotels" Title="Untitled Page" %>
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
<center>
<table>
   <tr>
   <td>
        <div>
            <table style="border: medium groove #FF9900; height: 223px; width: 424px; background-color: #ffcc66;">
                <tr>
                    <td colspan="3" class="style4">
                        Add  Hotels  Details
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        Hotel Name
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtHotelName" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtHotelName"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td  align="right" valign="top" >
                        Hotel Address</td>
                    <td align="left">
                        <asp:TextBox ID="txtHotelAddr" runat="server" TextMode="MultiLine" 
                            Width="153px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtHotelAddr"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
               
               
                <tr>
                    <td align="right">
                        Hotel PhoneNo</td>
                    <td align="left">
                        <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                    </td>
                    
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPhone"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
               
                     <tr>
                    <td  align="right">
                        Hotel Person  Name</td>
                    <td align="left">
                        <asp:TextBox ID="txtPName" runat="server"></asp:TextBox>
                    </td>
                    
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPName"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                     <tr>
                    <td  align="right">
                        Hotel Min. Charges</td>
                    <td align="left">
                        <asp:TextBox ID="txtMinCharge" runat="server"></asp:TextBox>
                    </td>
                    
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtMinCharge"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                     <tr>
                    <td align="right">
                        Hotel Max. Charges</td>
                    <td align="left">
                        <asp:TextBox ID="txtMaxCharge" runat="server"></asp:TextBox>
                    </td>
                    
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtMaxCharge"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="2">
                        <asp:Button ID="BtnAdd" runat="server" OnClick="BtnAdd_Click" Text="Submit" 
                            ValidationGroup="g" BackColor="#FF9900" 
                            BorderColor="#FF9900" Font-Bold="True" />
                        <asp:Button ID="btnClear" runat="server" OnClick="btnClear_Click" Text="Cancel" 
                            BackColor="#FF9900" BorderColor="#FF9900" Font-Bold="True" 
                            Font-Size="Small" />
                        <asp:Button ID="BtnView" runat="server" Text="Show"
                            OnClick="BtnView_Click" BackColor="#FF9900" BorderColor="#FF9900" 
                            Font-Bold="True" Font-Size="Small" />
                            <asp:Button ID="Button1" runat="server" Text="Modify"
                             BackColor="#FF9900" BorderColor="#FF9900" 
                            Font-Bold="True" Font-Size="Small" onclick="Button1_Click" />
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
            
             <div style="border: medium groove #FF9900; overflow:scroll; width:414px" 
                id="DivHotel" runat="server" 
                visible="false">
            <asp:GridView ID="GridViewHotel" runat="server" BackColor="LightGoldenrodYellow"
                BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None"
                Width="415px" style="margin-top: 1px" Height="120px">
                <FooterStyle BackColor="Tan" />
                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                <AlternatingRowStyle BackColor="PaleGoldenrod" />
            </asp:GridView>
        </div>
        <tr>
        <td class="style12">
        <asp:Label ID="lblMsg" runat="server" 
         ForeColor="#FF5050" ></asp:Label>
         </td>
         </tr>
         </div> 
         </td> 
         </tr> 
        </table>
    </center>
</asp:Content>



