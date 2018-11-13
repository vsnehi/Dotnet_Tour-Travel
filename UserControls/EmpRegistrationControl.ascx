<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EmpRegistrationControl.ascx.cs"
    Inherits="EmpRegistrationControl" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="UcBI" TagName="ImageBroser" Src="~/UserControls/BrowseImage.ascx" %> 
<script language="javascript" type="text/javascript">

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
    return false;		                            
}
function validateDate(evt)
{
    var date=document.getElementById("ctl00_ContentPlaceHolder1_RegistrationCOntrol1_txtDate").value;
    var month=document.getElementById("ctl00_ContentPlaceHolder1_RegistrationCOntrol1_txtMonth");
    var e = event || evt;
    var charCode = e.which || e.keyCode;
    //alert(String.fromCharCode(charCode));
    // alert(date.length);
    if(date.length ==0)
    {
	  if (charCode > 47 && charCode < 52)
         return true;
      else
         return false;
    }
    else if(date.length ==1)
    {
      if (charCode > 47 && charCode < 58)
      {
           if(date ==3)
           {
             if (charCode > 47 && charCode < 50)
                {
                  return true;
                }
             else
                return false;
           }
           else 
           {
            return true;
           }
      }          
      else
         return false;
    }
    else if(date.length ==2)
    {
      month.focus();
      return false;
    }
}

function validateMonth(evt)
{
    var date=document.getElementById("ctl00_ContentPlaceHolder1_RegistrationCOntrol1_txtDate").value;
    var month=document.getElementById("ctl00_ContentPlaceHolder1_RegistrationCOntrol1_txtMonth").value;
    var e = event || evt;
    var charCode = e.which || e.keyCode;
    if(month.length ==0)
    {
	  if (charCode > 47 && charCode < 50)
         return true;
      else
         return false;
    }
    else if(month.length ==1)
    {
      if (charCode > 47 && charCode < 58)
      {
           if(month ==1)
           {
             if (charCode > 47 && charCode < 51)
                {
                 return true;
                }
             else
                return false;
           }
           else 
           {
            return true;
           }
      }          
      else
         return false;
    }
    else if(month.length ==2)
    {
      document.getElementById("ctl00_ContentPlaceHolder1_RegistrationCOntrol1_txtYear").focus();
      return false ;
    }
}

function CalculateAge()
{
  var date=document.getElementById("ctl00_ContentPlaceHolder1_RegistrationCOntrol1_txtDate").value;
  var month=document.getElementById("ctl00_ContentPlaceHolder1_RegistrationCOntrol1_txtMonth").value;
  year=document.getElementById("ctl00_ContentPlaceHolder1_RegistrationCOntrol1_txtYear").value;
  if(year < 2008 && year >1900){
  
  if(date != "" && month !="" && year !="")
  { 
        var born;
        now = new Date()
        //alert(now);
	 	born = new Date(year, month*1-1, date);
	 	//alert(born);
	    years = Math.floor((now.getTime() - born.getTime()) / (365.25 * 24 * 60 * 60 * 1000));
	    //alert(years);
        document.getElementById("ctl00_ContentPlaceHolder1_RegistrationCOntrol1_txtAge").value =years +' Years';
   
  }
  else
  {
    alert('Please fill the date, month and year!');
    document.getElementById("ctl00_ContentPlaceHolder1_RegistrationCOntrol1_txtDate").focus();
  }
  }
  else 
  {
    if(year ==""){
        alert('Enter your birth Year');
    }
    else {
    alert('Enter a valid Year');
    document.getElementById("ctl00_ContentPlaceHolder1_RegistrationCOntrol1_txtYear").value="";
    document.getElementById("ctl00_ContentPlaceHolder1_RegistrationCOntrol1_txtYear").focus(); 
    }
    
  }
}

</script>

