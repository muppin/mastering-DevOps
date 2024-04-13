## Linux
- port no of http / https / ftp / dns / ssh / grafana / jenkins ? --> 80,443,21,53,22,3000,8080
- What is KERNEL PANIC Error in Linux? --> initramfs file gets corrupted or deleted.  an error that occurs when the kernel encounters a critical system failure or an unrecoverable error. It's the Linux equivalent of the Blue Screen of Death (BSOD) in Windows systems
- scp in linux , diff between scp & rsync ? scp command --> scp -pr <file_name> root@serverip:/<path>
- What is a process in Linux ? diff between orphan process vs zombie process?
- what is run level in Linux?
- Linux folder is 100% filled, troubleshoot  --> df -h , du -sh* | sort -hr | head 
- server slowness/performance issue in linux , troubleshoot --> Identify high CPU processes: ps -eo pid,ppid,%cpu,%mem,cmd --sort=-%cpu | head
- df -HT got stuck troubleshoot ( no load issue)   -->strace package
- diff between yum and rpm?  --> rpm install single package, yum installs with all dependencies.
- how to check who installed package and when ? --> yum history
- install/uninstall a package ? --> rpm -ivh <package_name> , rpm -e <package_name>
- what is special user access in Linux ?  -->setfacl /setuid /setgid /stickybit 
- what is swap memory in Linxu & how to configure it? (X2)
- change permission of File ? --> chmod 774 filename
- How to create / extend a file system? --> extend PV VG LV
- what is inode in Linux? --> node contains important metadata about the file system object including file type, permissions, file size, timestamps, ownership
- Configure TLs certificates
- where is the local user password stored in Linux? --> /etc/shadow
- NFS config file?   --> /etc/exports file
- Explain boot process in linux?
- write a cron expression to schedule a job every 1 hour --> 0 * * * * ./script.sh

## Grafana
- How did you setup grafana in your project?
- port no for grafana ?
- which metrics do you check ?
- from where does grafana fetch data to make a dashboard?

## Docker
- How to check docker logs of a container?
- how to create , enter , delete a docker container?
- What is a docker image ?
- How to remove dangling images?
- What is a Dockerfile , how to create container from dockerfile?
- check running containers in docker?

## Kubernetes
- Why do we use Kubernetes?
-  componenents of control / woker plane?
-  What is "Crash Loop Backoff" error in kubernetes?
-  What is Replicaset and Replication Controller in Kubernetes?
-  How to enter into kubernetes cluster?
-  How to check logs ?

## AWS
- what are the type of ebs?
- Private and public cloud with examples>
- steps to create ec2
- what is needed to host a website on ec2
- what is cloud front, route 53?
- what is vpc, what all resources get  created when we create a vpc
- what is a subnet?
- types of load balancer , types?
-  what is target group in aws?
-  how to acess get conmtents of s3 buckets via cli?
- what is vpc peering , how to configure?

  
## QBurst Tech (SRE Profile)
- what is special permissions in linux, explain about sticky bit . --> setuid / setgid / stickybit
- explain boot process in linux.
- how to check which ports are open in server.
- write a script to ping 10 servers at once.
- scenario - you have written a script , executed it, you want to ensure the script runs even after server reboot, how to do .
- explain about Kubernetes architecture? role of kube proxy , kubelet
- explain why we need service in kubernetes. different types. explain load balancer service in detail.
- what is headless service in kubernetes, why is it used?
- how to check how many pods are running?
- suddenly 1 pod stopped running, how to check what happened.
- what is namespace , why do we need it
- diff between CMD and ENTRYPOINT in Docker, Explain with real world scenario.
- You have to go out for next 2 days , how will you ensure your docker containers are up and running even if it restarts. (not using kubernetes , with docker context)
- in docker compose file  I have 2 applocations , I want to run only one of the applications how to do.
- what is state file in terraform?
- what will happen if state file gets deleted in terraform.
- difference between provisioners and providers in terraform.
- which resources have you created using terraform,
- while creating an instance using terraform explain what all fields are required in main.tf file.
- how are SRE Engineers different from Devops Engineers.
- Which load balancers have you used in AWS
- can we use 2 load balancers in same application
- what is sticky session in load balancers , explain with real world scenario.
- we have 3 aws accounts A,B,C, A,B are connected , B,C are connected , how to connect A,C
- how resources in vpc of account A can communicate with vpc of account C?
- how to check logs for ALB.
- what is vpc , subnet, firewall?
- when load average is very high on system , is there any effect on cpu / memory?
- what is the difference in instance health check vs system health check ? (hint 2/2 while provisioning).
- how to connect ec2 with rds , what firewall rules will you apply.

