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
Print only process ID:

```ps -ef | awk -F" " '{print $2}'```

  *Differences:*

The main difference between ps -ef and ps -aux is in the output format:

- ps -ef displays a full-format listing with columns for UID, PID, PPID, CPU usage, memory usage, start time, and command.
- ps -aux displays a user-oriented format with columns for username, PID, CPU usage, memory usage, virtual memory size (VSZ), resident set size (RSS), terminal (TTY), process state (STAT), start time, and command.
- Additionally, the -aux option is historically used in BSD-style systems like macOS, while -ef is more common in System V-style Unix and Linux systems.


**Write a script to print only error logs from the remote log**
- here suppose u have all ur logs stored in S3 bucket (cloud storage), then u can reterive with the help of API calls
- example-  curl google.com | grep HREF
- pipe (|) will send the output of first command to the second command
- The curl command is a versatile tool used to transfer data to or from a server

**Write a shell script to print numbers divided by 3 & 5 but not 15**

```for i in {1..100}; do
  if (['expr i % 3' == 0 ] || ['expr i % 5 == 0']) && ['expr i % 15' == 0'];
  then 
  echo $i
  fi
done
```

**Write a command to print number of "s" in "mississipi**

```x=mississipi
grep -o "s" <<<"$x" | wc -l
```

- -o is used for only
- <<< used for standard input
- wc -l for word count
