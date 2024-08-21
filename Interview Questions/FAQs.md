## How to explain DevOps project in an Interview?
- I work in DXC Technology, I support multiple development teams, some of them are payments, transactions.
- Their applications are written in python.
- I support them as a DevOps Engineer by:
     - creating the CI-CD pipeline
     - Deploying their applications to the EKS cluster using CI-CD
     - creating aws services (Infrastructure) using Iac tool Terraform
     - managing the configurations of VM's using Ansible.

 ________________________________________________________________________________________________________________________________________________________________________________________


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

_________________________________________________________________________________________________________________________________________________________________________________________
 

## Explain CI/CD pipeline used in your project**

*Checking out the code from source code repo* -  Checkout happens automatically since jenkins file is present in repo.
while creating CI/CD pipeline - Configure:
- For that we have configured both push notifications(from github webhook) and polling (jenkins will continously look for changes and poll it).
- We have configured polling for every 30 mins.

**Stage 1 - Build & Unit Test** 
**Purpose**:
- The Java application is built using Maven, and unit tests are executed to ensure the code's functionality. The build process generates a packaged artifact, typically a JAR file, that will be containerized later.
**Key Actions**:
- mvn clean package command:
          - Clean: Deletes the previous build artifacts to ensure a fresh build.
          - Package: Compiles the code, runs the unit tests, and packages the application into a JAR file.
          - Outcome: The JAR file is generated in the target directory.

**Stage 2 - Static Code Analysis**
**Purpose**:
- The code is analyzed using SonarQube to detect code quality issues such as bugs, code smells, and security vulnerabilities. This step improves code reliability and security.
**Key Actions**:
- he mvn sonar:sonar command runs the SonarQube analysis.
- SonarQube: The results are sent to a SonarQube server, where the code's health is assessed and reported.

**Stage 3 - Docker Build**
- **Purpose**:
The Java application is containerized by building a Docker image. The Docker image bundles the application with its dependencies and runtime environment, ensuring consistent deployment across different environments.
- **Key Actions**:
- A Docker image is built using a Dockerfile that specifies the base image (OpenJDK 11), copies the JAR file into the container, and sets the entry point to run the application.
- Outcome: The Docker image is tagged with the build number to uniquely identify the version.

**Stage 4 - Docker Image Scanning**
- **Purpose**:
The Docker image is scanned for vulnerabilities using Trivy. This ensures that the containerized application is free of known security issues before being deployed to production
- **Key Actions**:
- Trivy scans the Docker image and reports any vulnerabilities.
- The scan can be configured to fail the pipeline if vulnerabilities of a certain severity (e.g., HIGH) are found, enforcing security best practices.

**Stage 5 - Push Docker Image to registry**
- **Purpose**:
The built and scanned Docker image is pushed to a container registry (e.g., AWS ECR). This registry acts as a centralized location where the Docker images are stored and versioned.
- **Key Actions**:
The Docker image is pushed to the configured registry with the build number as the tag, making it available for deployment.

**Stage 6 - Update Kubernetes Manifests**
- **Purpose**:
The Kubernetes manifests (YAML files) are updated to reference the new Docker image version. This ensures that the Kubernetes cluster uses the latest version of the application during deployment.
- **Key Actions**:
- The sed command replaces the placeholder image tag in the Kubernetes deployment manifest with the current build number.
= The updated manifests are committed and pushed back to the Git repository, where they are monitored by ArgoCD.
- We have written a shell script to update the git manifest repo, git maifest repo holds all the k8s manifests
- sed -i "s/replaceImageTag/${BUILD_NUMBER}/g" java-maven-sonar-argocd-helm-k8s/spring-boot-app-manifests/deployment.yml

**ArgoCD Sync**
- **Purpose**:
ArgoCD is used to automatically deploy the updated application to the Amazon EKS cluster. ArgoCD continuously monitors the Git repository for changes and synchronizes the cluster to match the desired state defined in the manifests.
- **Key Actions**:
- ArgoCD detects the changes in the Git repository (i.e., the updated image tag) and deploys the new version of the application to the EKS cluster.
- If manual sync is required, ArgoCD CLI or API can be used to trigger the deployment.

**Post Steps**
- **Purpose**:
The post-steps handle the outcome of the pipeline, whether it succeeds or fails. This stage is used to send notifications and perform any cleanup actions.
- **Key Actions**:
- **Success**: Send notifications (e.g., Slack, email) to inform the team that the deployment was successful.
- **Failure**: Notify the team of any issues and trigger failure-handling mechanisms such as rolling back the deployment or marking the build as unstable.

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

****************************************************************************************************************************************************************************
### Higly Available Infrastructure - AWS - Example

To ensure a highly available infrastructure on AWS, you can design a multi-tier architecture that leverages various AWS services. Here is a recommended approach:

### 1. **VPC and Networking**
   - **Virtual Private Cloud (VPC):** Create a VPC to host your infrastructure, allowing you to define network boundaries and control inbound and outbound traffic.
   - **Subnets:** Create multiple subnets across different Availability Zones (AZs) to ensure redundancy.
   - **Internet Gateway:** Attach an Internet Gateway to the VPC for internet access.
   - **NAT Gateway:** Use a NAT Gateway in each public subnet to allow instances in private subnets to access the internet.

