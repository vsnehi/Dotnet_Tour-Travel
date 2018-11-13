<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="frmTicketSearch.aspx.cs" Inherits="Admin_frmTicketSearch" Title="Untitled Page" %>
<%@ Register Src="~/UserControls/TicketSearch.ascx" TagName="Ticket" TagPrefix="Uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
<br />
<br />
<Uc1:Ticket ID="TicketSearch" runat="server"></Uc1:Ticket>
</asp:Content>

