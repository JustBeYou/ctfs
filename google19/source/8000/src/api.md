# DevMaster 8000 API

The DevMaster 8000 supports a streaming interface for executing builds and obtaining the results. This file provides API documentation for this interface.

### Overview

Let's say you want to build `main.cc` with `g++`. Here's how you might do it programmatically:
 1. Send a `build` command (opcode `3`). This command will include the files you want to build (the contents of `main.cc`) and the shell command you want to execute to do the build (`g++ main.cc -o main`). This command also includes a unique `ref-id` that identifies this build in all later commands.
 2. Since `g++` doesn't take `stdin`, send a `stdin` command (opcode `0`) with a size of `0` to indicate that `stdin` should be closed.
 3. You now wait for the DevMaster to reply with `exited` (opcode `5`). Before sending this, the DevMaster will have replied back with one or more `stdout` (opcode `1`) and stderr (opcode `2`) commands. These contain the output of `g++`. Like `stdin`, they are closed by sending a size-zero message.
 4. Assuming there were no errors on `stdin`, you send a `fetch` command (opcode `7`) with the name of the file you want to fetch (`main`).
 5. Finally, you wait to receive a `fetched` command (opcode `8`), which will contain the contents of your `main`.

## Full Spec

This specifies the binary API used for communicating with the DevMaster. Each command is prefixed with its opcode and the size of the command (excluding the opcode and the size field themselves). All strings and arrays are size prefixed. All integers, including opcodes and size prefixes, are 4-byte little-endian. File paths are relative to the working directory.

### build
Runs the specified build command. Command is given the specified `ref-id`, which can be used to refer to it in subsequent commands. Two `build` commands must not specify the same `ref-id`.

 * opcode: `int` _(must be `3`)_
 * command-size: `int`
 * ref-id: `int`
 * command size: `int`
 * command to run: `string`
 * array-of-files size: `int`
 * `array` of files, where each file is:
   * filepath size: `int`
   * filepath: `string`
   * file size: `int`
   * file contents: `string`

### exited
Sent from server to client.

Indicates the command running at the specified `ref-id` has exited.

 * opcode: `int` _(must be `5`)_
 * command-size: `int`
 * ref-id: `int`
 * exit code: `int`

### fetch
Retrieves the specified file from the server. File paths are relative to the working directory.

 * opcode: `int` _(must be `7`)_
 * command-size: `int`
 * ref-id: `int`
 * filepath size: `int`
 * filepath: `string`

### fetched
Sent from servet to client.

Indicates a response to the `fetch` command.

 * opcode: `int` _(must be `8`)_
 * command-size: `int`
 * ref-id: `int`
 * filepath size: `int`
 * filepath: `string`
 * file size: `int`
 * contents: `string`

### stdin
Sends input to the command running at the specified `ref-id`. Can be sent more than once. Sending a size of `0` closes `stdin`. 

 * opcode: `int` _(must be `0`)_
 * command-size: `int`
 * ref-id: `int`
 * input size: `int`
 * input: `string`

### stdout
Sent from server to client.

Sends output from the command running at the specified `ref-id`. Can be sent more than once. Sending a size of `0` indicates a closed `stdout`. 

 * opcode: `int` _(must be `1`)_
 * command-size: `int`
 * ref-id: `int`
 * output size: `int`
 * output: `string`

### stderr
Sent from server to client.

Sends error output from the command running at the specified `ref-id`. Can be sent more than once. Sending a size of `0` indicates a closed `stderr`. 

 * opcode: `int` _(must be `2`)_
 * command-size: `int`
 * ref-id: `int`
 * output size: `int`
 * output: `string`

### server-error
Sent from server to client. Indicates errors with running specific server commands (as opposed to build commands themselves, which are typically indicated by the executable over `stderr`). If applicable, ref-id is included. If applicable, the user's failed command is included in the `errored-command` field.

 * opcode: `int` _(must be `9`)_
 * command-size: `int`
 * ref-id: `int`
 * error size: `int`
 * error: `string`
 * errored-command size: `int`
 * errored-command: `string`

### admin
Opens an administrator console session. Uses a user-specified ref-id like `build`.

To ensure the admin console is always up-to-date, it is rebuilt from the latest sources every 30 seconds. After opening, works identically to a running `build` command. Killing the process and fetching from it are disallowed.

 * opcode: `int` _(must be `10`)_
 * command-size: `int` _(must be `4`)_
 * ref-id: `int`
