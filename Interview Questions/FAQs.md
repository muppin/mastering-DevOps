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


```pipeline {
    agent any
    
    triggers {
        pollSCM('H/30 * * * *')
        githubPush()
    }
    
    stages {
        stage('Build') {
            steps {
                script {
                    // Build Docker image from Dockerfile
                    docker.build('your-image-name:latest', '-f path/to/Dockerfile .')
                }
            }
        }
        
        stage('Push to Image Repo') {
            steps {
                script {
                    // Authenticate to AWS ECR
                    withCredentials([usernamePassword(credentialsId: 'aws-ecr-credentials', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                        sh 'aws ecr get-login-password --region your-region | docker login --username AWS --password-stdin your-account-id.dkr.ecr.your-region.amazonaws.com'
                    }
                    
                    // Tag and push Docker image to AWS ECR
                    docker.image('your-image-name:latest').push("your-account-id.dkr.ecr.your-region.amazonaws.com/your-image-name:${env.BUILD_NUMBER}")
                }
            }
        }
        
        stage('Update Deployment File') {
            steps {
                script {
                    // Update deployment file with latest image tag
                    sh 'sed -i "s/replaceImageTag/${env.BUILD_NUMBER}/g" java-maven-sonar-argocd-helm-k8s/spring-boot-app-manifests/deployment.yml'
                }
            }
        }
        
        stage('ArgoCD Application Configuration') {
            steps {
                // Define application configuration for ArgoCD
                // Example: arcdocd app create my-app --repo https://github.com/your-repo.git --path path/to/manifests --sync-policy auto
            }
        }
        
        stage('ArgoCD Deployment') {
            steps {
                // Deploy application using ArgoCD
                // Example: argocd app sync my-app
            }
        }
    }
    
    post {
        success {
            echo 'CI/CD pipeline completed successfully'
        }
        failure {
            echo 'CI/CD pipeline failed'
        }
    }
}
```

****************************************************************************************************************************************************************************************************************

- **Explain the traffic flow of an application that is deployed on eks, the eks is in the private subnets. Consider the incoming request as HTTPS and also use Route 53, WAF?** 
  Certainly! Let's walk through the traffic flow of an application deployed on Amazon Elastic Kubernetes Service (EKS), where the EKS cluster is in private subnets. We'll include incoming HTTPS requests, Route 53 for DNS resolution, and AWS WAF (Web Application Firewall) for added security.

1. **Client Request (HTTPS):**
   - A user initiates an HTTPS request by accessing the domain name of your application (e.g., www.example.com) in their browser.

2. **DNS Resolution with Route 53:**
   - The domain name is resolved to an IP address using Route 53.
   - Route 53 is configured to direct traffic to an Application Load Balancer (ALB) or Network Load Balancer (NLB) in your public subnet.
   - We have craeted a "A" record which is resolving the incoming Domain name to public DNS of ALB/NLB

3. **ALB/NLB Handling Incoming Traffic:**
   - The ALB/NLB serves as the entry point for incoming HTTPS traffic.
   - It may have a listener configured to terminate SSL/TLS and forward the decrypted traffic to the EKS cluster.

4. **Ingress Controller in EKS Cluster:**
   - An Ingress controller within the EKS cluster manages external access to services.
   - The Ingress controller may be configured to route incoming requests based on path-based or host-based rules to specific services in the cluster.

5. **Internal Load Balancing within EKS:**
   - Services within the EKS cluster may be exposed through internal LoadBalancer services, distributing traffic among pods.

6. **Application Processing in EKS Pods:**
   - Pods running your application receive the HTTPS requests and process them within the EKS cluster.

7. **Database Interaction or Other Backend Services:**
   - Your application within the EKS cluster may interact with databases or other backend services, which could be in private subnets or other secure configurations.

8. **Outbound Communication:**
   - If your application needs to communicate with external services, it can do so through NAT gateways or NAT instances in the private subnets.

9. **AWS WAF for Security:**
   - AWS WAF can be configured to protect your application from common web exploits.
   - It can inspect and filter incoming HTTPS traffic based on predefined rules or custom rule sets to block malicious requests.

10. **Response to Client:**
    - The application generates an HTTPS response, which is sent back through the EKS cluster, the ALB/NLB, and Route 53 to the client.

This setup ensures that your EKS cluster remains in private subnets for enhanced security, while Route 53 and AWS WAF contribute to the secure and reliable handling of incoming HTTPS traffic.

**Recommendation:**

**Configure Route 53:** Start by configuring Route 53 to manage your domain's DNS and direct traffic to your AWS resources.
**Implement AWS WAF:** Once traffic is flowing through Route 53 to your AWS resources, consider implementing AWS WAF to enhance the security of your web applications.
By combining Route 53 and AWS WAF, you create a more comprehensive solution for managing and securing incoming web traffic to your AWS environment.

********************************************************************************************************************************************************************************************************************

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

### Python Projects

**Can you explain me about your python project?**
- we had a problem statement where QE Engineers comes across a bug and creates an GitHub issue.
- one of the members of the GitHub repo has to respond to the created issue, if the issue is not valid they close it. if the issue is valid they create a jira ticket to track the amount of work being done.
- so on daily basis there would be like multiples of issues, the repo member cannot go and create a jira for every single issue, so we have automated the process using python script to generate a jira ticket.
- when a repo member comments /jira under the issue, the jira ticket is created.

- the implementation is below shown:
- ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/11f64e53-b4e0-46b6-84e8-84fd3c11835e)

- ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/9c5e50e1-f2db-4978-b454-852bb0996739)

- we have automated GitHub and JIRA integration using python
- Firstly GitHub will talk to python API, i.e. github webhooks will push the json input, then python script is interacting with JIRA API to create a JIRA ticket.
- yeah we have written a python script that creates a jira issue.
- we have converted the python script to API using FLASK
- we have made use of decorators before the API for the authentication purpose, i.e. the authentication/authorisation action runs before function execution.
- so this python API is running on an ec2 server and the ec2 url with port and path is configured in the github webhooks.
- once the github webhook is congigured, now the automation works.




