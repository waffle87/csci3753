## PA5 - DNS Resolver
### overview
this assignment will develop an application that resolves domain names
to ip addresses. this is similar to the operation performed each time
you access a new website in your browser. provided are a set of input
files that contain one hostname per line. your program will process each
of these files by reading the file line by line, look up the ip address
for that hostname, and then write the hostname and ip address to the
specified log file using the following format:
```
google.com, 74.125.224.81
```
if the resolved is unable to fid the ip address for a hostname, it
should leave `NOT_RESOLVED` instead of an ip address. the program must
end after all names in each input file have been serviced by the
application. prior to exiting, the program should print the total time
taken to stdout
```
./lookup: total time is 2.420237 seconds
```
`gettimeofday()` library function is recommended for this purpose.

### error handling
program should deal with the following conditions
* missing arguments - terminate with a usage synopsis to stdout
* arguments that are out of range (ie. too many input files) should
terminate with an error message to stderr
* if a log file exists and is writeable, it should be overwritten
* if a log file does not exist, it should be created by the program
* missing or unreadable input files should print `invalid file <filename>`
to stderr, then move onto next file

all system and library calls should be checked for errors. if you
encounter errors not listed above, you should print an appropriate
message to stderr, and then either exit or continue depending up
whether or not you can recover from the error gracefully. make sure
your program returns an appropriate exit status.
