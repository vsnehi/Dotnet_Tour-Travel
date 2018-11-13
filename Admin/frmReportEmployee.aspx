<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="frmReportEmployee.aspx.cs" Inherits="Admin_frmReportEmployee" Title="Untitled Page" %>

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
<center style="height: 404px">
    <br />
    <br />
    <br />
    <asp:Label ID="lblHeading" ForeColor="#990033" 
                runat="server" Text="Employee Report Details"
                Style="font-size: large; font-weight: 700; font-family: Verdana"></asp:Label>
            <br />
            <br />
    
  <div id="divemp" style="border: thin groove #006666; width:714px; overflow:scroll; height: 273px;">
      <asp:GridView ID="GridViewEmp" runat="server" Width="716px" CellPadding="2" 
          ForeColor="Black" GridLines="None" AutoGenerateColumns="False" 
          BackColor="LightGoldenrodYellow" BorderColor="Tan" 
          BorderWidth="1px">
           <Columns>
                        <asp:TemplateField HeaderText="Employee Name">
                        <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" Text='<%#Eval("Emp_FirstName")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date Of Birth">
                        <ItemTemplate >
                        <asp:Label ID="lblDob" runat="server" Text='<%#Eval("Emp_DOB")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="Date Of Joining">
                        <ItemTemplate >
                        <asp:Label ID="lblDoj" runat="server" Text='<%#Eval("Emp_DOJ")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Qualification">
                        <ItemTemplate >
                        <asp:Label ID="lblQual" runat="server" Text='<%#Eval("Emp_HighestQual")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Dept Id">
                        <ItemTemplate>
                        <asp:Label ID="lblDept" runat="server" Text='<%#Eval("DeptName")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Desg Id">
                        <ItemTemplate>
                        <asp:Label ID="lblDesg" runat="server" Text='<%#Eval("Desg_Name")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="House Number">
                        <ItemTemplate>
                        <asp:Label ID="lblHno" runat="server" Text='<%#Eval("HNo")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="Street">
                        <ItemTemplate>
                        <asp:Label ID="lblStreet" runat="server" Text='<%#Eval("Street")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="City">
                        <ItemTemplate>
                        <asp:Label ID="lblCity" runat="server" Text='<%#Eval("City")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="Country">
                        <ItemTemplate>
                        <asp:Label ID="lblCountry" runat="server" Text='<%#Eval("Country")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="PinCode">
                        <ItemTemplate>
                        <asp:Label ID="lblPin" runat="server" Text='<%#Eval("PinCode")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Emp_PhoneType">
                        <ItemTemplate>
                        <asp:Label ID="lblPin" runat="server" Text='<%#Eval("Emp_PhoneType")%>'></asp:Label>
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
                        Text="Print Report"   BackColor="#FF9900" OnClientClick="callPrint('divemp')"
                        BorderColor="#FF9900" Font-Bold="True" Font-Size="Small" 
         />
  </td>
  </tr>
  </table>
  <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
</center> 
</asp:Content>

