<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="FrmModifyDesg.aspx.cs" Inherits="Admin_UPD_EMP_FrmModifyDesg" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <center>
<br />
<br />
<br />
        <table class="style1" 
        style="border: medium groove #FF9900; width: 291px;">
            <tr>
                <td colspan="2">
                    Modify Emp Designation Details</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblEmpName" runat="server" Text="Employee Name" 
                        Font-Bold="False" Font-Size="Small"></asp:Label>
                </td>
                <td>                   
                 <asp:DropDownList AutoPostBack="true" ID="DdlEmpName" runat="server" 
                        Width="153px" Font-Size="Small" onselectedindexchanged="DdlEmpName_SelectedIndexChanged" 
                        >  
                    </asp:DropDownList></td>
                    <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="DdlEmpName" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="g" InitialValue="--Select Emp--">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            
            <tr>
                <td>
                    <asp:Label ID="lblDate" runat="server" Text="Designation" 
                        Font-Bold="False" Font-Size="Small"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DdlDesg" runat="server" Width="153px" Font-Size="Small"></asp:DropDownList>
                
               </td>
                    <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="DdlDesg" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="g" InitialValue="--Select Desg--">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            
          
            <tr>
                <td align="right" colspan="2">
                    <asp:Button ID="BtnDeptUpdate" runat="server" Height="24px" onclick="BtnDeptUpdate_Click" 
                        Text="UPDATE" Width="61px" ValidationGroup="g" BackColor="#FF9900" 
                        BorderColor="#FF9900" Font-Bold="True" Font-Size="Small" 
                        ForeColor="#333333" />
                  
                </td>
            </tr>
            <tr>
                <td align="right" colspan="2">
                    <asp:Label ID="lblMsg" runat="server" ForeColor="#FF3300"></asp:Label>
                </td>
            </tr>
        </table>
    
    
    </center>
  
</asp:Content>


