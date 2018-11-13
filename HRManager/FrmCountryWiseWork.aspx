<%@ Page Language="C#" MasterPageFile="~/HRManager/TravelMaster.master"  AutoEventWireup="true" CodeFile="FrmCountryWiseWork.aspx.cs" Inherits="Travel_Sheduling_FrmCountryWiseWork" Title="Untitled Page" %>
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
        <div>
            <table style="border: medium groove #FF9900; background-color: #ffcc66;">
                <tr>
                    <td colspan="3" class="style4">
                        CountryWise Work Permit Info Details
                    </td>
                </tr>
                <tr>
                        <td align="right">
                        Country Name
                    </td>
                    <td align="left">
                        <asp:DropDownList ID="DdlCountryId" runat="server" Width="173px"></asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DdlCountryId"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g" 
                            InitialValue="Select">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                   <td align="right">
                        Work Permit Id</td>
                    <td align="left">
                        <asp:DropDownList ID="DdlPermitId" runat="server" Width="173px"></asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DdlPermitId"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g" 
                            InitialValue="Select">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
               
               
                <tr>
                    <td align="right">
                         Work Permit Info.</td>
                   <td align="left">
                        <asp:TextBox ID="txtPermitInfo" runat="server" TextMode="MultiLine" 
                            Width="173px" ></asp:TextBox>
                    </td>
                    
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPermitInfo"
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


