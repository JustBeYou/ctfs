# The script iterates over a lot of nested zip files
from zipfile import ZipFile
from os import remove

def extract(filename, password):
    zip_file = ZipFile(filename, "r")
    zip_file.extractall(".", pwd=password.encode('ascii'))
    zip_file.close()

filename = "37366.zip"

while True:
    with ZipFile(filename, "r") as zip_file:
        filename_new = zip_file.namelist()[0]
        if ".zip" not in filename_new:
            print ("[+] Found something: " + filename_new + " in" + filename)
            break

        print ("[*] Extracting " + filename_new)
        password = filename_new.replace(".zip", "")
        zip_file.extractall(".", pwd=password.encode('ascii'))
    remove(filename)
    filename = filename_new

# at the end (it will take a while), you should find a file
# named '6969.zip'
# Brute force its password. It should be 'letmeinplease'
# In it you will find 'DoNotTouch', a sql file.
# Use grep and strings to get the flag: strings DoNotTouch | grep HTB
# the flag is HTB{z1p_and_unz1p_ma_bruddahs}
