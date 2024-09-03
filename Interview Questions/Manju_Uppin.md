## Empower

- Explain the application that you have deployed in Kubernetes application?
- what is the gateway for the kubernetes cluster?
- Difference between NACL and Security group?
- What is IRSA?
- what is difference between ClusterIP, NodePort IP, Loadbalancer IP?
- how the application in the container can able to access the other services in AWS?
- how the containers in the pod communicate each other?
- how the container in a pod can communicate to the container that is running on different pod?
- Scripting scenario based question - how to get the things from the static file that contains 100s of application and has fields like name, cpu, memory, error status and 
  get the application where it has no error? awk -F ',' '$NF == "no_error" {print $1}' static_file.csv
- how to troubleshoot if you get a timeout error while accessing it from external world? 
- how two vpcs can communicate in the aws?
- how do you manage secrets? where do you store the credentials?
- explain the cicd process and let me know what are the stages that are used in your project?
- what are the best practices of a cicd pipeline?
- what is the difference btwn ebs vs efs storage in aws?

## OpsTree

- If there are 10 resources defined in the terraform file, how will you create only two or one from it?
- where do you store the state file of terraform and also what about terraform lock file?
- what happens when you are doing terraform apply command and in the middle of the creation you hit Ctrl+C(escape), what will happen to the state file?(common scenario)(this is related to lock file -followup question)
- when does the lock being released?
- what are provisioners in terraform? why they are used?
- what are the types of provisioners?
- what are types of resource dependencies in terraform?
- what is number of parallelism that is present in terraform? (how many resources terraform can create at a particular point?)- By default, Terraform sets the -parallelism option to 10, meaning it will execute up to 10 resource operations concurrently. However, you can adjust this value **terraform apply -parallelism=n**
- to see what are the resources created in terraform, what is that command? terraform show
- have you used Terraform function??
- have you seen terraform logs??
- suppose you are creating a ec2 instance of ami of t2.micro and aws will increase the version of ami and they update the ami value... then how do update the ami value??
- explain the kubernetes architecture?
- is containerd present in Control plane?
- Have you used any add-ons with the eks?
- how did you use alb in the kubernetes application?
- how will your kubernetes know that alb should be created in which subnet?
- what is secrets? how are you managing ? what if you store the credentials in hashicorp vault?
- what are the day-to-day tasks that you do in kubernetes?
- how do you troubleshoot the scenario pod is in pending state?
- Provided me the resource.yaml file and asked me if the specified limits are correct? and asked what are the possibilities of pod starting?
- what is PDB in kubernetes?
- how is scaling done in your application? and explain the different types of scaling?
- Have you used package manager?
- what are different types of services?
- have you come accross the service mesh?
- what are the probes in kubernetes and explain?
- how to fetch the data that is stored inside the pod?
- what is eni?
- what is cdn?
- what is route53? types of records that can be created?
- what is web application firewalls?
- what are types of load balancers?
- explain network type load balancer and gateway type load balancer?
- what are the targets for the ALB? ec2 and eks?
- what are the targets for the NLB?
- what is SCP?
- how to block the certain incoming traffic to the targets?
- what is the identity provider that you guys are using?
- what are the commands for network in linux?
- which command do you use to know where the traffic is being blocked? ping, traceroute, netcat, telnet
- what is shadow file and passwd file? Refer Notes
- which type of pipeline that you guys are using and explain me the steps involved in it?
- what is difference between Continuous delivery and continous Deployment?


## Press Ganey

- How do you create the EKS clusters?
- how do you create EKS using terraform?
- how do you ensure the nodes are scaling?
- what kind of applications you have managed?
- can you eloborate how you are deploying the python application, can you explain the stages of a CI-CD stages?
- write down the Dockerfile for that Python application?
- do you have any experience in Helm?
- how you are monitoring the application logs?
- Have you created any custom Modules in terraform?
- can you write down the syntax of module block?
- explain the error crashloopbackoff in kubernetes pods?
- what are the things we need to do to establish the connection to an eks cluster in aws account from our laptop?
- if ec2 instance is showing 100% disk occupied, how to find which folder is consuming the more space?

