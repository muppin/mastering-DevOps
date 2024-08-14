## Broadridge Financials - AWS DevOps Engineer


- Tell me your roles and responsibilities?
- Why you use git?
- Features of git?
- How you work on git in your org?
- How to resolve merge conflict?
- Write declarative jenkins pipeline to fetch code from github, to package source code
- Do you know EBS volumes, how to take backup of EBS volumes?
- If u want to take backup on certain day and time, what will you do?
- Write a shell script to take backup of EBS volumes. Script should output snapshot id and must include if/else conditions.
- S3 replication,how to replicate between regions.
- Which roles to create for replication?
- Is S3 buckets region specific?
- Explain s3 replication issue with kms key.
- Write TF script to create S3
- What is ACL?
- Write TF script to create EC2 instance and use data block to call security group.
- Difference between t3.small and t3a.small.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## KPIT - AWS DevOps Engineer

- Tell me your roles and responsibilities?
- Explain your current project and domain
- What is jenkins plugins?
- What plugins you have used in your pipeline?
- How to add credentials in jenkins.
- How to create EC2 instance and what is 2/2 health checks passed?
- What is instance type?
- What is autoscaling? Autoscaling group? traget group?
- What is horizontal and vertical scaling?
- What is load balancer and its types?
- Bash script to swap two variables without third variable?
- Write a docker file.
- What is S3? Versioning? Replication?
- What is VPC? What is subnet? What is the use of subnet?
- Explain terraform flow (init -> plan -> apply)
- Terraform import
- What is spot and on-demand instances?
- How to reduce cost? Cost and billing in AWS?
- What is git?
- Merge conflict?
- What is git pull and git push?
- Naming convention for branches in git.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


## Jenkins

- Difference between freestyle and pipelien project?
- What is credentials plugin?
- What is the purpose of jenkinsfile?
- How to distribute jenkins pipeline to multiple agents?
- What happens when a Jenkins agent is offline and what is the best practice in that situation?
- How can we share information between different build steps or stages in a Jenkins Job?
- How to create & use a Shared Library in Jenkins?

For more questions : https://www.interviewbit.com/jenkins-interview-questions/#ways-to-trigger-jenkins-job

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## Dassault Systems

- Tell me about yourself and explain your day to day task which u are doing in your project
- Write a pipeline script with build, test and deploy stages.
- Interviewer has given sample snippet of pipeline and asked what is missing.
- how many types of pipelines are there in jenkins, explain them
- difference between declarative and scripted pipeline
- write a program, in which input is total of two numbers and output should be index of two numbers.
- command to find a file:  ```find <directory> -name "<filename>"```
- what is proxy server
- what are the different types of services in kubernetes
- what all task u are doing in docker and kubernetes
- explain any script that you have written in python
- how proficient are u in shell scripting
- what is etcd
- what is api server

---------------------------------------------------------------------------------------------------------------------------------------------------------------

## Thomson Reuters

- Tell me about yourself and explain your day to day task which u are doing in your project
- What automation u have done with python
- Write a python program which is taking input from user and printing max of a list
- Which deployment strategy you are using in kubernetes
- Explain pod and services and why aspect of that.
- How u used terraform.
- How u deployed terraform, manually?
- if i already have a resource created on terraform and i want to create one more but i dont want to change the config of existing one, what to do?
- how u are using terraform for different environments?
- ueverytime u are switching the workspace, is there a way to automate it? We have a dedicated Infra pipeline, which is parameterised and should be trigerred manually. We have to give Env details while trigerring.
- Where u have stored your config and .tf files?
- explain ur CI/CD pipeline
- how you are connecting your pipeline to AWS.
- How you are authenticating CI/CD Pipeline with AWS.
- How you used boto3?
- Do you know Helm?
- what task you do on Ansible?
- Difference between deamon set and stateful set?

  _______________________________________________________________________________________________________________________________________________________________

  ## PwC

  - Tell me about yourself
  - Day to day activities
  - how will u bootstrap in linux - Most modern Linux distributions use systemd as the init system. To start a software automatically with systemd, you need to create a systemd service unit file.
  - do you know systemd init file - Systemd unit files are used to describe how services, sockets, devices, mount points, and other system resources should be managed by systemd.
  - how to check linux version: ```uname -a```  OR ```lsb_release -a```  OR  ```cat /etc/os-release```
  - Write a dockerfile for installation of abc jar file on top of tomcat server
  - how will you delete container and remove associated image- docker stop, remove container then rmi (remove image)
  - A pod is having 20GB of PV and pods claim also 20 GB. Space is exhausted. What will happen to pod?
  - What is OOM error?
  - Difference between limit and request?
  - Difference between Scripted and declarative pipeline?
  - What is VPC? A Virtual Private Cloud (VPC) is a concept in cloud computing that allows an enterprise to create its own private network within a shared public cloud infrastructure. 
  - What are the components of VPC? 
  - What is config map and secrets?
  - Which encoding will you use in K8s for your secrets?
  - Is it good to use k8s provided in built encoding or u should use some other?
  - What is CIDR routing in VPC? Determines the size of VPC, alloactes the IP address.
  - What is S3, how u have used S3 in ur achitecture?
  - Explain coponents of worker node and master node?
  - What is HPA and VPA?
  - Does resource and limits signify with VPA?
  - Why we use K8s over docker?
  - What is PV?
  - What is high availability?
  - Explain the use case where u worked on HA?
  - What is route 53 used for?
  - Which deployment mechanism will you use for your Database?
  - Difference between deployment and statefulsets?
  - Have you integradted your pipeline with any SCM?
  - How to checkout the code from git?
  - Have you taken backup of etcd anytime?
 
