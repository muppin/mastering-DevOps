## Linux
- port no of http / https / ftp / dns / ssh / grafana / jenkins ? --> 80,443,21,53,22,3000,8080
- What is KERNEL PANIC Error in Linux? --> initramfs file gets corrupted or deleted
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
-  what is vpc, what all resources get  created when we create a vpc
- what is a subnet?
- types of load balancer , types?
-  what is target group in aws?
-  how to acess get conmtents of s3 buckets via cli?
- what is vpc peering , how to configure?
