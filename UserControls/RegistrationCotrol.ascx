<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RegistrationCotrol.ascx.cs" Inherits="UserControls_RegistrationCotrol" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<%@ Register TagName="ImageBroser" Src="~/UserControls/BrowseImage.ascx" TagPrefix="UcBI" %>
<script language="javascript" type="text/javascript" >
function onlyNumbers(evt)
{
    var e = event || evt;
    var charCode = e.which || e.keyCode;
	if (charCode > 47 && charCode < 58 || charCode==32)
	   return true;		             
    else
    return false ;		                            
}
function OnlyChars(evt)
{
    var e = event || evt;
    var charCode = e.which || e.keyCode;
	if ((charCode > 64 && charCode < 91)||(charCode > 96 && charCode < 123) || charCode==32 || charCode==46)
    return true;		             
    else
    return false ;	
}
function onlyNumbershifen(evt)
{
    var e = event || evt;
    var charCode = e.which || e.keyCode;
	if ((charCode > 47 && charCode < 58 || charCode==45))
    return true;		             
    else
    return false ;		                            
}

</script>
<script type ="text/javascript" language ="javascript" >
var bCheckNumbers = true;
var bCheckUpperCase = true;
var bCheckLowerCase = true;
var bCheckPunctuation = true;
var nPasswordLifetime = 365;
function checkPassword(strPassword)
{
	nCombinations = 0;
	if (bCheckNumbers)
	{
		strCheck = "0123456789";
		if (doesContain(strPassword, strCheck) > 0) 
		{ 
        		nCombinations += strCheck.length; 
    		}
	}
	if (bCheckUpperCase)
	{
		strCheck = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		if (doesContain(strPassword, strCheck) > 0) 
		{ 
        		nCombinations += strCheck.length; 
    		}
	}
	if (bCheckLowerCase)
	{
		strCheck = "abcdefghijklmnopqrstuvwxyz";
		if (doesContain(strPassword, strCheck) > 0) 
		{ 
        		nCombinations += strCheck.length; 
    		}
	}
	if (bCheckPunctuation)
	{
		strCheck = ";:-_=+\|//?^&!.@$£#*()%~<>{}[]";
		if (doesContain(strPassword, strCheck) > 0) 
		{ 
        		nCombinations += strCheck.length; 
    		}
	}
    	var nDays = ((Math.pow(nCombinations, strPassword.length) / 500) / 2) / 86400;
	var nPerc = nDays / nPasswordLifetime;
	return nPerc;
}
function runPassword(strPassword, strFieldID) 
{
	nPerc = checkPassword(strPassword);
    	var ctlBar = document.getElementById(strFieldID + "_bar"); 
    	var ctlText = document.getElementById(strFieldID + "_text");
    	if (!ctlBar || !ctlText)
    		return;
    	var nRound = Math.round(nPerc * 100);
	if (nRound < (strPassword.length * 5)) 
	{ 
		nRound += strPassword.length * 5; 
	}
	if (nRound > 100)
		nRound = 100;
    	ctlBar.style.width = nRound + "%";
 	if (nRound > 95)
 	{
 		strText = "Very Secure";
 		strColor = "#3bce08";
 	}
 	else if (nRound > 75)
 	{
 		strText = "Secure";
 		strColor = "orange";
	}
 	else if (nRound > 50)
 	{
 		strText = "Mediocre";
 		strColor = "#ffd801";
 	}
 	else
 	{
 		strColor = "red";
 		strText = "Insecure";
 	}
	ctlBar.style.backgroundColor = strColor;
	ctlText.innerHTML = "<span style='color: " + strColor + ";'>" + strText + "</span>";
}
function doesContain(strPassword, strCheck)
 {
    	nCount = 0; 
 
	for (i = 0; i < strPassword.length; i++) 
	{
		if (strCheck.indexOf(strPassword.charAt(i)) > -1) 
		{ 
	        	nCount++; 
		} 
	} 
	return nCount; 
} 
 