************************************************************************************************************************************************************************************************

## Visa

- Introduce yourself
- Explain CI/CD pipeline
- How you are authenticating with argocd
- Explain git branching strategy used?
- Explain Git flow of this branching strategy?
- Difference between Hotfix and bugfix?
    - Bugfix branches are created to address bugs or issues discovered in the software during development or testing phases.
    - Hotfix branches are created to address critical issues or bugs found in the production environment that require immediate attention.
- How u are doing authentication to EKS cluster? we have to update the kubeconfig file using ``` aws eks update-kubeconfig --name your-cluster-name ```
- How many environments you have?
- How many worked nodes you have?
- How many manager(master) nodes you have? It's common to have at least three nodes running control plane components to provide redundancy and fault tolerance, but larger clusters might have more.
- Command to print nodes of k8s cluster? 
- Will the above command show both master and worker? both
- Write a python script to login into linux server, configure the repo, install jdk, tomcat, rpm, restart rpm?
- You worked on sonarqube?
- Worked on Chef or Ansible?
- Worked on java based app?
- Which build tool you are using?
- You know Maven and ANT?
- What you are using for artifact generation?
- How many repos are there in ur project?
- repo, other than git??? Linux repositories- These repositories contain software packages, along with metadata such as package descriptions, dependencies, and version information.
- Linux command to show java process running? ps -ef | grep java
- Output of this command? What all fileds will come in output?
- What is the significance of help and Man command? 
- What is Kernel?
- command to check if port is accessible.? netcat -z <ip/hostname> <port_no>
- What is Canary deployment?
- What is blue green deployment? 
- What is the use of deployment? 
- In canary deployment how will you make sure 90% traffic will go to one version and 10% will go to another version.??? define istio virtualservice and mention the destination rules.
- You know Destination Rule?
- How will you do resource planning of cluster? 
- App side vulnerabilities how will u check? static code analysis
- Server side vulnerabilities how will u check? Vulnerability Scanning with the tool named nessus, which will generate reports.
- Any security tool integrated in your CI/CD pipeline? watch a video on DevSecOps pipeline
- How will u restrict certain traffic in ur pipeline? watch a video on DevSecOps pipeline
- Do you know HELM?
- What is HELM?
- What are the templates in helm.
- Hvae you integradted HELM in argo cd?
- Write a sample docker file?
- Expalin FROM python:3.9?
- From where this base image is coming?
- Everytime you pull from internet? No we have private repo, there we manage
- Explain WORKDIR /app and COPY . /app
- Explain a usecase where u used python scripting?
- Scenario- 1- You are working on a task and another task comes from dev team, how will you handle?
- Scenario- 2- There is a prod incident call you have to join and dev wants you to join there call because they want to deliver a certain release to the client by today.
- Scenario- 3- You have to cut a cake into 8 equal parts but only 3 cuts are allowed.

************************************************************************************************************************************************************************************************************

## VISA - 2nd Round

