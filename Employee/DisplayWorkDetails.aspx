<%@ Page Language="C#" MasterPageFile="~/Employee/EmployeeMaster.master" AutoEventWireup="true" CodeFile="DisplayWorkDetails.aspx.cs" Inherits="Employee_DisplayWorkDetails" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<center>
    <br />
    <br />
    <br />
    <asp:Label ID="lblHeading" ForeColor="#990033" 
                runat="server" Text="Show Employee Work Details"
                Style="font-size: large; font-weight: 700; font-family: Verdana"></asp:Label>
            <br />
            <br />
    
  <div style="border: thin groove #006666; width:714px; overflow:scroll; height: 324px;">
      <asp:GridView ID="GridViewWork" runat="server" Width="716px" CellPadding="2" 
          ForeColor="Black" GridLines="None" AutoGenerateColumns="False" 
          BackColor="LightGoldenrodYellow" BorderColor="Tan" 
          BorderWidth="1px">
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
          <FooterStyle BackColor="Tan" />
          <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
               HorizontalAlign="Center" />
          <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
          <HeaderStyle BackColor="Tan" Font-Bold="True" />
          <AlternatingRowStyle BackColor="PaleGoldenrod" />
      </asp:GridView>
  </div>
  <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
</center>
</asp:Content>

