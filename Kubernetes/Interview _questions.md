- **If you are using cluster ip, how u are exposing it to the outside world?**
  With the help of ingress. Ingress will expose to http/https traffic.

- **How u are managing files on diff environments?**
  With the help of helm charts. For every env, we have different values.yml.
  For cost cutting we don't use HPA for sit where as HPA is imp in pre-prod and prod.

- **Explain the traffic flow of an application that is deployed on eks, the eks is in the private subnets. Consider the incoming request as HTTPS and also use Route 53, WAF?** 
  Certainly! Let's walk through the traffic flow of an application deployed on Amazon Elastic Kubernetes Service (EKS), where the EKS cluster is in private subnets. We'll include incoming HTTPS requests, Route 53 for DNS resolution, and AWS WAF (Web Application Firewall) for added security.

1. **Client Request (HTTPS):**
   - A user initiates an HTTPS request by accessing the domain name of your application (e.g., www.example.com) in their browser.

2. **DNS Resolution with Route 53:**
   - The domain name is resolved to an IP address using Route 53.
   - Route 53 is configured to direct traffic to an Application Load Balancer (ALB) or Network Load Balancer (NLB) in your public subnet.

3. **ALB/NLB Handling Incoming Traffic:**
   - The ALB/NLB serves as the entry point for incoming HTTPS traffic.
   - It may have a listener configured to terminate SSL/TLS and forward the decrypted traffic to the EKS cluster.

4. **Ingress Controller in EKS Cluster:**
   - An Ingress controller within the EKS cluster manages external access to services.
   - The Ingress controller may be configured to route incoming requests based on path-based or host-based rules to specific services in the cluster.

5. **Internal Load Balancing within EKS:**
   - Services within the EKS cluster may be exposed through internal LoadBalancer services, distributing traffic among pods.

6. **Application Processing in EKS Pods:**
   - Pods running your application receive the HTTPS requests and process them within the EKS cluster.

7. **Database Interaction or Other Backend Services:**
   - Your application within the EKS cluster may interact with databases or other backend services, which could be in private subnets or other secure configurations.

8. **Outbound Communication:**
   - If your application needs to communicate with external services, it can do so through NAT gateways or NAT instances in the private subnets.

9. **AWS WAF for Security:**
   - AWS WAF can be configured to protect your application from common web exploits.
   - It can inspect and filter incoming HTTPS traffic based on predefined rules or custom rule sets to block malicious requests.

10. **Response to Client:**
    - The application generates an HTTPS response, which is sent back through the EKS cluster, the ALB/NLB, and Route 53 to the client.

This setup ensures that your EKS cluster remains in private subnets for enhanced security, while Route 53 and AWS WAF contribute to the secure and reliable handling of incoming HTTPS traffic.

**Recommendation:**

**Configure Route 53:** Start by configuring Route 53 to manage your domain's DNS and direct traffic to your AWS resources.
**Implement AWS WAF:** Once traffic is flowing through Route 53 to your AWS resources, consider implementing AWS WAF to enhance the security of your web applications.
By combining Route 53 and AWS WAF, you create a more comprehensive solution for managing and securing incoming web traffic to your AWS environment.

- ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/e07efc89-fb31-4873-94c6-b78168d4bec9)

- ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/8dadf063-122f-406e-86d2-28134a95ea05)

- **how ttwo containers inside the pod communicate each other?**
  using localhost:portnumber

- ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/4f11b6e2-fcca-43a9-b835-495dff1f5ef2)

- ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/af9047cb-0631-4910-aed4-e8aeb91750c9)

- ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/c3324a58-9fde-408c-98b6-5f3014a4fe8a)

- ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/b55e5c99-77ca-4c98-9a75-e3f7cb8082ae)

- **What is a custom controller?**

- ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/1d199768-c07e-40ba-a629-85460a0b0757)

- **What is PSP(Pod security policy)?**