- Introduce yourself
- Explain brancing strategy.
- How to revert to certain version?
- Git command to revert?
- How many environments do you have?
- Do yo handle prod env also?
- Explain, CI/CD pipeline
- Cross questions on stage(replacing latest image tag from build number)
- Suppose the latest image is not there? Docker deamon will check in node first if its not there it will check in registry.
- Which tools u have used in pipeline?
- Which tools u have admin access and which tools u have only usage access? 
- Explain deamon set
- What all details will be having inside deamon set? 
- What is PV and PVC
- Command to list pv and pvs?
- Out of PV and PVC which is namespace scoped?
- Difference between multibranch and normal pipeline?
- Command to authenticate credentials? WithCredentials keyword
- Command sonar scan? mvn sonar:sonar
- You are using sonarqube directly or as a plugin?
- What is target directory in sense of mvn clean package and how it is created?
- Have u seen sandbox option in jenkins? What is use of that? 
- Have u seen Manage jenkins option?
- What all u have explored in manage jenkins? 
- Do you know credentials plugin, how to install and configure?
- Python script to parse json in python and print specific parsed data. Json data given by them. 
- How would you troubleshoot docker deamon? Suppose a pod is not coming up on any node, how will you troubleshoot? 
- Difference between service and virtual service in k8s? 
- Suppose two applications have same name by mistake, how will service schedule? if both have same labels? Have u came accross such issue? 
- What is service mesh?
- What is ISTIO?
- Why we use sidecar containers?
- Why we can't deploy monitoring or logging apps in same containers? why to use separate sidecar containers? 
- What is envoy proxy? What is the use of that?
- diffewrence btwn istio and envoy proxy?
- Have u worked on any monitoring solution?
- Have u worked on any configuration mgmt tools?
- List few config mgmt tools u have heard of?
- Why we use config mgmt?
- Have you heard of Kiali?
- Which mounting stategy/options u use inside config maps?
- Have u heard of Host path?
- Apart from work what do you do?
- Why u want to switch the job?
- How will u achive work life balance with a challenging role?
- What certifications you have?
- Any future plans for personal improvement?
- Are open to work on any cloud? also on local cloud or u are bound to specific cloud?

*********************************************************************************************************************************************************************************************************************
## Visa - Hiring Manager Round

- Introduce yourself
- Day to Day task/responsibilities
- How you start your day?
- What is your team size.
- Is this your fiest job?
- Where are u based at? Have you ever been to bangalore?
- Which tool u are using to track work?
- Do you work on docker also, what task you perform on docker?
- Do you know jenkins?
- Explain your CI/CD pipeline.
- In these three years what changes u did to make infra/piple more efficient? I talked about moving to AWS secret manager from credentials plugin and about distroless images, docker build cache
- Then if a credentail is changed, how will it be updated in pipeline. I said AWS secret manger gives this feature of rotating credentails and dynamic updates.
- Hvae you worked on any of these envs- QAT/ staging
- How many container do you have in staging environment?
- How many pods can be assigned to a user? - I talked about resource quota, performance bench marking, limits, resources - based on that we can assign pods
- How many apps are there in staging env.
- How will u transfer traffic in case of issues in staging env? I talked about blue green deployment.
- explain blue green deployment?
- How will u tranfer in case of prod?
- Explain canary deployment.
- How tranfer traffic from 10% traffic to one and rest 90% to other? Destination rules.
-  How to check active pods running?
-  Which scripting u are comfortable in?
-  Explain what script you have written in python?
- Do you do field testing also?
- In these 3.9 years have you worked in same team? How many mangers got changed?
- Are you ready to reloacte and this will be work from office?
- What is your expectation from the team?
- What is your notice period and are u serving notice period?

*********************************************************************************************************************************************************************************************************************

## Cognizant - 1st Round

- Introduce yourself
- How good are you at Kubernetes? Rate yourself?
- Can you write a Kubernetes manifest files?
- Write a sample deployment manifest
- Do you know security context in deployment file?
- runAsUser and fsGroup option in k8s security policy?
- Explain network policies in K8s?
- Explain ingress and egress N/W policy type? Ingress network policies define rules for incoming traffic to pods and egress for outgoing traffic from pods.
- What is service account?
- How to add DNS record in AWS? Which service is used?
- Explain IAM roles?
- What is terraform config?
- Explain Terraform workspace?
- Have u worked on Ansible?
- Have u worked on AWS lambda function? explained delete stale EBS sanpshot usecase
- Difference between Freestyle project and pipeline?
- How u are securing jenkins? Credentails plugin
- Have u used Any other plugin other than credentails plugin gor security?
- Explain sonarqube plugin?
- What is shared library in jenkins?
- What all instructions are there in dockerfile?
- What certifications u did?