</script>

<style type="text/css">
    .style3
    {
        height: 10px;
        width: 94px;
    }
        
    .style8
    {
        width: 8px;
    }
    .style9
    {
        width: 7px;
        text-align: left;
    }
    .style14
    {
        text-align: left;
        width: 511px;
    }
    .style15
    {
        width: 4px;
    }
    .style18
    {
        width: 246px;
    }
    .style20
    {
    }
    .style33
    {
        height: 17px;
    }
    .style37
    {
        height: 17px;
        width: 4px;
    }
    .style43
    {
        text-align: right;
        }
    .style46
    {
        text-align: right;
        width: 120px;
    }
    .style48
    {
        width: 57px;
    }
        
    
    .style70
    {
        color: #FF3300;
        text-align: right;
    }
    
    
    .style71
    {        text-align: right;
    }
    .style72
    {
        height: 17px;
        text-align: right;
    }
   
    .style76
    {
        width: 166px;
        text-align: right;
    }
    
    
    .style77
    {
        height: 17px;
        text-align: right;
        width: 93px;
    }
    .style79
    {
        width: 140px;
        text-align: right;
    }
    .style80
    {
        height: 10px;
        width: 140px;
    }
    .style83
    {
        width: 5px;
    }
    .style84
    {
        height: 20px;
        width: 7px;
        text-align: left;
    }
    .style85
    {
        width: 7px;
    }
    
    
    .style86
    {
        height: 20px;
        width: 8px;
        text-align: left;
    }
    .style87
    {
        height: 17px;
        width: 8px;
    }
    .style88
    {
        color: #CC3300;
    }
    .style89
    {
        width: 166px;
    }
    
    
    .style90
    {
        text-align: right;
        width: 128px;
    }
    .style91
    {
        height: 20px;
        text-align: left;
    }
        
    
    .style93
    {
        text-align: right;
        width: 165px;
    }
    .style94
    {
        height: 17px;
        width: 165px;
        text-align: right;
    }
    .style95
    {
        width: 165px;
        text-align: right;
    }
    .style96
    {
        text-align: right;
        width: 971px;
    }
    .style97
    {
        width: 49px;
    }
    
    
    .style98
    {
        width: 384px;
    }
    .style99
    {
        color: #FF3300;
        text-align: right;
        font-weight: bold;
    }
    .style100
    {
        text-align: right;
        width: 120px;
        font-weight: bold;
    }
    .style101
    {
        color: #426D94;
    }
    .style102
    {
        color: #396D8C;
    }
    .style103
    {
        color: #39698C;
    }
    
    
    </style>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<Triggers>
<asp:PostBackTrigger ControlID="ImageBrowser1" />
<asp:AsyncPostBackTrigger ControlID="imgBtnAddAddress" EventName="Click" />
<asp:AsyncPostBackTrigger ControlID="imgbtnAddPhoneNo" EventName="Click" />
<asp:AsyncPostBackTrigger ControlID="btnCheck" EventName="Click" />
<asp:PostBackTrigger ControlID="btnSubmit" />

</Triggers>

<ContentTemplate>
<center style="width: 539px; font-family: Verdana; font-size: medium;" >
 <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Font-Size="Larger" ForeColor="#0066FF"></asp:Label>
 <br />
 <br />
<asp:Label ID="lblError" BackColor="Yellow" runat="server" Font-Bold="True" Font-Names="Verdana" 
        Font-Size="10px" ForeColor="#FF3300"  ></asp:Label>

<fieldset style="border:1px;border-color:#0066FF;border-width:thin" >
<br />
<div class="style14">

<b style="text-align: left; font-size: 15px; font-family: Verdana;">
    <span style="text-align: center" class="style101" >Sign Up: Enter Information</span></b><b style="text-align: left; font-size: 15px; font-family: Verdana;color: #0066FF;">
    <br />
    </b> 
