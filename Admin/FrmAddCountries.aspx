<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="FrmAddCountries.aspx.cs" Inherits="Admin_Countries_Master_FrmAddCountries" Title="Untitled Page" %>
<%@ Register Src="~/UserControls/BrowseImage.ascx" TagName="BrowseImage" TagPrefix="Uc1" %>
<%@ Register Src="~/UserControls/BrowseImage1.ascx" TagName="BrowseImage1" TagPrefix="Uc3" %>
<%@ Register Src="~/UserControls/BrowseVideoFile.ascx" TagName="VideoFile" TagPrefix="Uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style5
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
            <table style="border: medium groove #FF9900; width: 492px; background-color: #FFCC66;">
                <tr>
                    <td colspan="3">
                        <span class="style5">Add  Country Details</span>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        Country Name
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtCountryName" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCountryName"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td  align="right">
                        Country Abbr</td>
                    <td align="left">
                        <asp:TextBox ID="txtCountryAbbr" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCountryAbbr"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
               
               
                <tr>
                    <td  align="right">
                        Country Desc</td>
                    <td align="left">
                        <asp:TextBox ID="txtCountryDesc" runat="server" TextMode="MultiLine" 
                            Width="153px"></asp:TextBox>
                    </td>
                    
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCountryDesc"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
               
                     <tr>
                    <td  valign="top" align="right">
                        Country Map</td>
                    <td align="left" valign="top">
                       <Uc1:BrowseImage ID="BrowseImage1" runat="server" DefaultImageUrl="~/Images/NoImage.jpg"/>
                    </td>
                </tr>
                     <tr>
                    <td  valign="top" align="right">
                        Country Flag</td>
                    <td align="left" valign="top">
                       <Uc3:BrowseImage1 ID="BrowseImage2" runat="server" DefaultImageUrl="~/Images/NoImage.jpg" />
                    </td>
                       
                </tr>
                     <tr>
                    <td  valign="top" align="right">
                       Country Video</td>
                    <td align="left" valign="top">
                      <Uc2:VideoFile ID="videoFile1" runat="server" />
                    </td>
                    
                </tr>
                <tr>
                    <td align="right" colspan="2">
                        <asp:Button ID="BtnAdd" runat="server" OnClick="BtnAdd_Click" Text="Submit" 
                            ValidationGroup="g" BackColor="#FF9900" 
                            BorderColor="#FF9900" Font-Bold="True" />
                        <asp:Button ID="btnClear" runat="server" OnClick="btnClear_Click" Text="Cancel" 
                            BackColor="#FF9900" BorderColor="#FF9900" Font-Bold="True" 
                            Font-Size="Small" />
                        <asp:Button ID="BtnView" runat="server" Text="Show"
                            OnClick="BtnView_Click" BackColor="#FF9900" BorderColor="#FF9900" 
                            Font-Bold="True" Font-Size="Small" />
                            <asp:Button ID="BtnModify" runat="server" Text="Modify"
                            OnClick="BtnModify_Click" BackColor="#FF9900" BorderColor="#FF9900" 
                            Font-Bold="True" Font-Size="Small" />
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
            
             <div style="border: medium groove #FF9900; overflow:scroll; width:484px; height: 141px;" 
                id="DivCountry" runat="server" 
                visible="false">
            <asp:GridView ID="GridViewCountry" runat="server" BackColor="LightGoldenrodYellow"
                BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None"
                Width="482px" style="margin-top: 1px" Height="122px" 
                     AutoGenerateColumns="False" onrowcommand="GridViewCountry_RowCommand">
                     <Columns>
                        <asp:TemplateField HeaderText="CountryName">
                        <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" Text='<%#Eval("CountryName")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Abbrevation">
                        <ItemTemplate >
                        <asp:Label ID="lblAbbr" runat="server" Text='<%#Eval("CountryAbbr")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="Description">
                        <ItemTemplate >
                         <asp:Panel ID="pnl1" runat="server" Height="50px" Width="200px"  ScrollBars="Vertical" >
                        <asp:Label ID="lblDesc" runat="server" Text='<%#Eval("CountryDesc")%>'></asp:Label>
                        </asp:Panel> 
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Map File">
                        <ItemTemplate >
                        <asp:Label ID="lblMap" runat="server" Text='<%#Eval("MapFile")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Flag File">
                        <ItemTemplate >
                        <asp:Label ID="lblFlag" runat="server" Text='<%#Eval("FlagFile")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Country Video">
                        <ItemTemplate >
                        <asp:LinkButton ID="lnkVideo" runat="server" Text='<%#Eval("VideoFile")%>' CommandArgument='<%#Eval("CountryId")%>'></asp:LinkButton>
                        </ItemTemplate>
                        </asp:TemplateField>
                        </Columns> 
                <FooterStyle BackColor="Tan" />
                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                <AlternatingRowStyle BackColor="PaleGoldenrod" />
            </asp:GridView>
        </div>
        <tr>
        <td>
        <asp:Label ID="lblMsg" runat="server" 
         ForeColor="#FF5050" ></asp:Label>
         </td>
         </tr>
         </div> 
    </center>
</asp:Content>



