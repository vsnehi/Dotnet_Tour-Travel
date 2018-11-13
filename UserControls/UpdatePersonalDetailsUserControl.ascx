<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UpdatePersonalDetailsUserControl.ascx.cs"
    Inherits="UpdatePersonalDetails" %>
<%@ Register Src="~/UserControls/BrowseImage.ascx" TagName="BrowseImage" TagPrefix="Uc1" %>

<script src="TextValidation.js" type="text/javascript"></script>

<style type="text/css">
    .HeaderTextStyle
    {
        font-weight: bold;
        text-align: left;
        font-size: medium;
        text-decoration: underline;
        font-family: Verdana;
        color: Blue;
    }
    .NormalTextStyle
    {
        text-align: left;
        font-size: 10px;
        font-family: Verdana;
    }
    .style5
    {
        font-family: Verdana;
        font-size: xx-small;
        text-align: left;
    }
    .style6
    {
        color: #FF3300;
        font-family: Verdana;
        font-size: 9px;
    }
</style>
<center style="width: 578px">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="imgbtnSubmit" EventName="Click" />
            <asp:PostBackTrigger ControlID="BrowseImage1" />
        </Triggers>
        <ContentTemplate>
            <fieldset style="width: 564px; border-color: Maroon">
                <table style="border-color: Maroon; border-width: medium; width: 564px; background-color: #99CCFF;">
                    <tr>
                        <td align="left" colspan="5" class="HeaderTextStyle">
                            Update Your Personal Details
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5" style="text-align: center">
                            <asp:Label ID="lblMsg" runat="server" BackColor="#FFFF99" Font-Bold="True" Font-Names="Verdana"
                                Font-Size="9px"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50px">
                        </td>
                        <td class="NormalTextStyle">
                            &nbsp;&nbsp;Email <span class="style6">*</span>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtEmailId" runat="server" MaxLength="30"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvEmailId" runat="server" ControlToValidate="txtEmailId"
                                ErrorMessage="*"></asp:RequiredFieldValidator>
                        </td>
                        <td style="text-align: right">
                            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmailId"
                                ErrorMessage="Enter Valid MailID" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50px">
                        </td>
                        <td class="NormalTextStyle">
                            &nbsp;&nbsp;Alternate Email <span class="style6">*</span>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtAltMail" runat="server" MaxLength="30"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAltMail"
                                ErrorMessage="*"></asp:RequiredFieldValidator>
                        </td>
                        <td style="text-align: right">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtAltMail"
                                ErrorMessage="Enter Valid MailID" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50px">
                            &nbsp;
                        </td>
                        <td class="NormalTextStyle">
                            &nbsp;&nbsp; Fax No <span class="style6">*</span>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtFaxNo" onKeypress="return onlyNumbershifen(event)" runat="server"
                                MaxLength="15"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtFaxNo"
                                ErrorMessage="*"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50px">
                        </td>
                        <td colspan="4" align="left">
                            <span class="style5">&nbsp;&nbsp; To Add New Photo Browse Here </span>
                            <br />
                            <Uc1:BrowseImage ID="BrowseImage1" runat="server" DefaultImageUrl="~/UserControls/Images/NoImage.jpg&quot;" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50px">
                        </td>
                        <td colspan="4" align="right">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            <span class="style6">( * Mandetory)</span><br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td colspan="3">
                            <br />
                        </td>
                        <td style="text-align: right">
                            <asp:ImageButton ID="imgbtnSubmit" runat="server" ImageUrl="~/UserControls/Images/btn_submit.jpg"
                                OnClick="imgbtnSubmit_Click" />
                        </td>
                    </tr>
                </table>
            </fieldset>
            <br />
            <asp:Label ID="lblError" runat="server" BackColor="#FFFF99" Font-Bold="True" Font-Names="Verdana"
                Font-Size="9px"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
</center>
