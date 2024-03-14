### IP Addresses

**Public IP Address:**
- Used for internet-facing resources, dynamically assigned by default.
- Public IP addresses may change when you stop and restart an instance unless it is associated with an Elastic IP address.

**Private IP Address:**
- Used for communication within a VPC, not accessible from the internet.
- Private IP addresses are generally stable as long as the associated resource exists.

**Elastic IP Address:**
- A static, persistent IP address designed for dynamic cloud computing, associated with a specific AWS account.
- An Elastic IP address remains associated with an AWS account until it is explicitly released. It does not change even if the associated instance is stopped and restarted.
- There may be charges associated with an Elastic IP address if it is not associated with a running instance, so it's advisable to release EIPs when not in use to avoid charges.

**CIDR** - Classless Inter-Domain Routing - Method for allocating IP addresses.

### Placement groups

- placement groups are used to influence the way instances are placed within the underlying infrastructure. 
- They are relevant when considering factors such as latency and network traffic between instances

**There are 3 types**

**Cluster**
- Cluster placement groups are used for applications that need low-latency and high-throughput communication between instances. Instances in a cluster placement group are placed in close proximity to each other within a single Availability Zone.
- ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/6d73ea81-0421-4e56-acbd-be6d76870147)

 **Spread**
- All the ec2 instances are going to be located on different hardware, that is on different availabilty zones. to avoid the risk of simultaneos failure and have high availabilty
- ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/ec72e40c-cf95-4ba2-a5ad-e4c9e084c86c)
 
**Partition**
- we can have instances spread across partitions in multiple availabilty zones
- you can have upto 7 partitions in az
- each partition represents a rack in aws
- ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/dff4e9f8-65db-4187-bc82-50c4b8cd9ffc)

### Elastic Network Interfaces (ENI)

- ENIs are fundamental building blocks for constructing scalable and highly available applications within the AWS cloud.
- when you create a instance, the instance comes up with primary network interface i.e. Eth0
- you can attach many more interfaces to the instance, based on the instance type.
- the secondary interface comes the private ip and you can attach a public ip by assoaciating with elastic ip
- each eni can have seperate security groups.

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/9543f726-c8e9-4d6c-8066-cc11ad5720cf)

For more info https://youtu.be/X6YPNciA8z8?si=8Mm8mtLKSNxLBMym

### EC2 Hibernate

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/97c342e5-ec48-4c98-b83c-cd06c1527129)

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/a8342755-4c68-4bb9-8f4a-ecdcbdab0c05)

### EC2 Storage (EBS and EFS)

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/ae8b3a74-f789-4d3f-a934-fa911cf33187)

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/027df425-8efb-4705-bbb1-35e8d5be18c7)

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/78583988-ac61-4f64-8e78-5410d51c32fc)

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/065ee6b9-87c7-4fcf-a676-aab6826b32bc)

#### EC2 instance store


Amazon EC2 instance store, also known as ephemeral storage, refers to the temporary block-level storage that comes with certain types of EC2 instances. Unlike Amazon EBS (Elastic Block Store), which provides persistent and durable storage, instance store is volatile storage that is directly attached to the physical hardware of the EC2 instance.

Here are key characteristics and considerations regarding EC2 instance store:

**Volatile Nature:**

Instance store volumes are temporary and will be lost if the associated EC2 instance is stopped or terminated. They are suitable for temporary data and should not be used for critical, persistent storage.

**Performance:**

Instance store volumes are typically faster in terms of I/O performance compared to Amazon EBS volumes. This is because they are physically attached to the host server.

**Instance Types with Instance Store:**

Certain EC2 instance types come with instance store volumes. These are often labeled as "instance store" or "ephemeral storage" in the instance type description.

#### Amazon EFS 

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/f9acfca6-4251-47d7-85d2-e105e073e704)

#### EBS vs EFS

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/6c2bccbb-68dc-4a52-a7ee-77588f8a133c)

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/75eb6372-d9bd-441c-a73f-eecce6034402)




### AMI

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/d90a7e60-4eb9-46aa-96d5-1e0c9e292c1c)


--------------------------------------------------------------------------------------------------------------------------------------------------------

**What are 2/2 health checks passed in EC2?**


In Amazon EC2, there are two types of health checks that are performed on instances: system status checks and instance status checks.

1. **System Status Check**:
   - The system status check monitors the health of the underlying infrastructure that supports your EC2 instance. It checks for issues at the hypervisor level, such as power or network connectivity problems.
   - System status checks are performed by AWS and are independent of the operating system running on the instance.
   - Examples of issues detected by system status checks include loss of network connectivity, failure of underlying hardware, or issues with the hypervisor.

2. **Instance Status Check**:
   - The instance status check monitors the health of the EC2 instance itself, including the operating system and any applications running on it.
   - Instance status checks verify that the instance's operating system is responding correctly and that any applications running on the instance are functioning properly.
   - Examples of issues detected by instance status checks include failed system checks (e.g., kernel panics), failed system status checks, or misconfigured networking.
   
These health checks are performed periodically by AWS and are essential for ensuring the availability and reliability of your EC2 instances. When an issue is detected during a health check, the instance may be marked as unhealthy, and actions can be taken based on the configured monitoring and recovery settings, such as terminating the instance or initiating auto-recovery processes.

By monitoring both system status and instance status, AWS helps ensure that your EC2 instances are operating properly and that any issues are detected and addressed promptly, minimizing downtime and maintaining the overall health of your infrastructure.









