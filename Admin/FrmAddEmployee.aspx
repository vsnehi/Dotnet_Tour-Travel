<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="FrmAddEmployee.aspx.cs" Inherits="Admin_FrmAddEmployee" Title="Untitled Page" %>
<%@ Register src="../UserControls/EmpRegistrationControl.ascx" tagname="EmpRegistrationControl" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <br />
  <br />
  <br />
    <center>
    <uc1:EmpRegistrationControl ID="EmpRegistrationControl1" runat="server" ConnectionName="TravelDeskConncetionString"  HeaderText="Registration"/>
</center>
</asp:Content>
