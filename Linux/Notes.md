## Linux


**What is OS**
- Operating System can be defined as an interface between user and the hardware. It provides an environment to the user so that, the user can perform its task in convenient and efficient way.

  **Linux:**
  - Free
  - open source
  - secure
  - Many distributions
  - Fast
 

  **Kernel**
  - It is the heart of linux operating system. Responsible for managing computer's hardware and operations.
  - It has 4 primary responsibilities:
      - Device mgmt
      - Memory mgmt
      - process mgmt
      - handling system calls
        
- **Shell**: Shell is CLI which takes all my commands as input, interprets and tell the OS what to do.
- **Commands**: commands are the executable files.
- **Environment Variables**: to store the path, passwords(which you do not want to hardcode).

### commands
- **ls** -> lists all the files and folders in the current directory
- **ls -a** -> list all files with hidden files
- **ls -la** -> list all files and folder with hidden files with more info(long details)
- **ls -R** -> list all files inside a folder recursively
- **ls -ltr** -> lists the content of the directory in longlisting, time stamped in reverse order. l====> Longlisting. t====> time stamp. r====> in reverse order. 
- **cd <folder_name>** -> change directory
- **cd**-> it will take you to home
- **cd ..** -> one directory up
- **cd ../..** -> two directories up
- **nproc** ->  number of processing units available to the current process
- **free -m** -> to check memory
- **df -h** -> to check disk size
- **top** -> to monitor all CPU, memory and disk size.
- **ps -ef** -> to list all the process
- **awk** -> pattern search and processing
- **kill <pid>** -> kill the process
- **mkdir <folder_name>** -> create a new directory
- **mkdir -p abc/def/xyz** -> creating a folder inside folder
- **pwd** -> present working directory
- **cat <file_name>** -> lists the contents of the file
- **echo "Hello world" > file.txt** -> ">" is a redirection, writing Hello world to file.txt  ('>' will overwrite and '>>' will append)
- **man <any_command>** -> describes you about that command
- **tr a-z A-Z** -> transalates all lower case letters to upper case letters
- **echo "hello world" | tr a-z A-Z** -> "|" piping is taking the output of a first command and feeding to the second command.
- **cat file.txt** \ -> "\" lets you to write next command in a new line
- **touch file.txt** -> creates a new file
- **cp file.txt file_copy.txt** -> makes a copy of file.txt and names it as file_copy.txt and works with the folders as well
- **mv file.txt <folder_name>** -> moves the file.txt
- **mv file.txt new_file.txt** -> renames the file.txt to new_file.txt and works with the folders as well.
- **mv file.txt ../new_file.txt** -> moves the file.txt to one step below and renames it as new_file.txt
- **rm file_copy.txt** -> deletes the file_copy.txt permanently
- **rm -R <folder_name>** -> deletes the folder
- **rm -f file.txt** -> force delete
- **sudo** -> superuser do -> to execte commands that administrative permissions.
- **df** -> display the free disk space
- **df -hg** -> h stands for human readable and g in GB
- **du** -> disk usage stats
- **head -n 4 file.txt** -> shows the first 4 lines of the file, by default it shows 10 lines
- **tail -n 2 file.txt** -> shows the last 2 lines of the file, by default last 10 lines
- **diff file1.txt file2.txt** -> shows the difference between 2 files
- **locate "*.txt"** -> locates all the files ending with *.txt.
- **find .** -> gives contents of current directory.
- **find . -type d/f** -> finds directories/files in the current directory
- **find . -type f -name "*.txt"** -> finds files of name .txt in the current directory
- **find . -type f -mmin -20** -> finds files which are modified in less than 20 minutes ago
- **find . -type f -mmin +20** -> finds files which are modified more than 20 minutes ago
- **find . -type f -mmin +20 -mmin -30** -> finds files which are modified more than 20 minutes ago and less than 30 mins ago.
- **find . -type f -mtime -10** -> finds files which are modified in less than 10 days ago
- **find . -type f -maxdepth 1** -> finds files in current folder because maxdepth is 1
- **find . -type f -maxdepth 2** -> finds files in current folder and one sub folder because maxdepth is 2
- **find . -type f -mindepth 2**-> starts finding files from 1st sub folder till last sub folder recursively
- **find . -type f -size +10k** -> finds files in current directory of size more that 10kb
- **find . -empty** -> finds empty files and folders
- **find . -perm 777** -> finds files with the permissions of read, write and execute.
  ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/ff4d6819-b2ac-444d-bfd6-00ded7c36842)
