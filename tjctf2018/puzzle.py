def find_words(data):
    to_find = "tjctf{"
    positions = []

    for i, line in enumerate(data):
        for j, elem in enumerate(line):
            if elem == 't':
                positions.append((i, j))

    results = []

    dirs = {
             'N': {
                 'x': -1,
                 'y': 0,
                 },
             'S': {
                 'x': 1,
                 'y': 0,
                 },
             'E': {
                 'x': 0,
                 'y': 1,
                 },
             'V': {
                 'x': 0,
                 'y': -1,
                 },
             'N-E': {
                 'x': -1,
                 'y': 1,
                 },
             'S-E': {
                 'x': 1,
                 'y': 1,
                 },
             'S-V': {
                 'x': 1,
                 'y': -1,
                 },
             'N-V': {
                 'x': -1,
                 'y': -1,
                 },

        }

    def check_bounds(x, y):
        return x < len(data) and y < len(data[0]) and x >= 0 and y >= 0

    def check_directions(x, y):
        found = []
        for d in dirs:
            cx = x
            cy = y

            # -------------------------
            word = ''

            chars = 0
            while check_bounds(x, y):
                if chars < len(to_find):
                    if to_find[chars] != data[x][y]:
                        break

                word += data[x][y]
                x += dirs[d]['x']
                y += dirs[d]['y']
                chars += 1

            # filter for flags
            if chars > 5 and "}" in word:
                found.append([d, x, y, word[:word.index('}') + 1]])
            # -------------------------
            x = cx
            y = cy
        return found

    while len(positions):
        pos = positions.pop()
        x = pos[0]
        y = pos[1]

        found = check_directions(x, y)
        if found != []:
            results.append(found)

    print (results)

data = []
with open('puzzle') as f:
    for line in f:
        data.append(list(line.strip()))

L2I = dict(zip("ABCDEFGHIJKLMNOPQRSTUVWXYZ".lower(),range(26)))
I2L = dict(zip(range(26),"ABCDEFGHIJKLMNOPQRSTUVWXYZ".lower()))

def decipher(key, ciphertext):
    plaintext2 = ""
    for c in ciphertext:
        if c.isalpha(): plaintext2 += I2L[ (L2I[c] - key)%26 ]
        else: plaintext2 += c

    return plaintext2

for k in range(26):
    print ("key: " + str(k))
    new_data = []

    for line in data:
        new_data.append(list(decipher(k, line)))
    find_words(new_data)