********************************************************************************************************************************************************************************************************************

## pwc Technical Round -1

- Introduce yourself
- what are your day to day responsibilities?
- On which cloud do you work?
- What AWS networking services, explain them?
- Difference between NACL and security group?
- which rule in NACL will get priority, explain?
- Explain auto scaling in AWS? And how it works, how to setuo?
- how will EC2 get to know that it has to boot certain S/W while in autoscaling group?
- Types of load balancer in AWS?
- Steps to create  ALB in AWS
- What is route53?
- How to create record?
- Difference between CNAME nad A type?
- What is CDN?
- write a script to take backup of logfile from one directory to another directory?
- write a dockerfile for installation of abc jar file on top of tomcat server?
- Difference between CMD and ENTRYPOINT?
- how will you delete container and remove associated image
- what is static pod?
- What is config map and secrets?
- which encoding will you use in K8s for your secrets?
- Is it good to use k8s provided in built encoding or u should use some other?
- A pod is having 50GB of PV and pods claim also 50 GB. Space is exhausted. What will happen to pod?
- What is PV and PVC?
- What is metrics server?
- which monitoring tools u have worked on?
- Explain prometheus architecture and grafana?
- Node exporter in prometheus?
- Which deployment mechanism will you use for your Database?
- Difference between deployment and statefulsets?
- Explain ping command?
- Explain telnet command?
- which command to use to check connectivity between two machines?
- which command to use to check accessibility of port?
- command to check CPU?
- Command to check memory?
- command to check disk usage?
- Do you know Ansible or Chef?

*********************************************************************************************************************************************************************************

## Axcess.io

- Tell me about yourself
- Roles and responsibilities
- Cloud experience
- How would you rate yourself in AWS, out of 10
- Which all services you have worked in AWS
- Difference between NACL and Security group
- A client want to deploy there application in AWS, suggest a highly available infra
- have u ever configured alarms on AWS
- Explain how to configure cloud watch alarms on EC2
- When u hit kubectl apply, what all task each component of master plane and worker plane do?
- components of dockerfile
- trunc brancking strategy?
- difference between replica set and daemon set?
- difference between PV and PVC?
- One application is running in private subnet, how will you access it on browser?
- there is a node js application and you have to deploy it to EC2, how will you automate it?

******************************************************************************************************************************************************************************


## LTIMindtree  - Technical Round 1

- Tell me about yourself
- Why u want to switch the job
- What all projects u have worked on
- Do you only work on java based or python and node.js also?
- latest version of python?
- you worked on jdk or jre?
- latest version of jdk?
- Do you write dockerfiles?
- Give a example when to use CMD and when to use ENTRYPOINT
- Command to build docker image
- command to run container
- how to attach volume in docker, command?
- Explain CI/CD pipeline
- In which language u write pipelines, is it groovy?
- Is it a declerative pipeline or a scripted one?
- Do do write pipeline from strach?
- Where you are deploying these build? On EC2 or on on-prem servers?
- how to do sonar scan?
- Do you write k8s manifests?
- do you write infra code of TF by yourself?
- Have you encountered any build failures, discuss some common cases as memory issues?
- Do you do k8s troubleshooting? Talk about some scenarios?
- What you will do if a container keeps failing?
- What is Imagepullbackoff and possible reasons?
- Where we will mention ImagePullSecret?
- Possible reasons of Crashloopbackoff?
- Apart from EKS, which other services u worked on AWS?
- What all task you do on EC2, VPC, S3 and all?
- which lang u are using for scripting?
- explain a use case where u have written a python script?
- how this script is having all details of jira?
- how u are dynamically assigning create date, due date of jira?
- 
 ************************************************************************************************************************************************************************************ 

## LTIMindtree  - Technical Round 2