- **chmod 777 file.txt/folder** -> providing read, write, execute permissions to users, groups and others for file.txt.
- **chmod 400 file.txt/folder** -> providing read to user and no permissions to groups and others
- **chown root file.txt/folder** -> changing the owner of a file to root
- **whoami** -> shows the current user
- **find . -mindepth 3 -type f -name "*.txt" -exec rm -rf {} +** deletes the files called .txt at the subfolder level 3
- **grep "<some_text>" file.txt** -> it will search for that text in file.txt.
- **grep -w "<some_text>" file.txt** -> it will search for whole word, if the input is part of word it wont return the output.
- **grep -i "<some_text>" file.txt** -> not case sensitive
- **grep -n "<some_text>" file.txt** -> tells you the line number where your text is present.
- **history** -> shows you all commands used
- **!<command_number>** -> To rerun a command from the history by its number
- **alias <alias_name>=<command>** -> temporary aliases, this works untill you close that session
- **echo "alias ll='ls -alF'" >> ~/.bashrc** -> storing the alias file in bashrc file
- **git push origin main**
   - if you want to take the cursor to the beginning of command press ctrl+a
   - if you want to take the cursor to the end of command press ctrl+e
   - if you want to delete everything after push, place the cursor after push and press ctrl+k
   - if you want to delete everything press ctrl+u
- **ls ; ls -la** -> ";" this allows you run multiple commands multiple commands one by one.
- **sort -r file.txt** -> sorts file.txt in reverse order
- **zip file.zip file.txt** -> zips file.txt and names it file.zip
- **unzip file.zip** -> unzips the zipped file

#### Users and groups
 
- **useradd <username>** -> add a new user
- **passwd <username>** -> adds the new password.
- **userdel <username>** -> deletes the user
- **groupadd <groupname>** -> adds group
- **groupdel <groupname>** -> deletes group
- **usermod -aG groupname username** -> adds username to the group
- **groups username** -> dispalys the groups of user
- **id username** -> Displays information about the current user or a specified user, including user ID (UID) and group ID (GID).
- **su username** -> switches the user
- **sudo command** -> Allows users to execute commands with the security privileges of another user (usually the root user).
- **cat /etc/passwd** -> file which shows the user related info
- **sudo cat /etc/shadow** -> The /etc/shadow file is only readable by the root user to prevent unauthorized access to sensitive password information.
- **cat /etc/groups** -> The /etc/group file in Linux contains information about user groups on the system.
- **sudo cat /etc/gshadow** -> The /etc/gshadow file in Linux is a system file that contains encrypted password and group membership information for group accounts on the system.

##### uaseradd vs adduser

- ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/4557c869-46fe-4d1c-bbb5-74780e452a3a)
- By default, useradd only creates the user account without setting up additional configurations like creating a home directory, setting the default shell, or adding the user to groups.

- ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/0aa18770-56c1-4d1b-b653-79ee51110092)
- adduser takes care of setting up default configurations, creating the user's home directory, and adding the user to common groups like the users group.
  


#### Networking commands

- **ifconfig**: Display or configure network interface parameters.
- **ip addr**: Another command to display or configure network interface parameters and versatile than ifconfig
- **ping <ip_address>/<host_name>**: Used to test the reachability of a host on a network by sending ICMP echo request packets and waiting for ICMP echo reply packets
- **traceroute google.com**: Displays the route that packets take to reach a specified destination.
- **netstat**:shows active established internet connections on your computer.
- **telnet <IP address or domain>** : is used to access remote server like SSH command, but not secure as it uses plain text.
- **hostname**: displays the syatem's hostname
- **hostanme -i**: displays the ip address
- **nslookup <domain_name>/<ip_address>**: nslookup is a powerful tool for troubleshooting DNS-related issues, such as verifying DNS records, diagnosing DNS configuration problems, and checking DNS propagation.
- **ssh**: Secure Shell protocol for secure remote login and other secure network services over an insecure network.
- **scp**: Securely copy files between hosts on a network.
- **wget/curl**: Used to download files from the internet.

