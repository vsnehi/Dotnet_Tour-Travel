<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UCLoginChecking.ascx.cs" Inherits="UserControls_UCLoginChecking" %>

<style type="text/css">
    .style1
    {
        height: 4px;
    }
    .style2
    {
        height: 13px;
    }
</style>

<script runat="server">

    
</script>

<table border="0" cellspacing="0" cellpadding="0" align="center" 
    
    style="background-image: url('Images/top-middle.jpg'); width: 36%; height: 489px;">
    <tr>
        <td width="4%" class="style2">
            <img id ="imgleft" src="Images/top-left.jpg" width="34" height="32" alt =""  >
        </td>
        <td width="93%" style="background-image: url('Images/top-middle.jpg')" 
            class="style2">
            &nbsp;
        </td>
        <td width="3%" class="style2">
            <img id="imgright" src="Images/top-right.jpg" width="34" height="32" alt =""  >
        </td>
    </tr>
    <tr>
        <td width="4%"  height="27" style="background-image: url('Images/left-middle.jpg')">
          
        </td>
        <td width="93%" bgcolor="#FFFFFF" valign="top">
            <h1 align="left" style="text-align: center">
                <font face="Verdana, Arial, Helvetica, sans-serif" size="-1"></font>User Login Page
            </h1>
            <table border="0" cellspacing="2" cellpadding="2" 
                style="width: 67%; height: 363px">
                <tr>
                    <td>
                        
                            <div align="center">
                                <table border="0" cellspacing="0" width="75%">
                                    <tr>
                                        <td colspan="2" style="text-align: center">
                                            <b>Please enter your Login information</b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Username:
                                        </td>
                                        <td style="margin-left: 40px">
                                            <asp:TextBox ID="txtUserName" runat="server" Width="131px" class="keyboardInput" onkeypress="return false"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RFVUserName" runat="server" ControlToValidate="txtUserName"
                                                ErrorMessage="*"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Password:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtPassword" runat="server" onKeypress="return false" Width="131px" TextMode="Password" class="keyboardInput" ></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RFVPassword" runat="server" ControlToValidate="txtPassword"
                                                ErrorMessage="*"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center">
                                            <asp:CheckBox ID="ChkRemember" runat="server" Width="131px" Text="RememberMe" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center">
                                            </hr>
                                            <asp:Button ID="btnLogin" runat="server" Text="Log In" OnClick="btnLogin_Click" />
                                        </td>
                                    </tr>
                                    <tr><td><p style="color: #FF0000">* are Mandatory!
                            </p></td></tr>
                                </table>
                            </div>
                           <div><asp:Label  ForeColor="#FF0000" ID="lblError" runat="server"></asp:Label></div>
                            <p>Lost your password? Enter your username to request it again.
                     <b>The email is sent from our personal mailId, please make sure it won't be blocked by spam filters</b>
                     </br>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                Username:
                                <asp:TextBox ID="txtForgotUserName" runat="server" Width="131px"></asp:TextBox>
                                <asp:Button ID="btnForgot" runat="server" Text="LostPassword" 
                        CausesValidation="false" onclick="btnForgot_Click" />
                              
                               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              
                               </p></td></tr>
            </table>
        </td>
        <td width="3%" height="27" style="background-image: url('Images/right-middle.jpg')">
            &nbsp;
        </td>
    </tr>
    <tr>
        <td width="4%" valign="top" class="style1">
            <img  id ="imgbtmleft"  src="Images/bottom-left.jpg" width="34" height="32" alt=""  />
        </td>
        <td width="93%" style="background-image: url('Images/bottom-middle.jpg')"
            valign="bottom" class="style1">
            &nbsp;
        </td>
        <td width="3%" valign="top" class="style1">
            <img id ="imgbtmright" src="Images/bottom-right.jpg" width="34" height="32" alt ="">
        </td>
    </tr>
</table>