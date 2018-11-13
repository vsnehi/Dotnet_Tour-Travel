<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="FrmModifyDepartment.aspx.cs" Inherits="Admin_Department_Master_FrMModifyDepartment" Title="Untitled Page" %>
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
            <table  style="border: medium groove #FF9900; background-color: #ffcc66;">
                                                  
                <tr>
                    <td colspan="3" class="style4">
                        Modify Department Details
                    </td>
                </tr>
                <tr>
                    <td align="right">
                       Department Name
                    </td>
                    <td align="left">
                        <asp:DropDownList ID="DdlDeptName" runat="server"  Width="153px" 
                            AutoPostBack="True" onselectedindexchanged="DdlDeptName_SelectedIndexChanged">
                        </asp:DropDownList>
                       
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DdlDeptName"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g" InitialValue="Select">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        Department Abbbrevation</td>
                    <td align="left">
                        <asp:TextBox ID="txtDeptAbbr" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDeptAbbr"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        Department Location </td>
                    <td align="left">
                         <asp:TextBox ID="txtDeptLoc" runat="server"></asp:TextBox>
                       
                        </td>
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDeptLoc"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                    
                </tr>
               
                <tr>
                    <td  valign="top" align="right">
                        Department Desc</td>
                    <td align="left">
                        <asp:TextBox ID="txtDeptDesc" runat="server" TextMode="MultiLine" Width="153px"></asp:TextBox>
                    </td>
                    <td>
                    
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtDeptDesc"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                    
                </tr>
             
                 <tr>
                <td align="right" colspan="2">
                    <asp:Button ID="BtnUpdate" runat="server" Height="24px" onclick="BtnUpdate_Click" 
                        Text="Update" Width="61px" ValidationGroup="g" BackColor="#FF9900" 
                        BorderColor="#FF9900" Font-Bold="True" Font-Size="Small" ForeColor="#333333" />
                        <asp:Button ID="BtnBack" runat="server" Height="24px" 
                        Text="Back" Width="61px" BackColor="#FF9900" 
                        BorderColor="#FF9900" Font-Bold="True" Font-Size="Small" 
                        ForeColor="#333333" onclick="BtnBack_Click" />
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