## Msys Tech (SRE Support)
- write a script that can monitor apache service at an interval of 5 mins and if its not running then log the event in logs.txt and 
  start the service
- cron entry to run script at 8:30 pm every friday
- diff between service and systemctl
- kill the process in one command (dont know the process id)
- difference between docker run vs docker exec
- difference between docker run vs cmd in dockerfile.
- how to create an image from running app
- did you write any dockerfile 
- what is kubedns, why is it used
- components of worker plane 
- what is headless service , types of services
- types of controller managers
- diff between deployment vs statefulset
- what is pdb?
- why is metrics server used?
- what is init container?
- what resources are created in default namespace when we create a cluster
- why do we stop/start instance not reboot an ec2 instance 
- A name vs AAAA name
- steps to create a custom ami

  ## Msys (L2 round)
- write a docker file from scratch?
- write a pipeline code from scratch.
- write a code for factorial of a no?
- write a script to check if  Apache service is running, if yes increase the count by 1
- when we run kubectl command what happens in background?
- have you worked with helm charts?
- what is terraform init
- we are getting huge cloud bill, how to minimise it?
- diff b/w security group and nacl?
- how do you plan an app migration running on on prem to cloud?
- what do you monitor in grafana dashboard?
- explain boot process in Linux?
- steps to create a filesystem and mount it?
- why do we use /etc/fstab
- steps/approach to create Technical docs

## VuNET Systems (L2 round)
- explain boot process in linux.
- how to check high cpu usage in server, troubleshooting steps.
- server is not booting up , troubleshoot.
- why do we use docker?
- how to establish keyless connectivity between 2 servers
- how to extend file system in Linux
- how to install / uninstall a package in linux?
- you have ran rm -rf* command, how to explain to client/manager?

