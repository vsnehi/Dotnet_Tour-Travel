

function OnlyChars(evt)
{
    var e = event || evt;
    var charCode = e.which || e.keyCode;
	if ((charCode > 64 && charCode < 91)||(charCode > 96 && charCode < 123) || charCode==32 || charCode==46)
    return true;		             
    else
    return false ;	
}
function onlyNumbers(evt)
{
    var e = event || evt;
    var charCode = e.which || e.keyCode;
	if (charCode > 47 && charCode < 58 || charCode==32)
	   return true;		             
    else
    return false ;		                            
}
function onlyNumbersdot(evt)
{
    var e = event || evt;
    var charCode = e.which || e.keyCode;
	if (charCode > 47 && charCode < 58 || charCode==46)
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
function onlyNumbersUnderScore(evt)
{
    var e = event || evt;
    var charCode = e.which || e.keyCode;
	if ((charCode > 47 && charCode < 58 || charCode==95))
    return true;		             
    else
    return false ;		                            
}  