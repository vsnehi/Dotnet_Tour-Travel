<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="FrmAddDesignation.aspx.cs" Inherits="Admin_Designation_Master_FrmAddDesignation" Title="Untitled Page" %>
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
<table style="border: medium groove #FF9900; width: 327px">
<tr>
<td>
        <div>
            <table style="background-color: #FFCC66; width: 336px;">
                <tr>
                    <td colspan="3" class="style4">
                        Add  Designation  Details
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        Designation Name
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtDesgName" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDesgName"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        Designation Abbr</td>
                    <td align="left">
                        <asp:TextBox ID="txtDesgAbbr" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDesgAbbr"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
               
                <tr>
                    <td align="right">
                        Designation Desc</td>
                    <td align="left">
                        <asp:TextBox ID="txtDesgDesc" runat="server" TextMode="MultiLine" Width="153px"></asp:TextBox>
                    </td>
                    
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtDesgDesc"
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
                            <asp:Button ID="BtnModify" runat="server" Text="Modify" 
                             BackColor="#FF9900" BorderColor="#FF9900" 
                            Font-Bold="True" Font-Size="Small" onclick="BtnModify_Click" />
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
            
             <div style="overflow:scroll; width:337px" id="DivDesg" runat="server" 
                visible="false">
            <asp:GridView ID="GridViewDesg" runat="server" BackColor="LightGoldenrodYellow"
                BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None"
                Width="335px" style="margin-top: 1px" Height="122px">
                <FooterStyle BackColor="Tan" />
                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                <AlternatingRowStyle BackColor="PaleGoldenrod" />
            </asp:GridView>
        </div>
        <tr>
        <td>
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

