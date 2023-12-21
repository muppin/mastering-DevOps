# Kubernetes

Basically, why Kubernetes?

The Docker had many problems in day-to-day life in the industry,

Four main problems of the docker that are,

-   Single host
-   Auto scaling
-   Auto Healing
-   Docker is not for Enterprise Nature

So, if we wonder how all these problems are solved, here comes the Kubernetes.

Kubernetes is an Open-source platform for managing containerized applications. It automates the deployment, scaling and management of these applications. It is portable, extensible and declarative, and has a large and growing ecosystem of services and tools. 

So, Kubernetes came up with a solution for all those docker problems.

**How did it solve the problem of single host?**

By default, Kubernetes is a cluster, cluster is group of nodes. So, Kubernetes on production is installed in terms of Master node architecture just like Jenkins. 

If there are 100s of containers running and if one of the container lifecycles is affecting any of the containers, what Kubernetes does is, it just picks up the affected container and puts into the other node to resume its capability without any intervention.

**How does it solve Auto scaling?**

Kubernetes has something called replica set.

So, if a container is experiencing a huge load on a certain time (the no of users hitting the application n increases). We have replicaset.yaml file and increase the replicas and bring up the new containers manually. Kubernetes also supports HPA (Horizontal pod Auto scaler) using which we can increase the no of containers whenever we experience the load.

**How does it solve Auto healing?**

Kubernetes controls and fix the damage.

If one of the containers goes down, using the Auto healing feature Kubernetes will spin up a new container before the old one dies.

We have something called API server in k8s, this API servers receives the signal of container going down, immediately the k8s rolls out a new container before the old one goes down. The user doesn’t even experience of any shutdown of the application.

**How will it support Enterprise Nature?**

People at Google Built Enterprise level container orchestration platform called Kubernetes.

Since Docker is not of enterprise nature (Load balancer support, firewall support, auto healing, auto scaling, Api gateways, blacklisting ips etc.). so, it is never used in Production platform. Kubernetes is aiming to solve these problems.



## Kubernetes Architecture

| **Master Node (Control Plane)** | **Worker Node (Data plane)** |
| ------------------------------- | :--------------------------- |
| API Server                      | Kubelet                      |
| Scheduler                       | Kubeproxy                    |
| etcd                            | Container Runtime            |
| Controller Manager              |                              |
| CCM (Cloud Controller manager)  |                              |

To explain this, in docker simplest thing is container and k8s simplest thing is pod.

When a container is created in docker using a docker run command, what happens behind the scenes. when we use docker run command, to execute this process we should have container run time env which is called Dockershim.

Similarly in Kubernetes, we have master node architecture. When a pod is deployed on k8s it goes through Master node and executed on worker node.

 

**Worker Node**

***Kubelet*** – this is responsible for running/maintaining a pod. If the pod goes down it reminds a component in control plane to fix or control this issue.

***Container Runtime***- in order to run a pod in k8s we should have a container runtime and here unlike docker, docker is not mandatory. We can user either dockershim or containerd or crio(all these are container runtimes)

***Kubeproxy*** – Like default bridge network(docker0) in Docker, this kube-proxy basically provides us the networking, it allocates the ips to every pods we are creating and also provides the load balancing capability since, k8s supports auto scaling capability. It uses IP tables in Linux.

 

**Master Node**

***API sever*** – Acts as a core component in K8s and takes all incoming requests. It basically exposes K8s to the external world.

***Scheduler*** – it is responsible for scheduling the pods/resources on the K8s. for example, it schedules the pod1 to run on one of the available nodes.

***etcd*** – it is key-value storage, and the entire cluster related information is stored as objects/ key-value pairs inside etcd. It helps in restoring the cluster related information when required.

***Controller manager*** – since k8s supports auto scaling therefore k8s has something called as Controllers. For example, replica sets. This replica sets is maintaining state of K8s and help in auto scaling.

***CCM*** – K8s can be run on different cloud platforms. When a user requests to create load balancer on EKS to k8s. Firstly k8s must understand the underlying cloud providers and translate the user request on to the API request that the cloud provider must understand. This mechanism is implemented on the CCM. So that load balancer gets created on the EKS.

## Interview Questions 
![image](https://github.com/muppin/mastering-DevOps/assets/121821200/c1019d65-f499-4edb-9c4b-f3e0f46d3f1c)
![image](https://github.com/muppin/mastering-DevOps/assets/121821200/69863387-677d-4803-99cb-9dd7f3e06d68)
![image](https://github.com/muppin/mastering-DevOps/assets/121821200/fd75878d-dc15-46ea-8ecc-77da9661d573)

**Day-to-Day activities on Kubernetes?**

As part of the DevOps Engineer role we manage clusters of our organisations and also ensure that the applications are deployed on the clusters and have no issues with the application. We have setup monitoring capability on our Cluster. and we also do some maintainance activities for example we have kubernetes cluster with 2 Master nodes and 7 worker nodes, we have to do continuous maintainance activities on the worker nodes probably upgrading the versions of worker node and installing the default packages, ensuring the worker nodes are not exposed to security vulnarability 



**Difference between Docker Swarm and K8s**
Docker Swarm and Kubernetes (often abbreviated as K8s) are both container orchestration tools used for managing containerized applications, but they have differences in their architectures, feature sets, and intended use cases:

1. **Architecture:**
   - **Docker Swarm:** It's Docker's native clustering and orchestration tool. It's designed to be simple and integrated with Docker Engine. Swarm operates by creating a cluster of Docker nodes where containers are scheduled and managed.
   - **Kubernetes:** K8s is an open-source container orchestration platform developed by Google. It's a more complex system built with a modular architecture, separating the control plane (manages cluster state) from the worker nodes (where containers run). It uses various components like API server, scheduler, controller manager, and etcd for cluster management.

2. **Ease of Use vs. Scalability:**
   - **Docker Swarm:** It's known for its simplicity and ease of setup. For smaller-scale deployments or those new to container orchestration, Swarm may be easier to learn and use.
   - **Kubernetes:** K8s is more complex but offers powerful features for large-scale deployments. It provides extensive capabilities for scaling, self-healing, and managing complex applications, making it suitable for enterprise-grade and complex environments.

3. **Features:**
   - **Docker Swarm:** Swarm focuses on simplicity and integrates seamlessly with Docker tools. It provides basic orchestration features like service discovery, load balancing, and basic health checks.
   - **Kubernetes:** K8s has a rich set of features including auto-scaling, rolling updates, advanced networking, configuration management, secret management, and more. It offers a robust ecosystem and a wide array of community-contributed tools and plugins.

4. **Community and Ecosystem:**
   - **Docker Swarm:** While Docker Swarm has a user-friendly interface and is tightly integrated with Docker, its ecosystem and community support are relatively smaller compared to Kubernetes.
   - **Kubernetes:** K8s has a large and active community with extensive documentation, third-party integrations, and a vast ecosystem of tools, making it more adaptable to various scenarios and use cases.

5. **Use Cases:**
   - **Docker Swarm:** It's suitable for smaller to medium-sized deployments, especially for users already familiar with Docker tools and seeking a simpler orchestration solution.
   - **Kubernetes:** K8s shines in large-scale, complex, and multi-cloud/container environments. It's ideal for enterprise-grade applications that require extensive scaling, robustness, and flexibility.

When choosing between Docker Swarm and Kubernetes, it often boils down to the specific needs of the project, the level of complexity required, existing expertise within the team, and the scalability and feature requirements of the application being deployed.

 
