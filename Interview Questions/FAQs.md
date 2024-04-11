### How to explain DevOps project in an Interview?
- I work in DXC Technology, I support multiple development teams, some of them are payments, transactions.
- Their applications are written in python.
- I support them as a DevOps Engineer by:
     - creating the CI-CD pipeline
     - Deploying their applications to the EKS cluster using CI-CD
     - creating aws services (Infrastructure) using Iac tool Terraform
     - managing the configurations of VM's using Ansible.
 



### How do you typically begin your day? / What are your daily responsibilities?

- I initiate my day by checking Outlook, Slack, and Teams.
- This allows me to see if any new Jira tasks have been assigned to me or if there are any updates on existing Jira tasks. I also review if my pull requests have been merged or approved, and I welcome any feedback on them.
- I participate in daily or weekly sync-up calls regarding Jira stories.
- I monitor Teams and Slack messages and respond to them promptly.
- Following that, I commence work on the assigned Jira tasks.
- My tasks typically include:
  - Exposing application metrics on Prometheus and visualizing them on Grafana.
  - Developing automation scripts.
  - Managing databases.
  - Creating and maintaining playbooks.
  - Troubleshooting issues.
  - Managing CI/CD pipelines, which involves using CircleCI to build images, pushing them to Amazon ECR, and deploying Docker images.
  - Writing YAML manifests for Kubernetes pods, services, etc.
  - Provisioning infrastructure on AWS.
  - Participating in on-call rotations, including PagerDuty calls.
  - Addressing incidents and alerts, such as those related to memory/CPU utilization or pod crashes.

### Linux based questions

**How can you diagnose latency between AWS resources?**
- Initially il check with ping command followed by the IP address or hostname of the target resource to check connectivity and measure round-trip latency.
  ``` ping IP_address_or_hostname```

**What was that round trip ? How would you measure ?**
- When you use the ping command in Linux, it sends a small packet of data to the target server and waits for a response. The time it takes for the packet to travel to the server and back to your computer is the round trip latency.
- I will also use the traceroute command followed by the IP address or hostname of the target resource to trace the path packets from your machine to the target, showing latency at each hop.
 ``` traceroute IP_address or hostname```

**what is netcat command?**
- Netcat Command, i will Use the nc command to test network connectivity and measure latency between two machines by establishing a TCP connection.
  ```nc -z IP_address or hostname port_number```
  - **What is -z in the above command?**
  - So when you use -z you're telling nc to check if the specified port on the target machine is open or reachable. If the port is open, you'll typically receive a response indicating that it's open, and if it's closed, you won't receive any response. 

  
