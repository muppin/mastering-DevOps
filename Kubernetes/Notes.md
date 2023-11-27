**Kubernestes - Container Orchestration tool**

## DAY30

### Why K8s? Or Problems with Docker.

- **Problem 1- Single host nature of docker container** - Nature of docker scopes to one single host and .
- **Problem 2- Docker does not provides auto healing** - Docker containers are ephemeral (Short-lived) in nature and docker does not provide any auto-healing. 
- **Problem 3- Docker does not provides auto scaling** - Auto-scaling means as soon as load increases, scaling up of containers. But docker does not provide auto-scaling feature.
- **Problem 4- Docker does not provide Enterpise level support** - Load balancing, auto-healing, auto-scaling, firewall etc... these features are not there in docker. Docker is not used in production, only docker swarm can be used.


### How K8s is soloving these problems??

- **Solution 1** - K8s has multi node architecture, means if there is a faulty node, K8s will tranfer the pod to different node. It has cluster of nodes.
- **Solution 2** - K8s provide auto-healing means, Without user intervention container should start by itself. When API server gets a signal that a container is going down, even before it goes down K8s wil spin up a new container and it will fix the damage.
- **Solution 3** - K8s has Replica sets and HPA feature, which supports auto scaling.
- **Solution 4** - K8s provide Enterpise level support.

___________________________________________________________________________________________________________________________________________________________________________________________

## DAY31
## K8s Architecture

**Master Node (Control Plane)** 	**Worker Node (Data plane)**
API Server	                        Kubelet
Scheduler	                          Kubeproxy
etcd	                              Container Runtime
Controller Manager	
CCM (Cloud Controller manager)	

- In docker smallest unit is container, where as in K8s samllest unit is POD.
- In docker we have container runtime known as Dockershim, K8s supports multiple container runtimes such as crio, containerd or dockershim.
- In docker we have docker0, bridge network, in K8s we have kubeproxy which provides networking, IP addresses and default LB features.

### Worker Node (Taking the action)

- **Kubelet** – This is responsible for running/maintaining a pod. If the pod goes down it reminds a component in control plane to fix or control this issue.
- **Container Runtime** - In order to run a pod in k8s we should have a container runtime and here unlike docker, docker is not mandatory. We can user either dockershim or containerd or crio(all these are container runtimes)
- **Kubeproxy** – Like default bridge network(docker0) in Docker, this kube-proxy basically provides us the networking, it allocates the ips to every pods we are creating and also provides the load balancing capability since, k8s supports auto scaling capability. It uses IP tables in Linux.

### Master Node (Controlling the action)

- **API sever** – This is the heart of K8s which acts as a core component in K8s and takes all incoming requests from the external world. It basically exposes K8s to the external world.
- **Scheduler** – It is responsible for scheduling the pods/resources on the K8s. for example, it schedules the pod1 to run on one of the available nodes.
- **etcd** – It is key-value storage & entire cluster related information is stored as objects/ key-value pairs inside etcd. It helps in restoring the cluster related info when required.
- **Conroller Manager** - It ensures all conrollers are always running, one of such conroller is Replica set. This replica sets is maintaining state of K8s and help in auto scaling.
- **CCM (Cloud Controller Manager)** – K8s can be run on different cloud platforms. When a user requests to create load balancer on EKS to k8s. Firstly k8s must understand the underlying cloud providers and translate the user request on to the API request that the cloud provider must understand. This mechanism is implemented on the CCM. So that load balancer gets created on the EKS.

____________________________________________________________________________________________________________________________________________________________________________________________

## DAY32
What K8s distribution you have used in your Organization?

**K8 distributions**- Distributions are popular because they provide customer support.
- Kubernetes- K8s
- RedHat- OpenShift
- Rancher Labs- Rancher
- VMware- Tanzu
- Amazon- EKS
- Azure- AKS
- Google- GKE
- Docker- DKE

 **KOPS - Kubernetes Operations**
- it requires S3 bucket to store KOPs objects.
- Domain need to be configured in route53, for Kops cluster installation.

____________________________________________________________________________________________________________________________________________________________________________________________

## DAY33
#### POD
- Smallest unit of deployment in K8s.
- A wrapper of containers.
- POD will have ClusterIP and containers can be reached via that cluster IP.
- Definition Of how to run a container, in form of YAML file.
- Can be a single container or multiple containers.
- POD provides shared network and storage to all containers.


**Minikube**
- Minikube is a single node cluster.
- Minikube will create a VM and on top of it a single node cluster.
- To create a VM in windows/MAC, you need virtualization platform
- use command-> minikube start --memory=4096 --driver=hyperkit
- if you give only- minikube start, then by default it uses docker driver

____________________________________________________________________________________________________________________________________________________________________________________________

## DAY34
### Kubernetes Deployment