## IDC 

- Inroduce yourself?
- what is your day to day activities in dxc?
- what is k8s?
- what is orchestration in software and DevOps?
- expalin Continous Integration?
- how are kubernetes and docker related?
- what are differences docker swarm and Kubernetes?
- Docker requires a third party tools, can you name that third party tool?
- what is ELK?
- wht are the differences when you deploy application in Docker and Hosts(Virtual Machines)?
- What are the main components Kubernets architecture?
- what are nodes and pods in kubernetes?
- what is scheduler?
- what is cluster of containers in k8s?
- what is google container engine?
- what is Demon set?
- what is heapster in K8s?
- what is minikube?
- what is kubernetes controller manager?
- what is load balancer in k8s ?
- what is Elastic load balancing?
- what is the use of terraform ?
- what are the key features of terraform?
- what is Iac?
- what are the terraform commands that you use?
- are the callbacks possible on terraform azure?
- what is terraform init?
- what is terraform d?
- why terraform is used form DevOps? what is the language ?
- what is terraform null?
- what terraform cloud?
- what is terraform backend?
- what are modules in terraform?
- what are helm charts?
- what is ansible?
- what is the methodology that you are following?

## Capgemini



## Ops Tree Telephonic round

- Introduce yourself?
- is s3 a block or object storage?
- what are types of volumes in EBS?
- list different types of storage classes?
- differnence btwn public and Elastic IP?
- what is CDN?
- difference between stateful and stateless application?
- How do you persist data in kubernetes?
- explain different probes in kubernetes?
- what are the security services u have used in AWS?
- what are the different types of aws services you have used?


## Opstree 1st technical

- can you explain me about the current project?
- can you tell me about type of pipeline you have created(multibranch) and explain me the stages involved?
- what are the resources that you are creating in kubernetes?
- do you write the manifest files??????? bit confused
- explain ingress resource?
- why do we use stateful set and why not deployments for stateful applications?
- explain daemon set and its importance?
- what kind of services you have used in aws?
- expalin the application architecture and how the traffic flows through the services in aws ?
- explain ingress controller and which one do you use??
- what types of scripting you have done? explain boto3 module and what scripts you have implementes?
- can you implement shell scripting?
- explain the different HTTP codes?
- what are client side errors?
- have you been involved in kubernetes, linux troubleshooting ??
- linux troubleshooting using network commands?
- lets say there is one ec2 instance, i am not able to another ec2 instance.. what are the possible reasons? sg rules, nacl rules(subnet level), peering is not done, incoming requests are not accepted because of memory spike
- what are the databases that you used ?
- what are the resource that you are creating in terraform?
- what is structure of your terraform file?
- have you used any Monitoring, logging tools?
- how prometheus collects the data from k8s?
- how do you achieve logging, what tools are you using??
- logging using aws service? i told cloudwatch and explained
- have you setup noSQL databases? DynamoDB
- how do you achieve security in aws infra?
- are you using VPN? what is the importance?
- what is bastion server?
- differnece between NACL and SG?
- are you using SSL certificates?
- what are types of hosted zone? what type of hosted zone you guys use??

## Opstree 2nd technical

