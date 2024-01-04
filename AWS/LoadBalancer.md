![image](https://github.com/muppin/mastering-DevOps/assets/72374894/b0928f53-d691-47cc-91e1-7bfcfb6e4c24)



____________________________________________________________________________________________________________________________________________________________________________________________

## Application Load Balancer

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/ce3910f7-6db9-4091-a336-ae0308d25c99)


![image](https://github.com/muppin/mastering-DevOps/assets/56094875/62cca133-a8a0-4929-85ed-77b94a3ad8fe)

______________________________________________________________________________________________________________________________________________________________________________________________

## Network Load Balancer

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/676a091e-4b7a-429e-9d18-27f0ba6ccb9c)


![image](https://github.com/muppin/mastering-DevOps/assets/56094875/046a4b17-6807-415d-afdc-d738314902a2)

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/a1ecd850-950d-4911-bec1-6f26c64aac97)

___________________________________________________________________________________________________________________________________________________________________________________________

## Gateway Load Balancer

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/349da9e7-4015-418b-9e25-00829c336b0b)

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/d4f5947e-1c67-454e-a4fd-a3eea11004cb)

____________________________________________________________________________________________________________________________________________________________________________________________

## Sticky sessions for ELB

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/8bc50a4c-bbe5-4c4b-b6c2-b7e1bc9a8080)

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/8320c56c-270e-44ba-82d1-4aef49d6c07f)

**To enable sticky session-**
- Navigate to target group
- Actions -> Edit attributes -> stickiness

____________________________________________________________________________________________________________________________________________________________________________________________

## Cross Zone Load Balancing

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/6d3a42cc-7e7a-4cbe-989c-512838bcf5ae)

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/16bf15d2-d8d9-4d9b-825e-25b536a72f10)

____________________________________________________________________________________________________________________________________________________________________________________________

## SSL & TLS Certificates

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/8e107189-e33b-47b7-83f5-2732bc94eb29)

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/7d6f812b-ca75-4b2c-9762-658ca91818b6)

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/984bdb0a-b5ab-473d-8176-5f19443df933)

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/abc18337-a644-4a5a-99ed-05601f176c79)

To configure SSL certs-
- Go to ALB/NLB
- Add listners
- Config surity policy
- Add or Import SSL cert

____________________________________________________________________________________________________________________________________________________________________________________________

## TCP Vs. UDP Vs. HTTP

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

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## Auto Scaling Groups

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/5262ca00-5473-4fd4-ae5f-3059f2a9915a)

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/d90a5c05-715b-4ea2-b0f7-a21036add67e)

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/7f8904fe-2617-436a-80dc-4d88223078ae)

![Uploading image.png…]()

![Uploading image.png…]()















