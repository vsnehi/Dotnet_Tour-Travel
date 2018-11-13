<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaster.master"  AutoEventWireup="true" CodeFile="FrmAddCountriesVisas.aspx.cs" Inherits="Admin_Countires_And_Visas_FrmAddCountriesVisas" Title="Untitled Page" %>
<%@ Register Src="~/UserControls/BrowseFile.ascx" TagName="BrowseFile" TagPrefix="Uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style4
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
        <div style="overflow:scroll; width: 828px;">
            <table style="border: medium groove #FF9900; background-color: #FFCC66; width: 1030px;">
                <tr>
                    <td colspan="6">
                    <center class="style4">
                        &nbsp;Countries Visas Details
                        </center>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                       Country Name
                    </td>
                    <td align="left">
                        <asp:DropDownList ID="DdlCountryId" runat="server" Width="153px">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DdlCountryId"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                    <td align="right">
                        VisaType Name</td>
                    <td align="left">
                        <asp:DropDownList ID="DdlTypeId" runat="server" Width="153px">
                        </asp:DropDownList>
                        </td> 
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DdlTypeId"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
               
                <tr>
                    <td  align="right">
                       PerCountry</td>
                    <td align="left">
                        <asp:TextBox ID="txtPerCountry" runat="server" ></asp:TextBox>
                    </td>
                    
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPerCountry"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                     
                    <td align="right">
                        Description
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtVisaTypeDesc" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtVisaTypeDesc"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                       </tr>
                     <tr>
                     <td align="right" valign="top">
                       Supportive Documents
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtDocuments" runat="server" Textmode="MultiLine" 
                            Width="366px"></asp:TextBox>
                    </td>
                    <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtDocuments"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                     
                      <td align="right">
                      Visa Eligiblilty </td>
                    <td align="left">
                       <asp:DropDownList ID="DdlEligiblity" runat="server" Width="153px">
                       <asp:ListItem Value="0" Text="Select"></asp:ListItem>
                       <asp:ListItem Value="1" Text="E-1 Treat Traders"></asp:ListItem>
                       <asp:ListItem Value="2" Text="E-2 Treat Investors"></asp:ListItem>
                       <asp:ListItem Value="3" Text="E-3 Australian Speciality Workers"></asp:ListItem>
                       <asp:ListItem Value="4" Text="H-1B Specility Workers"></asp:ListItem>
                       <asp:ListItem Value="5" Text="H-1B1 Chileans and Singaporeans"></asp:ListItem>
                       <asp:ListItem Value="6" Text="H-2A Agricultural Workers"></asp:ListItem>
                       <asp:ListItem Value="7" Text="H-2B Seasonal Workers"></asp:ListItem>
                       <asp:ListItem Value="8" Text="H-3 Trainees"></asp:ListItem>
                       <asp:ListItem Value="9" Text="L-1 Intra-company Transfers"></asp:ListItem>
                       <asp:ListItem Value="10" Text="L-1 Blanket"></asp:ListItem>
                       <asp:ListItem Value="11" Text="0-1 Extraordinary Ability"></asp:ListItem>
                       <asp:ListItem Value="12" Text="P-1 Athletes or Entertainers"></asp:ListItem>
                       <asp:ListItem Value="13" Text="P-2 Artists or Entertainers"></asp:ListItem>
                       <asp:ListItem Value="14" Text="R-1 Religious Workers"></asp:ListItem>
                               
                       </asp:DropDownList>
                            
                            </td> 
                            <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DdlEligiblity"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                   </td> 
                </tr>
                
                   <tr>
                   
                   <td align="right" valign="top">
                        Rules</td>
                        <td align="left">
                   <asp:TextBox ID="txtRules" runat="server" TextMode="MultiLine" Width="366px"></asp:TextBox>
                        
                    </td>
                     <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtRules"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                   
                    <td  valign="top" algn="right" align="right">
                       Stamping GuideLines
                       </td>
                    <td valign="top" align="left">
                     <Uc1:BrowseFile ID="BrowseFile1" runat="server" />
                     
                    </td>
                    
                </tr>
                   <tr>
                    <td align="right">
                        Visa Cost
                       </td>
                        <td align="left">
                  <asp:TextBox ID ="txtCost" runat="server"></asp:TextBox>
                        
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCost"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                    <td  align="right">
                         Visa Permit Time</td>
                        <td align="left">
                        <asp:TextBox ID="txtPermitTime" runat="server"></asp:TextBox>
                            </td>
                          <td>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtPermitTime"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                        </td> 
                </tr>
                       <tr>
                    <td align="right" valign="top">
                 Application Form</td>
                    <td align="left" valign="top">
                   <Uc1:BrowseFile ID="BrowseFile2" runat="server" />
                       </td>
                       <td>
                       </td>
                                     
                 <td  align="right">
                       Remarks</td>
                        <td align="left">
                        <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine"></asp:TextBox>
                            </td>
                          <td>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtRemarks"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                        </td> 
                    
                </tr>
                 <tr>
                    <td align="right" valign="top">
                        Count Documents</td>
                     <td align="left">
                        <asp:TextBox ID="txtCount" runat="server" TextMode="MultiLine" Width="366px"></asp:TextBox>
                            </td>
                          <td>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtCount"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                        </td> 
                                     
                
                    
                </tr>
                <tr>
                    <td align="right" colspan="4">
                        <asp:Button ID="BtnAdd" runat="server" Height="24px" OnClick="BtnAdd_Click" Text="Submit"
                            Width="51px" ValidationGroup="g" BackColor="#FF9900" 
                            BorderColor="#FF9900" Font-Bold="True" />
                        <asp:Button ID="btnClear" runat="server" OnClick="btnClear_Click" Text="Cancel" 
                            Width="57px" BackColor="#FF9900" BorderColor="#FF9900" Font-Bold="True" 
                            Font-Size="Small" />
                        <asp:Button ID="BtnView" runat="server" Text="Show"
                            OnClick="BtnView_Click" BackColor="#FF9900" BorderColor="#FF9900" 
                            Font-Bold="True" Font-Size="Small" />
                    </td>
                   
                </tr>
            </table>
            
             <div style="border: medium groove #FF9900; overflow:scroll; width:1101px" 
                id="DivCountriesVisas" runat="server" 
                visible="false">
            <asp:GridView ID="GridViewCountriesVisas" runat="server" BackColor="LightGoldenrodYellow"
                BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None"
                Width="1049px" style="margin-top: 1px" Height="122px" 
                     >
                <FooterStyle BackColor="Tan" />
                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                <AlternatingRowStyle BackColor="PaleGoldenrod" />
            </asp:GridView>
        </div>
        <tr>
        <td  colspan="4">
        <asp:Label ID="lblMsg" runat="server" 
         ForeColor="#FF5050" ></asp:Label>
         </td>
         </tr>
         </div> 
</asp:Content>


