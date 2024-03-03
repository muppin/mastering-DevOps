### IP Addresses

**Public IP Address:**
- Used for internet-facing resources, dynamically assigned by default.
- Public IP addresses may change when you stop and restart an instance unless it is associated with an Elastic IP address.

**Private IP Address:**
- Used for communication within a VPC, not accessible from the internet.
- Private IP addresses are generally stable as long as the associated resource exists, but they may change if the resource is stopped and restarted.

**Elastic IP Address:**
- A static, persistent IP address designed for dynamic cloud computing, associated with a specific AWS account.
- An Elastic IP address remains associated with an AWS account until it is explicitly released. It does not change even if the associated instance is stopped and restarted.
- There may be charges associated with an Elastic IP address if it is not associated with a running instance, so it's advisable to release EIPs when not in use to avoid charges.

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

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/9543f726-c8e9-4d6c-8066-cc11ad5720cf)

For more info https://youtu.be/X6YPNciA8z8?si=8Mm8mtLKSNxLBMym

### EC2 Hibernate

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/97c342e5-ec48-4c98-b83c-cd06c1527129)

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/a8342755-4c68-4bb9-8f4a-ecdcbdab0c05)


