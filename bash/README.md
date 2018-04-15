#BASH related dot-files

(more detailed infoemation: [Wikipedia](https://en.wikipedia.org/wiki/Bash_(Unix_shell)))

##Startup scripts
When Bash starts, it executes the commands in a variety of dot files.

###Execution order of startup files

####When started as an interactive login shell
Bash reads and executes ```/etc/profile``` (if it exists). (Often this file calls ```/etc/bash.bashrc```.)

After reading that file, it looks for ```~/.bash_profile```, ```~/.bash_login```, and ```~/.profile``` *in that order*, and reads and executes the first one that exists and is readable.

####When a login shell exits
Bash reads and executes ```~/.bash_logout``` (if it exists).

####When started as an interactive shell (but not a login shell)
Bash reads and executes ```/etc/bash.bashrc``` and then ```~/.bashrc``` (if it exists). This may be inhibited by using the ```--norc``` option. The ```--rcfile file``` option forces Bash to read and execute commands from ```file``` instead of ```~/.bashrc```.