***************************************************************************************************************************************************************************************

The "passwd" file and the "shadow" file are both essential files in Unix-like operating systems (such as Linux) that store user account information. They are located in the "/etc" directory.

1. **Passwd File (/etc/passwd)**:
   - The "passwd" file contains basic information about user accounts, such as username, user ID (UID), group ID (GID), home directory, and default shell.
   - Each line in the "passwd" file represents a user account, and fields are separated by colons (:).
   - Example entry in the "passwd" file:
     ```
     username:x:UID:GID:User description:Home directory:Default shell
     ```
   - Example:
     ```
     john:x:1001:1001:John Doe:/home/john:/bin/bash
     ```
   - Note: The actual password is not stored in the "passwd" file. Instead, it is typically stored in an encrypted form in the "shadow" file for security reasons.

2. **Shadow File (/etc/shadow)**:
   - The "shadow" file contains encrypted passwords and other security-related information for user accounts.
   - It is accessible only by the root user to enhance security.
   - Each line in the "shadow" file represents a user account, and fields are separated by colons (:).
   - Example entry in the "shadow" file:
     ```
     username:encrypted_password:password_last_changed:password_min_age:password_max_age:password_warning_period:password_inactive_period:account_expiration_date:
     ```
   - Example:
     ```
     john:$6$1234567890$...:18723:0:99999:7:::
     ```
   - The fields include:
     - Username
     - Encrypted password (typically using a hashing algorithm like MD5 or SHA-512)
     - Password last changed (in days since Jan 1, 1970)
     - Minimum password age
     - Maximum password age
     - Password warning period
     - Password inactive period
     - Account expiration date

The separation of password-related information into the "passwd" and "shadow" files enhances security by restricting access to sensitive password data to privileged users only.


***************************************************************************************************************************************************************************************

## logical volume (LV) 

A **logical volume** (often abbreviated as **LVM**) is a fundamental concept in Linux storage management. Let's explore what it is and why it's useful:

- **Definition**:
  - A logical volume is a **virtual block device** that appears to users and applications as a single, contiguous, and extensible disk volume.
  - It is functionally equivalent to a partition on a physical disk but offers much more flexibility.

- **Components of LVM**:
  - **Physical Volumes (PV)**: These are actual physical disks or disk partitions. Each PV has a name (e.g., `/dev/sda1`).
  - **Volume Groups (VG)**: VGs combine one or more PVs into a unified storage pool. They provide the central storage space for logical volumes.
  - **Logical Volumes (LV)**: LVs are created within VGs. They serve as the primary component that users and applications interact with.

- **Advantages of LVM**:
  - **Dynamic Resizing**: LVM makes it easy to resize logical volumes or volume groups without dealing with raw partitions. This flexibility is especially useful when you need to adjust storage space.
  - **Abstraction**: LVM abstracts away the complexities of raw disks and partitions, providing a more manageable storage layer.
  - **Snapshot and Backup**: You can create snapshots of logical volumes for backups or testing purposes.
  - **Migration**: LVM allows you to migrate data between physical volumes without downtime.

In summary, LVM provides a powerful way to manage storage by creating logical volumes on top of physical disks. It's particularly beneficial for system administrators and anyone dealing with storage scalability and flexibility. 😊 ²³⁴

********************************************************************************************************************************************************************************************************

A zombie process, also known as a defunct process, is a process that has completed execution but still has an entry in the process table. In Unix-like operating systems, when a process completes execution, it becomes a zombie process until its parent process retrieves its exit status via the `wait()` system call.

Here are some key points about zombie processes:

1. **Completion of Execution**: A zombie process is created when a child process completes execution but the parent process has not yet retrieved its exit status using the `wait()` system call. The exit status contains information about how the child process terminated, such as whether it exited normally or due to an error.

2. **Entry in Process Table**: Even though a zombie process has completed execution, it still has an entry in the process table to allow the parent process to retrieve its exit status.

3. **No Longer Running**: A zombie process does not consume any system resources other than a small amount of memory for its process table entry. It does not use CPU time or have any other active state.

