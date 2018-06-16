from flask import Flask, render_template, request, make_response, redirect
import random
import string
from base64 import b64decode, b64encode
from Crypto.Cipher import AES
from hashlib import md5
from Crypto.Hash import HMAC

BLOCK_SIZE = 16
pad = lambda s: s + (BLOCK_SIZE - len(s) % BLOCK_SIZE) * \
                chr(BLOCK_SIZE - len(s) % BLOCK_SIZE)
unpad = lambda s: s[:-ord(s[len(s) - 1:])]

app = Flask(__name__)
HMAC_SECRET = ''.join(random.choice(string.ascii_letters + string.digits) for _ in range(16))
key = md5(''.join(random.choice(string.ascii_letters + string.digits) for _ in range(32)).encode('utf8')).hexdigest()

@app.route('/')
def index():
    if 'token' in request.cookies:
        token = request.cookies['token']
        status, name = verify_token(token)
        if status == 0:
            return render_template('login.html')
        elif status == 1:
            return render_template('user.html', name=name)
        else:
            return render_template('admin.html', name=name)
    else:
        return render_template('login.html')

@app.route('/login', methods=['POST'])
def login():
    response = make_response(redirect('/'))
    name = request.form['name']
    name = name.replace(":", "")
    if 0 < len(name) <= 1024:
        response.set_cookie('token', gen_token(name))
        return response
    else:
        return response

def gen_token(user):
    data = user + ":user"
    h = HMAC.new(HMAC_SECRET.encode("utf-8"))
    h.update(data.encode("utf-8"))
    mac = h.hexdigest()
    return encrypt(data + HMAC_SECRET) + mac.encode("utf-8")

def verify_token(token):
    if len(token) < 53:
        return 0, ""
    mac = token[-32:]
    token = token[:-32]
    try:
        data = decrypt(token)
        if len(data) >= 21:
            secret = data[-16:]
            data = data[:-16]
            i = data.rfind(":")
            if i >= 0:
                user = data[:i]
                if verify_hmac(secret, mac, user + ":user"):
                    return 1, user
                elif verify_hmac(secret, mac, user + ":admin"):
                    return 2, user
    except:
        pass
    return 0, 0

def encrypt(raw):
    raw = pad(raw)
    cipher = AES.new(key)
    return b64encode(cipher.encrypt(raw))

def decrypt(enc):
    enc = b64decode(enc)
    cipher = AES.new(key)
    return unpad(cipher.decrypt(enc)).decode('utf8')

def verify_hmac(secret, mac, msg):
    h = HMAC.new(secret.encode("utf-8"))
    h.update(msg.encode("utf-8"))
    if h.hexdigest() == mac:
        return True
    else:
        return False

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=9999)