<%@ Page Language="C#" MasterPageFile="~/Employee/EmployeeMaster.master" AutoEventWireup="true" CodeFile="DisplayTravelDetails.aspx.cs" Inherits="Employee_DisplayTravelDetails" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <br />
    <br />
    <br />
    <asp:Label ID="lblHeading" ForeColor="#990033" 
                runat="server" Text="Show Employees Travel Details"
                Style="font-size: large; font-weight: 700; font-family: Verdana"></asp:Label>
            <br />
            <br />
<div style="border: thin groove #008000; overflow:scroll; width:646px; height: 140px;" 
        id="DivTickets" runat="server" 
                >
            <asp:GridView ID="GridViewTravel" runat="server" BackColor="LightGoldenrodYellow"
                BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None"
                Width="825px" style="margin-top: 1px" Height="122px">
                <FooterStyle BackColor="Tan" />
                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                <AlternatingRowStyle BackColor="PaleGoldenrod" />
            </asp:GridView>
        </div>
         <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
         </center>
</asp:Content>

