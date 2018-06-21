from pickle import load, dump

session_name = "test"
session_local = True

# create session
def create_session(name, local = True):
    global session_name, session_local
    session_name = name
    session_local = local

# load saved data
def load_vars():
    global config
    if not session_local:
        with open("config/{}_remote.json".format(session_name)) as f:
            config = load(f)
    else:
        with open("config/{}_local.json".format(session_name)) as f:
            config = load(f)
    return config

# save state
def save_vars(config):
    if not session_local:
        with open("config/{}_remote.json".format(session_name), "w") as f:
            dump(config, f)
    else:
        with open("config/{}_local.json".format(session_name), "w") as f:
            dump(config, f)
