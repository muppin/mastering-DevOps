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

```
x=mississipi
grep -o "s" <<<"$x" | wc -l
```

- -o is used for only
- <<< used for standard input
- wc -l for word count

**How will you debug your shell script**
- Set -x: Use the set -x command at the beginning of your script or before a specific section to enable debugging mode. 
- This mode prints each command before it's executed, which can help identify where issues are occurring.

```#!/bin/bash
set -x
# Your script here
```


**What is crontab in linux? can u provide an example?**

In Linux, `crontab` (cron table) is a system utility that allows users to schedule tasks or commands to run periodically at fixed times, dates, or intervals. These scheduled tasks are known as cron jobs, and they can perform a wide range of operations, such as executing scripts, running commands, or invoking programs.

Each user on a Linux system can have their own crontab file, which contains a list of cron jobs. The cron daemon (`cron`) reads these crontab files and executes the scheduled tasks accordingly.

Here's a basic example of how to use `crontab` to schedule a task:

1. **Open the Crontab Editor**: To edit your user's crontab file, you can use the `crontab -e` command:

   ```bash
   crontab -e
   ```

   This command opens the crontab file in the default text editor specified by the `EDITOR` environment variable (usually `vi` or `nano`).

2. **Add a Cron Job**: In the crontab file, each line represents a cron job in the following format:

   ```
   * * * * * command_to_execute
   ```

   The fields in the cron job represent:
   - Minute (0-59)
   - Hour (0-23)
   - Day of the month (1-31)
   - Month (1-12)
   - Day of the week (0-7, where 0 and 7 represent Sunday)

   For example, to schedule a task to run a script named `backup.sh` every day at 2:00 AM, you would add the following line to your crontab file:

   ```
   0 2 * * * /path/to/backup.sh
   ```

   This cron job specifies:
   - Minute: 0 (at the start of the hour)
   - Hour: 2 (2:00 AM)
   - Day of the month: * (every day)
   - Month: * (every month)
   - Day of the week: * (every day of the week)

3. **Save and Exit**: After adding the cron job, save the changes and exit the crontab editor. In `vi`, you would press `Esc` followed by `:wq` and then Enter. In `nano`, you would press `Ctrl + O` to save and `Ctrl + X` to exit.

4. **View Cron Jobs**: You can view your scheduled cron jobs by running `crontab -l`:

   ```bash
   crontab -l
   ```

   This command lists the contents of your crontab file.

That's it! The cron daemon will now execute the specified command or script according to the schedule you defined in your crontab file.


**How to open a file in read only mode**

vim -r file.txt

**What is the difference between soft and hard link**
Soft links (symbolic links) and hard links are two types of links used in Unix-like operating systems to create references to files. While both types of links serve similar purposes, they have distinct characteristics and behaviors. Here's a comparison between soft links and hard links:

**Soft Links (Symbolic Links):**

- A soft link, also known as a symbolic link, is a special type of file that points to another file or directory.
- Symbolic links contain the path to the target file or directory, rather than containing the actual data of the target.
- Soft links can reference files or directories on different filesystems.
- Deleting or moving the target file or directory does not affect the soft link. However, if the target is deleted, the soft link becomes a dangling link.
- Symbolic links can be created using the ln -s command.


**Hard Links:**

- A hard link is another name (directory entry) for an existing file or directory. It directly points to the inode of the target file or directory.
- Hard links share the same inode and file data as the target file or directory.
- Hard links cannot reference directories or files on different filesystems.
- Deleting or moving the original file does not affect hard links; they still refer to the original file's inode and data. However, deleting all hard links will remove the file's data from the filesystem.
- Hard links can be created using the ln command without any options.


**Difference between break and continue statements**

- Break- breaking the execution
- Continue - skip the current and continue with the next

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/c89ed51e-029b-4fb8-b4a7-f85c32a329f7)

**Shell is dynamically typed or statically typed?**
- both python and shell are dyanamically typed means no need to specify that a variable is a string, int or float.

**Traceroute command**
- it will check how many hops its taking to reach the destination or server and how much time each hop is taking.
- Flow: trafiic from computer->router->{hops....} -> google.com

**How will you manage logs of a system that generate huge log files everyday?**
- with the help of **logrotate**
- The logrotate command is a system utility in Unix-like operating systems, including Linux, used to manage and rotate log files.
- It is typically configured to run as a daily cron job to ensure that log files do not grow too large and consume excessive disk space. logrotate renames, compresses, and/or deletes old log files according to a set of rules defined in its configuration files.




