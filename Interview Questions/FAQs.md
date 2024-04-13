### How to explain DevOps project in an Interview?
- I work in DXC Technology, I support multiple development teams, some of them are payments, transactions.
- Their applications are written in python.
- I support them as a DevOps Engineer by:
     - creating the CI-CD pipeline
     - Deploying their applications to the EKS cluster using CI-CD
     - creating aws services (Infrastructure) using Iac tool Terraform
     - managing the configurations of VM's using Ansible.
 



### How do you typically begin your day? / What are your daily responsibilities?

- I initiate my day by checking Outlook, Slack, and Teams.
- This allows me to see if any new Jira tasks have been assigned to me or if there are any updates on existing Jira tasks. I also review if my pull requests have been merged or approved, and I welcome any feedback on them.
- I participate in daily or weekly sync-up calls regarding Jira stories.
- I monitor Teams and Slack messages and respond to them promptly.
- Following that, I commence work on the assigned Jira tasks.
- My tasks typically include:
  - Exposing application metrics on Prometheus and visualizing them on Grafana.
  - Developing automation scripts.
  - Managing databases.
  - Creating and maintaining playbooks.
  - Troubleshooting issues.
  - Managing CI/CD pipelines, which involves using CircleCI to build images, pushing them to Amazon ECR, and deploying Docker images.
  - Writing YAML manifests for Kubernetes pods, services, etc.
  - Provisioning infrastructure on AWS.
  - Participating in on-call rotations, including PagerDuty calls.
  - Addressing incidents and alerts, such as those related to memory/CPU utilization or pod crashes.
 

### Explain CI/CD pipeline used in your project**

*Checking out the code from source code repo* -  Checkoiut happens automatically since jenkins file is present in repo.
while creating CI/CD pipeline - Configure:
- For that we have configured both push notifications(from github webhook) and polling (jenkins will continously look for changes and poll it).
- We have configured polling for every 30 mins.

**Stage 1 - Build** 
- We have dockerfile in our git repo
- We are using docker build to build the image out of the dockerfile

**Stage 2 - Push to image repo**
- we are pushing the images to AWS ECR.
- ECR - Amazon Elastic Container Registry (Amazon ECR) is a fully managed container registry, its a private repo.
- Authenticate to AWS ECR, docker and then tag it and push it

**Stage 3 - Update Deployment File**
- Once the images are build and pushed to the ECR, then in order to use the latest image in K8s cluster, we have dedicated stage
- We have written a shell script to update the git manifest repo, git maifest repo holds all the k8s manifests
- sed -i "s/replaceImageTag/${BUILD_NUMBER}/g" java-maven-sonar-argocd-helm-k8s/spring-boot-app-manifests/deployment.yml
- Basically the above command wil replace the image tag with the build number so that latest image in used in k8s cluster

**ArgoCD Application Configuration:**
Define the application configuration for ArgoCD, specifying details like the Git repository URL, path to Kubernetes manifests, and synchronization settings.

**ArgoCD Deployment:**
ArgoCD continuously monitors the Git repository for changes. When changes are detected, ArgoCD deploys the updated application to the EKS cluster, ensuring the desired state matches the configuration in the Git repository.

****************************************************************************************************************************************************************************************************************

### Linux based questions

**How can you diagnose latency between AWS resources?**
- Initially il check with ping command followed by the IP address or hostname of the target resource to check connectivity and measure round-trip latency.
  ``` ping IP_address_or_hostname```

**What was that round trip ? How would you measure ?**
- When you use the ping command in Linux, it sends a small packet of data to the target server and waits for a response. The time it takes for the packet to travel to the server and back to your computer is the round trip latency.
- I will also use the traceroute command followed by the IP address or hostname of the target resource to trace the path packets from your machine to the target, showing latency at each hop.
 ``` traceroute IP_address or hostname```

**what is netcat command?**
- Netcat Command, i will Use the nc command to test network connectivity and measure latency between two machines by establishing a TCP connection.
  ```nc -z IP_address or hostname port_number```
  - **What is -z in the above command?**
  - So when you use -z you're telling nc to check if the specified port on the target machine is open or reachable. If the port is open, you'll typically receive a response indicating that it's open, and if it's closed, you won't receive any response.
 

### AWS Based questions 

**My client has a highly sensitive application deployed in an Amazon hashtag#VPC (Virtual Private Cloud) within their AWS account. The application needs to securely access AWS services such as Amazon S3 and Amazon DynamoDB without the public internet. Additionally, these services are restricted to only the resources within their VPC. How will you achieve this, and could you explain step by step?**
- VPC endpoints will allow the servers inside the VPC to communicate with other AWS services internally without going through the internet. We have two types of endpoints:
Gateway endpoints and Interface Endpoints.
- Gateway endpoints are used for S3 and DynamoDB, while Interface endpoints will create a network interface on a corresponding subnet. By implementing VPC Endpoints, we can avoid the cost of NAT gateway which is $0.045/hour and S3 $0.045/GB, along with the data transmission prices.

**You lost both PEM and PPk file how will you try to connect to your Instance ?**
- Create a role > select Ec2 >search for  “managed instance core”  select it > again search for “ ssmf “  > and click on create a role
- Attach the iam role to the instances you want to login
- Got to management and governance > click on  “AWS systems manager”  > under drop down select “ Sessions Manager  ” > start session > her you will see you server > Select the server you wanted to login and start session.
-         Bash 
-         Sudo su –
-         Nano etc/ssh/sshd_config
-         Come down and search for “password authentication disabled “
-         change it to "PasswordAuthentication yes
-         Save and Exit
-         sudo service ssh restart
-         Set a password for the user you want to use to log in: sudo passwd username

- Connect to the instance using SSH: ssh username@instance_ip. When prompted, enter the password you set for the user.

**Walk me through the concept of VPC flow logs and explain their significance in a cloud environment**
- refer this https://www.youtube.com/watch?v=6CjIT068Ss0&t=6s
