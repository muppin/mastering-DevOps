## Kubernates

**Basically, why Kubernetes?**
- The Docker had many problems in day-to-day life in the industry,
- Four main problems of the docker that are,
    -	Single host
    -	Not capable of Auto scaling
    -	Not capable of Auto Healing
    -	Docker is not of Enterprise Nature
      
So, if we wonder how all these problems are solved, here comes the Kubernetes.
- Kubernetes is an Open-source platform for managing containerized applications. It automates the deployment, scaling and management of these applications. It is portable, extensible and declarative, and has a large and growing ecosystem of services and tools. 

So, Kubernetes came up with a solution for all those docker problems.

**How did it solve the problem of single host?**
- By default, Kubernetes is a cluster, cluster is group of nodes. So, Kubernetes on production is installed in terms of Master node architecture just like Jenkins. 
- If there are 100s of containers running and if one of the container lifecycles is affecting any of the containers, what Kubernetes does is, it just picks up the affected container and puts into the other node to resume its capability without any intervention.

**How does it solve Auto scaling?**
- Kubernetes has something called replica set.
- So, if a container is experiencing a huge load on a certain time (the no of users hitting the application n increases). We have replicaset.yaml file and increase the replicas and bring up the new containers manually. Kubernetes also supports HPA (Horizontal pod Auto scaler) using which we can increase the no of containers whenever we experience the load.

**How does it solve Auto healing?**
- Kubernetes controls and fix the damage.
- If one of the containers goes down, using the Auto healing feature Kubernetes will spin up a new container before the old one dies.
- We have something called API server in k8s, this API servers receives the signal of container going down, immediately the k8s rolls out a new container before the old one goes down. The user doesn’t even experience of any shutdown of the application.

**How will it support Enterprise Nature?**
- People at Google Built Enterprise level container orchestration platform called Kubernetes.
- Since Docker is not of enterprise nature (Load balancer support, firewall support, auto healing, auto scaling, Api gateways, blacklisting ips etc.). so, it is never used in Production platform. Kubernetes is aiming to solve these problems.

**Kubernetes Architecture**

**Master Node (Control Plane)**
- API Server	                
- Scheduler	                    
- etcd	                        
- Controller Manager	
- CCM (Cloud Controller manager)

**Worker Node (Data plane)**
- Kubelet
- Kubeproxy
- Container Runtime

To explain this, in docker simplest thing is container and k8s simplest thing is pod.

When a container is created in docker using a docker run command, what happens behind the scenes. when we use docker run command, to execute this process we should have container run time env which is called Dockershim.

Similarly in Kubernetes, we have master node architecture. When a pod is deployed on k8s it goes through Master node and executed on worker node.

**Worker Node**
- Kubelet – this is responsible for running/maintaining a pod. If the pod goes down it reminds a component in control plane to fix or control this issue.
- Container Runtime - in order to run a pod in k8s we should have a container runtime and here unlike docker, docker is not mandatory. We can user either dockershim or containerd or crio(all these are container runtimes)
- Kubeproxy – Like default bridge network(docker0) in Docker, this kube-proxy basically provides us the networking, it allocates the ips to every pods we are creating and also provides the load balancing capability since, k8s supports auto scaling capability. It uses IP tables in Linux.

**Master Node**
- API sever – Acts as a core component in K8s and takes all incoming requests. It basically exposes K8s to the external world.
- Scheduler – it is responsible for scheduling the pods/resources on the K8s. for example, it schedules the pod1 to run on one of the available nodes.
- etcd – it is key-value storage, and the entire cluster related information is stored as objects/ key-value pairs inside etcd. It helps in restoring the cluster related information when required.
- Controller manager – since k8s supports auto scaling therefore k8s has something called as Controllers. For example, replica sets. This replica sets is maintaining state of K8s and help in auto scaling.
- CCM – K8s can be run on different cloud platforms. When a user requests to create load balancer on EKS to k8s. Firstly k8s must understand the underlying cloud providers and translate the user request on to the API request that the cloud provider must understand. This mechanism is implemented on the CCM. So that load balancer gets created on the EKS.

__________________________________________________________________________________________________________________________
### Overview of Manifest file

**Each Configuration file has 3 parts:**
- Metadata
- Specification
- Status - this one is automatically generated and added by Kubernetes.

**Layers of Abstractions:**
- when you create a deployment, by default it creates replica set and a pod. Therefore,
- Deployment manages a ReplicaSet
- ReplicaSet manages a Pod
- Pod is an abstarction of Container

**Connecting Components:**
- The connection is established by Labels, selectorsand ports.  
- Metadata part contains Labels and Specification part contains Selectors

___________________________________________________________________________________________________________________________

### Namespace

**What is Namespace?**
- Organise Resources in namespace. It is a virtual cluster inside a cluster.
  
*a cluster contains 4 namespaces :*
- kube-system: do not create or modify in kube-system. system process, master and kubectl are deployed in this namespace.
- kube-public: contains publicely accesble data like configmap, which contains cluster information
- kube-node-lease: holds the heartbeats of nodes, determines the availability of nodes
- default: resources you create without any particular namespace are located here. 

