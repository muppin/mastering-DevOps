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
  get the application where it has no error?
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
- which command do you use to know where the traffic is being blocked?
- what is shadow file and passwd file?
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
