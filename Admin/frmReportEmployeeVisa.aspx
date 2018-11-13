<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="frmReportEmployeeVisa.aspx.cs" Inherits="Admin_frmReportEmployeeVisa" Title="Untitled Page" %>

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
                runat="server" Text="Employee Report Visa Details"
                Style="font-size: large; font-weight: 700; font-family: Verdana"></asp:Label>
            <br />
            <br />
    
  <div id="divvisa"  style="border: thin groove #006666; width:714px; overflow:scroll; height: 324px;">
      <asp:GridView ID="GridViewVisa" runat="server" Width="716px" CellPadding="2" 
          ForeColor="Black" GridLines="None" AutoGenerateColumns="False" 
          BackColor="LightGoldenrodYellow" BorderColor="Tan" 
          BorderWidth="1px" Height="162px">
           <Columns>
                        <asp:TemplateField HeaderText="Visa Apply Date">
                        <ItemTemplate>
                        <asp:Label ID="lblDate" runat="server" Text='<%#Eval("VisaApplydate")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Emp Name">
                        <ItemTemplate >
                        <asp:Label ID="lblEmpName" runat="server" Text='<%#Eval("Emp_FirstName")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="Reason Deputation">
                        <ItemTemplate >
                         <asp:Label ID="lblpassportId" runat="server" Text='<%#Eval("PassportId")%>'></asp:Label>
                         </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Country Name">
                        <ItemTemplate >
                        <asp:Label ID="lblCountryName" runat="server" Text='<%#Eval("CountryName")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="VisaType Name">
                        <ItemTemplate >
                        <asp:Label ID="lblVisaName" runat="server" Text='<%#Eval("VisaTypeName")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status">
                        <ItemTemplate >
                        <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("VisaStatus")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Reason Apply Date">
                        <ItemTemplate >
                         <asp:Panel ID="pnl1" runat="server" Height="50px" Width="200px"  ScrollBars="Vertical" >
                        <asp:Label ID="lblApply" runat="server" Text='<%#Eval("ReasonsforApplyingVisa")%>'></asp:Label>
                        </asp:Panel> 
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Visa FromDate">
                        <ItemTemplate >
                        <asp:Label ID="lblFrom" runat="server" Text='<%#Eval("VisaFromDate")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Visa TODate">
                        <ItemTemplate >
                        <asp:Label ID="lblTo" runat="server" Text='<%#Eval("VisaToDate")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="EmployeeDate Relieved">
                        <ItemTemplate >
                        <asp:Label ID="lblRelieved" runat="server" Text='<%#Eval("EmployeeDateRelieved")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="EmployeeDate Rejoined">
                        <ItemTemplate >
                        <asp:Label ID="lblRejoined" runat="server" Text='<%#Eval("EmployeeDateRejoined")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Emp Details">
                        <ItemTemplate >
                         <asp:Panel ID="pnl2" runat="server" Height="50px" Width="200px"  ScrollBars="Vertical" >
                        <asp:Label ID="lblDetails" runat="server" Text='<%#Eval("EmployeeDetails")%>'></asp:Label>
                        </asp:Panel> 
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Document Status">
                        <ItemTemplate >
                         <asp:Panel ID="pnl3" runat="server" Height="50px" Width="200px"  ScrollBars="Vertical" >
                        <asp:Label ID="lblDocuments" runat="server" Text='<%#Eval("SupporativeDocumentsStatus")%>'></asp:Label>
                        </asp:Panel> 
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Address">
                        <ItemTemplate >
                         <asp:Panel ID="pnl4" runat="server" Height="50px" Width="200px"  ScrollBars="Vertical" >
                        <asp:Label ID="lblResponsibilities" runat="server" Text='<%#Eval("EmbassyNameAddressToVisit")%>'></asp:Label>
                        </asp:Panel> 
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="VisaApplyId">
                        <ItemTemplate >
                        <asp:Label ID="lblVisaApplyId" runat="server" Text='<%#Eval("VisaApplyId")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="From File">
                        <ItemTemplate >
                         <asp:Panel ID="pnl5" runat="server" Height="50px" Width="200px"  ScrollBars="Vertical" >
                        <asp:Label ID="lblVisaRemark" runat="server" Text='<%#Eval("Remarks")%>'></asp:Label>
                        </asp:Panel> 
                        </ItemTemplate>
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="Approved Status">
                        <ItemTemplate >
                        <asp:Label ID="lblApprovedStatus" runat="server" Text='<%#Eval("DocumentApprovedStatus")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="Document Submit Date">
                        <ItemTemplate >
                        <asp:Label ID="lblSubmitDate" runat="server" Text='<%#Eval("DocumentSubmittedDate")%>'></asp:Label>
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
                        Text="Print Report"   BackColor="#FF9900" OnClientClick="callPrint('divvisa')"
                        BorderColor="#FF9900" Font-Bold="True" Font-Size="Small" 
         />
  </td>
  </tr>
  </table>
  <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
</center>
</asp:Content>