**Use cases of namespace:**
- Resource grouped in Namespaces : logically grouping of resources inside a cluster
- Confilcts: many teams, same application : each team can work in their own namespace without disrupting others.
- Resource Sharing: Staging and development : namespaces can hold the common resources and these resouces can be shared across staging and development, rathar than creating in both of them.
- Resource Sharing: Blue/Green Deployment: (Blue/green deployment: it is live production and coming up production instances) these both production instances can use common resources deployed under a namespace.
- Access and resource Limits on Namespaces : limits authentication to the users based on the namespace. It also limits the available resource to the namespaces in the cluster.

**Characterstics of a namespace:**
- Each NS must define own ConfigMap.
- each NS must define own Secrets.
- Service can be shared across Namespace
- Some Components, which cant be created within namespace are volume, node.

___________________________________________________________________________________________________________________________

### Service:

**Why service is needed?**
- so in the world of kubernetes, when the pod goes down and comes back due to its auto healing capability, the pod gets a different ip address every time a pod goes down and comes back, so a user cant access the application using Ip address. therefore kubernetes introduces a service for this purpose and application can be accessed via service,

**The service provides the capabilities like:**
- Load balancing: It distributes the incoming requests to the available pods equally
- Service Discovery: Services uses Labels and Selectors to talk to the pods instead of Ip addresses.
- Exposes the application to the external Network:
- The service helps in exposing the application running inside the pods to the external network in 3 different ways i.e. 1) Cluster IP 2) Node Port 3) Load balancer

- Cluster IP: this mode of service will allow only people having access to cluster can access the application.
- Node port : this mode of service allows only people having access to the node where application resides ( basically people inside the organisation)
- Load balancer: this mode of service exposes the application to the internet, where it creates a public IP address.

- While accessing the application from the outside world, the kubernetes generates an external ip, you can access the application via http://<external ip>:<service_port>
- while accessing the application using Node ip, you can use the Node ip address by the command kubectl get nodes -o wide, like http://<node_ip>:<node_port>. To access the particular node_port you need to allow the port access in the firewall settings. 
- gcloud compute firewall-rules create test-node-port \
    --allow tcp:NODE_PORT

___________________________________________________________________________________________________________________________

### Ingress:

**without ingress in the kubernetes, the application did not have the luxuries of Enterprise application like:**
- Ratio based LoadBalancing : 40% of req has to go to one pod and 60% of req has to go to other
- Sticky sessions - particular user traffic has to reach particular pod
- Path based loadbalancing
- Domain Based Load Balancing
- Black and white listing

**Another problem was, if the application had some 1000 microservices then the service type of LoadBalancer will have 1000s of static public ip address which the cloud provider will create, so tthis would bear a huge cost on the company.**

**Ingress Controller:**
- This is a component which looks for a Ingress resouce. This is just Load Balancer and Api Gateway.
- Make sure that IngressClass name is same for both Ingress resource and ingress controller.
- To install the ingress controller: https://kubernetes.github.io/ingress-nginx/deploy/#gce-gke
- To check the logs of the ingress controller : kubectl logs <pod name> -n <namespace>
- to configure the cloud DNS watch: https://www.youtube.com/watch?v=1lsFYHtWbEc

___________________________________________________________________________________________________________________________

### Kubernetes RBAC:
- users/ service accounts
- Roles/ Cluster roles
- Role Binding/ Cluster Role Binding

  Kubernetes offloads the user management to Identity providers. for example if you are working in aws EKS cluster, the user related stuffs are taken care by IAM, this is how it offloads the user management to Identity providers 
- Roles are the set of permissions defined in the yaml file and then users or service accounts are assined these roles. Cliuster roles are defined at cluster level.
- Role Binding is binding roles to the user or service accounts.

- Service Account is an identity that a Pod can use to interact with the Kubernetes API server and access various resources within the cluster. It's similar to how a user account represents a human user in a traditional operating system, but a Service Account is used for applications and Pods running inside the cluster. Service Accounts are mainly used for authentication and authorization purposes.

 __________________________________________________________________________________________________________________________

### Kubernetes Custom Resources:
- Kubernetes Custom Resources (CRs), also known as Custom Resource Definitions (CRDs), allow you to extend the Kubernetes API and create your own resource types tailored to your specific application or use case. 
- Firstly as a Devops Engineer, you create a Custom Resource Definition(CRD), CRDs define the structure and schema for your custom resources. They specify what fields and metadata your custom resources can have, much like a blueprint. and also validates the custom resources created by the users.
- secondly you create a custom resources based on that definition. CRs follow the schema defined in the associated CRD and can have fields and values specific to your application.
- After defining CRDs and creating CRs, you typically need custom controllers to manage and reconcile the state of your custom resources. Custom controllers are software components that watch for changes in CRs and take action to ensure the desired state is met. They are responsible for the lifecycle management of custom resources.

**Uses of Custom Resources:**
- Custom Resources are commonly used for managing complex applications, databases, stateful services, and other resources that don't have built-in Kubernetes resource types.