<br  />
 
    
    <p><span style="font-size:12px;" class="style103">
    Register now to access the system. Its easy, fast and free. 
     Registration Fields marked with an asterisk (</span>
    <span style="font-size:12px;" class="style70">*</span><span style="font-size:12px;" 
            class="style101">) 
    are mandatory.
</span> </p>
</div>
<br />

    <fieldset style="border-style: none; border-color: inherit; border-width: 0; width: 511px;">
        <legend style="font-family: Verdana;width:412px; background-image:url('Images/linkbg.gif'); font-size: 15px;font-weight: bold" 
            class="style101">
           1. Personal Details...</legend>
        <br />
        
        <table style="width: 553px; font-family: Verdana; font-size: 10px; height: 324px;">
            <tr>
                <td class="style46" colspan="2">
                    <b>First Name
                </b>
                <span class="style99">*</span></td>
                <td align="left" class="style97">
                    <asp:TextBox ID="txtFirstName" onkeypress="return OnlyChars(event)" 
                        runat="server" MaxLength="20" TabIndex="1"></asp:TextBox>
                </td>
                <td class="style84">
                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName"
                        ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
                <td class="style83">
                </td>
                <td  class="style43">
                    <b>Last Name
                </b>
                <span class="style99">*</span></td>
                <td align="left" class="style18">
                    <asp:TextBox ID="txtLastName" onkeypress="return OnlyChars(event)" 
                        runat="server" MaxLength="20" TabIndex="1"></asp:TextBox>
                </td>
                <td class="style14">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtLastName"
                        ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="8">
                </td>
            </tr>
            <tr>
                <td class="style46" colspan="2">
                    <b>Gender
                </b>
                <span class="style99">*</span></td>
                <td align="left" class="style97">
                    <asp:DropDownList ID="ddlGender" runat="server" Font-Names="Verdana" 
                        Font-Size="10px">
                        <asp:ListItem Value="Select Gender">Select Gender</asp:ListItem>
                        <asp:ListItem Value="Male">Male</asp:ListItem>
                        <asp:ListItem Value="Female">Female</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="style9">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" InitialValue="Select Gender"
                        runat="server" ControlToValidate="ddlGender" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
                <td class="style83">
                </td>
                <td class="style43">
                    <b>Birth Date
                </b>
                <span class="style99">*</span></td>
                <td colspan="2" style="text-align: left" class="style69">
                    &nbsp;<asp:TextBox ID="txtDob" runat="server"></asp:TextBox>
                    <cc2:CalendarExtender TargetControlID="txtDob" ID="CalendarExtender1" runat="server">
                    </cc2:CalendarExtender>
                    &nbsp;&nbsp;
                    <asp:RequiredFieldValidator ID="rfvDOB" ErrorMessage="*" runat="server" ControlToValidate="txtDob"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="8">
                </td>
            </tr>
            <tr>
                <td class="style46" colspan="2">
                    <b>Email
                </b>
                <span class="style99">*</span></td>
                <td align="left" class="style97">
                    <asp:TextBox ID="txtEmailID" runat="server" MaxLength="40"></asp:TextBox>
                </td>
                <td class="style85">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" 
                        runat="server" ControlToValidate="txtEmailID" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
                <td colspan="2" style="text-align: left">
                    <asp:RegularExpressionValidator ID="revMailID" runat="server" ControlToValidate="txtEmailID"
                        ErrorMessage="Enter Valid EmailID" Width="122px" Font-Names="Verdana" 
                        Font-Size="10px" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
                <td align="left"  class="style3">
                    </td>
                <td>
                </td>
            </tr>
            <tr>
                <td colspan="8">
                </td>
            </tr>
            <tr>
                <td class="style100" colspan="2">
                    Alternate Email
                </td>
                <td align="left" class="style97">
                    <asp:TextBox ID="txtAltEmailID" runat="server" MaxLength="40"></asp:TextBox>
                </td>
                <td class="style85">
                </td>
                <td colspan="2" style="text-align: left">
                    <asp:RegularExpressionValidator ID="revaltMailID" runat="server" ControlToValidate="txtAltEmailID"
                        ErrorMessage="Enter Valid EmailID" Width="122px" Font-Names="Verdana" 
                        Font-Size="10px" Height="16px" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
                <td>
                </td>
                <td></td>
            </tr>
            <tr>
                <td  colspan="8">
                    </td>
            </tr>
            <tr>
                <td class="style46" colspan="2">
                    <b>Fax No </b> <span class="style99">*</span></td>
                <td align="left" class="style97">
                    <asp:TextBox ID="txtFaxNo" runat="server"></asp:TextBox>
                </td>
                <td class="style85">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" 
                        runat="server" ControlToValidate="txtFaxNo" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </td>
                <td colspan="2" style="text-align: left">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style96">
                </td>
                <td colspan="6" rowspan="3" style="text-align: right" valign="top" >
                    <UcBI:ImageBroser ID="ImageBrowser1" runat="server" 
                        DefaultImageUrl="~/UserControls/Images/NoImage.jpg" />
                </td>
                <td></td>
            </tr>
                       
        </table>
    </fieldset>
  
    <fieldset style="border-style: none; border-color: inherit; border-width: 0; width: 540px;">
        <legend style="width:524px; background-image:url('Images/linkbg.gif'); font-family: Verdana; font-size: 15px; font-weight: bold" 
            class="style102">
            2.Mailing & Contact Detailss</legend>
        <br />
        
        <table style="width: 532px; font-size: 10px; font-weight: 700;">
            <tr>
                <td class="style43" colspan="2">
                    Address Type
                <span class="style70">*</span>
                </td>
                <td align="left" class="style15">
                    <asp:DropDownList ID="ddlAddType" runat="server" ValidationGroup="a" >
                    <asp:ListItem Value="--Select One--">--Select One--</asp:ListItem>
                    <asp:ListItem Value="Home">Home</asp:ListItem>
                    <asp:ListItem Value="Office">Office</asp:ListItem>
                    <asp:ListItem Value="Others">Others</asp:ListItem>
                    
                    </asp:DropDownList>
                </td>
                <td class="style91" align="left" >
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
                        InitialValue="--Select One--" runat="server" ControlToValidate="ddlAddType"
                        ErrorMessage="*" ValidationGroup="a"></asp:RequiredFieldValidator>
                </td>
                <td class="style90" align="left" >
                    </td><td  align="left" class="style76" >
                            </td>
                     <td>
                         &nbsp;</td>
                     <td></td>
                     
            </tr>
            <tr>
                <td class="style71">
                </td>
                <td colspan="7" width="3px">
                </td>
            </tr>
            <tr>
                <td class="style72" colspan="2">
                    Door No                 <span class="style70">*</span></td>
                <td align="left" class="style37">
                    <asp:TextBox ID="txtDNO" runat="server" ValidationGroup="a" ></asp:TextBox>
                </td>
                <td class="style33" align="left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtDNO"
                        ErrorMessage="*" ValidationGroup="a"></asp:RequiredFieldValidator>
                </td>
                <td align="left" class="style90">
                    Street <span class="style70">*</span></td>
                <td class="style76">
                    <asp:TextBox ID="txtStreet" runat="server" ValidationGroup="a" ></asp:TextBox>
                </td>
                <td align="left">
                   <asp:RequiredFieldValidator ID="rfvStreet" runat="server" ErrorMessage="*" 
                        ControlToValidate="txtStreet" ValidationGroup="a" ></asp:RequiredFieldValidator>
               
                </td>
                <td>
                   
                </td>
            </tr>
            <tr>
                <td class="style71">
                </td>
                <td colspan="7" width="3px">
                </td>
            </tr>
            <tr>
                <td class="style71" colspan="2">
                    City
               <span class="style70">*</span></td>
                <td align="left" class="style15">
                    <asp:TextBox ID="txtCity" runat="server" onKeyUp="this.value=this.value.toUpperCase()" onkeypress="return OnlyChars(event)" ValidationGroup="a"  ></asp:TextBox>
                </td>
                <td  align="left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtCity"
                        ErrorMessage="*" ValidationGroup="a"></asp:RequiredFieldValidator>
                </td>
                <td align="left" class="style90"  >Pin Code&nbsp; <span class="style70">*</span>
                       </td>
                <td class="style76">
                    <asp:TextBox ID="txtPin" onkeypress="return onlyNumbers(event)" runat="server" ValidationGroup="a" ></asp:TextBox>
                </td>
                <td align="left" >
                   <asp:RequiredFieldValidator ErrorMessage="*" ID="rfvPin" 
                        ControlToValidate="txtPin" runat="server" ValidationGroup="a" ></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style71">
                </td>
                <td colspan="2" style="text-align: right">
                </td>
                <td colspan="3">
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
            <td class="style71" colspan="2">
                    State
                <span class="style70">*</span>
                </td>
                <td style="text-align: left" >
                    <asp:TextBox ID="txtState" onkeyUp="this.value=this.value.toUpperCase()" onkeypress="return OnlyChars(event)" runat="server" ValidationGroup="a"></asp:TextBox>
                      </td>
                      <td align="left">
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator7" 
                              ControlToValidate="txtState" runat="server" ErrorMessage="*" 
                              ValidationGroup="a"></asp:RequiredFieldValidator>
                      </td><td align="left" class="style90">
                      Country<span class="style88">&nbsp; * </span>
                      </td>
                <td class="style76">
                    <asp:TextBox ID="txtCountry" onKeyUp="this.value=this.value.toUpperCase()" onkeypress="return OnlyChars(event)" runat="server" ValidationGroup="a"></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ControlToValidate="txtCountry" 
                        ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" 
                        ValidationGroup="a"></asp:RequiredFieldValidator>
                </td>
                <td>
                    
                </td>
            </tr>
            <tr>
                <td class="style71">
                </td>
                <td colspan="5">
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td colspan="5" style="text-align: right;font-size:8px;font-family:Verdana">
                    Add More Addreses one by one,you should have to submit minimum of oneaddress.<br />
                    Add Phone No button will enable After submission of your address only.
                    </td>
                <td align="right" class="style89" >
                    
                    <asp:ImageButton ID="imgBtnAddAddress" runat="server" Height="20px" 
                        Width="100px" ImageUrl="~/UserControls/Images/Add Address.jpg" ValidationGroup="a" 
                        onclick="imgBtnAddAddress_Click" />
                </td>
                <td>
                    
                </td>
                <td>
                    
                </td>
            </tr>
            <tr>
            <td colspan="8"></td>
            </tr>
            <tr>
            <td></td>
            <td colspan="7"><asp:Label BackColor="Yellow" ID="lblAddressMsg" runat="server" ></asp:Label></td>
            </tr>
            <tr>
            <td colspan="5" style="text-align: right">
                &nbsp;</td>
            <td colspan="3">
                </td>
            </tr>
            <tr>
                <td class="style72">
                </td>
                <td align="left" class="style77">
                    Phone Type                  <span class="style70">*</span></td>
                <td align="left" class="style37">
                    <asp:DropDownList ID="ddlPhonetype" runat="server" ValidationGroup="p">
                   
                    <asp:ListItem Value="--Select One--">--Select One--</asp:ListItem>
                    <asp:ListItem Value="Home">Home</asp:ListItem>
                    <asp:ListItem Value="Office">Office</asp:ListItem>
                    <asp:ListItem Value="Others">Others</asp:ListItem>
                    
                    </asp:DropDownList>
                    </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        InitialValue="--Select One--" ControlToValidate="ddlPhonetype"
                        ErrorMessage="*" ValidationGroup="p"></asp:RequiredFieldValidator>
                </td>
                <td align="left" class="style90">
                    Enter Phone No <span class="style70">*</span></td>
                <td align="left" class="style76">
                    <asp:TextBox ID="txtPhoneNo" onkeypress="return onlyNumbershifen(event)"  runat="server" ValidationGroup="p" ></asp:TextBox>
                </td>
                <td align="left">
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                        ErrorMessage="*" ControlToValidate="txtPhoneNo" ValidationGroup="p" ></asp:RequiredFieldValidator>
                </td>
                <td>
                   
                </td>
            </tr>
            <tr>
                <td class="style72">
                    &nbsp;</td>
                <td align="left" class="style77">
                    &nbsp;</td>
                <td align="left" class="style37">
                    &nbsp;</td>
                <td class="style33">
                    &nbsp;</td>
                <td class="style90">
                    &nbsp;</td>
                <td class="style76">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                   
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style72">
                    &nbsp;</td>
                <td  colspan="4" style="font-size:8px;font-family:Verdana;">
                Add More Phone Numbers one by one,you have to submit minimum of one Phone 
                    <br />
                                        Number.Submit button will enable After submission of your Phone Number only.
                    </td>
                <td align="right" class="style89" >
                    <asp:ImageButton ID="imgbtnAddPhoneNo" Enabled="false" runat="server" Height="20px" 
                        Width="100px" ImageUrl="~/UserControls/Images/Add Phone No.jpg" ValidationGroup="p" 
                        onclick="imgbtnAddPhoneNo_Click" />
                        </td>
                <td>
                    </td>
                <td>
                   
                    </td>
            </tr>
            <tr>
                <td class="style72">
                    &nbsp;</td>
                <td  colspan="5" align="left">
                    
                    <asp:Label ID="lblPhonetype" BackColor="Yellow" runat="server" ></asp:Label>
                    </td>
                <td>
                    &nbsp;</td>
                <td>
                   
                    &nbsp;</td>
            </tr>
        </table>
    </fieldset>
      
    <br />
   
    <fieldset style="border-style: none; border-color: inherit; border-width: 0; width: 541px;">
        <legend style="width:533px; background-image:url('Images/linkbg.gif'); font-family: Verdana; font-size: 15px; font-weight: bold" 
            class="style103">
            3.Account Details</legend>
        <br />
        
        <table style="width: 524px; font-size: 10px; font-weight: 700;">
            <tr>
                <td class="style93" colspan="2">
                    User Name
                <span class="style70">*</span>
                </td>
                <td align="left" class="style15">
                    <asp:TextBox ID="txtUserName" runat="server" MaxLength="15"></asp:TextBox>
                </td>
                <td class="style86">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtUserName"
                        ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
                <td class="style20" align="left" >
                    <asp:Button ID="btnCheck" runat="server" Text="Check" onclick="btnCheck_Click" 
                        CausesValidation="False" Font-Bold="True" Font-Size="X-Small" />
                    
                    </td><td colspan="3" align="left" >
                    <asp:Label ID="lblAvail" runat="server" Font-Bold="True" Font-Names="Verdana" 
                                Font-Size="10px" ForeColor="Red"></asp:Label>
                     </td>
            </tr>
            <tr>
                <td class="style98">
                </td>
                <td colspan="7" width="3px">
                </td>
            </tr>
            <tr>
                <td class="style94" colspan="2">
                    Password
                <span class="style70">*</span></td>
                <td align="left" class="style37">
                    <asp:TextBox ID="txtPwd" TextMode="Password" runat="server" MaxLength="16" onkeyup="runPassword(this.value, 'mypassword');"></asp:TextBox>
                </td>
                <td class="style87">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtPwd"
                        ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
                <td class="style33" colspan="4" align="left">
                <div style="width: 100px;"> 
				<div id="mypassword_text" style="font-size: 10px;"></div>
				<div id="mypassword_bar" style="font-size: 1px; height: 2px; width: 0px; border: 1px solid white;"></div> 
			</div>
                                
                </td>
            </tr>
            <tr>
                <td class="style95" colspan="2">
                    Confirm
                <span class="style70">*</span></td>
                <td align="left" class="style15">
                    <asp:TextBox ID="txtConfirm" TextMode="Password" runat="server" MaxLength="16" ></asp:TextBox>
                </td>
                <td class="style8">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="txtConfirm"
                        ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
                <td style="text-align: left">
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password Mismatch"
                        ControlToCompare="txtPwd" ControlToValidate="txtConfirm"></asp:CompareValidator>
                </td>
                <td style="text-align: right" class="style48">
                    &nbsp;
                </td>
                <td align="left" class="style80">
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style98">
                </td>
                <td colspan="2" style="text-align: right">
                </td>
                <td colspan="3">
                </td>
                <td class="style79">
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="style95">
                    Security Question
                <span class="style70">*</span>
                </td>
                <td colspan="3" style="text-align: left">
                    <asp:DropDownList ID="ddlSecQues" runat="server" Font-Names="Verdana" 
                        Font-Size="10px">
                        <asp:ListItem Value="Select One">- Select One -</asp:ListItem>
                        <asp:ListItem Value="Where did you meet your spouse?">Where did you meet your spouse?</asp:ListItem>
                        <asp:ListItem Value="What was the name of your first school?">What was the name of your first school?</asp:ListItem>
                        <asp:ListItem Value="Who was your childhood hero?">Who was your childhood hero?</asp:ListItem>
                        <asp:ListItem Value="What is your favorite pastime?">What is your favorite pastime?</asp:ListItem>
                        <asp:ListItem Value="What is your favorite sports team?">What is your favorite sports team?</asp:ListItem>
                        <asp:ListItem Value="What is your father's middle name?">What is your father's middle name?</asp:ListItem>
                        <asp:ListItem Value="What was your high school mascot?">What was your high school mascot?</asp:ListItem>
                        <asp:ListItem Value="What make was your first car or bike?">What make was your first car or bike?</asp:ListItem>
                        <asp:ListItem Value="What is your pet's name?">What is your pet's name?</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="ddlSecQues"
                        ErrorMessage="*" InitialValue="Select One" ></asp:RequiredFieldValidator>
                </td>
                <td style="text-align: right">
                    &nbsp;
                </td>
                <td class="style79">
                    &nbsp;
                </td>
                <td>
                    
                </td>
            </tr>
            <tr>
                <td class="style98">
                </td>
                <td colspan="5">
                </td>
                <td class="style79">
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="style95">
                    Security Answer
                <span class="style70">*</span>
                </td>
                <td colspan="3" style="text-align: left">
                    <asp:TextBox ID="txtSecAns" runat="server" Width="256px" MaxLength="100"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ErrorMessage="*" ControlToValidate="txtSecAns"></asp:RequiredFieldValidator>
                </td>
                <td align="left">
                    &nbsp;
                </td>
                <td class="style79">
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
            <td colspan="8"></td>
            </tr>
            <tr>
            <td colspan="6" style="text-align: right">
                For Submiting the Data first you need to Enter the above fields,After
                <br />
                submission of address andphone no submit button will be enabled</td>
                <td class="style79">
                 <asp:ImageButton ID="btnSubmit" Enabled="false" runat="server" Width="100px" Height="20px"
                    ImageUrl="~/UserControls/Images/btn_submit.jpg" onclick="btnSubmit_Click" />
              
                </td>
                <td></td>
            </tr>
        </table>
    </fieldset>
    
    <br />
    <br />
    
    </fieldset>
</center>
</ContentTemplate>
</asp:UpdatePanel>
