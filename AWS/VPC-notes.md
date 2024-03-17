## VPC 

Amazon Virtual Private Cloud (VPC) is a service provided by Amazon Web Services (AWS) that allows users to create isolated virtual networks within the AWS cloud environment. Think of it as your own private section of the AWS cloud where you can launch resources like EC2 instances, databases, and more, in a virtual network that you control.

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/a4f87315-6fdc-4799-b9ee-660936ac9ddb)

### VPC with Multiple CIDr blocks

In Amazon Virtual Private Cloud (VPC), you can have multiple CIDR (Classless Inter-Domain Routing) blocks associated with a single VPC. This feature, known as "multiple CIDR blocks," allows you to expand the IP address range of your VPC beyond a single CIDR block and accommodate more resources within your VPC.

Here's how a VPC can have multiple CIDR blocks and how it works:

1. **Initial CIDR Block**: When you create a VPC, you specify an initial CIDR block (e.g., 10.0.0.0/16) that defines the overall IP address range for the VPC. This initial CIDR block determines the maximum number of IP addresses available for resources within the VPC.

2. **Adding Additional CIDR Blocks**: After creating the VPC with the initial CIDR block, you can add one or more additional CIDR blocks to expand the IP address range of the VPC. Each additional CIDR block must be non-overlapping with the existing CIDR blocks associated with the VPC.

3. **Subnet Creation**: When you create subnets within the VPC, you can allocate each subnet from any of the associated CIDR blocks. This allows you to segment the VPC's IP address space across multiple CIDR blocks as needed.

4. **Route Tables**: Each subnet in the VPC is associated with a route table, which defines the routing rules for traffic in and out of the subnet. You can configure route tables to route traffic destined for specific CIDR blocks to appropriate destinations, including internet gateways, virtual private gateways, NAT gateways, VPC peering connections, etc.

5. **Network ACLs and Security Groups**: Network access control lists (ACLs) and security groups can be configured based on CIDR blocks. These security mechanisms allow you to control inbound and outbound traffic at the subnet and instance level based on IP addresses and CIDR blocks.

6. **Internet and NAT Gateways**: Internet and NAT gateways can serve multiple CIDR blocks within the VPC. By configuring appropriate route tables, you can enable internet access and outbound internet traffic for resources in subnets associated with any of the VPC's CIDR blocks.

7. **VPC Peering and VPN Connections**: VPC peering connections and VPN connections can span multiple CIDR blocks within the same VPC or between different VPCs. This allows for communication between resources across different CIDR blocks while maintaining network isolation and security.

By allowing multiple CIDR blocks in a single VPC, AWS provides flexibility in managing IP address space and accommodating varying requirements for resource allocation, segmentation, and connectivity within the VPC environment.


## Subnets
In Amazon Web Services (AWS), a Virtual Private Cloud (VPC) subnet is a segmented portion of a VPC's IP address range. Subnets are used to divide a VPC's IP address space into smaller, manageable blocks and are associated with specific availability zones (AZs) within a region. 

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/d4549257-aa53-4475-bacc-287c1483bf73)

## INternet Gateway

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/f58b9a51-3182-4bfd-9c4c-007c46c13413)

## Bastion Host 

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/4f4ca606-5afa-4cd9-a76f-7983333131d2)

## Nat Instance 

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/2e8ab88c-bbe8-485d-9b6e-ffeea4b62779)

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/e7a9b398-d201-4d47-948b-ccf86fead71e)

## Nat Gateway

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/eec2442e-e812-45f2-95ec-6705d207dbd4)

**Difference Btwn Nat Instance and Nat Gateway**

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/a3d3ff0e-b7f4-41c3-a991-bf603e6dc70c)

## NACL and SG

- ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/7c115949-f6fc-43fe-b85c-44faad45b971)

- ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/c19d358e-baae-46a3-928b-1fbaaee255c4)

**Ephimeral ports**

- ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/e93cdea2-11ce-4ecd-a318-53a15fbdcbcf)

- ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/7103e020-2056-4e5e-a93e-cb968e5c78a5)


**Statefull vs stateless**

*Security Groups (Stateful*):
- Security groups are stateful, meaning they keep track of the state of each connection (such as incoming/outgoing traffic, source/destination IP, port numbers, etc.).
- When you create a security group rule to allow inbound traffic, the corresponding return traffic is automatically allowed, regardless of any outbound rules explicitly defined.
- For example, if you allow inbound traffic on port 80 (HTTP), the corresponding outbound traffic for responses on port 80 is automatically allowed. You don't need to explicitly create an outbound rule for it.

*Network Access Control Lists (NACLs) Stateless*:
- NACLs, on the other hand, are stateless, meaning they do not maintain any information about the state of the traffic.
- Each rule in a NACL is evaluated independently, regardless of any other rules.
- If you want to allow return traffic, you must explicitly create rules for it in both directions (inbound and outbound).

**Dif btwn NACL and SG**

- ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/a22e175a-fbf5-4a1e-aa02-f5b213fd5ec6)









