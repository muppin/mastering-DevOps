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
