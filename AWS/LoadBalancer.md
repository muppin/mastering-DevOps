
## Application Load Balancer

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/ce3910f7-6db9-4091-a336-ae0308d25c99)


![image](https://github.com/muppin/mastering-DevOps/assets/56094875/62cca133-a8a0-4929-85ed-77b94a3ad8fe)

______________________________________________________________________________________________________________________________________________________________________________________________

## Network Load Balancer

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/676a091e-4b7a-429e-9d18-27f0ba6ccb9c)

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/046a4b17-6807-415d-afdc-d738314902a2)

___________________________________________________________________________________________________________________________________________________________________________________________

## Why do we use NLB on top of ALB

In AWS (Amazon Web Services), having a Network Load Balancer (NLB) on top of an Application Load Balancer (ALB) can provide several advantages, depending on the specific requirements of your application architecture. Here are some potential benefits:

1. **TCP/UDP Load Balancing:**
   - NLB operates at the transport layer (Layer 4) of the OSI model, allowing it to perform TCP and UDP load balancing. This is particularly useful for applications that require raw TCP/UDP handling without the additional processing introduced by higher-level protocols.

2. **High Performance and Low Latency:**
   - NLB is designed for high performance and low-latency workloads. It can handle millions of requests per second, making it suitable for applications with demanding performance requirements.

3. **Static IP Addresses:**
   - NLB provides a static IP address that remains constant even if instances behind the load balancer are replaced or scaled. This can be beneficial for applications that rely on a fixed IP address for communication or for scenarios where IP address changes are undesirable.

4. **Direct Server Return (DSR) Mode:**
   - NLB supports Direct Server Return (DSR) mode, allowing traffic to bypass the load balancer for certain scenarios. This can be advantageous for applications where the backend servers need to directly communicate with clients for specific types of responses.

5. **Handling Non-HTTP/HTTPS Traffic:**
   - NLB is well-suited for handling non-HTTP/HTTPS traffic. If your application involves protocols other than HTTP/HTTPS, NLB might be a more appropriate choice.

6. **Simple Health Checks:**
   - NLB provides basic health checks at the TCP/UDP level, simplifying the health check process. For applications that don't require the advanced health checks provided by ALB at the application layer, NLB's simplicity might be advantageous.

7. **Connection Draining:**
   - NLB supports connection draining, allowing in-flight requests to complete even when instances are being deregistered. This ensures a smooth transition during instance updates or scaling activities.

8. **Cost Efficiency:**
   - NLB tends to be more cost-effective for certain use cases due to its simplified feature set. If the advanced features of ALB are not required, using NLB might result in cost savings.

It's important to note that the choice between NLB and ALB depends on the specific requirements of your application. ALB is often preferred for web applications due to its advanced features such as content-based routing, SSL termination, and support for HTTP/HTTPS protocols. Consider the needs of your application, such as the type of traffic, protocols, and desired features, when choosing between NLB and ALB or a combination of both in your AWS architecture.
___________________________________________________________________________________________________________________________

## Gateway Load Balancer

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/a1ecd850-950d-4911-bec1-6f26c64aac97)

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/349da9e7-4015-418b-9e25-00829c336b0b)

____________________________________________________________________________________________________________________________________________________________________________________________

## Sticky sessions for ELB

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/d4f5947e-1c67-454e-a4fd-a3eea11004cb)

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/8bc50a4c-bbe5-4c4b-b6c2-b7e1bc9a8080)

**To enable sticky session-**
- Navigate to target group
- Actions -> Edit attributes -> stickiness

____________________________________________________________________________________________________________________________________________________________________________________________

## Cross Zone Load Balancing

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/8320c56c-270e-44ba-82d1-4aef49d6c07f)

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/6d3a42cc-7e7a-4cbe-989c-512838bcf5ae)

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/16bf15d2-d8d9-4d9b-825e-25b536a72f10)

____________________________________________________________________________________________________________________________________________________________________________________________

## SSL & TLS Certificates

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/8e107189-e33b-47b7-83f5-2732bc94eb29)

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/7d6f812b-ca75-4b2c-9762-658ca91818b6)

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/984bdb0a-b5ab-473d-8176-5f19443df933)

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/abc18337-a644-4a5a-99ed-05601f176c79)

**To configure SSL certs-**
- Go to ALB/NLB
- Add listners
- Config surity policy
- Add or Import SSL cert

____________________________________________________________________________________________________________________________________________________________________________________________

## Coonection Draining

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/4bb97bea-9cb4-4fd3-a0b1-eeacb273b5ce)


_________________________________________________________________________________________________________________________________________________________________________________

## Auto Scaling Groups

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/5262ca00-5473-4fd4-ae5f-3059f2a9915a)

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/d90a5c05-715b-4ea2-b0f7-a21036add67e)

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/7f8904fe-2617-436a-80dc-4d88223078ae)

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/ffa94829-4bd9-46c8-95e8-436f81b4b89f)

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/668df298-bc61-4ab6-bce6-12716a73b3a2)

**Scaling Policies**

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/9cf290bb-ff8e-4653-a9dd-2e1c358f3429)

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/403870fc-bc38-4a25-be76-2692ba985ce7)

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/683e3875-e299-4535-8537-4bdab77d2b09)

**Scaling cooldown**

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/168da490-c9ff-4eca-bf7c-abf4da2ffc02)






















