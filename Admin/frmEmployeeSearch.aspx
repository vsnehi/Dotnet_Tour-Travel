<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="frmEmployeeSearch.aspx.cs" Inherits="Admin_frmEmployeeSearch" Title="Untitled Page" %>
<%@ Register Src="~/UserControls/EmployeeSearch.ascx" TagName="Employee"  TagPrefix="Uc1"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
<br />
<br />
<Uc1:Employee ID="EmpSearch" runat="server"></Uc1:Employee>

</asp:Content>

