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
- **mkdir <folder_name>** -> create a new directory
- **mkdir -p abc/def/xyz** -> creating a folder inside folder
- **pwd** -> present working directory
- **cat <file_name>** -> lists the contents of the file
- **echo "Hello world" > file.txt** -> ">" is a redirection, writing Hello world to file.txt
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
- 
- 
- 