- what EKS cluster are you guys using? - AWS managed
- types of EKS clusters? AWS managed & self managed
- Have you worked on ADD ons? examples- service mesh, prometheus, k8s dashboards, ingress controller
- Have you been part of updating cluster? No (Need to be reviewed)
- differenve between core DNS and kube-proxy? Kube-proxy is default N/W, CORE DNS- default DNS server in K8s clusters. It provides service discovery and DNS resolution capabilities within Kubernetes clusters.
- have you worked on ISTIO? what is mTLS?
- suppose i have 3 EKS clusters, what sought of security practices do you take to have a communication between them, make sure this connection is not via external DNS.(need to be reviewed)
- what is NAT gateway and where it sits? 
- difference NACL and SG?
- 3 vpcs A,B,C communication A-B, B-C, C-A has to achieve this? Transit Gateway
- what is transit gateway?
- site-to-site VPN connection?
- what is KONG? Kong is widely used in various industries to simplify and enhance API and microservices management, providing a robust solution for handling modern application architectures.
- what is service account ?
- i have pod with multiple containers, for 1 container i want to s3 full access, for 2nd i want to give iam access, 3rd i want to give ec2 access .. how to achieve ??
- write a script, get into multiple directories, list items in directories, identify the items if it is a file or anything else?
- there are two links i.e. hard links and soft links...  explain?
- write a command to get logic volumes? lvdisplay /dev/<VG_name> (VG - virtual group)
- write a command to mount a directory to path? sudo mount -o bind /source_directory /mount_point
- write a command to see a memory? free -h
- what is zombie process?  process that has completed execution but still has an entry in the process table.
- what is load average? average number of processes in a runnable or uninterruptible state over a certain period of time.
- once you trigger a pipeline, that should go and create an entire infrastructure in AWS?
- explian me CI-CD part where i dont want to have a human intervention?
- how do you test the code in jenkins pipeline? for java code.

## Nielsen Holdings

- Introduce yourself?
- in Terraform, how do you store secrects and sensitive data?
- what are your day to day activities, can you brief me about?
- can you explain me the terraform commands that you use on daily basis?
- can you tell me about what are terraform providers and what all terraform providers that you have used?
- can you explain me about your application architecture?
- explain Route53 in AWS?
- explain VPC peering, how do you accomplish?
- write a program to sort numbers in python?
- explain a CI/CD pipeline that you have implemented?
- write a shell script to reverse a string?
- how do you build a microservices architecture in aws using Terraform?
- what is Helm Chart? can you explain me about helm commands that you used?
- how Helm charts are useful in the organisation?
- how do you perform updates in aws when new versions are rolled out?
- have you used boto3 SDK, explain me the task involved in that?
- Explain me about the different layers of Lambda function?
- what is service mesh in kubernetes?

## Nielsen 2nd round
- Introduce yourself?
- explain about your project?
- List the resources that you have used in AWS?
- can you brief me about how have you used AWS WAF and an example?
- is there any limit on how many rules can you add in WAF?
- can you brief about IAM service and how have you used in your project?
- what is Federated user?
- have you worked on API gateway and Lambda function?
- explain lambda function and how did you use?
- can you give me a difference between s3 and linux file system? S3 is web based storage whereas Linux is having local disk or storage.
- you have to list the buckets of different aws environments from the ec2 instances, how do you do it?
- can you explain me about the subnets in aws and types of subnets, how to differntiate them as public and private?
- differnce between NACL and SG's?
- explain Autoscaling group and its types?
- how can you enable communication between 2 ec2 instances which are on different network ?
- explain CICD pipeline?
- how will you configure argocd tool?
- what is the file type that you are using while configuring argocd?
- what branching stratagies you have used ?
- for different environments how images are used in case of deploying?
- how do disguinsh between different environments?
- what do you mean by full fledged cluster?
- what kind of clusters are you creating? (aws managed or normal kubernetes cluster)
- are you creating clusters or any other team? (be cautious while answering)
- how do you create the EKS and can you name the resources?
- can you explain me how hosted zones are created and records in it?
- explain k8s architecture?
- can you give me examples of kubernetes troubleshooting scenario?
- how to know why pod is using so much of memory when it exits with OOMKilled error?
- when you have 2 pods in a same namespace and you do not want them to communicate each other.. how do you achieve it? use network policies 
- explain null resource in terraform?
- explain types terraform provisioners?
- explain python scripting that you have implemented?

