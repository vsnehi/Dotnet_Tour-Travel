function firstFocus() {
// Sets the focus to a designated control object. All templates name the search box,
// but some pages may also have a firstControl object that will override this.
// This function is called from the body onload event.

	try{document.getElementById('searchBox').focus();} catch(e) {}
	try{document.getElementById('firstControl').focus();} catch(e) {}
}

function FP_jumpMenu(el,frm,sel) {//v1.0
 var href=el.options[el.selectedIndex].value; if(sel) el.selectedIndex=0;
 if('_new'==frm) open(href); else eval(frm+".location='"+href+"'");
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_validateForm() { //v4.0
  var i,p,q,nm,test,num,min,max,errors='',args=MM_validateForm.arguments;
  for (i=0; i<(args.length-2); i+=3) { test=args[i+2]; val=MM_findObj(args[i]);
    if (val) { nm=val.name; if ((val=val.value)!="") {
      if (test.indexOf('isEmail')!=-1) { p=val.indexOf('@');
        if (p<1 || p==(val.length-1)) errors+='- '+nm+' must contain an e-mail address.\n';
      } else if (test!='R') { num = parseFloat(val);
        if (isNaN(val)) errors+='- '+nm+' must contain a number.\n';
        if (test.indexOf('inRange') != -1) { p=test.indexOf(':');
          min=test.substring(8,p); max=test.substring(p+1);
          if (num<min || max<num) errors+='- '+nm+' must contain a number between '+min+' and '+max+'.\n';
    } } } else if (test.charAt(0) == 'R') errors += '- '+nm+' is required.\n'; }
  } if (errors) alert('The following error(s) occurred:\n'+errors);
  document.MM_returnValue = (errors == '');
}

function MM_setTextOfTextfield(objName,x,newText) { //v3.0
  var obj = MM_findObj(objName); if (obj) obj.value = newText;
}


//To use the printSpecial function:
//	1. Add a div tag around the printable range of code:
// 		<div id=printReady>  PRINTABLE RANGE   </div>
//	2. Add a hyperlink with href="javascript:void(printSpecial())"

function printSpecial()
{
 var gAutoPrint = true;        // Flag for whether or not to automatically call the print function
 var showCustomTitle = true;   // Flag for whether or not to print a special title for printable view
 if (document.getElementById != null)
 {
  var html = '<html>\n<head>\n';
  if (document.getElementsByTagName != null)
  {
   var headTags = document.getElementsByTagName("head");
   if (headTags.length > 0) html += headTags[0].innerHTML;
  }
  html += '\n</he' + 'ad>\n<bo' + 'dy>\n';
  
  if (showCustomTitle)
  {
   html += '<table width=100% height=100% cellpadding=0 cellspacing=0 border=0>\n';
   html += ' <tr height=14 valign=top>\n';
   html += '  <td align=right><br>\n';
   html += '    </td>\n';
   html += ' </tr>\n';
   html += ' <tr height=* valign=top><td>\n\n';
  }

  var printReadyElem = document.getElementById('printReady');
  if (printReadyElem != null)
  {
   html += printReadyElem.innerHTML;
  }
  else
  {
   alert('Could not find the print ready section on this page.\nPlease use your browser\'s print function instead.');
   return;
  }

  if (showCustomTitle) {
    var d = new Date();
    var dateString = new String();
    dateString = (d.getMonth() * 1 + 1) + '/' + d.getDate() + '/' + d.getFullYear();
    html += '</td></tr>\n';
    html += '<tr><td class="smalltext">\n';
    html += '  <br><hr size=1 style=color:silver>\n';
    html += '  <a href="' + document.location + '">' + document.location + '</a><br>\n';
    html += 'Print Date: ' + dateString;
    html += '</td></tr>\n';
    html += '</table>';
  }
  html += '\n</BO' + 'DY>\n</HT' + 'ML>';

  var printWin = window.open('','printSpecial','location=yes, toolbar=yes, status=yes, menubar=yes, resizable=yes, scrollbars=yes, fullscreen=no');
  printWin.document.open();
  printWin.document.write(html);
  printWin.document.close();
  if (gAutoPrint) printWin.print();
 }
 else
 {
  alert('Sorry, the printable view feature is not available for this browser.\nPlease use your browser\'s print function instead.');
 }
}