___________________________________________________________________________________________________________________________

### Config maps and secrets:
- In Kubernetes, ConfigMaps and Secrets are two important resources used for managing configuration data and sensitive information, respectively. They allow you to decouple configuration from your application code and keep sensitive data secure.

**Config maps:**
- ConfigMaps are used to store configuration data in a key-value format, which can be consumed by Pods as environment variables, command-line arguments, or as files in volumes.
- ConfigMaps are typically used for storing non-sensitive configuration data, such as environment variables, application configuration files, or any other settings that your application needs.

**Secrets:**
- Secrets are used to store sensitive data, such as passwords, API tokens, and SSL certificates, in a more secure manner than ConfigMaps. They are base64-encoded by default but can be used to store binary data as well.
- Secrets are typically used for storing sensitive data that should not be exposed in plain text. This data is often needed for authentication, encryption, or other security-related purposes.

___________________________________________________________________________________________________________________________

### Persistent Volume, Persistent volume claims and Storage classes

- **PV**:A Persistent Volume (PV) in Kubernetes is a resource that represents a piece of storage in a cluster, such as a physical disk or network storage. PVs are used to store data that should persist beyond the lifecycle of a single pod or container. They provide a way to manage and decouple storage from the application, making it possible to reuse storage across different pods, even if the pods are rescheduled or replaced.

- **PVC**: A Persistent Volume Claim (PVC) in Kubernetes is a request for a specific amount of storage with certain characteristics, like access mode and storage class. PVCs are used by pods to claim access to Persistent Volumes (PVs). PVCs act as an intermediary between the storage resources that are defined by Persistent Volumes and the storage requirements of pods.

- **Dynamic Provisioning**:PVCs can be used with Storage Classes to enable dynamic provisioning. In this case, when a PVC is created, a PV is automatically created to meet the storage requirements if no suitable pre-existing PV is available.

- **Staorage Class**: A Storage Class in Kubernetes is a resource object that defines the type and properties of storage that can be dynamically provisioned for Persistent Volume Claims (PVCs). Storage Classes allow you to abstract and standardize the provisioning of storage, making it easier to manage and allocate storage resources in a Kubernetes cluster. 

In Kubernetes, when a StorageClass is defined, it serves as an abstraction layer that defines how dynamic provisioning of PersistentVolumes (PVs) should be handled. When a PersistentVolumeClaim (PVC) references a StorageClass, Kubernetes automatically creates a PV based on the defined StorageClass rules. 

For AWS specifically, when a PVC requests storage from a StorageClass, Kubernetes interacts with the AWS cloud provider through the AWS CSI (Container Storage Interface) driver to dynamically provision a PersistentVolume based on the specifications provided in the StorageClass.

**Here's a general flow of how it works:**

1. **PVC Request:** A PVC requests storage by specifying the desired storageClassName in its definition.

2. **StorageClass Configuration:** The StorageClass contains configurations specifying the provisioning details, such as the provisioner, parameters (like storage type, size, encryption, etc.), and AWS-specific settings.

3. **Dynamic Provisioning:** Kubernetes, through the CSI driver for AWS, communicates with AWS APIs to provision a new EBS volume based on the defined StorageClass rules.

4. **Creation of PV:** Once the EBS volume is provisioned in AWS, Kubernetes creates a PV object to represent this volume within the cluster.

5. **Binding PV to PVC:** Finally, Kubernetes binds the PVC to the dynamically provisioned PV, allowing the PVC to access the provisioned storage.

This dynamic provisioning mechanism allows Kubernetes to automate the creation of storage resources in the cloud provider (such as AWS) based on the defined policies in the StorageClass, providing users with on-demand storage that meets their specified requirements without manual intervention.

___________________________________________________________________________________________________________________________

### Helm Charts:
Helm is a package manager for Kubernetes that simplifies the deployment and management of containerized applications. Helm uses packages called "charts" to define, install, and upgrade even the most complex Kubernetes applications. Helm charts are like pre-configured application packages that can be easily installed and managed within a Kubernetes cluster.

Helm charts are used when deployoing some of the predefined applications that are required for our applications.
They are also used for deploying multiple microservices using the same configuration files by changing the values in values.yaml
Deploy same set of application on different environments using Helm package.

**Chart Structure:**
A Helm chart is structured as a directory with a specific layout.

The basic components of a Helm chart include:
- Chart.yaml: Metadata about the chart, such as name, version, and dependencies.
- values.yaml: Default configuration values for the chart.
- templates/: YAML files defining Kubernetes resources (e.g., Deployments, Services, ConfigMaps).
- helpers.tpl: Template files and functions used in templates.
- charts/: Subcharts, which are charts that can be included in your chart as dependencies.

**Helm v2 vs v3**

- Helm v2 is more of release management and it has Client and server(Tiller) architecture. whenever install or upgrade is done everything is stored inside the architecture as a history.
- The main cause of upgrading to v3 is the tiller has a high power in the kubernetes cluster like create, update and delete, which leads to security issue. 