### 2. **Compute Layer**
   - **Elastic Load Balancer (ELB):** Deploy an Application Load Balancer (ALB) or Network Load Balancer (NLB) to distribute incoming traffic across multiple instances.
   - **Auto Scaling Group (ASG):** Set up an ASG with instances spread across multiple AZs to ensure high availability and scalability.

### 3. **Application Layer**
   - **EC2 Instances:** Deploy your application on EC2 instances within the ASG. Ensure they are distributed across multiple AZs.
   - **Elastic Container Service (ECS) or EKS:** Consider using ECS or EKS for containerized applications to simplify scaling and management.

### 4. **Database Layer**
   - **RDS (Relational Database Service):** Use Amazon RDS with Multi-AZ deployment for high availability. For example, use RDS for MySQL, PostgreSQL, or Aurora.
   - **DynamoDB:** For NoSQL databases, DynamoDB is inherently highly available and scalable.
   - **ElastiCache:** Use ElastiCache for caching to improve application performance and reduce load on the database.

### 5. **Storage Layer**
   - **S3 (Simple Storage Service):** Use S3 for storing static files, backups, and other objects. It provides 99.999999999% durability.
   - **EFS (Elastic File System):** Use EFS for shared file storage that can be mounted by multiple instances across AZs.

### 6. **Security**
   - **IAM (Identity and Access Management):** Define roles and policies to control access to AWS resources.
   - **Security Groups and NACLs:** Use Security Groups and Network ACLs to control inbound and outbound traffic at the instance and subnet level.

### 7. **Monitoring and Logging**
   - **CloudWatch:** Use CloudWatch for monitoring and alerting on metrics, logs, and events.
   - **CloudTrail:** Enable CloudTrail for logging API calls and tracking user activity.

### 8. **Backup and Recovery**
   - **Snapshots:** Regularly take snapshots of EBS volumes and RDS instances.
   - **S3 Glacier:** Use S3 Glacier for long-term archiving of data.

### Example Architecture Diagram
1. **Public Subnets**: Contain ALB and NAT Gateway.
2. **Private Subnets**: Contain EC2 instances, RDS, and other application components.
3. **Multiple Availability Zones**: Distribute resources across at least two AZs.

### Steps to Implement:
1. **Create a VPC:** Use the VPC Wizard or AWS Management Console to create a VPC with multiple subnets across different AZs.
2. **Set up Internet and NAT Gateways:** Attach an Internet Gateway to the VPC and create NAT Gateways in public subnets.
3. **Launch EC2 Instances:** Create an ASG and launch EC2 instances across multiple AZs.
4. **Configure Load Balancer:** Set up an ALB to distribute traffic to the EC2 instances.
5. **Deploy Database:** Set up RDS with Multi-AZ deployment or use DynamoDB.
6. **Configure Security:** Set up IAM roles, Security Groups, and NACLs.
7. **Enable Monitoring:** Configure CloudWatch and CloudTrail for monitoring and logging.
8. **Set up Backup:** Schedule EBS snapshots and configure S3 for backups and archiving.

This infrastructure ensures high availability, scalability, and fault tolerance for your client's application on AWS.

*************************************************************************************************************************************************

## What’s your salary expectation?

Case 1: You desperately need this job

Ans: I am looking for a salary package which is align with market standards based on my skillset and job profile.


Case 2: You already have at least 1 offer

Ans: I am already getting interviewed for {this role} by couple of other companies. I am getting package in the range {X-Y}.
Considering my skillset and vast experience in this technology, I feel my profile is very much aligned with job role. Hence looking for package in {X-Y} range 

Case 3: Want to negotiate aggressively

Thank you for the offer. Based on my research and experience, 
I believe my skills and contributions align with best IT industry standards.
However, I was hoping for a salary closer to [specific higher amount]. Given my [mention specific achievements or skills], I believe this adjustment reflects my value and commitment to driving results for {company_name}.

_____________________________________________________________________________________________________________________________________________________________________________________

## Why Three master Nodes Specifically in Kubernetes Cluster?


- Minimum for High Availability: Three nodes are the minimum number required to provide fault tolerance and high availability in a distributed system. With two nodes, the failure of one would result in a lack of majority, making the system unavailable. With three nodes, the system can tolerate the failure of one node and still maintain a majority(Quorum).
- Cost and Complexity Balance: Three nodes strike a balance between the cost of additional resources and the complexity of managing the cluster. More nodes can provide higher availability, but also come with increased operational and financial costs. Three nodes are often seen as a sweet spot for many use cases.
Conclusion
- In summary, having three master nodes in a Kubernetes cluster is essential for ensuring high availability, fault tolerance, load balancing, redundancy, and reliability. This configuration allows the cluster to continue functioning smoothly even in the event of a node failure, providing a robust and resilient infrastructure for running applications.

