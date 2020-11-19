import pickle
import base64
something = raw_input("Test you luck here:\n")
something = base64.b64decode(something)
blacklist = ["id", "cposix", "system", "os", "*", "?", "flag", "txt", "and", "exec", "not", "assert", "finally", "or", "break", "for", "pass", "class", "from", "print", "continue", "global", "raise", "def", "if", "return", "del", "import", "try", "elif", "while", "else", "is", "with", "except", "lambda", "yield", "pickle", "base64", "popen", "read", "subprocess", "Popen", "process", "stdout", "stderr", "python", "cat", "bash", "sh", "eval", "curl", "wget", "php", " ", "!", "..", "/", "\\", ")", "]", "}", "-", "+", ">", "<", "@", "#", "$", "%", "f", "^", "&", "=", "r", "()", "posix", "tryharder!"]
for test in blacklist:
    if test in something:
        raise SystemExit
if len(something) > 40:
    raise SystemExit
special = pickle.loads(something)
print special
