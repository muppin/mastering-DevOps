![image](https://github.com/muppin/mastering-DevOps/assets/121821200/c83203f9-c854-40cd-93f5-3861ffe7c88e)

The above image shows the architecture of Deploying a application inside private subnet.

Firstly, we create vpc with the help of AWS, which in-turn  creates us all the components required like Private and Public subnets, Internet gateway, Route tables, NAT gates etc.

After creating vpc, create auto scaling groups which demands us to creates launch template and then mention the desired capacity, max capacity and this auto scaling group should be created inside private subnet so that ec2 instances are created inside private subnets.

Then, deploy the application inside the ec2 instances and open the required ports for the trafficking purpose.

since these ec2 instances are deployed in the private subnets, normally we don't enable public ip's and these should accessed via bastion servers(jump servers).

Bastion servers are deployed inside public subnet to access the servers deployed inside the private subnet.

Then we deploy the Application Load Balancer and Target groups in the public subnets to route the incoming traffic to the ec2 instances.

Target groups contain the target servers(in this case ec2 instances deployed inside private subnets) and targets are mentioned with the accessible ports that ec2 instances have their application running on.

Application load balancer receives the traffic from internet gateway and is required to open the ports in order to accept the incoming traffic and forward it to required target mentioned in the target groups.

NAT (Network Address Translator) gates which are deployed in the public subnets are connected to ec2 instances(private subnet) via route tables. These NAT gates help ec2 instances to talk to internet(updating, downloading application) and also mask the ip addresses of ec2 instances in the outside world for security purposes.

so basically when a user tries to access the application inside the private subnet, he has to access via ip/DNS name of Load balancer. so the request first hits the internet gateway then reaches the load balancer in the public subnet, then checks the target groups and with the help of route tables reaches the server after security checks(Security groups at instance level, NACL at subnets level). 


# Learnings

- **Create VPC**
  - Creating a Virtual Private Cloud (VPC) and more.

- **Create Autoscaling group**
  - Using launch templates for creating an Autoscaling group.

- **Create Bastion Host with Auto-assign Public IP**
  - Setting up a Bastion host with an auto-assigned public IP.

- **Bastion Host/Jump Server**
  - Acting as a mediator between instances in the private subnet and public subnet.

- **Copy PEM File to Bastion Host**
  - Using SCP to copy a PEM file from the local machine to the Bastion host.
  - Command: `scp -i VPC-key.pem VPC-key.pem ubuntu@publicIP` 
  - *(Note: You need to be in the same folder where the .pem file is located.)*

- **Login to Bastion Host**
  - Logging in to the Bastion host.
  - Command: `ssh -i aws_login.pem ubuntu@pubIPofBastionHost`

- **Login to EC2 in Private Subnet**
  - Logging in to an EC2 instance in the private subnet.
  - Command: `ssh -i aws_login.pem ubuntu@PrivateIpOfEC2`

- **Run Python App**
  - Running a Python application.
  - Command: `python3 -m http.server 8000`

- **Run in Background Mode**
  - Running a command in the background.
  - Command: `nohup python3 -m http.server 8000 &`

- **Creating Target Groups**
  - When creating Target Groups, always mention the port on which the application is running.

- **Create Application Load Balancer (ALB)**
  - Creating an Application Load Balancer.
  - Opening HTTP port 80 and attaching the previously defined Target Group.

- **Validate Health Checks**
  - Later, validate health checks to ensure proper functioning.

- **Access with DNS of Load Balancer**
  - Access the application using the DNS of the Load Balancer.





