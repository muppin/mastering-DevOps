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
- what is KONG?
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
- how to create multiple resources in multi clouds?
- what is terraform import?
- suppose some one goes and creates a resouces in aws console how to get that into state file?
- what is terraform fmt?
- whay is terraform sentinal configuration?
- Explain kubernetes architecture?
- explain what kubernetes handle?
- explain auto healing?
- explain ingress reosurce?
- what is etcd?





