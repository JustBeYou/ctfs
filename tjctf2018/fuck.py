from requests import session
s = session()
for i in range(10000):
    r = s.get("https://moar_horse.tjctf.org/legs")
    if "Oops" not in r.text:
        print ("Stooooooooooooooooooooooooop {}".format(r.text))
    else:
        print (r.status_code)
