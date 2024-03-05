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
- OSI model begins from here after the TCP handshake is done
   - L7 (Application Layer) - Initiating the HTTP/HTTPS/FTP requests, passing headers and providing authentication.
   - L6 (Presentation Layer) - Data is transferred through multiple routers and it has to be encrypted beacause of security purpose(if and only if it is https request.
   - L5 (Session layer) - here the session is created, so that multiple authentication is not required.
   - together L7, L6, L5 are taken care  by browser.
   - L4 (Transport Layer) - heres the data segmentation is done and it is done through TCP/UDP protocols. if the request is of http/https then TCP is identified.
   - *Network Segmentation*: In computer networking, data segmentation involves dividing a network into smaller segments or subnetworks.
   - L3 (Networking Layer) - transmission of data is done here, the data is sent in the form of packets from source ip to the destination ip through multiple routers.
     - packets will be having certain info like how to travel and which path to take. all this decision is taken by your router.
   - L2 (DataLink Layer) -  after sending the data to router, then if router has switches in it(ethernet ports/LAN ports), here the transmission medium is changed. in order to send the data throgh switches the data should be in Frames. it also contains MAC addresses.
   - L1 (Physical Layer) - here the transmission of data is sent via OFC(optical fibre cables).and here it is converted as electronic signals.
     ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/b8f688c6-502c-4fe6-9fcb-0e282f59bb54)

**TCP Vs. UDP Vs. HTTP**

HTTP (Hypertext Transfer Protocol), TCP (Transmission Control Protocol), and UDP (User Datagram Protocol) are all fundamental protocols used in computer networks for different purposes.

1. **HTTP (Hypertext Transfer Protocol):**
   - HTTP is a protocol used for transmitting hypermedia documents, commonly used on the World Wide Web for web page retrieval. 
   - It operates at the application layer of the TCP/IP model.
   - It works in a client-server model, where a client (like a web browser) requests resources, and a server (like a web server) responds with the requested resources (such as web pages, images, or other data).
   - It is a stateless protocol, meaning it doesn't retain information about previous requests, treating each request independently.

2. **TCP (Transmission Control Protocol):**
   - TCP is a connection-oriented protocol that operates at the transport layer of the TCP/IP model.
   - It ensures reliable and ordered delivery of data between devices over a network by establishing a connection before sending data and confirming the data's successful receipt.
   - It manages data flow, handles errors by retransmitting lost packets, and ensures that data arrives intact and in order.
   - TCP is used by protocols that require high reliability and accuracy in data transmission, such as HTTP, email (SMTP), and FTP.

3. **UDP (User Datagram Protocol):**
   - UDP is a connectionless protocol that operates at the transport layer of the TCP/IP model.
   - It is a simpler, lightweight protocol compared to TCP, lacking the features of reliability, error correction, and sequencing of data.
   - UDP is faster and more efficient for tasks that can tolerate occasional packet loss or errors, such as video streaming, VoIP (Voice over Internet Protocol), online gaming, and DNS (Domain Name System).
   - While it doesn't ensure reliable delivery, it's often used when speed and low overhead are more critical than perfect data transmission.

**Differences:**

1. **Reliability:**
   - TCP ensures reliable data transmission by establishing a connection, sequencing data packets, acknowledging their receipt, and retransmitting lost packets. UDP doesn't provide these features, making it faster but less reliable.

2. **Connection-oriented vs. Connectionless:**
   - TCP is connection-oriented, establishing a connection before data transfer and ensuring ordered, reliable delivery. UDP is connectionless, where data can be sent without prior setup and without guaranteeing delivery.

3. **Overhead:**
   - TCP has more overhead due to its mechanisms for reliability and ordered delivery, while UDP has less overhead, making it faster and more efficient for certain applications.

4. **Use Cases:**
   - TCP is suitable for applications where data accuracy and reliability are essential, such as web browsing (HTTP), email (SMTP), and file transfer (FTP). UDP is preferred for real-time applications like streaming media, online gaming, and VoIP due to its lower latency.

Understanding the differences between these protocols helps in choosing the right one for specific networking needs based on priorities like speed, reliability, and overhead requirements.