<style type="text/css">
    .style8
    {
        width: 3px;
    }
    .style15
    {
        width: 4px;
    }
    .style16
    {
        height: 20px;
        width: 24px;
        text-align: left;
    }
    .style20
    {
    }
    .style33
    {
        width: 17px;
        height: 17px;
    }
    .style37
    {
        height: 17px;
        width: 4px;
    }
    .style38
    {
        height: 17px;
        width: 3px;
    }
    .style70
    {
        color: #FF3300;
        text-align: right;
    }
    .style76
    {
        width: 129px;
    }
    .style77
    {
        height: 17px;
        text-align: left;
        width: 103px;
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
    .style81
    {
        width: 103px;
    }
</style>
<style type="text/css">
    .styles6
    {
        width: 76px;
        height: 20px;
    }
    .styles7
    {
        width: 103px;
        height: 20px;
        text-align: left;
    }
    .styles8
    {
        width: 128px;
    }
    .styles9
    {
        width: 9px;
    }
    .styles10
    {
        color: #FF3300;
    }
    .styles11
    {
        width: 76px;
        height: 28px;
    }
    .styles13
    {
        height: 28px;
    }
    .styles14
    {
        width: 110px;
    }
    .styles15
    {
        height: 28px;
        width: 110px;
    }
    .styles18
    {
        height: 20px;
        text-align: left;
    }
    .styles19
    {
        width: 110px;
        height: 20px;
    }
    .style86
    {
        text-align: right;
        width: 76px;
    }
    .style88
    {
        width: 76px;
        height: 17px;
    }
    .style89
    {
        width: 76px;
    }
    .style90
    {
        text-align: right;
        width: 97px;
    }
    .style91
    {
        width: 126px;
    }
    .style95
    {
        width: 108px;
    }
    .style96
    {
        height: 20px;
        width: 108px;
    }
    .style97
    {
        width: 108px;
        height: 20px;
    }
    .style99
    {
        color: #000000;
    }
    
</style>




<asp:UpdatePanel ID="MainUp" runat="server">
<Triggers>
<asp:AsyncPostBackTrigger ControlID="ddlDesg" EventName="SelectedIndexChanged" />
<asp:AsyncPostBackTrigger ControlID="ddlDept" EventName="SelectedIndexChanged" />
<asp:AsyncPostBackTrigger ControlID="ddlQualification" EventName="SelectedIndexChanged" />
<asp:AsyncPostBackTrigger ControlID="imgBtnAddAddress" EventName="Click" />
<asp:AsyncPostBackTrigger ControlID="imgbtnAddPhoneNo" EventName="Click" />
<asp:AsyncPostBackTrigger ControlID="btnSubmit" EventName="Click" />
<asp:PostBackTrigger ControlID="EmpPhoto" />
</Triggers>
<ContentTemplate>
<center style="height: 349px; width: 765px;  background-image: url('../Images/tableInnerback.JPG');
            background-repeat: repeat-x;border:2px solid #FF0000;">
    <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Font-Size="Larger" 
        ForeColor="Black"></asp:Label>
    <asp:Label ID="lblError" BackColor="Yellow" runat="server" Font-Bold="True" Font-Names="Verdana"
        Font-Size="10px" ForeColor="#FF3300"></asp:Label>
    <fieldset style="border-style: none; border-color: inherit; border-width: 0; width: 700px;">
        <legend style="font-family: Verdana; width: 770px; background-image: url('Images/linkbg.gif');
            font-size: 15px; font-weight: bold; background-color: #FFCC66;" 
            class="style99">Personal Details</legend>
        <br />
        <br />
        <center>
        <table style="border: 1px dashed #FF0000; width: 779px; height: 160px; font-family: Verdana; font-size: 10px;" 
            >
            <tr>
                <td class="styles6">
                </td>
                <td class="styles7">
                    First Name<span class="styles10">*</span>
                </td>
                <td class="styles8">
                    <asp:TextBox ID="txtFName" runat="server"></asp:TextBox>
                </td>
                <td class="styles9">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFName"
                        ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
                <td align="left" valign="top" colspan="3" rowspan="5">
                               <UcBI:ImageBroser UpdateMode="Conditional" ID="EmpPhoto" runat="server" 
                        DefaultImageUrl="~/Images/NoImage.jpg" />
                             
                                  </td>
            </tr>
            <tr>
                <td class="styles6">
                </td>
                <td class="styles7">
                    Middle Name<span class="styles10">*</span>
                </td>
                <td class="styles8">
                    <asp:TextBox ID="txtMidName" runat="server"></asp:TextBox>
                </td>
                <td class="styles9">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtMidName"
                        runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="styles6">
                </td>
                <td class="styles7">
                    Last Name<span class="styles10">*</span>
                </td>
                <td class="styles8">
                    <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                </td>
                <td class="styles9">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtLastName"
                        runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="styles6">
                </td>
                <td class="styles7">
                    Gender<span class="styles10">*</span>
                </td>
                <td class="styles8" align="left">
                    <asp:DropDownList ID="ddlGender" runat="server" Width="153px">
                        <asp:ListItem Value="--Select One--">--Select One--</asp:ListItem>
                        <asp:ListItem Value="M">Male</asp:ListItem>
                        <asp:ListItem Value="F">Female</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="styles9">
                    <asp:RequiredFieldValidator InitialValue="--Select One--" ID="RequiredFieldValidator6"
                        ControlToValidate="ddlGender" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="styles6">
                </td>
                <td class="styles7">
                    Marital Status<span class="styles10">*</span>
                </td>
                <td class="styles8" align="left">
                    <asp:DropDownList ID="ddlMarStat" runat="server" Width="153px">
                        <asp:ListItem Value="--Select One--">--Select One--</asp:ListItem>
                        <asp:ListItem Value="M">Married</asp:ListItem>
                        <asp:ListItem Value="S">Single</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="styles9">
                    <asp:RequiredFieldValidator InitialValue="--Select One--" ID="RequiredFieldValidator7"
                        ControlToValidate="ddlMarStat" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr style="height: 20px">
                <td>
                </td>
                <td align="left">
                    Date Of Birth<span class="styles10">*</span>
                </td>
                <td align="left" colspan="2">
                    <asp:TextBox ID="txtDob" runat="server"></asp:TextBox>
                    <cc1:CalendarExtender TargetControlID="txtDob" ID="CalendarExtender1" runat="server">
                    </cc1:CalendarExtender>
                </td>
                <td>
                    
                </td>
                <td align="right" style="text-align: left">
                   
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="styles6">
                </td>
                <td class="styles7">
                     Designation<span class="styles10">*</span>
                </td>
                <td align="left">
                <%--<asp:UpdatePanel runat="server" ID="UpdatePanel0" >
                
                <ContentTemplate >--%>
                    <asp:DropDownList ID="ddlDesg" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="ddlDesg_SelectedIndexChanged" Height="18px" 
                        Width="153px">                        
                    </asp:DropDownList>
                    <%--</ContentTemplate></asp:UpdatePanel>--%>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator InitialValue="--Select One--" ID="RequiredFieldValidator8"
                        ControlToValidate="ddlDesg" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
                <td style="text-align: right" class="style95">
                    
                </td>
                <td align="left">
               
                </td>
                <td align="left">
                </td>
            </tr>
            <tr>
                <td class="styles6">
                </td>
                <td class="styles7">
                    Department <span class="styles10">*</span>
                </td>
                <td align="left" class="styles13">
                 
                     <asp:DropDownList ID="ddlDept" runat="server" Height="16px" Width="153px" 
                        onselectedindexchanged="ddlDept_SelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem Value="--Select One--">--Select One--</asp:ListItem>
                    </asp:DropDownList>
              
                   
                </td>
                <td align="left" class="styles13">
                    <asp:RequiredFieldValidator InitialValue="--Select One--" ID="RequiredFieldValidator10"
                        ControlToValidate="ddlDept" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
                <td style="text-align: right" class="style96">
                   
                </td>
                <td align="left" class="styles13">
                   
                      </td>
                <td align="left" class="styles13">
                </td>
            </tr>
            <tr>
                <td class="styles6">
                </td>
                <td class="styles7">
                    Qualification <span class="styles10">*</span>
                </td>
                <td align="left" class="styles18">
                    
                    <asp:DropDownList ID="ddlQualification" runat="server" Height="16px" 
                        Width="153px">
                    <asp:ListItem Text="Select">--Select One--</asp:ListItem>    
                    <asp:ListItem Text="MS" >MS</asp:ListItem>
                    <asp:ListItem Text="MSc" >MSc</asp:ListItem>
                    <asp:ListItem Text="MTech">MTech</asp:ListItem>
                    <asp:ListItem Text="BSc">BSc</asp:ListItem>
                    <asp:ListItem Text="BCom">BCom</asp:ListItem>
                    <asp:ListItem Text="BTech">BTech</asp:ListItem>
                    <asp:ListItem Text="BE">BE</asp:ListItem>
                    <asp:ListItem Text="BBm">BBm</asp:ListItem>
                    </asp:DropDownList >
                    
                </td>
                <td align="left" class="styles18">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="ddlQualification"
                        ErrorMessage="*" InitialValue="--Select One--"></asp:RequiredFieldValidator>
                </td>
                <td style="text-align: right" class="style97">
                
                </td>
                <td align="right" class="styles18">
               
                </td>
                <td align="left" class="styles18">
                </td>
            </tr>
           
           
           
        </table></center>
        <br /><br />
    </fieldset>
    <br />
    <br />
    <fieldset style="border-style: none; border-color: inherit; border-width: 0; width: 700px; background-image: none;">
        <legend style="width: 770px; background-image: url('Images/linkbg.gif'); font-family: Verdana;
            font-size: 15px; font-weight: bold; background-color: #FFCC66;" 
            class="style99">Mailing & Contact Details</legend>
        <br />
        <br />
        <center>
        <table style="border: 1px dashed #FF0000; width: 775px; font-size: 10px; height: 344px; font-family: Verdana;" 
            >
            <tr>
                <td class="style86">
                </td>
                <td align="left">
                    Address Type <span class="style70">*</span>
                </td>
                <td align="left" class="style15">
                    <asp:DropDownList ID="ddlAddType" runat="server" ValidationGroup="a" 
                        Width="153px">
                        <asp:ListItem Value="--Select One--">--Select One--</asp:ListItem>
                        <asp:ListItem Value="Home">Home</asp:ListItem>
                        <asp:ListItem Value="Office">Office</asp:ListItem>
                        <asp:ListItem Value="Other">Other</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="style16" align="left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" InitialValue="--Select One--"
                        runat="server" ControlToValidate="ddlAddType" ErrorMessage="*" ValidationGroup="a"></asp:RequiredFieldValidator>
                </td>
                <td class="style90" align="left">
                </td>
                <td align="left" class="style76">
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td class="style89">
                </td>
                <td colspan="7" width="3px">
                </td>
            </tr>
            <tr>
                <td class="style88">
                </td>
                <td align="left" class="style77">
                    Door No <span class="style70">*</span>
                </td>
                <td align="left" class="style37">
                    <asp:TextBox ID="txtDNO" runat="server" ValidationGroup="a"></asp:TextBox>
                </td>
                <td class="style38" align="left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="txtDNO"
                        ErrorMessage="*" ValidationGroup="a"></asp:RequiredFieldValidator>
                </td>
                <td align="left" class="style90">
                    Street <span class="style70">*</span>
                </td>
                <td class="style76">
                    <asp:TextBox ID="txtStreet" runat="server" ValidationGroup="a"></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="rfvStreet" runat="server" ErrorMessage="*" ControlToValidate="txtStreet"
                        ValidationGroup="a"></asp:RequiredFieldValidator>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td class="style89">
                </td>
                <td colspan="7" width="3px">
                </td>
            </tr>
            <tr>
                <td class="style89">
                </td>
                <td align="left" class="style77">
                    City <span class="style70">*</span>
                </td>
                <td align="left" class="style15">
                    <asp:TextBox ID="txtCity" runat="server" onkeypress="return OnlyChars(event)" ValidationGroup="a"></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="txtCity"
                        ErrorMessage="*" ValidationGroup="a"></asp:RequiredFieldValidator>
                </td>
                <td align="left" class="style90">
                    Pin Code <span class="style70">*</span>
                </td>
                <td class="style76">
                    <asp:TextBox ID="txtPin" onkeypress="return onlyNumbers(event)" runat="server" ValidationGroup="a"></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ErrorMessage="*" ID="rfvPin" ControlToValidate="txtPin"
                        runat="server" ValidationGroup="a"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style89">
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
                <td class="style89">
                </td>
                <td align="left" class="style77">
                    State <span class="style70">*</span>
                </td>
                <td>
                    <asp:TextBox ID="txtState" onkeypress="return OnlyChars(event)" runat="server" ValidationGroup="a"></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator20" ControlToValidate="txtState"
                        runat="server" ErrorMessage="*" ValidationGroup="a"></asp:RequiredFieldValidator>
                </td>
                <td align="left" class="style90">
                    Country
                </td>
                <td class="style76">
                    <asp:TextBox ID="txtCountry" onkeypress="return OnlyChars(event)" runat="server"
                        ValidationGroup="a"></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ControlToValidate="txtCountry" ID="RequiredFieldValidator21"
                        runat="server" ErrorMessage="*" ValidationGroup="a"></asp:RequiredFieldValidator>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td class="style89">
                </td>
                <td colspan="5">
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td colspan="5" style="text-align: right; font-size: 8px; font-weight: bold; font-family: Verdana">
                    Add More Addreses one by one,you should have to submit minimum of oneaddress.<br />
                    Add Phone No button will enable After submission of your address only.
                </td>
                <td align="right">
                    <asp:ImageButton ID="imgBtnAddAddress" runat="server" Height="20px" Width="100px"
                        ImageUrl="~/Images/Add Address.jpg" ValidationGroup="a" OnClick="imgBtnAddAddress_Click" />
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td colspan="8">
                </td>
            </tr>
            <tr>
                <td class="style89">
                </td>
                <td colspan="7">
                    <asp:Label BackColor="Yellow" ID="lblAddressMsg" runat="server" 
                        ></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="5" style="text-align: right">
                    &nbsp;
                </td>
                <td colspan="3">
                </td>
            </tr>
            <tr>
                <td class="style88">
                </td>
                <td align="left" class="style77">
                    Phone Type <span class="style70">*</span>
                </td>
                <td align="left" class="style37">
                    <asp:DropDownList ID="ddlPhonetype" runat="server" ValidationGroup="p" 
                        Width="153px">
                        <asp:ListItem Value="--Select One--">--Select One--</asp:ListItem>
                        <asp:ListItem Value="Home">Home</asp:ListItem>
                        <asp:ListItem Value="Office">Office</asp:ListItem>
                        <asp:ListItem Value="Other">Other</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" InitialValue="--Select One--"
                        ControlToValidate="ddlPhonetype" ErrorMessage="*" ValidationGroup="p"></asp:RequiredFieldValidator>
                </td>
                <td align="left" class="style90">
                    Enter Phone No <span class="style70">*</span>
                </td>
                <td align="left" class="style76">
                    <asp:TextBox ID="txtPhoneNo" onkeypress="return onlyNumbershifen(event)" runat="server"
                        ValidationGroup="p"></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ErrorMessage="*"
                        ControlToValidate="txtPhoneNo" ValidationGroup="p"></asp:RequiredFieldValidator>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td class="style88">
                    &nbsp;
                </td>
                <td align="left" class="style77">
                    &nbsp;
                </td>
                <td align="left" class="style37">
                    &nbsp;
                </td>
                <td class="style38">
                    &nbsp;
                </td>
                <td class="style90">
                    &nbsp;
                </td>
                <td class="style76">
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style88">
                    &nbsp;
                </td>
                <td colspan="4" style="text-align: right; font-size: 8px; font-family: Verdana; font-weight: bold">
                    Add More Phone Numbers one by one,you have to submit minimum of one Phone
                    <br />
                    Number.Submit button will enable After submission of your Phone Number only.
                </td>
                <td align="right">
                    <asp:ImageButton ID="imgbtnAddPhoneNo" Enabled="false" runat="server" Height="20px"
                        Width="100px" ImageUrl="~/Images/Add Phone No.jpg" ValidationGroup="p" OnClick="imgbtnAddPhoneNo_Click" />
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td class="style88">
                    &nbsp;
                </td>
                <td colspan="5" align="left">
                    <asp:Label ID="lblPhonetype" BackColor="Yellow" runat="server" 
                        ></asp:Label>
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table></center>
        <br /><br />
    </fieldset>
    <br />
    <br />
    <fieldset style="border-style: none; border-width: 0; width: 700px; background-image: url('../../Images/newbackground.jpg');">
        <legend style="width: 770px; background-image: url('Images/linkbg.gif'); font-family: Verdana;
            font-size: 15px; font-weight: bold; background-color: #FFCC66;" 
            class="style99">Account Details</legend>
        <br />
        <br /><center>
        <table style="border: 1px dashed #FF0000; width: 775px; font-size: 10px; font-family: verdana;" 
            >
            <tr>
                <td class="style86">
                </td>
                <td align="left" class="style77">
                    User Name <span class="style70">*</span>
                </td>
                <td align="left" class="style15">
                    <asp:TextBox ID="txtUserName" runat="server" MaxLength="15"></asp:TextBox>
                </td>
                <td class="style16">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ControlToValidate="txtUserName"
                        ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
                <td class="style20" align="left">
                    <asp:Button ID="btnCheck" runat="server" Text="Check" OnClick="btnCheck_Click" CausesValidation="False"
                        Font-Bold="True" Font-Size="X-Small" />
                </td>
                <td colspan="3" align="left">
                    <asp:Label ID="lblAvail" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="10px"
                        ForeColor="Red" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style89">
                </td>
                <td colspan="7" width="3px">
                </td>
            </tr>
            <tr>
                <td class="style88">
                </td>
                <td align="left" class="style77">
                    Password <span class="style70">*</span>
                </td>
                <td align="left" class="style37">
                    <asp:TextBox ID="txtPwd" TextMode="Password" runat="server" MaxLength="16"></asp:TextBox>
                </td>
                <td class="style38">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ControlToValidate="txtPwd"
                        ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
                <td class="style33">
                </td>
                <td style="text-align: right" class="style91">
                    &nbsp;
                </td>
                <td align="left" style="text-align: left" class="style79">
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style89">
                </td>
                <td colspan="7" width="3px">
                </td>
            </tr>
            <tr>
                <td class="style89">
                </td>
                <td align="left" class="style81">
                    Confirm <span class="style70">*</span>
                </td>
                <td align="left" class="style15">
                    <asp:TextBox ID="txtConfirm" TextMode="Password" runat="server" MaxLength="16"></asp:TextBox>
                </td>
                <td class="style8">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ControlToValidate="txtConfirm"
                        ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
                <td style="text-align: left">
                    <asp:CompareValidator ID="CompareValidator1"  runat="server" ErrorMessage="Password Mismatch"
                        ControlToCompare="txtPwd" ControlToValidate="txtConfirm"></asp:CompareValidator>
                </td>
                <td style="text-align: right" class="style91">
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
                <td class="style89">
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
                <td class="style89">
                </td>
                <td style="text-align: left">
                    Security Question <span class="style70">*</span>
                </td>
                <td colspan="3" style="text-align: left">
                    <asp:DropDownList ID="ddlSecQues" runat="server" Font-Names="Verdana" Font-Size="10px">
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
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" ControlToValidate="ddlSecQues"
                        ErrorMessage="*" InitialValue="Select One"></asp:RequiredFieldValidator>
                </td>
                <td style="text-align: right" class="style91">
                    &nbsp;
                </td>
                <td class="style79">
                    &nbsp;
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td class="style89">
                </td>
                <td colspan="5">
                </td>
                <td class="style79">
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td class="style89">
                </td>
                <td style="text-align: left">
                    Security Answer <span class="style70">*</span>
                </td>
                <td colspan="3" style="text-align: left">
                    <asp:TextBox ID="txtSecAns" runat="server" Width="256px" MaxLength="100"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ErrorMessage="*"
                        ControlToValidate="txtSecAns"></asp:RequiredFieldValidator>
                </td>
                <td align="left" class="style91">
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
                <td colspan="8">
                </td>
            </tr>
            <tr>
                <td colspan="5" style="text-align: right">
                    For Submiting the Data first you need to Enter the above fields,After
                    <br />
                    submission of address and phone no submit button will be enabled
                </td>
                <td align="right">
                    <asp:ImageButton ID="btnSubmit" Enabled="false" runat="server" Width="100px" Height="20px"
                        ImageUrl="~/Images/btn_submit.jpg" OnClick="btnSubmit_Click" />
                </td>
                <td class="style79">
                </td>
                <td>
                </td>
            </tr>
        </table></center>
        <br /><br />
    </fieldset>
</center>
</ContentTemplate>
</asp:UpdatePanel> 