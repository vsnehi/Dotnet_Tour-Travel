<%@ Page Language="C#" MasterPageFile="~/HRManager/TravelMaster.master"   AutoEventWireup="true" CodeFile="FrmAddEmployeeWork.aspx.cs" Inherits="Travel_Sheduling_FrmAddEmployeeWork" Title="Untitled Page" %>
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
                        Add  Employee Work Details
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        Emp Name
                    </td>
                   <td align="left">
                        <asp:DropDownList ID="DdlEmpId" runat="server" Width="179px"></asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DdlEmpId"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g" 
                            InitialValue="Select">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" valign="top">
                        Project Details</td>
                    <td align="left">
                        <asp:TextBox ID="txtProject" runat="server" TextMode="MultiLine" Height="90px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtProject"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
               
               
                <tr>
                    <td align="right" valign="top">
                      Reasons Deputation</td>
                   <td align="left">
                        <asp:TextBox ID="txtReasons" runat="server" TextMode="MultiLine" Height="89px"></asp:TextBox>
                    </td>
                    
                       <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtReasons"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
               
                <tr>
                    <td align="right" valign="top">
                       Deputation Responsiblities</td> 
                        <td align="left">
                        <asp:TextBox ID="txtResponse" runat="server" TextMode="MultiLine" Height="89px"></asp:TextBox>
                    </td>
                    
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtResponse"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                  <tr>
                   <td align="right">
                        Designation Name
                    </td>
                    <td align="left">
                        <asp:DropDownList ID="DdlDesignationId" runat="server" Width="179px"></asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DdlDesignationId"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="2">
                        <asp:Button ID="BtnAdd" runat="server" OnClick="BtnAdd_Click" Text="Submit" 
                            ValidationGroup="g" BackColor="#FF9900" Font-Bold="True" 
                            BorderColor="#FF9900" />
                        <asp:Button ID="btnClear" runat="server" OnClick="btnClear_Click" Text="Cancel" 
                            Width="57px" BackColor="#FF9900" BorderColor="#FF9900" Font-Bold="True" 
                            Font-Size="Small"/>
                        <asp:Button ID="BtnView" runat="server" Text="Show" 
                            OnClick="BtnView_Click" BackColor="#FF9900" BorderColor="#FF9900" 
                            Font-Bold="True" Font-Size="Small" />
                             <asp:Button ID="BtnModify" runat="server" Text="Modify" 
                             BackColor="#FF9900" BorderColor="#FF9900" 
                            Font-Bold="True" Font-Size="Small" onclick="BtnModify_Click"  />
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
            
             <div style="border: medium groove #FF9900; overflow:scroll; width:375px" 
                id="DivWork" runat="server" 
                visible="false">
            <asp:GridView ID="GridViewWork" runat="server" BackColor="LightGoldenrodYellow"
                BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None"
                Width="373px" style="margin-top: 1px" AutoGenerateColumns="False">
                <FooterStyle BackColor="Tan" />
                <Columns>
                        <asp:TemplateField HeaderText="Employee Name">
                        <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" Text='<%#Eval("Emp_FirstName")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Project Details">
                        <ItemTemplate >
                         <asp:Panel ID="pnl1" runat="server" Height="50px" Width="200px"  ScrollBars="Vertical" >
                        <asp:Label ID="lblProject" runat="server" Text='<%#Eval("ProjectDetails")%>'></asp:Label>
                        </asp:Panel> 
                        </ItemTemplate>
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="Reason Deputation">
                        <ItemTemplate >
                         <asp:Panel ID="pnl2" runat="server" Height="50px" Width="200px"  ScrollBars="Vertical" >
                        <asp:Label ID="lblReason" runat="server" Text='<%#Eval("ReasonsForDeputation")%>'></asp:Label>
                        </asp:Panel> 
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Resposibilities">
                        <ItemTemplate >
                         <asp:Panel ID="pnl1" runat="server" Height="50px" Width="200px"  ScrollBars="Vertical" >
                        <asp:Label ID="lblResponsibilities" runat="server" Text='<%#Eval("DeputationResponsibilities")%>'></asp:Label>
                         </asp:Panel> 
                        </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Designation Name">
                        <ItemTemplate >
                        <asp:Label ID="lblResponsibilities" runat="server" Text='<%#Eval("Desg_name")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        </Columns> 
                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                <AlternatingRowStyle BackColor="PaleGoldenrod" />
            </asp:GridView>
        &nbsp;</div>
        <tr>
        <td>
        <asp:Label ID="lblMsg" runat="server" 
         ForeColor="#FF5050" ></asp:Label>
         </td>
         </tr>
         </div> 
    </center>
</asp:Content>