## CGI

- can you explain the application architecture?
- what is your run time?
- what is the build tool that you have (source code build tool)?
- explain CI-CD pipeline?
- where do you use continuous delivery and continuous deployment?
- sonarqube, how do you configure it and how will the pipeline know if code fails or passes?
- what autoscaling have you used in kubernetes?
- what service does autoscaling in kubernetes?
- how manifests are different from helm charts?
- what are the default services once you create the kuberenetes cluster?
- how good you are in terraform?
- what kind of modules you have written?
- write a terraform file to create a ec2 instance with a existing subnets, dont hardcode subnet ids?
- how do you resolve the merge-conflicts?
- difference between git merge and git pull?
- how to merge code between two branches?
- when do you use git rebase?
- have you created a repos?
- suppose i dont want to push codes to certain branches? how to achieve this?
- what is multibranch pipelines?
- difference between normal pipeline vs multibranch pipeline?
- difference between IAM user and IAM role?
- suppose you dont want to allow certain CIDR block to certain port? how to achieve this..
  

## CGI onsite round

- introduce yourself and what tools are you familiar with?
- what tool are you using for CI-CD pipeline?
- Do you know GitHub actions?
- Explain CI-CD pipeline?
- where do you run the pipeline?
- what is master and slave architecture? have you configured it?
- have you built any .net core applications?
- which tool are you using for Iac?
- how do you import infrastructure from the AWS?
- where do you store your state file?
- what all aws services do you create using terraform?
- what is terraform vault?
- what type of encryption do you use in s3?
- have you used kubernetes openshift?
- what type of service do you create in your application ?
- which load balancer are you using?
- what is aws secret manager?
- what type of python scripts have you implemented?
- where do you store your secrets in kubernetes?
- where do you store your secrets in jenkins?
- how do you authenticate to aws in the pipeline?
- what is RBAC in kubernetes?
- what is the difference between PV and PVC?


### CGI CLient round

- walk me through your background?
- what tools have you worked on?
- 30% improve in efficiency in the pipeline, how did you achieve it?
- how did you find this out, was there any hindrance towards the pipeline or did you figure it out?
- have you worked on GITHUB actions?
- Explain me the complete CI-CD pipeline
- explain me the tools that you have been working on?
- why GITOPS tool?
- what is the target of gitops tool?
- have you worked on kubernetes openshift?
- what is terraform used for?
- how do you write terraform configuration files?
- what code/modules have you written?
- have you worked on any database?
- is EKS cluster managed by you or any other team?
- what day to dat tasks are carried out in Kubernetes?
- how db scripts are updated?
- again have you worked on GitHub actions and .net applications?

### Qure.ai

- write a python program to remove duplicate rows
[1,0,0,1,0],
[1,1,0,1,1],
[1,0,1,1,0],
[1,0,0,1,0],
[1,0,1,1,0],
- how to iterate through directories and also print the files using bash scripting?
- what is Docker?

### Delloite ( AWS DevOps Engineer)

- Introduce yourself and tools that you have expertised?
- difference between availability zones and availability sets?
- "          "       reserve instances and spot instances?
- "          "       NACL and SG?
- "          "       NACL and Route Tables?
- "          "       EBS and EFS?
- are ebs and efs both network type?
- explain s3 lifecycle management ?
- suppose you have 10 vpcs how do you connect each other?
- what is the number of peerings happening in the above scenario ?
- what is max number of peering connections? 50 per VPC and 125 per AWS account per region
- suppose you have ec2 instance in private subnet and it wants to connect to s3 bucket how do you achieve it?
- what are types of endpoints?
- have you heard of service endpoint and private endpoint? just expalin interface and gateway vpc endpoints
- h0w do you attach a 20TB of volume to a ec2 instance ? is it possible ? no, depends on volume type.
- what is terraform ?
- what is terraform modules?
- what is terraform tf.state file?
- have you configured the terraform backend?
- for what lock file is used?
- can 2 members at a time modify the infrastructure?
- how to create multiple resources in multi clouds?
- what is terraform import?
- suppose some one goes and creates a resouces in aws console how to get that into state file?
- what is terraform fmt?
- whay is terraform sentinal configuration?
- what are tainted resources?
- Explain kubernetes architecture?
- explain what kubernetes handle?
- explain auto healing?
- explain ingress reosurce?
- what is etcd?

