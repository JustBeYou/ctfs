<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>md5 Hash Generator</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/bootstrap-3.3.5/css/bootstrap.min.css">
<style type="text/css">
body { font-family: "Helvetica Neue", sans-serif; background-image: url("/images/groovepaper.png"); padding-top: 50px; padding-bottom: 30px; /* -webkit-font-smoothing: antialiased; -moz-osx-font-smoothing: grayscale; */ }
nav { background: #2c2c2c url("/images/lettuce_tile_dark.jpg") top left repeat; }
.navbar-inverse .navbar-nav > li > a { color: #d7d7d7; }
.navbar-inverse .navbar-brand { color: #cec; }
.navbar-inverse .navbar-nav > .active > a, .navbar-inverse .navbar-nav > .active > a:focus, .navbar-inverse .navbar-nav > .active > a:hover { background-color: rgba(0, 0, 0, 0.5); }
.container a { color: #693; }
.svg-icon { display: inline-block; width: 1em; height: 1em; fill: currentColor; }
.svg-icon-ul { padding-left: 0; margin-left: 2.14285714em; list-style-type: none; }
.svg-icon-ul > li { position: relative; }
.svg-icon-li { position: absolute; left: -2.14285714em; width: 2.14285714em; top: 0.14285714em; text-align:center; }
.svg-icon.spin { -webkit-animation: icon-spin 2s infinite linear; animation: icon-spin 2s infinite linear; }
@-webkit-keyframes icon-spin { 0% {-webkit-transform: rotate(0deg); transform: rotate(0deg); } 100% { -webkit-transform: rotate(359deg); transform: rotate(359deg); } }
@keyframes icon-spin { 0% { -webkit-transform: rotate(0deg); transform: rotate(0deg); } 100% { -webkit-transform: rotate(359deg); transform: rotate(359deg); } }
</style>
<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">
var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-53148-1']);
_gaq.push(['_trackPageview']);
_gaq.push(['_setSiteSpeedSampleRate', 50]);
(function() {
var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();
</script><meta property="og:title" content="MD5 Hash Generator">
<meta property="og:type" content="website">
<meta property="og:url" content="http://www.miraclesalad.com/webtools/md5.php">
<meta property="og:site_name" content="MiracleSalad">
<meta property="og:description" content="Compute the MD5 hash of a string.">
<link rel="canonical" href="http://www.miraclesalad.com/webtools/md5.php">
<style type="text/css">
#output { border-width: 0; background-color: transparent; font-family: monospace; font-size: 2em; width: 100%; height: 2.5em; -webkit-box-shadow: none; -moz-box-shadow: none; box-shadow: none; line-height: 1; }
#string { width: 100%; }
</style>
<script type="text/javascript">
/* MD5 (Message-Digest Algorithm) from http://www.webtoolkit.info/ */
var MD5=function(string){function RotateLeft(lValue,iShiftBits){return(lValue<<iShiftBits)|(lValue>>>(32-iShiftBits));}
function AddUnsigned(lX,lY){var lX4,lY4,lX8,lY8,lResult;lX8=(lX&0x80000000);lY8=(lY&0x80000000);lX4=(lX&0x40000000);lY4=(lY&0x40000000);lResult=(lX&0x3FFFFFFF)+(lY&0x3FFFFFFF);if(lX4&lY4){return(lResult^0x80000000^lX8^lY8);}
if(lX4|lY4){if(lResult&0x40000000){return(lResult^0xC0000000^lX8^lY8);}else{return(lResult^0x40000000^lX8^lY8);}}else{return(lResult^lX8^lY8);}}
function F(x,y,z){return(x&y)|((~x)&z);}
function G(x,y,z){return(x&z)|(y&(~z));}
function H(x,y,z){return(x^y^z);}
function I(x,y,z){return(y^(x|(~z)));}
function FF(a,b,c,d,x,s,ac){a=AddUnsigned(a,AddUnsigned(AddUnsigned(F(b,c,d),x),ac));return AddUnsigned(RotateLeft(a,s),b);};function GG(a,b,c,d,x,s,ac){a=AddUnsigned(a,AddUnsigned(AddUnsigned(G(b,c,d),x),ac));return AddUnsigned(RotateLeft(a,s),b);};function HH(a,b,c,d,x,s,ac){a=AddUnsigned(a,AddUnsigned(AddUnsigned(H(b,c,d),x),ac));return AddUnsigned(RotateLeft(a,s),b);};function II(a,b,c,d,x,s,ac){a=AddUnsigned(a,AddUnsigned(AddUnsigned(I(b,c,d),x),ac));return AddUnsigned(RotateLeft(a,s),b);};function ConvertToWordArray(string){var lWordCount;var lMessageLength=string.length;var lNumberOfWords_temp1=lMessageLength+8;var lNumberOfWords_temp2=(lNumberOfWords_temp1-(lNumberOfWords_temp1%64))/64;var lNumberOfWords=(lNumberOfWords_temp2+1)*16;var lWordArray=Array(lNumberOfWords-1);var lBytePosition=0;var lByteCount=0;while(lByteCount<lMessageLength){lWordCount=(lByteCount-(lByteCount%4))/4;lBytePosition=(lByteCount%4)*8;lWordArray[lWordCount]=(lWordArray[lWordCount]|(string.charCodeAt(lByteCount)<<lBytePosition));lByteCount++;}
lWordCount=(lByteCount-(lByteCount%4))/4;lBytePosition=(lByteCount%4)*8;lWordArray[lWordCount]=lWordArray[lWordCount]|(0x80<<lBytePosition);lWordArray[lNumberOfWords-2]=lMessageLength<<3;lWordArray[lNumberOfWords-1]=lMessageLength>>>29;return lWordArray;};function WordToHex(lValue){var WordToHexValue="",WordToHexValue_temp="",lByte,lCount;for(lCount=0;lCount<=3;lCount++){lByte=(lValue>>>(lCount*8))&255;WordToHexValue_temp="0"+lByte.toString(16);WordToHexValue=WordToHexValue+WordToHexValue_temp.substr(WordToHexValue_temp.length-2,2);}
return WordToHexValue;};function Utf8Encode(string){string=string.replace(/\r\n/g,"\n");var utftext="";for(var n=0;n<string.length;n++){var c=string.charCodeAt(n);if(c<128){utftext+=String.fromCharCode(c);}
else if((c>127)&&(c<2048)){utftext+=String.fromCharCode((c>>6)|192);utftext+=String.fromCharCode((c&63)|128);}
else{utftext+=String.fromCharCode((c>>12)|224);utftext+=String.fromCharCode(((c>>6)&63)|128);utftext+=String.fromCharCode((c&63)|128);}}
return utftext;};var x=Array();var k,AA,BB,CC,DD,a,b,c,d;var S11=7,S12=12,S13=17,S14=22;var S21=5,S22=9,S23=14,S24=20;var S31=4,S32=11,S33=16,S34=23;var S41=6,S42=10,S43=15,S44=21;string=Utf8Encode(string);x=ConvertToWordArray(string);a=0x67452301;b=0xEFCDAB89;c=0x98BADCFE;d=0x10325476;for(k=0;k<x.length;k+=16){AA=a;BB=b;CC=c;DD=d;a=FF(a,b,c,d,x[k+0],S11,0xD76AA478);d=FF(d,a,b,c,x[k+1],S12,0xE8C7B756);c=FF(c,d,a,b,x[k+2],S13,0x242070DB);b=FF(b,c,d,a,x[k+3],S14,0xC1BDCEEE);a=FF(a,b,c,d,x[k+4],S11,0xF57C0FAF);d=FF(d,a,b,c,x[k+5],S12,0x4787C62A);c=FF(c,d,a,b,x[k+6],S13,0xA8304613);b=FF(b,c,d,a,x[k+7],S14,0xFD469501);a=FF(a,b,c,d,x[k+8],S11,0x698098D8);d=FF(d,a,b,c,x[k+9],S12,0x8B44F7AF);c=FF(c,d,a,b,x[k+10],S13,0xFFFF5BB1);b=FF(b,c,d,a,x[k+11],S14,0x895CD7BE);a=FF(a,b,c,d,x[k+12],S11,0x6B901122);d=FF(d,a,b,c,x[k+13],S12,0xFD987193);c=FF(c,d,a,b,x[k+14],S13,0xA679438E);b=FF(b,c,d,a,x[k+15],S14,0x49B40821);a=GG(a,b,c,d,x[k+1],S21,0xF61E2562);d=GG(d,a,b,c,x[k+6],S22,0xC040B340);c=GG(c,d,a,b,x[k+11],S23,0x265E5A51);b=GG(b,c,d,a,x[k+0],S24,0xE9B6C7AA);a=GG(a,b,c,d,x[k+5],S21,0xD62F105D);d=GG(d,a,b,c,x[k+10],S22,0x2441453);c=GG(c,d,a,b,x[k+15],S23,0xD8A1E681);b=GG(b,c,d,a,x[k+4],S24,0xE7D3FBC8);a=GG(a,b,c,d,x[k+9],S21,0x21E1CDE6);d=GG(d,a,b,c,x[k+14],S22,0xC33707D6);c=GG(c,d,a,b,x[k+3],S23,0xF4D50D87);b=GG(b,c,d,a,x[k+8],S24,0x455A14ED);a=GG(a,b,c,d,x[k+13],S21,0xA9E3E905);d=GG(d,a,b,c,x[k+2],S22,0xFCEFA3F8);c=GG(c,d,a,b,x[k+7],S23,0x676F02D9);b=GG(b,c,d,a,x[k+12],S24,0x8D2A4C8A);a=HH(a,b,c,d,x[k+5],S31,0xFFFA3942);d=HH(d,a,b,c,x[k+8],S32,0x8771F681);c=HH(c,d,a,b,x[k+11],S33,0x6D9D6122);b=HH(b,c,d,a,x[k+14],S34,0xFDE5380C);a=HH(a,b,c,d,x[k+1],S31,0xA4BEEA44);d=HH(d,a,b,c,x[k+4],S32,0x4BDECFA9);c=HH(c,d,a,b,x[k+7],S33,0xF6BB4B60);b=HH(b,c,d,a,x[k+10],S34,0xBEBFBC70);a=HH(a,b,c,d,x[k+13],S31,0x289B7EC6);d=HH(d,a,b,c,x[k+0],S32,0xEAA127FA);c=HH(c,d,a,b,x[k+3],S33,0xD4EF3085);b=HH(b,c,d,a,x[k+6],S34,0x4881D05);a=HH(a,b,c,d,x[k+9],S31,0xD9D4D039);d=HH(d,a,b,c,x[k+12],S32,0xE6DB99E5);c=HH(c,d,a,b,x[k+15],S33,0x1FA27CF8);b=HH(b,c,d,a,x[k+2],S34,0xC4AC5665);a=II(a,b,c,d,x[k+0],S41,0xF4292244);d=II(d,a,b,c,x[k+7],S42,0x432AFF97);c=II(c,d,a,b,x[k+14],S43,0xAB9423A7);b=II(b,c,d,a,x[k+5],S44,0xFC93A039);a=II(a,b,c,d,x[k+12],S41,0x655B59C3);d=II(d,a,b,c,x[k+3],S42,0x8F0CCC92);c=II(c,d,a,b,x[k+10],S43,0xFFEFF47D);b=II(b,c,d,a,x[k+1],S44,0x85845DD1);a=II(a,b,c,d,x[k+8],S41,0x6FA87E4F);d=II(d,a,b,c,x[k+15],S42,0xFE2CE6E0);c=II(c,d,a,b,x[k+6],S43,0xA3014314);b=II(b,c,d,a,x[k+13],S44,0x4E0811A1);a=II(a,b,c,d,x[k+4],S41,0xF7537E82);d=II(d,a,b,c,x[k+11],S42,0xBD3AF235);c=II(c,d,a,b,x[k+2],S43,0x2AD7D2BB);b=II(b,c,d,a,x[k+9],S44,0xEB86D391);a=AddUnsigned(a,AA);b=AddUnsigned(b,BB);c=AddUnsigned(c,CC);d=AddUnsigned(d,DD);}
var temp=WordToHex(a)+WordToHex(b)+WordToHex(c)+WordToHex(d);return temp.toLowerCase();}
</script>
</head>
<body data-here="md5">
<nav class="navbar navbar-fixed-top navbar-inverse">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a href="/" class="navbar-brand">Miracle Salad</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li><a href="/"><svg width="1em" height="1em" viewBox="0 0 64 64" class="svg-icon fa-home" title="" role="img" xmlns="http://www.w3.org/2000/svg"><path d="M54.2,35.7v18.5c0,0.7-0.2,1.2-0.7,1.7s-1.1,0.7-1.7,0.7H36.9V41.9h-9.8v14.8H12.3c-0.7,0-1.2-0.2-1.7-0.7s-0.7-1.1-0.7-1.7 V35.7c0,0,0-0.1,0-0.1c0-0.1,0-0.1,0-0.1L32,17.3l22.1,18.2C54.1,35.6,54.2,35.6,54.2,35.7z M62.7,33.1l-2.4,2.8 c-0.2,0.2-0.5,0.4-0.8,0.4h-0.1c-0.3,0-0.6-0.1-0.8-0.3L32,13.9L5.4,36.1c-0.3,0.2-0.6,0.3-0.9,0.3c-0.3-0.1-0.6-0.2-0.8-0.4 l-2.4-2.8C1.1,32.8,1,32.5,1,32.2c0-0.3,0.2-0.6,0.4-0.8l27.7-23c0.8-0.7,1.8-1,2.9-1s2.1,0.3,2.9,1l9.4,7.8V8.7 c0-0.4,0.1-0.7,0.3-0.9c0.2-0.2,0.5-0.3,0.9-0.3h7.4c0.4,0,0.7,0.1,0.9,0.3C54,8,54.2,8.3,54.2,8.7v15.7l8.4,7 c0.3,0.2,0.4,0.5,0.4,0.8C63,32.5,62.9,32.8,62.7,33.1z"/></svg> Home</a></li>
				<li class="dropdown active">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><svg width="1em" height="1em" viewBox="0 0 64 64" class="svg-icon fa-suitcase" title="" role="img" xmlns="http://www.w3.org/2000/svg"><path d="M23.1,14.3h17.7V9.9H23.1V14.3z M11,14.3v44.3H8.8c-2.1,0-3.9-0.8-5.5-2.3C1.8,54.8,1,52.9,1,50.8V22c0-2.1,0.8-3.9,2.3-5.5 s3.3-2.3,5.5-2.3H11z M49.7,14.3v44.3H14.3V14.3h4.4V8.8c0-0.9,0.3-1.7,1-2.4s1.4-1,2.4-1H42c0.9,0,1.7,0.3,2.4,1s1,1.4,1,2.4v5.5 H49.7z M63,22v28.8c0,2.1-0.8,3.9-2.3,5.5c-1.5,1.5-3.3,2.3-5.5,2.3H53V14.3h2.2c2.1,0,3.9,0.8,5.5,2.3C62.2,18.1,63,19.9,63,22z"/></svg> Apps <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="/webtools/timesheet.php"><svg width="1em" height="1em" viewBox="0 0 64 64" class="svg-icon fa-clock-o" title="" role="img" xmlns="http://www.w3.org/2000/svg"><path d="M37.2,17.8v18.1c0,0.4-0.1,0.7-0.4,0.9s-0.6,0.4-0.9,0.4H23c-0.4,0-0.7-0.1-0.9-0.4s-0.4-0.6-0.4-0.9v-2.6 c0-0.4,0.1-0.7,0.4-0.9S22.6,32,23,32h9V17.8c0-0.4,0.1-0.7,0.4-0.9s0.6-0.4,0.9-0.4h2.6c0.4,0,0.7,0.1,0.9,0.4S37.2,17.4,37.2,17.8 z M54,32c0-4-1-7.7-2.9-11s-4.6-6-8-8S36,10,32,10s-7.7,1-11,2.9s-6,4.6-8,8S10,28,10,32s1,7.7,2.9,11s4.6,6,8,8S28,54,32,54 s7.7-1,11-2.9s6-4.6,8-8S54,36,54,32z M63,32c0,5.6-1.4,10.8-4.2,15.6c-2.8,4.7-6.5,8.5-11.3,11.3C42.8,61.6,37.6,63,32,63 s-10.8-1.4-15.6-4.2c-4.7-2.8-8.5-6.5-11.3-11.3S1,37.6,1,32s1.4-10.8,4.2-15.6s6.5-8.5,11.3-11.3S26.4,1,32,1s10.8,1.4,15.6,4.2 s8.5,6.5,11.3,11.3C61.6,21.2,63,26.4,63,32z"/></svg> Time Sheet Calculator</a></li>
                        <li><a href="/webtools/base64.php"><svg width="1em" height="1em" viewBox="0 0 64 64" class="svg-icon fa-code" title="" role="img" xmlns="http://www.w3.org/2000/svg"><path d="M20.4,46.9l-1.7,1.7c-0.2,0.2-0.5,0.3-0.8,0.3c-0.3,0-0.6-0.1-0.8-0.3L1.3,32.8C1.1,32.6,1,32.3,1,32s0.1-0.6,0.3-0.8 l15.8-15.8c0.2-0.2,0.5-0.3,0.8-0.3c0.3,0,0.6,0.1,0.8,0.3l1.7,1.7c0.2,0.2,0.3,0.5,0.3,0.8c0,0.3-0.1,0.6-0.3,0.8L7.1,32l13.3,13.3 c0.2,0.2,0.3,0.5,0.3,0.8C20.7,46.4,20.6,46.6,20.4,46.9z M40.4,10.7L27.8,54.5c-0.1,0.3-0.3,0.5-0.5,0.7c-0.3,0.1-0.5,0.2-0.8,0.1 l-2.1-0.6c-0.3-0.1-0.5-0.3-0.7-0.5c-0.1-0.3-0.2-0.5-0.1-0.8L36.2,9.5c0.1-0.3,0.3-0.5,0.5-0.7s0.5-0.2,0.8-0.1l2.1,0.6 c0.3,0.1,0.5,0.3,0.7,0.5S40.5,10.4,40.4,10.7z M62.7,32.8L46.9,48.6c-0.2,0.2-0.5,0.3-0.8,0.3c-0.3,0-0.6-0.1-0.8-0.3l-1.7-1.7 c-0.2-0.2-0.3-0.5-0.3-0.8c0-0.3,0.1-0.6,0.3-0.8L56.9,32L43.6,18.7c-0.2-0.2-0.3-0.5-0.3-0.8c0-0.3,0.1-0.6,0.3-0.8l1.7-1.7 c0.2-0.2,0.5-0.3,0.8-0.3c0.3,0,0.6,0.1,0.8,0.3l15.8,15.8c0.2,0.2,0.3,0.5,0.3,0.8S62.9,32.6,62.7,32.8z"/></svg> Base64 Converter</a></li>
						<li><a href="/webtools/holidays.php"><svg width="1em" height="1em" viewBox="0 0 64 64" class="svg-icon fa-calendar" title="" role="img" xmlns="http://www.w3.org/2000/svg"><path d="M7.6,58.6h10v-10h-10V58.6z M19.8,58.6h11.1v-10H19.8V58.6z M7.6,46.4h10V35.3h-10V46.4z M19.8,46.4h11.1V35.3H19.8V46.4z M7.6,33.1h10v-10h-10V33.1z M33.1,58.6h11.1v-10H33.1V58.6z M19.8,33.1h11.1v-10H19.8V33.1z M46.4,58.6h10v-10h-10V58.6z M33.1,46.4h11.1V35.3H33.1V46.4z M20.9,16.5v-10c0-0.3-0.1-0.6-0.3-0.8c-0.2-0.2-0.5-0.3-0.8-0.3h-2.2c-0.3,0-0.6,0.1-0.8,0.3 c-0.2,0.2-0.3,0.5-0.3,0.8v10c0,0.3,0.1,0.6,0.3,0.8c0.2,0.2,0.5,0.3,0.8,0.3h2.2c0.3,0,0.6-0.1,0.8-0.3 C20.8,17.1,20.9,16.8,20.9,16.5z M46.4,46.4h10V35.3h-10V46.4z M33.1,33.1h11.1v-10H33.1V33.1z M46.4,33.1h10v-10h-10V33.1z M47.5,16.5v-10c0-0.3-0.1-0.6-0.3-0.8s-0.5-0.3-0.8-0.3h-2.2c-0.3,0-0.6,0.1-0.8,0.3s-0.3,0.5-0.3,0.8v10c0,0.3,0.1,0.6,0.3,0.8 s0.5,0.3,0.8,0.3h2.2c0.3,0,0.6-0.1,0.8-0.3S47.5,16.8,47.5,16.5z M60.8,14.3v44.3c0,1.2-0.4,2.2-1.3,3.1c-0.9,0.9-1.9,1.3-3.1,1.3 H7.6c-1.2,0-2.2-0.4-3.1-1.3c-0.9-0.9-1.3-1.9-1.3-3.1V14.3c0-1.2,0.4-2.2,1.3-3.1s1.9-1.3,3.1-1.3h4.4V6.5c0-1.5,0.5-2.8,1.6-3.9 S16.1,1,17.6,1h2.2c1.5,0,2.8,0.5,3.9,1.6c1.1,1.1,1.6,2.4,1.6,3.9v3.3h13.3V6.5c0-1.5,0.5-2.8,1.6-3.9C41.4,1.5,42.7,1,44.2,1h2.2 c1.5,0,2.8,0.5,3.9,1.6s1.6,2.4,1.6,3.9v3.3h4.4c1.2,0,2.2,0.4,3.1,1.3C60.3,12,60.8,13.1,60.8,14.3z"/></svg> Hawaii State Holidays</a></li>
						<li><a href="/webtools/hexadecimal-decimal.php"><svg width="1em" height="1em" viewBox="0 0 64 64" class="svg-icon fa-random" title="" role="img" xmlns="http://www.w3.org/2000/svg"><path d="M24,19.9c-1.4,2.1-3,5.3-4.7,9.4c-0.5-1-0.9-1.9-1.3-2.5s-0.8-1.4-1.4-2.2c-0.6-0.8-1.2-1.5-1.8-2c-0.6-0.5-1.3-0.9-2.2-1.2 c-0.9-0.3-1.8-0.5-2.8-0.5H2.1c-0.3,0-0.6-0.1-0.8-0.3S1,20.1,1,19.8v-6.6c0-0.3,0.1-0.6,0.3-0.8s0.5-0.3,0.8-0.3h7.7 C15.6,12.1,20.4,14.7,24,19.9z M63,47.5c0,0.3-0.1,0.6-0.3,0.8L51.6,59.4c-0.2,0.2-0.5,0.3-0.8,0.3c-0.3,0-0.6-0.1-0.8-0.3 s-0.3-0.5-0.3-0.8v-6.6c-0.7,0-1.7,0-2.9,0c-1.2,0-2.2,0-2.8,0s-1.5,0-2.5,0c-1,0-1.9-0.1-2.5-0.2c-0.6-0.1-1.3-0.2-2.2-0.4 s-1.6-0.4-2.2-0.6c-0.6-0.3-1.2-0.6-2-1c-0.8-0.4-1.4-0.9-2-1.4c-0.6-0.5-1.2-1.1-1.9-1.9c-0.7-0.7-1.3-1.5-1.9-2.4 c1.4-2.1,2.9-5.3,4.7-9.4c0.5,1,0.9,1.9,1.3,2.5s0.8,1.4,1.4,2.2s1.2,1.5,1.8,2c0.6,0.5,1.3,0.9,2.2,1.2c0.9,0.3,1.8,0.5,2.8,0.5 h8.9v-6.6c0-0.3,0.1-0.6,0.3-0.8s0.5-0.3,0.8-0.3c0.3,0,0.6,0.1,0.8,0.3l11,11C62.9,46.9,63,47.2,63,47.5z M63,16.5 c0,0.3-0.1,0.6-0.3,0.8L51.6,28.4c-0.2,0.2-0.5,0.3-0.8,0.3c-0.3,0-0.6-0.1-0.8-0.3c-0.2-0.2-0.3-0.5-0.3-0.8v-6.6h-8.9 c-1.1,0-2.1,0.2-3,0.5c-0.9,0.3-1.7,0.9-2.4,1.6c-0.7,0.7-1.3,1.4-1.8,2.1s-1,1.6-1.6,2.7c-0.7,1.4-1.6,3.4-2.7,5.9 c-0.7,1.5-1.2,2.8-1.7,3.8c-0.5,1-1.1,2.2-1.9,3.6c-0.8,1.4-1.5,2.5-2.2,3.5c-0.7,0.9-1.6,1.9-2.6,2.9c-1,1-2,1.8-3.1,2.4 c-1.1,0.6-2.3,1.1-3.7,1.5s-2.9,0.6-4.4,0.6H2.1c-0.3,0-0.6-0.1-0.8-0.3S1,51.1,1,50.8v-6.6c0-0.3,0.1-0.6,0.3-0.8s0.5-0.3,0.8-0.3 h7.7c1.1,0,2.1-0.2,3-0.5s1.7-0.9,2.4-1.6c0.7-0.7,1.3-1.4,1.8-2.1s1-1.6,1.6-2.7c0.7-1.4,1.6-3.4,2.7-5.9c0.7-1.5,1.2-2.8,1.7-3.8 s1.1-2.2,1.9-3.6s1.5-2.5,2.2-3.5c0.7-0.9,1.6-1.9,2.6-2.9c1-1,2-1.8,3.1-2.4c1.1-0.6,2.3-1.1,3.7-1.5c1.4-0.4,2.9-0.6,4.4-0.6h8.9 V5.4c0-0.3,0.1-0.6,0.3-0.8s0.5-0.3,0.8-0.3c0.3,0,0.6,0.1,0.8,0.3l11,11C62.9,15.9,63,16.2,63,16.5z"/></svg> Hex/Dec Converter</a></li>
						<li class="active"><a href="/webtools/md5.php"><svg width="1em" height="1em" viewBox="0 0 64 64" class="svg-icon fa-barcode" title="" role="img" xmlns="http://www.w3.org/2000/svg"><path d="M3.2,56.4H1V7.6h2.2V56.4z M5.4,56.3H4.3V7.6h1.1V56.3z M8.6,56.3H7.5V7.6h1.1V56.3z M14,56.3H13V7.6H14V56.3z M19.5,56.3 h-2.1V7.6h2.1V56.3z M23.8,56.3h-1.1V7.6h1.1V56.3z M26,56.3h-1.1V7.6H26V56.3z M28.2,56.3h-1.1V7.6h1.1V56.3z M33.6,56.3h-2.2V7.6 h2.2V56.3z M39.1,56.3h-2.2V7.6h2.2V56.3z M43.4,56.3h-2.2V7.6h2.2V56.3z M47.8,56.3h-2.2V7.6h2.2V56.3z M51,56.3h-2.2V7.6H51V56.3z M57.6,56.3h-3.3V7.6h3.3V56.3z M59.7,56.3h-1.1V7.6h1.1V56.3z M63,56.4h-2.2V7.6H63V56.4z"/></svg> md5 Hash Generator</a></li>
						<li><a href="/webtools/random.php"><svg width="1em" height="1em" viewBox="0 0 64 64" class="svg-icon fa-qrcode" title="" role="img" xmlns="http://www.w3.org/2000/svg"><path d="M17.9,46.1v5.6h-5.6v-5.6H17.9z M17.9,12.3v5.6h-5.6v-5.6H17.9z M51.7,12.3v5.6h-5.6v-5.6H51.7z M6.6,57.3h16.9V40.5H6.6 V57.3z M6.6,23.5h16.9V6.6H6.6V23.5z M40.5,23.5h16.9V6.6H40.5V23.5z M29.2,34.8V63H1V34.8H29.2z M51.7,57.4V63h-5.6v-5.6H51.7z M63,57.4V63h-5.6v-5.6H63z M63,34.8v16.9H46.1v-5.6h-5.6V63h-5.6V34.8h16.9v5.6h5.6v-5.6H63z M29.2,1v28.2H1V1H29.2z M63,1v28.2 H34.8V1H63z"/></svg> Random Number Generator</a></li>
                        <li><a href="/webtools/sha1.php"><svg width="1em" height="1em" viewBox="0 0 64 64" class="svg-icon fa-barcode" title="" role="img" xmlns="http://www.w3.org/2000/svg"><path d="M3.2,56.4H1V7.6h2.2V56.4z M5.4,56.3H4.3V7.6h1.1V56.3z M8.6,56.3H7.5V7.6h1.1V56.3z M14,56.3H13V7.6H14V56.3z M19.5,56.3 h-2.1V7.6h2.1V56.3z M23.8,56.3h-1.1V7.6h1.1V56.3z M26,56.3h-1.1V7.6H26V56.3z M28.2,56.3h-1.1V7.6h1.1V56.3z M33.6,56.3h-2.2V7.6 h2.2V56.3z M39.1,56.3h-2.2V7.6h2.2V56.3z M43.4,56.3h-2.2V7.6h2.2V56.3z M47.8,56.3h-2.2V7.6h2.2V56.3z M51,56.3h-2.2V7.6H51V56.3z M57.6,56.3h-3.3V7.6h3.3V56.3z M59.7,56.3h-1.1V7.6h1.1V56.3z M63,56.4h-2.2V7.6H63V56.4z"/></svg> sha-1 Hash Generator</a></li>
						<li><a href="/webtools/sha256.php"><svg width="1em" height="1em" viewBox="0 0 64 64" class="svg-icon fa-barcode" title="" role="img" xmlns="http://www.w3.org/2000/svg"><path d="M3.2,56.4H1V7.6h2.2V56.4z M5.4,56.3H4.3V7.6h1.1V56.3z M8.6,56.3H7.5V7.6h1.1V56.3z M14,56.3H13V7.6H14V56.3z M19.5,56.3 h-2.1V7.6h2.1V56.3z M23.8,56.3h-1.1V7.6h1.1V56.3z M26,56.3h-1.1V7.6H26V56.3z M28.2,56.3h-1.1V7.6h1.1V56.3z M33.6,56.3h-2.2V7.6 h2.2V56.3z M39.1,56.3h-2.2V7.6h2.2V56.3z M43.4,56.3h-2.2V7.6h2.2V56.3z M47.8,56.3h-2.2V7.6h2.2V56.3z M51,56.3h-2.2V7.6H51V56.3z M57.6,56.3h-3.3V7.6h3.3V56.3z M59.7,56.3h-1.1V7.6h1.1V56.3z M63,56.4h-2.2V7.6H63V56.4z"/></svg> sha-256 Hash Generator</a></li>
						<li><a href="/whatthecolor.php"><svg width="1em" height="1em" viewBox="0 0 64 64" class="svg-icon fa-check-circle" title="" role="img" xmlns="http://www.w3.org/2000/svg"><path d="M52.8,25.5c0-0.8-0.2-1.4-0.7-1.9L48.4,20c-0.5-0.5-1.1-0.8-1.8-0.8c-0.7,0-1.3,0.3-1.8,0.8L28.3,36.4l-9.1-9.1 c-0.5-0.5-1.1-0.8-1.8-0.8s-1.3,0.3-1.8,0.8l-3.7,3.6c-0.5,0.5-0.7,1.1-0.7,1.9c0,0.7,0.2,1.3,0.7,1.8l14.6,14.6 c0.5,0.5,1.1,0.8,1.8,0.8c0.7,0,1.3-0.3,1.9-0.8l21.9-21.9C52.6,26.8,52.8,26.2,52.8,25.5z M63,32c0,5.6-1.4,10.8-4.2,15.6 c-2.8,4.7-6.5,8.5-11.3,11.3C42.8,61.6,37.6,63,32,63s-10.8-1.4-15.6-4.2c-4.7-2.8-8.5-6.5-11.3-11.3S1,37.6,1,32s1.4-10.8,4.2-15.6 s6.5-8.5,11.3-11.3S26.4,1,32,1s10.8,1.4,15.6,4.2s8.5,6.5,11.3,11.3C61.6,21.2,63,26.4,63,32z"/></svg> What the Color? Game</a></li>
					</ul>
				</li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><svg width="1em" height="1em" viewBox="0 0 64 64" class="svg-icon fa-cogs" title="" role="img" xmlns="http://www.w3.org/2000/svg"><path d="M30,32c0-2.3-0.8-4.3-2.4-5.8c-1.6-1.6-3.6-2.4-5.8-2.4s-4.3,0.8-5.8,2.4c-1.6,1.6-2.4,3.6-2.4,5.8s0.8,4.3,2.4,5.8 c1.6,1.5,3.6,2.4,5.8,2.4s4.3-0.8,5.8-2.4C29.1,36.2,30,34.2,30,32z M54.8,48.5c0-1.2-0.4-2.1-1.3-2.9c-0.8-0.8-1.7-1.3-2.9-1.3 c-1.2,0-2.1,0.4-2.9,1.3c-0.8,0.8-1.3,1.7-1.3,2.9c0,1.2,0.4,2.1,1.2,2.9c0.8,0.8,1.7,1.2,2.9,1.2c1.2,0,2.1-0.4,2.9-1.2 C54.3,50.6,54.8,49.6,54.8,48.5z M54.8,15.4c0-1.2-0.4-2.1-1.3-2.9c-0.8-0.8-1.7-1.3-2.9-1.3c-1.2,0-2.1,0.4-2.9,1.3 c-0.8,0.8-1.3,1.7-1.3,2.9c0,1.2,0.4,2.1,1.2,2.9c0.8,0.8,1.7,1.2,2.9,1.2c1.2,0,2.1-0.4,2.9-1.2C54.3,17.6,54.8,16.6,54.8,15.4z M42.4,29.1v6c0,0.2-0.1,0.4-0.2,0.7c-0.2,0.2-0.3,0.3-0.5,0.3l-5,0.8c-0.2,0.8-0.6,1.5-1.1,2.4c0.8,1.1,1.7,2.2,2.9,3.7 c0.2,0.2,0.2,0.4,0.2,0.7c0,0.3-0.1,0.5-0.2,0.6c-0.5,0.7-1.4,1.6-2.7,2.9c-1.3,1.3-2.1,1.9-2.5,1.9c-0.2,0-0.5-0.1-0.7-0.2 l-3.7-2.9c-0.8,0.4-1.6,0.8-2.5,1c-0.2,2.3-0.5,4-0.8,5c-0.2,0.5-0.5,0.8-1,0.8h-6c-0.2,0-0.5-0.1-0.7-0.2c-0.2-0.2-0.3-0.4-0.3-0.6 L16.9,47c-0.8-0.2-1.6-0.6-2.4-1L10.7,49c-0.2,0.2-0.4,0.2-0.7,0.2c-0.2,0-0.5-0.1-0.7-0.3c-3.1-2.9-4.7-4.6-4.7-5.1 c0-0.2,0.1-0.4,0.2-0.6c0.2-0.3,0.7-0.9,1.4-1.7c0.7-0.9,1.2-1.5,1.6-1.9c-0.5-1-0.9-1.8-1.2-2.6l-4.8-1c-0.2,0-0.4-0.1-0.6-0.3 C1.1,35.4,1,35.2,1,34.9v-6c0-0.2,0.1-0.4,0.2-0.6c0.2-0.2,0.3-0.3,0.5-0.4l5-0.8c0.2-0.8,0.6-1.5,1.1-2.4C7,23.7,6,22.5,4.9,21.1 c-0.2-0.2-0.2-0.5-0.2-0.7c0-0.3,0.1-0.5,0.2-0.7C5.4,19,6.2,18,7.5,16.8s2.1-1.9,2.5-1.9c0.2,0,0.5,0.1,0.7,0.2l3.7,2.9 c0.8-0.4,1.6-0.8,2.5-1.1c0.2-2.3,0.5-4,0.8-4.9c0.2-0.5,0.5-0.8,1-0.8h6c0.2,0,0.5,0.1,0.7,0.2c0.2,0.2,0.3,0.4,0.3,0.6l0.8,4.9 c0.8,0.2,1.6,0.6,2.4,1l3.8-2.9c0.2-0.2,0.4-0.2,0.7-0.2c0.2,0,0.5,0.1,0.7,0.3c3.1,2.9,4.6,4.6,4.6,5.1c0,0.2-0.1,0.4-0.2,0.6 c-0.3,0.4-0.7,1-1.4,1.7c-0.7,0.8-1.2,1.5-1.5,1.9c0.5,1.1,0.9,1.9,1.1,2.6l4.9,0.8c0.2,0,0.4,0.2,0.6,0.3 C42.3,28.6,42.4,28.8,42.4,29.1z M63,46.2v4.6c0,0.4-1.6,0.7-4.8,1c-0.3,0.6-0.6,1.2-1,1.6c1.1,2.4,1.6,3.9,1.6,4.5 c0,0.1,0,0.2-0.1,0.2c-2.6,1.5-4,2.3-4,2.3c-0.2,0-0.7-0.5-1.5-1.5c-0.8-1-1.4-1.7-1.6-2.2c-0.4,0-0.8,0.1-1,0.1c-0.2,0-0.6,0-1-0.1 c-0.3,0.5-0.9,1.2-1.6,2.2c-0.8,1-1.4,1.5-1.5,1.5c0,0-1.4-0.8-4-2.3c-0.1-0.1-0.1-0.1-0.1-0.2c0-0.6,0.6-2,1.6-4.5 c-0.4-0.6-0.7-1.1-1-1.6c-3.2-0.3-4.8-0.7-4.8-1v-4.6c0-0.4,1.6-0.7,4.8-1c0.3-0.6,0.6-1.2,1-1.6c-1.1-2.4-1.6-3.9-1.6-4.5 c0-0.1,0-0.2,0.1-0.2s0.5-0.3,1.2-0.7c0.7-0.4,1.3-0.8,1.9-1.1c0.6-0.4,1-0.5,1-0.5c0.2,0,0.7,0.5,1.5,1.5c0.8,1,1.4,1.7,1.6,2.1 c0.4,0,0.8-0.1,1-0.1c0.2,0,0.6,0,1,0.1c1.1-1.5,2.1-2.7,3-3.6l0.2-0.1c0.1,0,1.5,0.8,4,2.2C59,39,59,39,59,39.1 c0,0.6-0.6,2-1.6,4.5c0.4,0.5,0.7,1.1,1,1.6C61.4,45.6,63,46,63,46.2z M63,13.2v4.6c0,0.4-1.6,0.7-4.8,1c-0.3,0.6-0.6,1.2-1,1.6 c1.1,2.4,1.6,3.9,1.6,4.5c0,0.1,0,0.2-0.1,0.2c-2.6,1.6-4,2.3-4,2.3c-0.2,0-0.7-0.5-1.5-1.5c-0.8-1-1.4-1.7-1.6-2.2 c-0.4,0-0.8,0.1-1,0.1c-0.2,0-0.6,0-1-0.1c-0.3,0.5-0.9,1.2-1.6,2.2c-0.8,1-1.4,1.5-1.5,1.5c0,0-1.4-0.8-4-2.3 c-0.1-0.1-0.1-0.1-0.1-0.2c0-0.6,0.6-2,1.6-4.5c-0.4-0.6-0.7-1.1-1-1.6c-3.2-0.3-4.8-0.7-4.8-1v-4.6c0-0.4,1.6-0.7,4.8-1 c0.3-0.6,0.6-1.2,1-1.6c-1.1-2.4-1.6-3.9-1.6-4.5c0-0.1,0-0.2,0.1-0.2s0.5-0.3,1.2-0.7c0.7-0.4,1.3-0.8,1.9-1.1c0.6-0.4,1-0.5,1-0.5 c0.2,0,0.7,0.5,1.5,1.5c0.8,1,1.4,1.7,1.6,2.1c0.4,0,0.8-0.1,1-0.1c0.2,0,0.6,0,1,0.1c1.1-1.6,2.1-2.7,3-3.6L55,3.6 c0.1,0,1.5,0.8,4,2.2C59,5.9,59,5.9,59,6c0,0.6-0.6,2-1.6,4.5c0.4,0.5,0.7,1.1,1,1.6C61.4,12.5,63,12.8,63,13.2z"/></svg> Web Tools <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="/webtools/bit-calculator.php"><svg width="1em" height="1em" viewBox="0 0 64 64" class="svg-icon fa-calculator" title="" role="img" xmlns="http://www.w3.org/2000/svg"><path d="M16.5,54.1c0-1.2-0.4-2.3-1.3-3.1c-0.9-0.9-1.9-1.3-3.1-1.3c-1.2,0-2.3,0.4-3.1,1.3c-0.9,0.9-1.3,1.9-1.3,3.1 c0,1.2,0.4,2.3,1.3,3.1c0.9,0.9,1.9,1.3,3.1,1.3c1.2,0,2.3-0.4,3.1-1.3C16.1,56.4,16.5,55.4,16.5,54.1z M29.8,54.1 c0-1.2-0.4-2.3-1.3-3.1s-1.9-1.3-3.1-1.3s-2.3,0.4-3.1,1.3c-0.9,0.9-1.3,1.9-1.3,3.1c0,1.2,0.4,2.3,1.3,3.1c0.9,0.9,1.9,1.3,3.1,1.3 s2.3-0.4,3.1-1.3S29.8,55.4,29.8,54.1z M16.5,40.9c0-1.2-0.4-2.3-1.3-3.1c-0.9-0.9-1.9-1.3-3.1-1.3c-1.2,0-2.3,0.4-3.1,1.3 c-0.9,0.9-1.3,1.9-1.3,3.1c0,1.2,0.4,2.3,1.3,3.1c0.9,0.9,1.9,1.3,3.1,1.3c1.2,0,2.3-0.4,3.1-1.3C16.1,43.1,16.5,42.1,16.5,40.9z M43.1,54.1c0-1.2-0.4-2.3-1.3-3.1s-1.9-1.3-3.1-1.3c-1.2,0-2.3,0.4-3.1,1.3s-1.3,1.9-1.3,3.1c0,1.2,0.4,2.3,1.3,3.1 s1.9,1.3,3.1,1.3c1.2,0,2.3-0.4,3.1-1.3S43.1,55.4,43.1,54.1z M29.8,40.9c0-1.2-0.4-2.3-1.3-3.1s-1.9-1.3-3.1-1.3s-2.3,0.4-3.1,1.3 c-0.9,0.9-1.3,1.9-1.3,3.1c0,1.2,0.4,2.3,1.3,3.1c0.9,0.9,1.9,1.3,3.1,1.3s2.3-0.4,3.1-1.3S29.8,42.1,29.8,40.9z M16.5,27.6 c0-1.2-0.4-2.3-1.3-3.1c-0.9-0.9-1.9-1.3-3.1-1.3c-1.2,0-2.3,0.4-3.1,1.3c-0.9,0.9-1.3,1.9-1.3,3.1s0.4,2.3,1.3,3.1 c0.9,0.9,1.9,1.3,3.1,1.3c1.2,0,2.3-0.4,3.1-1.3C16.1,29.8,16.5,28.8,16.5,27.6z M43.1,40.9c0-1.2-0.4-2.3-1.3-3.1s-1.9-1.3-3.1-1.3 c-1.2,0-2.3,0.4-3.1,1.3s-1.3,1.9-1.3,3.1c0,1.2,0.4,2.3,1.3,3.1s1.9,1.3,3.1,1.3c1.2,0,2.3-0.4,3.1-1.3S43.1,42.1,43.1,40.9z M29.8,27.6c0-1.2-0.4-2.3-1.3-3.1s-1.9-1.3-3.1-1.3s-2.3,0.4-3.1,1.3c-0.9,0.9-1.3,1.9-1.3,3.1s0.4,2.3,1.3,3.1 c0.9,0.9,1.9,1.3,3.1,1.3s2.3-0.4,3.1-1.3C29.4,29.8,29.8,28.8,29.8,27.6z M56.4,54.1V40.9c0-1.2-0.4-2.2-1.3-3.1 c-0.9-0.9-1.9-1.3-3.1-1.3c-1.2,0-2.2,0.4-3.1,1.3c-0.9,0.9-1.3,1.9-1.3,3.1v13.3c0,1.2,0.4,2.2,1.3,3.1c0.9,0.9,1.9,1.3,3.1,1.3 c1.2,0,2.2-0.4,3.1-1.3C55.9,56.4,56.4,55.3,56.4,54.1z M43.1,27.6c0-1.2-0.4-2.3-1.3-3.1s-1.9-1.3-3.1-1.3c-1.2,0-2.3,0.4-3.1,1.3 s-1.3,1.9-1.3,3.1s0.4,2.3,1.3,3.1c0.9,0.9,1.9,1.3,3.1,1.3c1.2,0,2.3-0.4,3.1-1.3C42.6,29.8,43.1,28.8,43.1,27.6z M56.4,16.5V7.6 c0-0.6-0.2-1.1-0.7-1.6c-0.4-0.4-1-0.7-1.6-0.7H9.9c-0.6,0-1.1,0.2-1.6,0.7C7.9,6.5,7.6,7,7.6,7.6v8.9c0,0.6,0.2,1.1,0.7,1.6 c0.4,0.4,1,0.7,1.6,0.7h44.3c0.6,0,1.1-0.2,1.6-0.7C56.1,17.6,56.4,17.1,56.4,16.5z M56.4,27.6c0-1.2-0.4-2.3-1.3-3.1 c-0.9-0.9-1.9-1.3-3.1-1.3c-1.2,0-2.3,0.4-3.1,1.3s-1.3,1.9-1.3,3.1s0.4,2.3,1.3,3.1c0.9,0.9,1.9,1.3,3.1,1.3c1.2,0,2.3-0.4,3.1-1.3 C55.9,29.8,56.4,28.8,56.4,27.6z M60.8,5.4v53.1c0,1.2-0.4,2.2-1.3,3.1c-0.9,0.9-1.9,1.3-3.1,1.3H7.6c-1.2,0-2.2-0.4-3.1-1.3 c-0.9-0.9-1.3-1.9-1.3-3.1V5.4c0-1.2,0.4-2.2,1.3-3.1S6.4,1,7.6,1h48.7c1.2,0,2.2,0.4,3.1,1.3C60.3,3.2,60.8,4.2,60.8,5.4z"/></svg> Bit Calculator</a>
						<li><a href="/webtools/fuzzydate.php"><svg width="1em" height="1em" viewBox="0 0 64 64" class="svg-icon fa-comment" title="" role="img" xmlns="http://www.w3.org/2000/svg"><path d="M63,27.6c0,4-1.4,7.7-4.2,11.1c-2.8,3.4-6.5,6.1-11.3,8.1c-4.8,2-9.9,3-15.6,3c-1.6,0-3.3-0.1-5-0.3 c-4.6,4-9.9,6.8-15.9,8.4c-1.1,0.3-2.4,0.6-3.9,0.8c-0.4,0-0.7-0.1-1.1-0.3c-0.3-0.3-0.5-0.6-0.6-1v0c-0.1-0.1-0.1-0.2,0-0.4 c0.1-0.2,0.1-0.3,0.1-0.3c0,0,0-0.2,0.2-0.3l0.2-0.3l0.2-0.3l0.3-0.3C6.6,55,6.9,54.6,7.5,54c0.6-0.6,1-1,1.2-1.3 c0.2-0.3,0.6-0.7,1.1-1.4s0.8-1.2,1.1-1.8c0.3-0.5,0.6-1.2,0.9-2c0.3-0.8,0.6-1.7,0.9-2.6c-3.6-2.1-6.5-4.6-8.6-7.6S1,31,1,27.6 c0-3,0.8-5.9,2.5-8.6s3.8-5.1,6.6-7.1s6.1-3.6,9.9-4.7s7.8-1.7,12-1.7c5.6,0,10.8,1,15.6,3s8.5,4.7,11.3,8.1S63,23.6,63,27.6z"/></svg> Fuzzy Date</a></li>
						<li><a href="/webtools/ip.php"><svg width="1em" height="1em" viewBox="0 0 64 64" class="svg-icon fa-map-marker" title="" role="img" xmlns="http://www.w3.org/2000/svg"><path d="M42.3,21.7c0-2.9-1-5.3-3-7.3c-2-2-4.5-3-7.3-3s-5.3,1-7.3,3s-3,4.5-3,7.3s1,5.3,3,7.3s4.5,3,7.3,3s5.3-1,7.3-3 C41.3,27,42.3,24.5,42.3,21.7z M52.7,21.7c0,2.9-0.4,5.3-1.3,7.2L36.6,60.1c-0.4,0.9-1.1,1.6-1.9,2.1C33.9,62.7,33,63,32,63 s-1.9-0.3-2.7-0.8c-0.8-0.5-1.5-1.2-1.9-2.1L12.7,28.9c-0.9-1.9-1.3-4.3-1.3-7.2c0-5.7,2-10.6,6.1-14.6S26.3,1,32,1s10.6,2,14.6,6.1 S52.7,16,52.7,21.7z"/></svg> IP Address</a></li>
						<li><a href="/webtools/line_processor.php"><svg width="1em" height="1em" viewBox="0 0 64 64" class="svg-icon fa-list" title="" role="img" xmlns="http://www.w3.org/2000/svg"><path d="M9.9,48.6v6.6c0,0.3-0.1,0.6-0.3,0.8c-0.2,0.2-0.5,0.3-0.8,0.3H2.1c-0.3,0-0.6-0.1-0.8-0.3C1.1,55.8,1,55.5,1,55.2v-6.6 c0-0.3,0.1-0.6,0.3-0.8s0.5-0.3,0.8-0.3h6.6c0.3,0,0.6,0.1,0.8,0.3S9.9,48.3,9.9,48.6z M9.9,35.3V42c0,0.3-0.1,0.6-0.3,0.8 S9,43.1,8.8,43.1H2.1c-0.3,0-0.6-0.1-0.8-0.3S1,42.3,1,42v-6.6c0-0.3,0.1-0.6,0.3-0.8s0.5-0.3,0.8-0.3h6.6c0.3,0,0.6,0.1,0.8,0.3 S9.9,35,9.9,35.3z M9.9,22v6.6c0,0.3-0.1,0.6-0.3,0.8S9,29.8,8.8,29.8H2.1c-0.3,0-0.6-0.1-0.8-0.3S1,29,1,28.7V22 c0-0.3,0.1-0.6,0.3-0.8c0.2-0.2,0.5-0.3,0.8-0.3h6.6c0.3,0,0.6,0.1,0.8,0.3C9.7,21.5,9.9,21.7,9.9,22z M63,48.6v6.6 c0,0.3-0.1,0.6-0.3,0.8c-0.2,0.2-0.5,0.3-0.8,0.3H15.4c-0.3,0-0.6-0.1-0.8-0.3c-0.2-0.2-0.3-0.5-0.3-0.8v-6.6c0-0.3,0.1-0.6,0.3-0.8 c0.2-0.2,0.5-0.3,0.8-0.3h46.5c0.3,0,0.6,0.1,0.8,0.3S63,48.3,63,48.6z M9.9,8.8v6.6c0,0.3-0.1,0.6-0.3,0.8 c-0.2,0.2-0.5,0.3-0.8,0.3H2.1c-0.3,0-0.6-0.1-0.8-0.3C1.1,16,1,15.7,1,15.4V8.8C1,8.5,1.1,8.2,1.3,8c0.2-0.2,0.5-0.3,0.8-0.3h6.6 C9,7.6,9.3,7.8,9.5,8C9.7,8.2,9.9,8.5,9.9,8.8z M63,35.3V42c0,0.3-0.1,0.6-0.3,0.8s-0.5,0.3-0.8,0.3H15.4c-0.3,0-0.6-0.1-0.8-0.3 c-0.2-0.2-0.3-0.5-0.3-0.8v-6.6c0-0.3,0.1-0.6,0.3-0.8c0.2-0.2,0.5-0.3,0.8-0.3h46.5c0.3,0,0.6,0.1,0.8,0.3S63,35,63,35.3z M63,22 v6.6c0,0.3-0.1,0.6-0.3,0.8s-0.5,0.3-0.8,0.3H15.4c-0.3,0-0.6-0.1-0.8-0.3c-0.2-0.2-0.3-0.5-0.3-0.8V22c0-0.3,0.1-0.6,0.3-0.8 c0.2-0.2,0.5-0.3,0.8-0.3h46.5c0.3,0,0.6,0.1,0.8,0.3C62.9,21.5,63,21.7,63,22z M63,8.8v6.6c0,0.3-0.1,0.6-0.3,0.8 c-0.2,0.2-0.5,0.3-0.8,0.3H15.4c-0.3,0-0.6-0.1-0.8-0.3c-0.2-0.2-0.3-0.5-0.3-0.8V8.8c0-0.3,0.1-0.6,0.3-0.8 c0.2-0.2,0.5-0.3,0.8-0.3h46.5c0.3,0,0.6,0.1,0.8,0.3C62.9,8.2,63,8.5,63,8.8z"/></svg> Line Processor</a></li>
						<li><a href="/webtools/sequencer.php"><svg width="1em" height="1em" viewBox="0 0 64 64" class="svg-icon fa-forward" title="" role="img" xmlns="http://www.w3.org/2000/svg"><path d="M2.8,62.4c-0.5,0.5-0.9,0.7-1.3,0.5C1.2,62.7,1,62.3,1,61.6V2.4c0-0.7,0.2-1.1,0.5-1.3s0.8,0,1.3,0.5l28.5,28.5 c0.2,0.2,0.4,0.5,0.5,0.8V2.4c0-0.7,0.2-1.1,0.5-1.3c0.3-0.2,0.8,0,1.3,0.5l28.5,28.5c0.5,0.5,0.8,1.1,0.8,1.8s-0.3,1.3-0.8,1.8 L33.7,62.4c-0.5,0.5-0.9,0.7-1.3,0.5c-0.3-0.2-0.5-0.6-0.5-1.3V33c-0.1,0.3-0.3,0.5-0.5,0.8L2.8,62.4z"/></svg> Sequencer</a></li>
						<li class="divider"></li>
                        <li><a href="/webtools/code_library/"><svg width="1em" height="1em" viewBox="0 0 64 64" class="svg-icon fa-book" title="" role="img" xmlns="http://www.w3.org/2000/svg"><path d="M62,16.4c1,1.4,1.2,3,0.7,4.8L52.5,55c-0.5,1.6-1.4,2.9-2.8,4c-1.4,1.1-2.9,1.6-4.6,1.6H10.7c-1.9,0-3.8-0.7-5.5-2 c-1.8-1.3-3-3-3.7-4.9C0.9,52,0.8,50.5,1.4,49c0-0.1,0-0.4,0.1-1c0.1-0.6,0.1-1,0.1-1.4c0-0.2,0-0.5-0.1-0.8s-0.1-0.6-0.1-0.7 c0-0.3,0.1-0.5,0.3-0.8c0.1-0.2,0.4-0.5,0.6-0.9c0.3-0.3,0.5-0.6,0.6-0.9c0.6-0.9,1.1-2.1,1.7-3.4c0.5-1.3,0.9-2.5,1.1-3.4 c0.1-0.2,0.1-0.6,0-1.1c-0.1-0.5-0.1-0.8,0-1c0.1-0.3,0.3-0.6,0.6-1c0.3-0.4,0.6-0.7,0.6-0.9c0.5-0.9,1-2,1.6-3.4s0.8-2.5,0.9-3.4 c0-0.2,0-0.6-0.1-1.2s-0.1-0.9,0-1c0.1-0.3,0.4-0.7,0.8-1.1c0.4-0.4,0.7-0.7,0.8-0.8c0.5-0.6,1-1.7,1.6-3.1c0.6-1.5,0.9-2.6,1-3.6 c0-0.2,0-0.5-0.1-0.9c-0.1-0.4-0.1-0.8-0.1-1c0-0.2,0.2-0.4,0.3-0.7c0.2-0.2,0.4-0.5,0.7-0.9s0.5-0.6,0.6-0.8 c0.2-0.3,0.4-0.7,0.6-1.1c0.2-0.5,0.4-0.9,0.6-1.3c0.2-0.4,0.4-0.9,0.6-1.3c0.2-0.5,0.5-0.9,0.7-1.2c0.2-0.3,0.6-0.6,1-0.9 s0.9-0.4,1.3-0.4c0.5,0,1.1,0.1,1.8,0.2l0,0.1c0.9-0.2,1.6-0.3,1.9-0.3h28.3c1.8,0,3.3,0.7,4.2,2.1c1,1.4,1.2,3,0.7,4.8L46.6,44.1 c-0.9,3-1.8,4.9-2.7,5.7c-0.9,0.9-2.5,1.3-4.8,1.3H6.8c-0.7,0-1.1,0.2-1.4,0.6c-0.3,0.4-0.3,0.9,0,1.6c0.6,1.7,2.4,2.6,5.4,2.6h34.4 c0.7,0,1.4-0.2,2.1-0.6c0.7-0.4,1.1-0.9,1.3-1.5L59.7,17c0.2-0.5,0.2-1.3,0.2-2.1C60.8,15.2,61.5,15.7,62,16.4z M22.4,16.5 c-0.1,0.3-0.1,0.6,0.1,0.8c0.1,0.2,0.4,0.4,0.7,0.4h22.6c0.3,0,0.6-0.1,0.9-0.4c0.3-0.2,0.5-0.5,0.6-0.8l0.8-2.4 c0.1-0.3,0.1-0.6-0.1-0.8c-0.1-0.2-0.4-0.4-0.7-0.4H24.8c-0.3,0-0.6,0.1-0.9,0.4c-0.3,0.2-0.5,0.5-0.6,0.8L22.4,16.5z M19.3,26 c-0.1,0.3-0.1,0.6,0.1,0.8c0.1,0.2,0.4,0.4,0.7,0.4h22.6c0.3,0,0.6-0.1,0.9-0.4c0.3-0.2,0.5-0.5,0.6-0.8l0.8-2.4 c0.1-0.3,0.1-0.6-0.1-0.8c-0.1-0.2-0.4-0.4-0.7-0.4H21.7c-0.3,0-0.6,0.1-0.9,0.4c-0.3,0.2-0.5,0.5-0.6,0.8L19.3,26z"/></svg> Code Library</a></li>
						<li><a href="https://thenounproject.com/thunderpaw"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 100 100" class="svg-icon"><path d="M50 2.5C23.8 2.5 2.5 23.8 2.5 50S23.8 97.5 50 97.5c26.2 0 47.5-21.3 47.5-47.5S76.2 2.5 50 2.5zM50 88C29 88 12 71 12 50c0-8.8 3-16.8 8-23.3l9 9c0 0.1 0 0.2 0 0.3 0 3.8 1.2 7 3.5 9.6 2.3 2.6 6.2 5 11.8 7.2L47 54v13.2c-2-0.2-5.7-0.7-9.2-1.7C34.3 64.5 32 63.4 29 62.2v11.2c5 2.3 11 3.5 18 3.6V86h6v-9.1c5-0.5 9.7-1.9 12.9-4.3l7.4 7.4C66.8 85 58.8 88 50 88zM47 40.5l-5.4-5.4C42.1 33.3 44 32.1 47 31.6V40.5zM57.8 64.6C56.9 65.7 55 66.4 53 66.8v-7.1L57.8 64.6zM80 73.3l-8.7-8.7c0.2-1.1 0.3-2.2 0.3-3.3 0-2.5-0.5-4.7-1.6-6.5 -1.1-1.9-2.8-3.6-5.2-5.1C62.5 47.9 58 46.1 53 44V31.5c5 0.4 9.2 1.5 13.6 3.3l4-9.9C65.3 22.5 60 21.2 53 20.9V15h-6v6.1c-5 0.6-10.1 2.2-13.3 4.8 -0.2 0.2-0.4 0.4-0.6 0.5l-6.4-6.4c6.4-5 14.5-8 23.3-8 21 0 38 17 38 38C87.9 58.8 85 66.8 80 73.3z"/></svg> Free Icons</a></li>
					</ul>
				</li>
			</ul>
			<!-- ul class="nav navbar-nav pull-right">
				<li><a href="https://twitter.com/kamakalolii" title="Sunny Walker on Twitter"><svg width="1em" height="1em" viewBox="0 0 64 64" class="svg-icon twitter-color" title="" role="img" xmlns="http://www.w3.org/2000/svg"><path fill="#00aced" d="M63,12.8c-1.8,2.6-3.9,4.8-6.4,6.6c0,0.4,0,0.9,0,1.7c0,3.4-0.5,6.8-1.5,10.2c-1,3.4-2.5,6.7-4.5,9.8s-4.5,5.9-7.3,8.3 s-6.2,4.3-10.1,5.7s-8.2,2.1-12.7,2.1c-7.1,0-13.6-1.9-19.5-5.7c0.9,0.1,1.9,0.2,3.1,0.2c5.9,0,11.2-1.8,15.8-5.4 c-2.8-0.1-5.2-0.9-7.4-2.5C10.3,42,8.8,39.9,8,37.4c0.9,0.1,1.7,0.2,2.4,0.2c1.1,0,2.2-0.1,3.3-0.4c-2.9-0.6-5.4-2.1-7.3-4.4 s-2.9-5-2.9-8.1v-0.2c1.8,1,3.7,1.5,5.7,1.6c-1.7-1.2-3.1-2.7-4.1-4.5c-1-1.9-1.5-3.9-1.5-6.1c0-2.3,0.6-4.4,1.7-6.4 c3.2,3.9,7,7,11.6,9.4s9.4,3.7,14.6,3.9c-0.2-1-0.3-2-0.3-2.9c0-3.5,1.2-6.5,3.7-9c2.5-2.5,5.5-3.7,9-3.7c3.7,0,6.8,1.3,9.3,4 c2.9-0.6,5.5-1.6,8.1-3.1c-1,3-2.8,5.4-5.6,7C58.1,14.5,60.6,13.9,63,12.8z"/></svg> @kamakalolii</a></li>
			</ul -->
		</div>
	</div>
</nav>

<div class="container" id="content">
    <h1>md5 Hash Generator</h1>
    <blockquote><p>This simple tool computes the MD5 hash of a string. Also available: <a href="sha1.php">SHA-1 hash generator</a> and <a href="sha256.php">SHA-256 hash generator</a>.</p></blockquote>

    <form action="/webtools/md5.php" method="post" name="form1" id="form1">
        <div id="group1" class="group">
            <p><label for="email">String:</label>
                <textarea name="string" cols="50" rows="5" wrap="virtual" id="string" autocapitalize="off" autofocus></textarea></p>
            <p><input name="Submit" type="submit" class="btn btn-primary" value="md5" />
                <span class="checkbox"><label><input type="checkbox" name="multiline" id="multiline" class="checkbox"> Treat multiple lines as separate strings</label></span>
            </p>
        </div>
    </form>
    <p class="text-warning">Special note about line endings: Mac/Unix and Windows use different codes to separate lines. <strong>The tool on this page normalizes all line endings to a Line Feed (<code>\n</code>)</strong>. Other tools are available online if you need hashes specifically with Windows line endings (Carriage Return + Line Feed: <code>\r\n</code>).</p>
    <p>As a reminder, <a href="http://www.mscs.dal.ca/~selinger/md5collision/">MD5 is not a cryptographically secure</a> hashing algorithm.</p>
    <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
    <!-- Links -->
    <ins class="adsbygoogle" style="display:block" data-ad-client="ca-pub-7593691325624205" data-ad-slot="7088498372" data-ad-format="link"></ins>
    <script>(adsbygoogle = window.adsbygoogle || []).push({});</script>
    <hr>
<footer>
	<p>copyright &copy; 2019, Sunny Walker, <a href="http://www.miraclesalad.com/">MiracleSalad.com</a>; <a href="http://www.miraclesalad.com/contact.php">Contact</a>; <a href="http://www.miraclesalad.com/privacy.php">Privacy Statement</a></p>
	<!-- <script src="https://www.coinbase.com/assets/button.js" type="text/javascript"></script> -->
</footer>

</div>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="/bootstrap-3.3.5/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
	$('.dropdown-toggle').dropdown();
});
</script>
<script src="/js/jquery.autogrow-textarea.min.js"></script>
<script>
$(document).ready(function(){
    var i = $('#string'), // input field
        o = $('#output'), // output field
        f = $('#form1'), // form
        m = $('#multiline'), // multiline option
        buildOutput = function() { // calc the hash
            if (!o.length) { // ensure the output exists and create if it doesn't
                f.append('<div id="group2" class="group"><h2>MD5 Hash:</h2><p><textarea name="output" type="text" id="output"></textarea></p></div>'); // create the output section
                o = $('#output'); // cache the new element
                o.autogrow(); // add the autogrow behavior
            }
            if (m.prop('checked')) { // is the multiple lines option checked?
                var strings = i.val().replace(/\r\n/, "\n").split("\n"), // break the lines into an array
                    outputs = []; // bucket to hold the hashes
                $.each(strings, function(index, value) { // iterate through each line
                    if (value !== '') { // if it's not a blank line...
                        outputs.push(MD5(value)); // add the hash to the bucket
                    } else { // it's a blank line...
                        outputs.push(''); // and a blank to the bucket
                    }
                });
                o.val(outputs.join("\n")); // display the hashes
            } else { // single line
                o.val(MD5(i.val())); // compute the hash
            }
            o.trigger('change');
        };
    i.on('input propertychange', function(e) { // add a timer to auto calc the md5
        var t = $(this);
        if (window.event && event.type==='propertychange' && event.propertyName!=='value') {
            return; // ignore the event if it's not a propertychange on a value
        }
        window.clearTimeout(t.data('timeout')); // clear the timer
        t.data('timeout', setTimeout(buildOutput, 250)); // add the timer in milliseconds
    });
    f.on('submit', function(e) { // override the submit button to run javascript
        e.preventDefault(); // cancel the form submission
        buildOutput(); // run the hashing
        o.focus().select(); // select the contents of the output
    });
    $('li[data-here="'+$('body').data('here')+'"]').addClass('active');
    o.autogrow(); // add the autogrow behavior to the output
    m.on('change', buildOutput); // trigger the hashing when the checkbox is (un)checked
});
</script>
</body>
</html>
