The Python version running on the server is 2.7.x
`input` function in this family of versions passes the input to `eval`, so we can get RCE. Import `os` module using `__import__` and then call `system` to get a shell.
