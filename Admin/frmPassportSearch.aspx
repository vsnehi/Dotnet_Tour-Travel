<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="frmPassportSearch.aspx.cs" Inherits="Admin_frmPassportSearch" Title="Untitled Page" %>
<%@ Register Src="~/UserControls/PassportSearch.ascx" TagName="Passport" TagPrefix="Uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
<br />
<br />
<Uc1:Passport ID="PaasportSearch" runat="server"></Uc1:Passport>
</asp:Content>

