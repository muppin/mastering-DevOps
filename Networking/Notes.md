### Networking

**Ip Address**
- Provides a unique address i.e. unique identification to a device.
- IPV4, IPV6 are used to generate unique addresses.
- ipv4 address ranges between o.o.o.o -> 255.255.255.255
- computer understands these in bits and bytes, (1 byte = 8 bits)
- ipv4 contains 4 bytes = 32 bits, each byte seperated by dots
  ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/996a0eb5-e3a6-40f3-9d04-4d04bfb1b015)
  ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/5955f9bd-176c-45ec-bf82-87fdb3babc8b)

**Subnet**
- Part of larger network is called a subnet.
- advantages
  - security
  - privacy
  - isolation
- types of subnet
  - public - allow access it from internet
  - private - doesnt allow to access it from internet
- suppose vpc is created in CIDR range 19.18.0.0/16 and it has 65,536 ips's. (refer:https://cidr.xyz/)
  - then subnets has to be created within the mentioned cidr range.
  - suppose private subnet_1 wants some 16 ip addresses to be assigned then the cidr range would be 19.18.5.0/28
    ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/f31518cd-8f9f-4170-8e16-8b9df2831ebe)

  - suppose public subnet_1 wants some 1024 ip addressed to be assigned then the cidr range would be 19.18.3.0/22
    ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/98b8c275-37f0-4de1-8577-ed69a4da2110)

  - private ips should be starting from 192, 172, 10
 
**Ports**
-  Ports are used to differentiate between different services or applications running on the same device, allowing multiple services to operate concurrently.
-  Ports are identified by numbers, known as port numbers, which range from 0 to 65535.
-  types of ports:
   - Well-known ports (0-1023):Standard services like http(80), https(443), ftp(21)
   - Registered ports (1024-49151): these are assignes to services, application upon request.
   - Dynamic or private ports (49152-65535): Also known as ephemeral ports, these are used for temporary connections.
- Ports are a crucial part of the TCP/IP protocol suite, specifically in the Transport layer. They help ensure that data reaches the correct application or service on a device by using both the IP address and the port number as part of the addressing information.

**OSI Model**
- before entering seven layers there are other 2 other concepts
   - DNS resolution - it tries to resolve or check in local cache for the domain name that has been mapped to ceratin IP address, that we want to access. Further if it 
     resolves then proceeds with the TCP handshake.
   - TCP handshake - (3 way handshake)
     ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/de1cfe5f-63d8-41c0-8fcb-14d896121d88)
- 

