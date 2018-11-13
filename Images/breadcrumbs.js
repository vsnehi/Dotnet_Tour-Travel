function breadcrumbs(){
    sURL = new String;
    bits = new Object;
    names = new Object;
    var x = 0;
    var stop = 0;
    var output = "&nbsp;<A HREF=\"/travel/\">Travel</A> | ";
    var skipLastBit = 0;

    sURL = location.href;
    if (sURL.substr(0,13) == 'http://author') sURL = sURL.slice(30,sURL.length);
    else sURL = sURL.slice(23,sURL.length);
    chunkStart = sURL.indexOf("/");
    sURL = sURL.slice(chunkStart+1,sURL.length)

    while(!stop){
      chunkStart = sURL.indexOf("/");
      if (chunkStart != -1) {
          bits[x] = sURL.slice(0,chunkStart)
          names[x] = bits[x];
          switch (bits[x]) {
            case 'Approval_Reimbursement':    names[x] = 'Approval/Reimbursement'; break;
            case 'Discounts':   names[x] = 'Discounts'; break;
            case 'ECT':   names[x] = 'Expedia Corporate Travel'; break;
            case 'General_Information':  names[x] = 'General Information'; break;
            case 'Lodging':    names[x] = 'Lodging'; break;
            case 'Publications':    names[x] = 'Publications'; break;
            case 'Quick_Links':      names[x] = 'Quick Links'; break;
            case 'Resources':        names[x] = 'Resources'; break;
            case 'Subsistence':     names[x] = 'Subsistence'; break;
            case 'Resources':  names[x] = 'Resources'; break;
            case 'Transportation': names[x] = 'Transportation'; break;
            case 'Air_Travel':      names[x] = 'Air Travel'; break;
            case 'Car':      names[x] = 'Car'; break;
            case 'Other':      names[x] = 'Other'; break;
            default:           names[x] = bits[x]; break;
          }
          sURL = sURL.slice(chunkStart+1,sURL.length);
          if (sURL=='index.html' || sURL=='Welcome.html' || sURL=='') skipLastBit=1;
          
      }else{
        stop = 1;
      }
      x++;
    }

    for(var i in bits){
      if (!skipLastBit || i!=x-2) {
        output += '<A HREF="';
        for (y = 1; y < x - i; y++){
          output += '..//';
        }
        output += bits[i] + '/">' + names[i] + '</A> | ';
      }
    }

    document.write(output + document.title);
}
