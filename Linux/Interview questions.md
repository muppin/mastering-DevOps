**List some of the commanly used shell commands**
ls, touch, mkdir, top, grep, mv, cp, vim
- I use shell scripting for listing the file and for that I use ls command.
- to find files we use the find command.
- to debug the linux machine- we use top,sar command
- to look for the disk space we use df command
- sar" command provides a wealth of information about a Linux system's performance, including CPU usage, memory usage, disk activity, and more


**Write a simple shell script to list all the process**
- ps -ef
  OR
- ps -aux

  *Differences:*

The main difference between ps -ef and ps -aux is in the output format:

- ps -ef displays a full-format listing with columns for UID, PID, PPID, CPU usage, memory usage, start time, and command.
- ps -aux displays a user-oriented format with columns for username, PID, CPU usage, memory usage, virtual memory size (VSZ), resident set size (RSS), terminal (TTY), process state (STAT), start time, and command.
- Additionally, the -aux option is historically used in BSD-style systems like macOS, while -ef is more common in System V-style Unix and Linux systems.
