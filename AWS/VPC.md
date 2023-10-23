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
