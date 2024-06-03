## How to explain DevOps project in an Interview?
- I work in DXC Technology, I support multiple development teams, some of them are payments, transactions.
- Their applications are written in python.
- I support them as a DevOps Engineer by:
     - creating the CI-CD pipeline
     - Deploying their applications to the EKS cluster using CI-CD
     - creating aws services (Infrastructure) using Iac tool Terraform
     - managing the configurations of VM's using Ansible.
 



## How do you typically begin your day? / What are your daily responsibilities?

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
 

## Explain CI/CD pipeline used in your project**

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

## Explain the traffic flow of an application that is deployed on eks, the eks is in the private subnets. Consider the incoming request as HTTPS and also use Route 53, WAF?
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
  
   ```
      **AWS WAF Configuration:**
     - Create a Web ACL (Web Access Control List) in AWS WAF.
     - Define the rules and conditions to filter incoming traffic based on your security requirements. This could include rules to block malicious requests, protect against common web vulnerabilities, or allow only 
     specific IP addresses or user agents.
     - Associate the Web ACL with the ALB listener to inspect and filter incoming requests.
     **Integration:**
     - Update the ALB listener to forward incoming HTTPS traffic to the target group associated with your application servers.
     - Ensure that the ALB security group allows inbound HTTPS traffic from the internet.
     - Verify that the Route 53 DNS record is correctly configured to route traffic to the ALB.
   ```

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

**How ALB is going to created**

- We have IRSA created and attached to nginx controller pod , which is deployed by nginx controller.
- so this pod will have the IAM role to create a ALB load balancer in the public subnet.
- then the ALB gets created on the PUBLIC subnet.

********************************************************************************************************************************************************************************************************************

## Linux based questions

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

## Python Projects

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
- we have made use of decorators before the API/function definition for the authentication purpose, i.e. the authentication/authorisation action runs before function execution.
- so this python API is running on an ec2 server and the ec2 url with port and path is configured in the github webhooks.
- once the github webhook is congigured, now the automation works whenever /jira is commented under the issue a jira issue gets created.

##  Do you write your own modules in terraform?

When answering the question, "Do you write your own modules in Terraform?" you can provide a comprehensive response that showcases your understanding and experience with Terraform modules. Here’s a structured way to answer:

### Affirmative Response with Details

1. **Direct Affirmation**:
   - **Yes, I write my own modules in Terraform.**

2. **Describe the Purpose**:
   - **Purpose of Writing Custom Modules**:
     - I write custom Terraform modules to encapsulate and reuse common configurations across different projects. This helps in maintaining consistency, reducing code duplication, and simplifying complex infrastructure setups.

3. **Examples of Modules**:
   - **Examples of Custom Modules**:
     - For instance, I have written modules for managing VPCs, EC2 instances, IAM roles, and security groups in AWS. These modules include parameterized inputs to allow flexibility and reusability.

4. **Approach and Best Practices**:
   - **Approach and Best Practices**:
     - When writing modules, I follow best practices such as:
       - Keeping modules focused on a single responsibility.
       - Using meaningful variable names and providing default values where appropriate.
       - Including comprehensive documentation and examples within the module.
       - Writing outputs that provide necessary information for other parts of the infrastructure.
       - Implementing versioning to manage changes and ensure backward compatibility.

5. **Collaboration and Sharing**:
   - **Collaboration and Sharing**:
     - I also collaborate with team members to develop and maintain these modules. We host our modules in a version-controlled repository (e.g., GitHub) and use Terraform Registry or private registries for sharing within the organization.

6. **Experience and Learning**:
   - **Experience and Learning**:
     - Writing my own modules has significantly improved my understanding of Terraform and infrastructure as code principles. It also enables me to contribute to the standardization of infrastructure practices within the team or organization.

### Sample Response

"Yes, I write my own modules in Terraform. I often create custom modules to encapsulate specific configurations, such as VPCs, EC2 instances, and security groups, to promote reusability and maintain consistency across different projects. When developing these modules, I adhere to best practices by focusing on single responsibilities, using clear variable names, and including thorough documentation. Additionally, I collaborate with my team to maintain these modules, hosting them in a version-controlled repository and sharing them through Terraform Registry. This practice not only streamlines our infrastructure management but also enhances my proficiency with Terraform and infrastructure as code."

This answer demonstrates your technical expertise, understanding of best practices, and collaborative approach, providing a comprehensive overview of your capabilities with Terraform modules.

## Normally what is the type of service used in your application?

When you have an Ingress resource in Kubernetes, it typically routes external HTTP/HTTPS traffic to services within the cluster. The type of service that the Ingress routes to is generally a `ClusterIP` service. This is because `ClusterIP` services are intended to be accessible only within the cluster, and the Ingress controller handles the external accessibility.

### Typical Setup with Ingress and Service Types

1. **Ingress Resource**: Manages external access to the services, usually HTTP/HTTPS, providing load balancing, SSL termination, and name-based virtual hosting.
2. **Service Resource**: Exposes the application running on a set of Pods as a network service.

### Service Types in Kubernetes

- **ClusterIP**: Exposes the service on a cluster-internal IP. This is the default type and makes the service only reachable from within the cluster.
- **NodePort**: Exposes the service on each Node's IP at a static port (the NodePort). A ClusterIP service, to which the NodePort service routes, is automatically created.
- **LoadBalancer**: Exposes the service externally using a cloud provider's load balancer. A ClusterIP and NodePort service, to which the external load balancer routes, are automatically created.

### Typical Configuration

#### Ingress Resource
An Ingress resource defines how external HTTP/HTTPS traffic should be routed to services within the cluster.

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: example-ingress
  namespace: default
spec:
  rules:
  - host: example.com
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: example-service
            port:
              number: 80
```

#### Service Resource
A ClusterIP service typically backs the Ingress resource.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: example-service
  namespace: default
spec:
  selector:
    app: example
  ports:
  - protocol: TCP
    port: 80
    targetPort: 8080
  type: ClusterIP
```

### Explanation

- **Ingress Resource**: Defines that HTTP traffic to `example.com` should be routed to `example-service` on port 80.
- **Service Resource**: A `ClusterIP` service named `example-service` routes traffic to Pods with the label `app: example` on port 8080.

### Why ClusterIP?

- **Internal Routing**: `ClusterIP` services are designed to be used within the cluster. The Ingress controller can access these services directly.
- **Security**: By using `ClusterIP`, you limit the exposure of your services to within the cluster. External access is managed and controlled by the Ingress, providing a single entry point and enhancing security.
- **Simplicity**: Managing services with `ClusterIP` in conjunction with Ingress simplifies the architecture, focusing external exposure and management through Ingress rules.

### Additional Considerations

- **Ingress Controller**: Ensure that you have an Ingress controller (like NGINX, Traefik, etc.) deployed in your cluster, which watches for Ingress resources and configures the necessary routing.
- **Annotations**: Depending on the Ingress controller, you might need to add specific annotations to the Ingress resource for additional configurations such as SSL, redirects, etc.

By using a `ClusterIP` service with an Ingress resource, you leverage Kubernetes' internal networking capabilities while efficiently managing external traffic through a single entry point.



