lines = []

with open("program.txt") as f:
    for line in f:
        if "#" in line: continue
        lines.append(line.strip())

lines = [x.split('=') for x in lines]

from pprint import pprint
pprint (lines)

values = {}
for x in lines:
    values[x[0].strip()] = x[1].strip()

pprint (values)

class Node(object):
    def __init__(self, func, left, right):
        self.func = func
        self.left = left
        self.right = right
    def set_func(self, func):
        self.func = func
    def set_left(self, left):
        self.left = left
    def set_right(self, right):
        self.right = right

def create(expr):
    start = expr.index("(")
    mid = expr.index(",")
    end = expr.index(")")

    func = expr[:start].strip()
    left = expr[start+1:mid].strip()
    right = expr[mid+1:end].strip()

    print (func, left, right)

    return Node(func, left, right)

def solve(root, values):
    if root.left in values:
        if "(" in values[root.left]:
            root.set_left(create(values[root.left]))
            solve(root.left, values)
        else:
            root.set_left(values[root.left])

    if root.right in values:
        if "(" in values[root.right]:
            root.set_right(create(values[root.right]))
            solve(root.right, values)
        else:
            root.set_right(values[root.right])


root = create("add( v21, v17)")
solve(root, values)

def dfs(root):
    if type(root) is str:
        print (root, end = ' ')
        return

    print (root.func, end = ' ')
    dfs(root.left)
    dfs(root.right)
print ()

dfs(root)