- Tell me about yourself
- What are your day to day tasks
- Have you worked on Ansible
- What all playbooks you have written
- what all ansible modules you have used?
- Have you used ansible roles?
- Write a sample deployment file? Explain it.
- What is container port in deployment file.
- Explain the use of ingress
- which all manifest files we should write along with deployment in order to access the application in browser?
- What all deployment strategies u know?
- Difference between blue green and canary?
- Difference between rolling updates and canary?
- how will you tranfer 10% to v1 and 90% to v2 with the help of Load baalncer, explain the load balnc config here?
- Explain git branching startegy?
- Difference between git merge and git rebase?
- Difference between git reset and git revert?
- Write a sample jenkins file?
- what chnages will u do if u want to run certain stages parallely?
- Have you configured jenkins master, slave?
- Can u explain why we need master and slave in jenkins?
- Do you know jenkins shared library?
- how to configure a existing shared library?
- What all build triggers u have used?
- difference between SCM polling and periodically build?
- How will you do disaster recovery in jenkins, how will you take backup of jenkins master?
- Have you worked on Terraform and what kind of resources you have created?
- How will you achecive re-use in TF?
- AMI_ID is dyanamic, what all practices will you use
- Have u worked with variables and tfvars? Is it environment specific?
- Which lang u are using for scripting?
- Explain a usecase of python scripting?
- which all modules and functions you have used in git-jira API script?
- Do you know shell scripting?
- Difference between DevOps and SRE?

*************************************************************************************************************************************************************************************************************

## OPSTREE TELEPHONIC ROUND

- Default docker network
- If I want to connect two docker containers that are on different host.
- What is admission webhook in k8s?
- Best practices while deploying application on k8s.
- How will you acheive kubernetes secure pod to pod communication
- Headless service in k8s?
- How will you take backup of k8s cluster

**************************************************************************************************************************************************************************************************************

## Thomson Reuters - DevOps Enablement

## Project Description- Majorly working into github, github actions, terraform, cloud formation, AWS/Azure/GCP, few applications are on K8s.

- Tell me about yourself.
- What are your daily task and responsibilities.
- I need to pass build version in jenkins pipeline, how will I do it?
- Suppose If need to pass in mid of the pipeline?
- How will you authenticate AWS to jenkins.
- There are multiple steps in jenkinsfile, suppose static code analysis stage fails, but I still want to continue the pipeline, what I should do?
- What is the difference between quality gates and quality profiles?
- Explain a CI/CD pipeline?
- Where u will store maven dependencies?
- What all resources are required to create EC2 instance.
- App server and DB server are in same vpc in different subnet, how will they connect?
- How to access resources in side private subnet?
- Which type of resources we should store in public and what kind of resources in private?
- Where should be DB server placed?
- What all load balancers are there in AWS.
- how will u recreate infra in Terraform.- TF replace.
- Infra is created on TF and requirement is that before merging the PR, we want to do the dry run. How will you achieve this in github.
- How to remove duplicate resources from TF.
- How will you create empty git branch. -> git checkout --orphan <branch-name>
- Difference between master node and worker node in kubernetes.
- Explain ingress.
- How comfortable you are in git?
- Difference between git merge and rebase.
- Difference between Terraform Validate and Plan command.

***************************************************************************************************************************************************************************************************************

## Quantiphi

1. Introduce yourself
2. what all services you have worked on AWS?
3. Explain few usecases why u are creating EC2 instances.
4. Do you have different AWS accounts for different environments? I talked about AWS Organizations.
5. Do you know control towers?
6. What all you are doing in VPC?
7. Do you know VPC peering?
8. Explain a usecase of VPC peering, where you have implemented peering?
9. Is your EKS cluster accessible to internet.
10. Which DB service you are using AWS?
11. Both RDS instances and EKS will be in same subnet?
12. How will you implement data security in AWS and in k8s?
13. Explain one of your project, end to end?
14. Explain CI/CD pipeline which you have worked on?
15. Explain infra of ur project?
16. What are the standard practices you follow writing a dockerfile?
17. Who will write terraform modules?
18. Write a python script using boto3 to list all S3 buckets.
19. Why u used client instead of resource in above script.
20. Suppose I don't want to authenticate with client, how will authenticate locally, wjat changes will you do in above script.
21. Who is responsible for creating IAM roles/perm etc?
22. Have you worked/explored on any other AWS services apart from what u said above? I taled about Lambda and EBS stale snapshot use case?
23. Do you use shell scripts in ur pipeline.

******************************************************************************************************************************************************************************************************************

