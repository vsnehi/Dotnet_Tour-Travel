<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="frmReportEmployeeWork.aspx.cs" Inherits="Admin_frmReportEmployeeWork" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script language="javascript" type="text/javascript">
 
    function callPrint(elementId)
    {
       var prtContent = document.getElementById(elementId);                
       var WinPrint = window.open('','', 'left=0,top=0,width=1000,height=600,toolbar=2,scrollbars=2,status=0');
       var docColor="Black";
       var strInnerHTML=prtContent.innerHTML;
       var strModifiedInnerHTMl=strInnerHTML.replace(/white/g,docColor);
       WinPrint.document.write(strModifiedInnerHTMl);
       WinPrint.document.close();
       WinPrint.focus();
       WinPrint.print();
       WinPrint.close();
    }
    
    
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <br />
    <br />
    <br />
    <asp:Label ID="lblHeading" ForeColor="#990033" 
                runat="server" Text="Employee Report Work Details"
                Style="font-size: large; font-weight: 700; font-family: Verdana"></asp:Label>
            <br />
            <br />
    
  <div id="divwork" style="border: thin groove #006666; width:714px; overflow:scroll; height: 324px;">
      <asp:GridView ID="GridViewWork" runat="server" Width="716px" CellPadding="2" 
          ForeColor="Black" GridLines="None" AutoGenerateColumns="False" 
          BackColor="LightGoldenrodYellow" BorderColor="Tan" 
          BorderWidth="1px" Height="297px">
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
  <table>
  <tr>
  
  <td>
    <asp:Button ID="btnReport" runat="server"
                        Text="Print Report"   BackColor="#FF9900" OnClientClick="callPrint('divwork')"
                        BorderColor="#FF9900" Font-Bold="True" Font-Size="Small" 
         />
  </td>
  </tr>
  </table>
  <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
</center>
</asp:Content>