### Infosys

- Why do you want to change the company?
- Introduce yourself?
- Which cloud are you using?
- my application is running on ec2 instance, ec2 is up and running, app is up and running, when i am hitting that web app url it is not working fine, what might be the issue?
- you want to copy a fine s3 to ec2 instance, what is the command?
- what is the port no of HTTPS, HTTP, DNS?
- what is DNS?
- difference btwn elastic IP and Public IP?
- recently aws released a new thing about public ip what is that?
- from 9-6 we are facing cpu utilisation, client is facing some performance issue, you have to find a solution which is cost effective .
- what is VPC?
- what is NAT gateway?
- difference IGW and Nat Gateway?
- what is mutable and immutable datatypes?
- what is init in python?
- default port of Jenkins?
- how to change the port no of jenkins?
- Changes that are made in local repo are not reflecting remote repo, what might be the issue?
- i want to make the changes in the latest commit, how can we do that?
- git commit -ammend, what is the use?
- command to change the branchname?
- command to create a branch?
- difference between git pull and git fetch?
- command to check the disk utilisation?
- what is the use of du -sh ?
- command for CPU utilisation?
- memory utilisation?
- if i have PID, how can i identify the service?
- command to troubleshoot port conflict?
- what is the use of netstat -tnpl? to list all the listening TCP ports
- you did some deployment in kubernetes pods got restarted and it shows 3/4 running, how to troubleshoot?
- how to restart a pod manually? what is the command?
- how to create namespace?
- what is kube-proxy?
- what is etcd?
- kubernetes architecture?
- what is PV and PVC?

## SAP 1st Technical

- Introduce yorself?
- what is git fetch vs git pull?
- what is git rebase?
- if you want to merge one specific commit from the feature branch to master branch, what will you do?
- what is git stash?
- what are the plugins for static code analysis?
- how do you setup sonarqube server?
- explain what sonarqube does?
- how will you notify the developers if there is qualitygate status is negative.. how will you do so?
- explain Jenkinsfile?
- what is parallel block?
- lets say you have failure in certain stage, how will you take care of these interruptions?
- how will you increase the efficiency and increase the network bandwith of the jenkins pipeline, what measures would you take? need to discuss..
- what AWS services do you use?
- What is IAM roles and IAM users?
- the JAVA application is residing in the private subnet, how will it access the other AWS services and how will the authentication takes place?
- In S3 what is full path?
- what is mutable and immutable data types?
- can list hold any type of datatypes?
- what are the scopes in python?
- she showed some lists and asked me the output?
- function related debuging?
- what is DynamoDB?
- dcoker vs vms?
- explain docker architecture?
- explain docker lifecycle?
- expalin dockerfile?
- docker volumes vs bind mounts?
- what is namespace and cgroups in linux?
- how to reduce the size of docker image?
- explain Kubernetes Architecture?
- how will Kubectl apply command works? expalin end to end
- explin Autoscaling?
- what applications use VPA?
- what is headless service?
- what is meaning of pod stuck in pending state?
- how will you troubleshoot the above case at namespace level?
- Explain Crashloopbackoff error, what leads to crashloopbackoff
- NACL vs SG?
- Explain VPC peering?
- How to access the RDS server that is residing in private subnet?
- Explain ArgoCD architecture?
- how to see the resources in kubernetes?
- what are the default namespaces?
- Have you worked on Monitoring part?

