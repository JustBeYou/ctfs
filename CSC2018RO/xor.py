# all encrypted messages has the length of 15
table = ["4840DDEB8C1CBAC721F824949FCF9A",
"4840D5EA8E1BBACB36F72C9C94D59D",
"484FD9EB9305A2C63FF92A909DD790",
"4A4CD3F48018BFCC3BFC208598DE9A",
"4A4CD0E28808B3C026F9289D98CF90",
"4A4CCBEA9509A4CB2AF124819DDE9A",
"4D4ACDE5911CB9C73CE4209F96D790"]

# convert from ascii to hex
hex_table = []

for elem in table:
    new_elem = [int(elem[i:i+2], 16) for i in range(0, len(elem), 2)]
    hex_table.append(new_elem)

# load few english words of length 15 (only lowercase)
words = []
with open("words.txt") as f:
    for row in f:
        words.append(row.strip())

def compute_table(first_word):
    k = []

    # suppose that the first word is a chosen value
    # using this value, calculate a key
    for i in range(len(hex_table[0])):
        elem = hex_table[0][i]
        k.append(elem ^ ord(first_word[i]))

    # using the supposed key, generate the whole table
    sol_table = []
    for row in hex_table:
        new_row = []
        for i in range(len(row)):
            new_row.append(row[i] ^ k[i])
        sol_table.append(new_row)

    return sol_table, k

# check if the decrypted content is ASCII lowercase
def check_table(table):
    for row in table:
        for c in row:
            if ord('a') > c or ord('z') < c: return False

    return True

# from hex to ascii
def to_ascii(table):
    ascii_table = []

    for row in table:
        add = []
        for c in row:
            add.append(chr(c))
        ascii_table.append(''.join(add))

    return ascii_table

# check few words from english alphabet from start (length 15)
for word in words:
    t, k = compute_table(word)
    v = check_table(t)
    if v:
        print (to_ascii(t))
        print ("Key: ", end='')
        for c in k:
            print (hex(c)[2:].upper(), end='')
        print ()