4. **Cleanup by Parent Process**: It's the responsibility of the parent process to call `wait()` or a similar system call to retrieve the exit status of its terminated child processes. Once the parent process retrieves the exit status, the zombie process is removed from the process table, and its resources are released.

Zombie processes are usually harmless and temporary, but they can accumulate if the parent process does not properly handle child process termination. In extreme cases, a large number of zombie processes can consume system resources and indicate a problem with the system's process management. Therefore, it's essential for parent processes to handle the termination of their child processes correctly to prevent the accumulation of zombie processes.

***********************************************************************************************************************************************************************************************************
An orphan process is a process whose parent process has terminated or finished execution before the orphan process has completed. As a result, the orphan process is reparented to the init process (process ID 1), which becomes its new parent.

Here are some key points about orphan processes:

1. **Parent Process Termination**: Orphan processes are created when the parent process terminates before the child process. This can happen due to various reasons, such as the parent process ending unexpectedly, exiting prematurely, or being forcibly terminated.

2. **Reparenting to init Process**: When a process becomes an orphan, the init process adopts it as its child. The init process is always running and is responsible for starting and managing other processes during the system boot process.

3. **No Impact on System**: Orphan processes typically do not cause any issues or harm to the system. They continue their execution as usual, now under the supervision of the init process.

4. **Handling of Exit Status**: When an orphan process eventually completes execution, its exit status is collected by the init process using the `wait()` system call. This ensures that the system resources associated with the orphan process are properly released.

5. **Common Scenario**: Orphan processes are a common occurrence in Unix-like operating systems, especially in scenarios where a parent process spawns multiple child processes and then exits without waiting for them to finish.

Overall, orphan processes are a natural consequence of the process lifecycle in Unix-like systems. They are handled gracefully by the init process and do not pose a significant risk or burden to system stability.

*********************************************************************************************************************************************************************************************************************

To check the Linux distribution and version you are using, you can use one of the following commands:

1. **lsb_release**:
   - Use the `lsb_release` command with the `-a` option to display all available information about the Linux distribution.
   ```bash
   lsb_release -a
   ```

2. **/etc/os-release**:
   - Many modern Linux distributions provide version information in the `/etc/os-release` file. You can use the `cat` command to view its contents.
   ```bash
   cat /etc/os-release
   ```

3. **/etc/*-release**:
   - Some Linux distributions store version information in specific files like `/etc/redhat-release`, `/etc/centos-release`, `/etc/debian_version`, etc.
   - You can use the `cat` command to view the contents of these files.
   ```bash
   cat /etc/redhat-release
   ```

4. **uname**:
   - The `uname` command with the `-a` option displays system information, including the kernel version.
   ```bash
   uname -a
   ```

Each of these commands will provide information about the Linux distribution and version you are using. Choose the one that works best for your specific system and preferences.

*******************************************************************************************************************************************************************************

Certainly! The `netstat -lntp` command is used to display information about network connections and listening ports on a system. Let's break down what each part of the command does:

- `netstat`: This is the command itself, which stands for "network statistics."
- `-l`: Shows only listening sockets (i.e., ports that are actively waiting for incoming connections).
- `-n`: Displays numerical addresses instead of resolving hostnames.
- `-t`: Shows TCP connections.
- `-p`: Displays the process ID (PID) and program name associated with each connection.

When you run `netstat -lntp`, it will list all the listening TCP ports along with their associated processes. This can be helpful for troubleshooting port conflicts or identifying which services are using specific ports. 🚀🔧 ¹²³.

Source: Conversation with Copilot, 11/6/2024
(1) Netstat Command Cheat Sheet & Quick Reference. https://quickref.me/netstat.html.
(2) Command line for looking at specific port - Stack Overflow. https://stackoverflow.com/questions/12010631/command-line-for-looking-at-specific-port.
(3) Master the Linux ‘netstat’ Command: A Comprehensive Guide. https://hopeness.medium.com/master-the-linux-netstat-command-a-comprehensive-guide-6bb5a6f7e272.
(4) Using the nstat network statistics command in Linux. https://www.redhat.com/sysadmin/nstat-command-linux.
(5) How to use 'netstat' command on Windows 11 and 10. https://www.windowscentral.com/how-use-netstat-command-windows-10.
(6) en.wikipedia.org. https://en.wikipedia.org/wiki/Netstat.