_______________________________________________________________________________________________________________________________________________________________________________________

## How to reduce the size of a docker image?

Reducing the size of a Docker image is essential for improving performance, reducing network bandwidth usage, and speeding up deployment times. Here are several strategies to minimize Docker image size:

### 1. **Use a Smaller Base Image**
   - **Choose Minimal Base Images**: Start with a smaller base image such as `alpine`, `busybox`, or `scratch` instead of larger ones like `ubuntu` or `debian`.
   - **Example**: Instead of using `FROM ubuntu:latest`, you could use `FROM alpine:latest` which is significantly smaller.
   - **Considerations**: Smaller base images may require you to manually install certain utilities or dependencies that are included in larger images.

### 2. **Multi-Stage Builds**
   - **Build and Copy Only What’s Needed**: Use multi-stage builds to compile or build your application in one stage and then copy only the necessary files to a minimal final stage.
   - **Example**:
     ```Dockerfile
     # Stage 1: Build
     FROM golang:alpine AS builder
     WORKDIR /app
     COPY . .
     RUN go build -o myapp

     # Stage 2: Create the final image
     FROM alpine:latest
     WORKDIR /app
     COPY --from=builder /app/myapp .
     CMD ["./myapp"]
     ```
   - **Benefit**: The final image only contains the compiled binary and essential runtime dependencies, not the entire build environment.

### 3. **Minimize Layers**
   - **Combine Commands**: Each `RUN`, `COPY`, or `ADD` command in a Dockerfile creates a new layer. Combining commands into a single `RUN` statement can reduce the number of layers.
   - **Example**:
     ```Dockerfile
     # Instead of:
     RUN apt-get update
     RUN apt-get install -y curl

     # Use:
     RUN apt-get update && apt-get install -y curl
     ```
   - **Minimize Temporary Files**: Remove any temporary files or caches within the same `RUN` command to avoid bloating the image.
     ```Dockerfile
     RUN apt-get update && apt-get install -y curl && \
         rm -rf /var/lib/apt/lists/*
     ```

### 4. **Avoid Installing Unnecessary Packages**
   - **Install Only What’s Necessary**: Be specific about the packages and dependencies you install. Avoid installing unnecessary packages or using the `apt-get install` with a `-y` flag indiscriminately.
   - **Clean Up After Installation**: Always clean up package manager caches after installing packages to reduce the image size.

### 5. **Use `.dockerignore` File**
   - **Exclude Unnecessary Files**: Create a `.dockerignore` file to exclude files and directories that don’t need to be copied into the Docker image, such as documentation, source code files not needed for the runtime, or local development files.
   - **Example `.dockerignore`**:
     ```
     .git
     node_modules
     *.log
     ```
   - **Benefit**: This reduces the context size, speeding up the build process and resulting in a smaller image.

### 6. **Minimize Image Layers**
   - **Squash Layers**: Consider squashing layers during the build process to consolidate them into a single layer. This can be done with the `--squash` flag (experimental feature).
   - **Example**:
     ```bash
     docker build --squash -t myapp:latest .
     ```

### 7. **Use Specific Versions**
   - **Pin Versions**: Instead of using the `latest` tag for base images and dependencies, specify exact versions. This helps avoid unintentional bloat from updates or additions in newer versions.
   - **Example**: 
     ```Dockerfile
     FROM python:3.9-slim
     ```

### 8. **Remove Unnecessary Files and Binaries**
   - **Remove Build Tools**: If you need to compile software in the image, remove compilers, package managers, and other build tools after they’re no longer needed.
   - **Delete Unnecessary Files**: Ensure that any temporary files, caches, or unused binaries are deleted within the same `RUN` command where they were created.

### 9. **Optimize Dependencies**
   - **Review Dependencies**: Regularly review and prune dependencies in your application to ensure only the necessary ones are included.
   - **Use Minimal Versions**: Where possible, use minimal versions of libraries and frameworks.

### 10. **Leverage Image Optimization Tools**
   - **Tools like `docker-slim`**: Use tools like `docker-slim`, which analyzes your image and automatically removes unnecessary files, reducing the image size.
   - **Example**:
     ```bash
     docker-slim build --target myapp:latest
     ```

### 11. **Use `scratch` for Go or Rust Applications**
   - **Static Binaries**: If you are building a Go, Rust, or similar statically compiled application, you can use the `scratch` base image which is completely empty.
   - **Example**:
     ```Dockerfile
     FROM scratch
     COPY myapp /myapp
     CMD ["/myapp"]
     ```

By following these strategies, you can significantly reduce the size of your Docker images, leading to more efficient builds, faster deployments, and easier distribution.


- Once the images are build and pushed to the ECR, then in order to use the latest image in K8s cluster, we have dedicated stage
- We have written a shell script to update the git manifest repo, git maifest repo holds all the k8s manifests
- sed -i "s/replaceImageTag/${BUILD_NUMBER}/g" java-maven-sonar-argocd-helm-k8s/spring-boot-app-manifests/deployment.yml
- Basically the above command wil replace the image tag with the build number so that latest image in used in k8s cluster




