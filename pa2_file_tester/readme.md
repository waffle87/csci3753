## PA2 - File Tester
### introduction
in this assignment, you will write a userspace test program that takes
commands from the user to **read, write, & seek** on a file

### implementation
program should accept a filename to test on the command line:
`./pa2test filename`. if the filename does not exist or isn't readable
or writeable, program should print an error message and terminate with
non-zero exit status:
```shell
$ ./pa2test missingfile
./pa2test error: invalid filename
$ echo $?
255
```

once successfully invoked, your interactive program should open `filename`
for reading/writing, prompt user to choose option **r** for read, **w**
for write, or **s** for seek. then, accept the following input:
* **r** -- program should immediately ask for number of bytes to
read using the prompt: "Enter the number of bytes you want to read:"
making sure you create a large enough buffer using `malloc()`, read
the file starting from its current position. then print the returned
data out to the console followed by a new line
* **w** -- program should immediately ask for number of bytes to read
using the prompt: "Enter the data you want to write:". The user then
entres the desired data terminated by a carriage return. program should
then write this data to the file
* **s** -- program should prompt for values offset and whence:
"Enter an offset value":, "Enter a value for whence:". program should
then set its position in the file according to the offset and whence
(0 for `SEEK_SET`, 1 for `SEEK_CUR`, 2 for `SEEK_END`). see `man lseek`
* **ctl + d** -- at any prompt, terminate the program and return exit
success status
* **other** -- if the user entres something other than listed above,
ignore it and prompt the user again

note, the program should run in an infinite loop until its explicitly
terminated by the user

### testing
verify program is correctly reading and writing file:
```shell
$ echo "the quick brown fox jumps over the lazy dog" >> foo.txt
$ cat foo.txt
the quick brown fox jumps over the lazy dog
$ hexdump -C foo.txt
00000000  74 68 65 20 71 75 69 63  6b 20 62 72 6f 77 6e 20  |the quick brown |
00000010  66 6f 78 20 6a 75 6d 70  73 20 6f 76 65 72 20 74  |fox jumps over t|
00000020  68 65 20 6c 61 7a 79 20  64 6f 67 0a              |he lazy dog.|
0000002c

$ tail -c 10 foo.txt
lazy dog
$ head -c 10 foo.txt
the quick
```