## SAP Cross LOB round

- Introduce yourself
- talk about CI-CD pipeline?
- what are the complexities that you have solved in pipeline?
- why are you using docker to containerize, why cant you use maven to dockerize..?
- what mechanism are you using for ArgoCD? pull or push..?
- Docker container as a agent.. every time you make a change to the dockerfile of an agent, you have to rebuild the image.. this takes quite lot of time to start up the agent.. this again becomes complex?
- how will you use the caches, is it from the local maven repository?
- where is local maven repository created?
- how are you using the docker? where have you installed it?
- doing all this, what outcome did you get?
- Apart from Sonarqube? what is the security tool you are using?
- how are you handling image vulnerabilities?
- What are CVE databases?
- what is your team size?
- how ArgoCD deploys the deployments into the cluster?
- what is component in the ArgoCD?
- what is CR?
- what is Application Set?
- what is application in ArgoCD?
- if there are 100s of application , how will you manage and will you write all 100s of application?
- what is appofapp?
- what is controller?
- what are types of controllers, can you name them?
- ArgoCD is a controller..can you manage ArgoCD using ArgoCd ?
- what is service-mesh?
- what are the benefits that istio is providing?
- how to achieve canary without using service-mesh?
- how will the communication takes place?
- how will you achieve blue green deployment?
- how many services you will have to use for blue green deployments?
- how will achieve high availability of prometheus?
- what is pushgateway?
- what are the pillars of observability? metics, logs, trace
- Using Trace you will find out which service is giving error.. read about Trace
- what is crossplane?

## PWC 

- Introduce yourself?
- Suppose you accidently commit a sensitive info to git.. how will you deal with this?
- suppose i am working a feature branch and you are working on another feature branch, i have made the changes and pushed it to git repo and you are not aware of these changes, what will happen?
- design a script that helps in monitoring the metrics?
- What is Log Rotation?
- suppose, i have placed a script, i used to edit and do changes.. now i dont want to do it manually.. how will you achieve it?
- there was a scenario where i had to tell to use them the ec2 user-data, talked to use custom AMI's?
- how do you define terraform for different environments?
- how do terraform knows particular environment?
- someone deletes a tf.state file ? what happens
- if suppose for different environments  have different backends(tf state file) how you are dynamically passing this file to particular environment?
- Difference between ingress and load balancer?
- Suppose i have 2 pods the app pod should start after db pod how will you achieve it?
- design a Jenkins architure, that should be effiecient enough and that should have functionality of rollback should be achieved in one go?
- what is istio and explain Cananry?
- How do you optimse Docker for reduced image size and security?
- Difference between CMD, ENTRYPOINT and RUN?
- suppose a application is residing in ec2 and it is assigned to a autoscaling group, how would you toubleshoot/?
- suppose i have ip address in a file and i want to use these ip's to ssh to the instance, how will you achieve using shell script?

## Genisys

- Introduce yourself?
- what is your day to day activities?
- what is Git Stash?
- how will you create Git token?
- how will you protect the git branch?
- what is git stash?
- what is jenkins shared library?
- which plugin do you use for secrets?
- what tasks you have performed in Jenkins?
- what is Jenkins stash?
- what is ArgoCD?
- how did you configure ArgoCD?
- how will the Sync happens in argoCD?
- what are terraform workspaces?
- what is help.tnpl file in helm chart?
- how and where do you define the dependency in helm charts?
- what is Ingress in Kubernetes?
- which all aws services you have worked on?
- how do you design a VPC architecture, Explain?
- suppose there is problem in connecting to ec2 instance, how will you troubleshoot?
- Differnce between NACL and Security Groups?
- what is command to find a process id?
- how to kill a process?

## Ciphead(TekSystems)

