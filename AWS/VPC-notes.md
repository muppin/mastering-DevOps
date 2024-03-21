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



## VPC Peering

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/e31d4060-ccee-49a9-88fc-614baef83c50)


![image](https://github.com/muppin/mastering-DevOps/assets/56094875/5baccba5-c68c-42dc-870f-86d3700d6fb5)

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/5cf1641a-5204-470a-899d-7e6a4a834ce0)

**How to connect two VPC's using VPC peering**
- Create peering connection, give requestor & acceptor VPC. Make sure CIDR's doesnt overlap.
- Add routes in public/private route table of each VPC. (2 way handshake)


## VPC Endpoints

- VPC endpoint is deployed in VPC, allows resources inside private subnet to access other AWS services directly. Network will never leave AWS.
- AWS VPC Endpoint is a service that enables you to privately connect your VPC to supported AWS services without requiring internet gateway, NAT devices, VPN connections, or direct peering connections. It allows communication between resources within your VPC and AWS services via a private link.

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/b27b7dd9-5db1-4280-a84d-1eb272753033)

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/818cc8d8-e0f7-4a81-9162-9385f7faeb9f)


**Types of endpoints**

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/2e625a17-9602-4efb-b5e8-ccc79ac26fa9)

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/9ff174b9-fd1b-4ff5-ac63-35796681e675)


## VPC Flow logs 

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/057c1bab-a9db-45d7-b54a-95e5cd7acea2)

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/c67198d8-565e-4d22-905e-78af7935b594)

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/9c8f55f6-c78b-4801-a6ed-b1b6e38aad6e)

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/7f3df304-9fc3-4818-8bf2-d9db9f8fae71)


## Site to site VPN

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/e5b281d3-3b99-40c9-ae61-f0492865b3a8)

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/e7bb99ac-9585-4590-8c51-3df111131d7d)

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/e13407ec-a456-4e36-bc38-32e94334e84e)

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/f6757ba7-fa57-4740-9394-db27ae747941)


## Direct Connect (DX)

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/d3aa977a-bf03-4fcb-85e3-52b62c3cb666)

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/35523157-2f8f-4752-82da-634cfc2af6d8)

**Direct Connect Gateway**

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/13f2ac23-0bf6-48a3-ae77-c8e404f3a7f2)

**Direct Connect: Connection Types**

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/7cc875a7-2de8-4c74-ad8d-ac7fda9b35c4)

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/7a88bed1-8c10-4904-8343-76c4023f1d88)

*******************************************************************************************************************************************************************************************************************

## Direct Connect + Site to site VPN

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/20068d39-82a2-430c-a3d2-0f35026c1e69)

********************************************************************************************************************************************************************************************************************

## Transit Gateway

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/e712f286-e882-4787-933d-f21c53329293)

***********************************************************************************************************************************************************************************************************************
## VPC Traffic Mirroring

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/170ae1cc-44ac-495b-b98b-6fb199a8dd1e)

***********************************************************************************************************************************************************************************************************************
## IPv6 addresses

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/ef45b3a5-3294-4822-97b0-d3c858eeab04)

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/c7a19bd7-b556-44bd-979f-c6b0777191fe)

## Igress only Internet Gateway

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/9e55e553-5040-4295-8ad9-6f79e3020890)

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/e5fa31c6-ba10-4311-a646-b0b137bdedf2)

***********************************************************************************************************************************************************************************************************************

## Networking Cost in AWS

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/54b3ec7f-d4cd-4b71-bb58-8ff7b497cc9d)

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/b61653f3-2017-4865-9af9-37faa722378b)

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/df6812c7-db3c-438d-b9cd-f968619d10de)

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/05b74e65-c267-4425-b227-c8eba8ea72d2)

**********************************************************************************************************************************************************************************************************************

## Network protection on AWS

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/5f0f0ef9-131d-4edb-9eb7-7a9b416f4708)

*What if we want to protect entire VPC?*

## AWS Network Firewall

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/a765d003-b6fa-430c-8da8-2f3e247e4573)

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/98b74fb2-22fc-4ab6-9501-68be614659bf)

*********************************************************************************************************************************************************************************************************************
















### Creating VPC_

*What is Tenancy*
![image](https://github.com/muppin/mastering-DevOps/assets/56094875/c4fc6903-a66b-4df4-ae22-6fdcb0ffd790)