## Maple Labs (L1 round)
- have you used OPENLENS.
- difference between monitoring and obeservability
- daemonsets vs stateful sets
- pvc unable to bind, troubleshoot.
- how to update version of image in docker
- how containers in same pod communicate to each other?
- what is init container?
- write a docker file to run Apache and expose ports , explain dockerfile written.
- docker file vs dockerfile.ops
- how to specify resource limits cpu memory in docker
- what is substitute to if-else in bash script -- switch -  case
- write a script to check if file exist or not.
- pods, deployment are not running, troubleshoot
- how to check which pods are consuming most resources
- tell ebout custom controllers in k8s
- explain crashloopbackoff error
- unable to connect to google dns, troubleshoot -- firewall
- write a pod yaml file which prints logs infinitely and runtime for 2 mins
- how to ensure security of metrics.
- what is elastic IP , why it is needed , is 1 ip mapped to 1 instance or many instance
- how to create eks cluster
- metrics unable to dis[play in grafana , troubleshoot.
- check which process consuming most cpu/mem resources.

## Thoughtworks
- what is versioning, version control?
- explain git workflow.
- git reset vs revert
- git pull vs fetch
- how to check git logs
- write a terraform file to create a local file.
- why we use s3, dynamodb . how can 10 users write in a single file
- useradd vs adduser in linux
- check cpu , disk i/o on windows
- setuid , setgid , stickybit implemented in real life
- public subnet vs private subnet
- what is canonical name in dns 
- vpc resources created when we create a vpc
- what is a federated user?
- what are the types of file systems in Linux, which one is better among them?

***************************************************************************************************************************************************************************************************************
## ANSWERS FOR LINUX QUESTIONS


**scp in linux , diff between scp & rsync**

`scp` (secure copy) and `rsync` are both command-line tools used in Linux for transferring files between systems. However, they have some differences in terms of functionality and usage.

Here's a comparison of `scp` and `rsync`:

1. **Purpose**:
   - **scp**: Primarily used for securely copying files between a local and a remote host or between two remote hosts over SSH.
   - **rsync**: Designed for efficient file transfer and synchronization between directories, whether they are local or remote.

2. **Transfer Mechanism**:
   - **scp**: Transfers files one by one, similar to `cp` command, and uses SSH for encryption and authentication.
   - **rsync**: Utilizes a delta-transfer algorithm to transfer only the differences between source and destination files. This results in faster transfers, especially for large files or when only a small portion of the files have changed.

3. **Usage**:
   - **scp**: Basic usage involves specifying the source file(s) and the destination, which can be local or remote. Example: `scp file.txt user@remotehost:/path/to/destination`.
   - **rsync**: Offers more advanced options for synchronization, including options for excluding files, preserving permissions and ownership, and syncing entire directories. Example: `rsync -avz source_directory/ user@remotehost:/destination`.

4. **Features**:
   - **scp**: Provides basic file copying functionality with secure encryption.
   - **rsync**: Offers features such as bandwidth throttling, partial file transfers, compression during transfer, and the ability to resume interrupted transfers.

5. **Performance**:
   - **scp**: Can be slower for large files or directories, as it transfers each file individually without optimization.
   - **rsync**: Typically faster and more efficient, especially for large files or directories, due to its delta-transfer algorithm and ability to skip files that haven't changed.

In summary, while both `scp` and `rsync` are used for transferring files, `scp` is simpler and suitable for basic file copying tasks, especially when security is a concern, while `rsync` is more powerful and efficient for synchronization tasks, especially when dealing with large files or directories.

_________________________________________________________________________________________________________________________________________________________________________________________________________________

**What is a process in Linux ? diff between orphan process vs zombie process?**

In Linux, a process is a running instance of a program. It's the basic unit of execution in an operating system, and each process has its own memory space, program code, data, and system resources.

**Orphan Process**:
- An orphan process is a process whose parent process has terminated or ended unexpectedly.
- Orphan processes are adopted by the init process (process ID 1), which is the ancestor of all processes on the system.
- When the parent process of a child process terminates, the child process becomes an orphan and is adopted by the init process.
- Orphan processes continue to run normally under the init process until they complete their execution or are terminated.

**Zombie Process**:
- A zombie process is a process that has completed execution but still has an entry in the process table.
- Zombie processes occur when a child process terminates, but its parent process hasn't yet called the `wait()` system call to retrieve the termination status of the child.
- Zombie processes consume system resources such as process table entries, but they don't consume CPU time or memory.
- Zombie processes are typically harmless, but if too many accumulate, they can exhaust system resources.

**Difference**:
- The key difference between orphan and zombie processes is their state and behavior after the parent process terminates:
  - Orphan processes are still actively running and are adopted by the init process, while zombie processes have already completed execution but still have an entry in the process table waiting for the parent process to retrieve their termination status.
- Orphan processes are potentially still performing tasks and consuming system resources, while zombie processes are essentially "dead" and are waiting to be cleaned up by the parent process.

In summary, orphan processes are active but have lost their parent process, while zombie processes are terminated but haven't been cleaned up yet.

****************************************************************************************************************************************************************************************************************
**what is run level in Linux?**


In Linux, runlevels are predefined operating states or configurations that determine which services, daemons, and processes are started or stopped when the system boots up or switches to a different runlevel. Each runlevel is associated with a specific set of system services and behaviors.

Historically, Unix-like systems used runlevels to define system states, with different runlevels representing different modes of operation. While modern Linux distributions often use other mechanisms, such as systemd targets, runlevels are still used conceptually and are often referenced.

The traditional runlevels in Linux are numbered from 0 to 6, with each runlevel having its own purpose:

- **Runlevel 0**: Halt/Shut down the system. This runlevel shuts down all processes, unmounts filesystems, and powers off the system.
- **Runlevel 1**: Single user mode or maintenance mode. This runlevel boots the system into a minimal environment, typically with only a single user logged in as the root user. It is used for system maintenance and recovery tasks.
- **Runlevel 2**: Multi-user mode without networking. Similar to runlevel 3 but without network services.
- **Runlevel 3**: Multi-user mode with networking. This runlevel starts the system with full multi-user capabilities and networking services enabled. It is the default runlevel for many server distributions.
- **Runlevel 4**: Unused or user-defined runlevel. It is not standardized and is often left unused or used for user-defined purposes.
- **Runlevel 5**: Graphical multi-user mode. This runlevel is similar to runlevel 3 but includes a graphical user interface (GUI), typically provided by a display manager such as GNOME Display Manager (GDM) or KDE Display Manager (KDM).
- **Runlevel 6**: Reboot the system. This runlevel reboots the system by shutting down all processes, unmounting filesystems, and restarting the system.

When a Linux system boots, it typically starts in a default runlevel specified in the system configuration files. The system administrator can also switch between runlevels manually using the `init` command or its alternatives like `telinit`, `systemctl`, or `runlevel`.

While traditional runlevels are still used conceptually, many modern Linux distributions have adopted systemd, which introduces the concept of targets as a more flexible and powerful replacement for runlevels. However, the basic idea of defining different system states for different purposes remains the same.

********************************************************************************************************************************************************************************************************************
**What is swap memory in linux**

In Linux, swap memory (also known as swap space or swap) is a designated area of the hard disk that the operating system uses as virtual memory when physical RAM (Random Access Memory) is full. Swap allows the system to temporarily move data from RAM to disk and vice versa, thereby freeing up physical memory for other processes.

Here's how swap memory works:

1. **Memory Management**: When a system's RAM is fully utilized, the operating system moves less frequently accessed or inactive memory pages from RAM to the swap space on the disk. This process is called swapping or paging.

2. **Performance Impact**: While swap provides a way to increase the total amount of available memory, accessing data from disk is slower than accessing data from RAM. Therefore, excessive swapping can lead to degraded performance, known as "thrashing," as the system spends more time moving data between RAM and disk than executing actual tasks.

3. **Configuration**: Swap space is typically configured during the installation of the Linux operating system. However, it's also possible to create or resize swap space after installation.

   - **Creating Swap Space**: To create a swap partition or file, you can use tools like `mkswap` and `swapon`. For example, to create a swap file named `swapfile` with a size of 1 GB:
     ```
     sudo fallocate -l 1G /swapfile
     sudo mkswap /swapfile
     sudo swapon /swapfile
     ```

   - **Enabling Swap**: To enable the swap space permanently, you need to add an entry for it in the `/etc/fstab` file. For the `swapfile` example above, you would add the following line to `/etc/fstab`:
     ```
     /swapfile   none    swap    sw    0   0
     ```

   - **Swappiness**: Swappiness is a kernel parameter that controls the tendency of the system to move processes out of physical memory and onto swap space. It ranges from 0 to 100, with lower values indicating less swapping. You can adjust the swappiness value by editing the `/etc/sysctl.conf` file or using the `sysctl` command. For example, to set swappiness to 10:
     ```
     sudo sysctl vm.swappiness=10
     ```

4. **Monitoring**: You can monitor swap usage and performance using tools like `free`, `top`, or `vmstat`. High swap usage or frequent swapping may indicate that your system is under memory pressure and may benefit from additional physical RAM.

Overall, swap memory plays a crucial role in Linux systems by providing a mechanism to handle memory overflow situations and ensure system stability, but it should be used judiciously to avoid performance degradation.

________________________________________________________________________________________________________________________________________________________________________________________________________________________

**Explain boot process in Linux**

The boot process in Linux involves several stages that initialize the hardware, load the operating system kernel into memory, and start the system services and user-space processes. Here's an overview of the typical boot process in Linux:

1. **BIOS/UEFI Initialization**: When you power on or reboot your computer, the Basic Input/Output System (BIOS) or Unified Extensible Firmware Interface (UEFI) firmware initializes the hardware components such as CPU, memory, storage devices, and input/output devices.

2. **Boot Loader**: Once the hardware is initialized, the BIOS/UEFI firmware loads and executes the boot loader. The boot loader is responsible for loading the operating system kernel into memory and initializing the kernel environment. Common boot loaders used in Linux include GRUB (GRand Unified Bootloader) and LILO (LInux LOader).

3. **Kernel Initialization**: The boot loader loads the Linux kernel (`vmlinuz`) into memory and passes control to it. The kernel initializes various subsystems, including memory management, process management, device drivers, and file systems.

4. **Init Process**: After the kernel is initialized, the init process (usually `/sbin/init` or systemd) is executed as the first user-space process. The init process is responsible for initializing the system services and user-space processes according to the configured runlevel or target. In modern Linux distributions using systemd, the init process is replaced by systemd, which acts as a system and service manager.

5. **System Initialization**: The init or systemd process reads the system configuration files, such as `/etc/inittab` (for init) or systemd unit files, to determine the system's boot behavior. It starts essential system services, mounts the file systems specified in `/etc/fstab`, and sets up the network interfaces.

6. **User Login**: Once the system initialization is complete, the login prompt is displayed on the console or graphical login manager (e.g., GDM, LightDM) on desktop systems. Users can then log in and start using the system.

7. **Graphical Environment (Optional)**: On systems with graphical desktop environments (e.g., GNOME, KDE), the user's graphical desktop session is started after login. This involves launching the window manager, desktop environment, and other graphical applications.

Throughout the boot process, various system logs (e.g., `/var/log/messages`, `/var/log/syslog`) are generated to record the events and messages from the kernel and system services, which can be helpful for troubleshooting boot-related issues. Additionally, the boot process can be customized by modifying configuration files, boot loader settings, and systemd unit files according to the system's requirements.