- Introduce yourseld?
- What is AWS IAM?
- how do you define Permissions and attach to user and roles?
- What are differnet types of staorage classes of S3?
- what task have you done on s3?
- what are triggers in lambda?
- what is SQS and SNS?
- which is publisher/subscriber in SQS and SNS?
- what is AWS Secret Manager?
- how do ypou enable dynamic rotation of secrets in aws secret manager?
- what type of deployment do you use for Production environment?
- what is difference between CI and CD?
- what is Declarative and multistage pipeline?
- how do you checkout the code from Github to Jenkins server?
- what tasks have you done on Terraform?
- suppose some one has deleted a statefile, how to deal with this?
- How will you create aws_secret_manager using terraform?
- what is terraform concurrency control?
- how will you release the lock, not forcefully? if you relase it forcefully it might affect some resorces? how tpo deal with this?
- what is terraform backend?

## First American India

- Introduce Yourself?
- what are your day-to-day tasks?
- what all the things have you done on Terraform?
- Have you configured any Infra Pipeline?
- How will you configure the backend?
- have you used Azure DevOps?
- How do you create multiple Accounts in AWS?
- Have you come accross any problems in AWS infra and did you troubleshoot any of them?
- can you show me the infra of AWS how you are managing?
- How aws access are given in the teams?
- How to Connect two VPC?
- if there are 50 vpcs , how will you connect each other?
- what are VPC Flow logs?
- EKS resides in Private Subnet, how will the public internet talk to application?
- when do you use ALB and NLB.. which suits best for?
- What monitoring tool u have used in AWS?
- do you know about cloud trail?
- Explain Python project u have been involved?
- I will give you a terraform code can you explain that fail?

## GlobalLogic

- Introduce yousrself?
- explain CI/Cd pipeline?
- how do you create EKS cluster using terraform?
- where do EKS cluster reside?
- how will the cluster be accessed?
- Explain Kubernetes Architecture?
- what if etcd crashes, what will happen to the cluster?
- if there are 10 pods and it has to be deployed on 10 different nodes, how to achieve this?
- What are daemonsets? explain the usecase?
- what are the possibilities of Crashloopbackoff error? explain? how to troubleshoot?
- what is pending state in kubernetes?
- what are limits and requests?
- what is OOMkilled error?
- write a Dockerfile for java application?
- explain the layers?
- difference between RUN and CMD?
- difference between CMD and ENTRYPOINT?
- difference btw COPY and ADD?
- how will you copy the data from the running container, any way other than docker volume?
- list running containers?
- list all container?
- how to go inside a container?
- where have you configured the jenkins in your project?
- explain jenkins master-slave architecture?
- other way to launch jenkins slave apart from ssh?
- how jenkins knows which agent the job has to use?
- what plugins have you used?
- why aws plugin is used?
- can you explain how you bring secrets from aws secret manager?
- is it require to use both secrets access id, key and IAM role assigned to ec2 server in order to make jenkins authenticate to aws ?
- explain terraform lifecycle?
- how to exclude certain resources from creating in terraform?
- how do you manages secrets in Terraform? how will you import from AWS secret manager?
- what all basic linux commands you know?
- command to know the running process?
- how to check the ports that are open?
- how to print certain columns in a file ?
- what all aws services u have worked on?
- can you tell me how you build aws architecture for 3 tier application?
- how can you distinguish between public and private route tables?
- application having trouble in accessing the RDS instance ? what might be the issue?
- Iam user should acces the eks cluster? how to configure?
- what is IRSA?


## Capco Screening round

- Introduce yourself?
- how will you make sure application that is deployed in EKS cluster is highly available?
- what is difference between replicaset and replicaset controller?
- what is difference between pod and job?
- what is kubectl command to see the revision?
- you have a docker container running and i have not assigned a port to it, how will i do it now?
- how to check the port that the container is running on?
- describe docker lifecycle?
- what is docker kill and stop?
- Why Terraform is used?
- how do you manage terraform variables?
- steps to create EKS using terraform?
- what all api services you have deployed in kubernetes cluster?



