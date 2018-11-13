<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="FrmModifyDept.aspx.cs" Inherits="Admin_UPD_EMP_FrmModifyDept" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .style4
        {
            width: 149px;
        }
        .style5
        {
            width: 21px;
        }
        .style6
        {
            width: 142px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <center>
    <br />
    <br />
    <br />
   <br />
        <table class="style1" 
        style="border: medium groove #FF9900; width: 294px;">
            <tr>
                <td colspan="3">
                    Modify Emp Department </td>
            </tr>
            <tr>
                <td class="style6" >
                    <asp:Label ID="lblEmpName" runat="server" Text="Employee Name" 
                        Font-Bold="False" Font-Size="Small"></asp:Label>
                </td>
                <td class="style4">
                    <asp:DropDownList AutoPostBack="true" ID="DdlEmpName" runat="server" 
                         Width="153px" Font-Size="Small" onselectedindexchanged="DdlEmpName_SelectedIndexChanged" 
                        >  
                    </asp:DropDownList></td>
                    <td class="style5">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="DdlEmpName" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="g" InitialValue="--Select Emp--">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            
            <tr>
                <td class="style6" >
                    <asp:Label ID="lblDate" runat="server" Text="Department" 
                        Font-Bold="False" Font-Size="Small"></asp:Label>
                </td>
                <td class="style4">
                    <asp:DropDownList ID="DdlDept" runat="server" Width="153px" Font-Size="Small"></asp:DropDownList>
                
               </td>
                    <td class="style5">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="DdlDept" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="g" InitialValue="--Select Dept--">*</asp:RequiredFieldValidator>
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





