## Kubernetes

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

  
Explaining the different ways
- Cluster IP: this mode of service will allow only people having access to cluster can access the application.
- Node port : this mode of service allows only people having access to the node where application resides ( basically people inside the organisation)
- Load balancer: this mode of service exposes the application to the internet, where it creates a public IP address.

While accessing the application from the outside world, the kubernetes generates an external ip, you can access the application via http://<external ip>:<service_port>

while accessing the application using Node ip, you can use the Node ip address by the command kubectl get nodes -o wide, like http://<node_ip>:<node_port>. To access the particular node_port you need to allow the port access in the firewall settings. 

gcloud compute firewall-rules create test-node-port \
    --allow tcp:NODE_PORT

___________________________________________________________________________________________________________________________

### Ingress:

**Ingress**- In Kubernetes, ingress is an API object that manages how external users access services within a cluster.

**without ingress in the kubernetes, the application did not have the luxuries of Enterprise application like:**
- Ratio based LoadBalancing : 40% of req has to go to one pod and 60% of req has to go to other
- Sticky sessions - particular user traffic has to reach particular pod
- Path based loadbalancing
- Domain Based Load Balancing
- Black and white listing

**Another problem was, if the application had some 1000 microservices then the service type of LoadBalancer will have 1000s of static public ip address which the cloud provider will create, so tthis would bear a huge cost on the company.**

**Ingress Controller:**
- An Ingress Controller is a Kubernetes resource and a controller that manages incoming HTTP and HTTPS traffic to your Kubernetes services. It acts as an entry point for incoming traffic to the cluster and routes requests to different services based on rules defined in Ingress resources.
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
  
Roles are the set of permissions defined in the yaml file and then users or service accounts are assined these roles. Cliuster roles are defined at cluster level.

Role Binding is binding roles to the user or service accounts.

Service Account is an identity that a Pod can use to interact with the Kubernetes API server and access various resources within the cluster. It's similar to how a user account represents a human user in a traditional operating system, but a Service Account is used for applications and Pods running inside the cluster. Service Accounts are mainly used for authentication and authorization purposes.

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

**Ways of storing secrets**

In Kubernetes, secrets can be stored and managed in multiple ways, each offering different features and security characteristics. Here are the main ways to store secrets in Kubernetes:

1. **Using Kubernetes Secrets:**
   - Kubernetes provides a built-in resource called Secrets for storing sensitive information such as passwords, OAuth tokens, and SSH keys.
   - Secrets are stored in etcd, the distributed key-value store used by Kubernetes, and are encrypted at rest by default.
   - Secrets can be mounted as volumes or exposed as environment variables in Pods, allowing applications to access sensitive data securely.

2. **Using External Vault or Key Management Services:**
   - Kubernetes can integrate with external secret management systems such as HashiCorp Vault, AWS Secrets Manager, Azure Key Vault, or Google Cloud KMS.
   - These external systems provide advanced features for managing secrets, such as centralized access control, audit logging, automatic rotation, and integration with external identity providers.
   - Kubernetes can use the SecretProviderClass or SecretProviderRef objects to dynamically retrieve secrets from external secret management systems and inject them into Pods at runtime.

3. **Using Custom Controllers or Operators:**
   - Organizations can develop custom controllers or operators to manage secrets in Kubernetes according to their specific requirements.
   - These custom controllers can leverage Kubernetes custom resources or annotations to define and manage secrets and integrate with external systems or processes for secret generation, rotation, and distribution.
   - Custom controllers offer flexibility and extensibility for implementing custom secret management workflows and integrating with existing infrastructure and tooling.

4. **Using Configuration Management Tools:**
   - Configuration management tools such as Helm, Kustomize, or Kubernetes ConfigMaps can be used to manage configuration data and secrets alongside other Kubernetes resources.
   - Secrets can be stored as part of Helm charts, Kustomize overlays, or ConfigMaps and deployed along with other application components.
   - While not designed specifically for secret management, these tools offer a convenient way to manage configuration data and secrets in Kubernetes deployments.

Each approach to storing secrets in Kubernetes has its advantages and trade-offs in terms of security, ease of management, integration capabilities, and complexity. Organizations should evaluate their requirements and choose the approach that best fits their needs and infrastructure environment.

**How to use AWS secrets manager to store kubernetes secrets**

To store Kubernetes secrets using AWS Secrets Manager, you can leverage the AWS Secrets Store CSI Driver. This driver enables you to use secrets stored in AWS Secrets Manager as Kubernetes secrets.

Here's how you can store Kubernetes secrets using AWS Secrets Manager:

1. **Install the AWS Secrets Store CSI Driver:**
   - Begin by installing the AWS Secrets Store CSI Driver on your Kubernetes cluster. You can find the installation instructions in the official AWS documentation.

2. **Create a Secret in AWS Secrets Manager:**
   - Use the AWS Management Console, AWS CLI, or SDK to create a secret in AWS Secrets Manager. The secret can contain key-value pairs of sensitive data.
   - For example, you might create a secret named "my-secret" with key-value pairs for "username" and "password".

3. **Define a Kubernetes SecretProviderClass:**
   - Create a Kubernetes SecretProviderClass object that defines how to retrieve secrets from AWS Secrets Manager.
   - Specify the ARN (Amazon Resource Name) of the secret in AWS Secrets Manager and any additional configuration parameters.
   - For example:

   ```yaml
   apiVersion: secrets-store.csi.x-k8s.io/v1alpha1
   kind: SecretProviderClass
   metadata:
     name: aws-secrets
   spec:
     provider: aws
     parameters:
       secretArn: arn:aws:secretsmanager:region:account-id:secret:secret-name
   ```

4. **Mount the Secret in Pods:**
   - Define a Kubernetes Secret object that references the SecretProviderClass and specifies the desired secret keys to be mounted.
   - Mount the secret as a volume or expose it as environment variables in your Pods.
   - For example:

   ```yaml
   apiVersion: v1
   kind: Pod
   metadata:
     name: my-pod
   spec:
     containers:
     - name: my-container
       image: my-image
       volumeMounts:
       - name: secret-volume
         mountPath: /etc/secrets
     volumes:
     - name: secret-volume
       csi:
         driver: secrets-store.csi.k8s.io
         readOnly: true
         volumeAttributes:
           secretProviderClass: "aws-secrets"
   ```

5. **Access the Secrets in Pods:**
   - Once the Pod is running, the secrets will be available at the specified mount path (/etc/secrets in the example).
   - Your application running in the Pod can access the secrets from the mounted volume or environment variables as needed.

By following these steps, you can store Kubernetes secrets using AWS Secrets Manager and access them securely from your Pods using the AWS Secrets Store CSI Driver.


### Why should we prefer volume mounts over SecretKeyRef

- Secrets are exposed as env variables when we use SecretKeyRef where as in volume mounts secrets are exposed to only files within the filesystem.
- We can impose file permissions for more security.
- volume mounts can handle larger secrets.
- Secrets mounted as volumes can be automatically updated by Kubernetes without requiring a pod restart.
- The containerized application can read the updated secret directly from the filesystem. With environment variables, the container would need to be restarted to pick up changes, making secret rotation more cumbersome.

___________________________________________________________________________________________________________________________

### Persistent Volume, Persistent volume claims and Storage classes

**Problem Statement 1**
- Data loss when a container is deleted.

**Problem Statement 2**
- Data is not shared among the containers.

- With k8s volumes above two problems are solved, it helps in sharing the data and in data persistence.
- data will be stored on the node where pod is running.
- storing data to empty dir volume is not a perfect solution.
- Volume should be at container level.
- Volume mount should be inside container.

**Storing the data at container level**

if a container is deleted or restarted, data will not persist and also it cant be shared between the containers inside the pod
 
**Storing the data at pod level**
- we user volume and volumeMounts to store the data at pod with emptyDir:{}
- the data is shared between the containers
- if the pod goes down the data will be lost and the data cant be shared between the pods.
 
**Storing the data at Node level**
- we use volume and volumeMounts to store data at the node level with hostPath:{}
- the data is shared between the pods
- if the node goes down the data will be lost and the data cant be shared among nodes.
 
The best practice would be storing the data at Remote storage for ex: cloud storage(Recommended), Local storage

**PV**:A Persistent Volume (PV) in Kubernetes is a resource that represents a piece of storage in a cluster, such as a physical disk or network storage. PVs are used to store data that should persist beyond the lifecycle of a single pod or container. They provide a way to manage and decouple storage from the application, making it possible to reuse storage across different pods, even if the pods are rescheduled or replaced.

**PVC**: A Persistent Volume Claim (PVC) in Kubernetes is a request for a specific amount of storage with certain characteristics, like access mode and storage class. PVCs are used by pods to claim access to Persistent Volumes (PVs). PVCs act as an intermediary between the storage resources that are defined by Persistent Volumes and the storage requirements of pods.

**Dynamic Provisioning**:PVCs can be used with Storage Classes to enable dynamic provisioning. In this case, when a PVC is created, a PV is automatically created to meet the storage requirements if no suitable pre-existing PV is available.

**Staorage Class**: A Storage Class in Kubernetes is a resource object that defines the type and properties of storage that can be dynamically provisioned for Persistent Volume Claims (PVCs). Storage Classes allow you to abstract and standardize the provisioning of storage, making it easier to manage and allocate storage resources in a Kubernetes cluster. 

In Kubernetes, when a StorageClass is defined, it serves as an abstraction layer that defines how dynamic provisioning of PersistentVolumes (PVs) should be handled. When a PersistentVolumeClaim (PVC) references a StorageClass, Kubernetes automatically creates a PV based on the defined StorageClass rules. 

For AWS specifically, when a PVC requests storage from a StorageClass, Kubernetes interacts with the AWS cloud provider through the AWS CSI (Container Storage Interface) driver to dynamically provision a PersistentVolume based on the specifications provided in the StorageClass.

**Here's a general flow of how it works:**

1. **PVC Request:** A PVC requests storage by specifying the desired storageClassName in its definition.

2. **StorageClass Configuration:** The StorageClass contains configurations specifying the provisioning details, such as the provisioner, parameters (like storage type, size, encryption, etc.), and AWS-specific settings.

3. **Dynamic Provisioning:** Kubernetes, through the CSI driver for AWS, communicates with AWS APIs to provision a new EBS volume based on the defined StorageClass rules.

4. **Creation of PV:** Once the EBS volume is provisioned in AWS, Kubernetes creates a PV object to represent this volume within the cluster.

5. **Binding PV to PVC:** Finally, Kubernetes binds the PVC to the dynamically provisioned PV, allowing the PVC to access the provisioned storage.

This dynamic provisioning mechanism allows Kubernetes to automate the creation of storage resources in the cloud provider (such as AWS) based on the defined policies in the StorageClass, providing users with on-demand storage that meets their specified requirements without manual intervention.

**Normal Flow without Dynamic provisioning?**
- Create a PersistentVolume (PV)
- Create a PersistentVolumeClaim (PVC)
- Admission Controller Validation - When the PVC is created, the admission controller intervenes to validate the request.
   - Validation: The admission controller checks that the PVC’s requested storage and access modes match those of available PVs. This ensures that the PVC can be fulfilled by existing PVs.
   - Mutating: If necessary, the admission controller can also modify the PVC to align with policies or quotas defined by the cluster administrators.
- Binding the PVC to a PV
- Deploy a Pod that uses the PVC

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

___________________________________________________________________________________________________________________________

## Advance Scheduling in kubernetes

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/b6b3c0f7-a9e8-4aaf-8b78-67393a80cfa0)

- Kubernetes considers the pod resource requirements and other customizations, then schedules the pod onto a node.
- Most of the time we do not need to guide the scheduler, it does the job for us.
- Must be specified at pod level, not container level.

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/76034b8c-b327-4f8c-a6d7-dd4350653dbb)

There may be cases where we need to deploy our pod onto a specific nodes then we need to guide the scheduler using the different ways
- nodeName - to deploy all pods on to a single node.
- nodeSelector -  if you want to deploy pods based on label name.
- Affinity
   - Node Affinity -  if you want to bring a pod and a node close to eachother
   - Pod Affinity -  if you pods to be close to eachother
- Taints and Tolerations - tainted nodes can have only pods that can tolerate the particular taint.

**nodeName**
to deploy all our replicas on one single node then we specify the nodename. not recommended way though.

**nodeSelector**
- To run our pods on multiple nodes, we should use the nodeselector type.
- Here we should add the labels to the node using, **kubectl label node *nodename* *team=analytics***, label should be in the form key value pair.
- The in the deployment.yaml we mention nodeselector with the label. so that pods having the label gets deployed in the nodes that matches with the label. (same labels can be given to multiple nodes).

**affinity**
- in short affinity is an alternative to nodeselector and allows us to instruct kubernetes to schedule our pod onto specifc nodes based on condition with advanced operators.
  - **nodeAffinity**-used to select the nodes to schedule the pods
      - **requiredDuringSchedulingIgnoredDuringExecution**(Hard)- Required means node should meet all the conditions specified in the pod specification in order to schedule the pod. *IgnoredDuringExecution* the running pods that are already on a node doesnt get impacted.
        
        ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/86aad24d-f9f3-4ed5-b862-02cad37b7067)

      - **prefferredDuringSchedulingIgnoredDuringExecution**(soft) - we provide the prefernce with the weight, based on this nodes are ranked
        
        ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/623eff4d-e4ff-4f13-b4c2-8aecffa1dcb8)
        ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/c56a683d-33f2-4100-9a82-06535bb79c76)

**NOTE** - if we use both nodeAffinity and nodeSelector both must be satisfied.
  - **podAffinity**- it is used to colocate the pods, imagine two application needs to communicate too frequently, so they must be deployed in the same node, this is where podAffinity helps.
    
    ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/5638daff-1563-47c6-aa44-4d76bb79c93c)
  - **podAntiAffinity**- contrast of podAffinity
    
    ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/2911cfe3-d41f-4005-b21f-4297692a4441)

**Taints and Toleration**

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/94909a82-d599-4ad6-8a2d-4c9fd1b9be50)

- With this you can keep pods away from the nodes and attaract the tolerant pods to the nodes.
- Taints are added to node
- tolerations are specified to pods

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/782c2893-9dfd-4d33-bd04-d8acf84166d6)

when the tolerations value match the taint value added, based on the the taint effect mentioned to that node, pods are scheduled

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/985064bd-549f-4145-a835-664e9165b066)

**Summary**
![image](https://github.com/muppin/mastering-DevOps/assets/121821200/1a10fe47-139b-4472-9a6c-8701d3874acd)


## Autoscaling in kubernetes

Types of Autoscalers:
- HPA(Horizontal pod autoscaler)
- VPA(Vertical Pod autoscaler)
- CA(Cluster autoscaler)

### HPA

- ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/5f149bb0-af95-472e-a025-5629abf088aa)
- cAdvisor collects the metrics from the pod every 1os and feeds it to Kubelet.
- metrics server aggregates the metrics and expose it to API server.
- HPA queries every 15s to check the usage as mentioned in the config file, if the usage exceeds it adds a new replica. if the usage falls below, deletes the replica.

- increases/decreases the no of replicas when there is spike/no spike in memory, cpu or some other metrics.
- ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/8eef8241-429f-4805-99cd-5db4e56e8601)

### VPA

- increases/decreases the resources of existing pod, instead of creating new pods.
- ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/c840af7e-b9f2-4250-890d-b14f8614bfcf)

```
apiVersion: autoscaling.k8s.io/v1
kind: VerticalPodAutoscaler
metadata:
  name: my-app-vpa
  namespace: default
spec:
  targetRef:
    apiVersion: "apps/v1"
    kind:       Deployment
    name:       my-app
  updatePolicy:
    updateMode: "Auto"
  resourcePolicy:
    containerPolicies:
    - containerName: '*'
      minAllowed:
        cpu: 100m
        memory: 128Mi
      maxAllowed:
        cpu: 1
        memory: 1Gi
```

- update modes:
    - Auto : kubernetes applies the resource limits to the pods recommended by VPA
    - off : VPA just recommends not applies
    - Initial : VPA applies the new recommended resource limits to the new pods.
    - **Note: in production, update mode is set to off so that pods are not restarted and there is no application downtime**
- By default VPA is not available in cluster, we need to install.

## When to use HPA and VPA

Horizontal Pod Autoscaler (HPA) and Vertical Pod Autoscaler (VPA) are both Kubernetes mechanisms for automatically adjusting the resources allocated to applications, but they are used in different scenarios based on the nature and requirements of the applications.

### Horizontal Pod Autoscaler (HPA)

**HPA** automatically scales the number of pods in a deployment or replication controller based on observed CPU utilization (or other select metrics). It is most effective for applications where the workload can be distributed across multiple instances. Here are typical use cases:

1. **Stateless Applications**:
   - **Web Servers**: Applications like web servers (e.g., Nginx, Apache) that can handle requests independently across multiple instances.
   - **Microservices**: Microservice architectures where each service can scale out independently.

2. **Batch Processing**:
   - **Data Processing Jobs**: Applications that process data in parallel, such as data analysis or ETL (Extract, Transform, Load) jobs.
   
3. **Event-Driven Applications**:
   - **Message Processing**: Applications that process messages from a queue (e.g., RabbitMQ, Kafka), where increasing the number of consumers can improve throughput.

4. **High Availability Applications**:
   - **API Services**: Services where you want to maintain high availability and quickly respond to increased traffic by adding more instances.

**Example HPA YAML:**

```yaml
apiVersion: autoscaling/v1
kind: HorizontalPodAutoscaler
metadata:
  name: example-hpa
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: example-deployment
  minReplicas: 1
  maxReplicas: 10
  targetCPUUtilizationPercentage: 50
```

### Vertical Pod Autoscaler (VPA)

**VPA** adjusts the CPU and memory requests/limits of containers in a pod based on historical usage and current demands. It is suitable for applications where performance is more sensitive to the resources allocated per pod rather than the number of pods. Here are typical use cases:

1. **Stateful Applications**:
   - **Databases**: Applications like relational databases (e.g., MySQL, PostgreSQL) or NoSQL databases (e.g., MongoDB, Cassandra) that benefit from vertical scaling due to the complexity of data consistency and state management.
   
2. **In-Memory Data Stores**:
   - **Caching Layers**: In-memory data stores like Redis or Memcached, which may perform better with more memory or CPU.

3. **Machine Learning Models**:
   - **Model Serving**: Serving machine learning models where the model inference requires significant CPU or memory and benefits from vertical scaling.

4. **Monolithic Applications**:
   - **Legacy Applications**: Monolithic applications that are difficult to scale horizontally but can benefit from additional CPU or memory.

**Example VPA YAML:**

```yaml
apiVersion: autoscaling.k8s.io/v1
kind: VerticalPodAutoscaler
metadata:
  name: example-vpa
spec:
  targetRef:
    apiVersion: "apps/v1"
    kind:       Deployment
    name:       example-deployment
  updatePolicy:
    updateMode: "Auto"
```

### Summary

- **HPA** is best suited for stateless applications, batch processing jobs, event-driven applications, and any workload that can easily be distributed across multiple instances.
- **VPA** is best suited for stateful applications, in-memory data stores, machine learning model serving, and monolithic applications where resource demands are more sensitive to the capacity of individual pods.

Both HPA and VPA can be used together in a complementary manner. For example, you might use HPA to scale the number of pods based on external demand while using VPA to ensure each pod has the optimal amount of resources for its workload. This combination can provide both flexibility and efficiency in resource management for various types of applications.

### CA

- it adds the nodes to the cluster if there are pods stuck at pending state due to lack of resources available in the cluster.
- deletes the node whenever the resource usage falls below 50% in the node.
- ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/2af9ad86-1d40-4982-8930-0568554b1925)
- every 10s cluster autoscaler checks for unscheduled pod and resource usage to add or remove nodes inside the cluster.

### Integration of Cluster Autoscaler with ASGs

In EKS, the Cluster Autoscaler interacts with ASGs to dynamically manage the node count in response to the needs of the Kubernetes cluster. Here’s how the integration works:

- Monitoring: The Cluster Autoscaler continuously monitors the state of the cluster, checking for unschedulable pods and underutilized nodes.
- Scaling Up: When the Cluster Autoscaler detects unschedulable pods due to resource constraints, it interacts with the ASGs to launch additional EC2 instances, thereby increasing the cluster size.
- Scaling Down: When the Cluster Autoscaler identifies underutilized nodes that can be safely drained and terminated without affecting running applications, it instructs the ASGs to terminate these nodes, thus reducing the cluster size.

**Summary**
- EKS uses both the Kubernetes Cluster Autoscaler and Amazon EC2 Auto Scaling Groups (ASGs) to scale worker nodes.
- The Cluster Autoscaler adjusts the number of nodes based on the resource needs of the Kubernetes cluster.
- ASGs manage the underlying EC2 instances, handling automatic scaling, health checks, and load balancing.

  
## Daemonset in Kubernetes

- In the case of performing node specific stasks like collecting logs, metrics we have to use of DaemonSets.
- DaemonSets runs pods on every single node even when the cluster adds the node dynamically to collect the logs, metrics.
- DaemonSet also deletes the running pod if the node is deleted from the cluster.
- with daemonset we make sure pod runs on every single node always.
- Question may arise.. why can't you also use Deployments-Replica sets to run pods on nodes?
  - deployements can deploy pods on available nodes, the new incoming node dynamically wont be having any pods unless we apply deployments.
  - deployments cant guarantee the pods running on every single node.

 ### Use cases

 -  used for deploying logging agents like fluentd, logstash to collect logs from the node
 -  used for monitoring agents like prometheus, grafana, datadog. this ensures collecting metrics from the nodes and have centralised location for analysis.
 -  used for deploying network agents, ensures network policies on all nodes.

**Note: whenever you create a cluster, kubernetes by default creates kube-proxy daemonset in kube-system namespace that deploy kube-proxy pod on all the nodes**

- whenever you delete a ds, all associated pods gets deleted.
- if you want to keep pods assoaciated with those ds, use --cascade=false while deleting the ds.

### Kubernetes ADD ons

Kubernetes add-ons are additional components or functionalities that can be installed on a Kubernetes cluster to enhance its capabilities or provide additional features. These add-ons are often essential for managing and operating Kubernetes clusters effectively. Some common Kubernetes add-ons include:

1. **Dashboard**: The Kubernetes Dashboard provides a web-based user interface for managing and monitoring Kubernetes clusters. It allows users to view and manage resources, inspect cluster metrics, and troubleshoot issues.

2. **DNS**: Kubernetes clusters typically include a DNS add-on, such as CoreDNS or kube-dns, to provide DNS-based service discovery within the cluster. This allows pods and services to communicate with each other using DNS names.

3. **Ingress Controller**: An Ingress controller manages external access to services running within the Kubernetes cluster. It provides features such as SSL termination, path-based routing, and load balancing for incoming traffic.

4. **Container Network Interface (CNI)**: CNI plugins enable networking between pods and nodes in a Kubernetes cluster. They provide the necessary networking features, such as IP address management, routing, and isolation, to facilitate communication between containers.

5. **Monitoring and Logging**: Add-ons such as Prometheus and Grafana are commonly used for monitoring Kubernetes clusters and applications running on them. These tools collect metrics and logs from various components of the cluster and provide dashboards for visualization and analysis.

6. **Storage Provisioner**: Kubernetes storage add-ons, such as dynamic storage provisioners or CSI drivers, enable dynamic provisioning and management of storage volumes for persistent storage in Kubernetes clusters.

7. **Service Mesh**: Service mesh technologies like Istio and Linkerd provide advanced networking and security features for microservices running on Kubernetes. They offer capabilities such as traffic management, load balancing, service discovery, and encryption.

8. **Cluster Autoscaler**: The Cluster Autoscaler add-on automatically adjusts the size of the Kubernetes cluster based on resource utilization and workload demands. It scales the cluster by adding or removing nodes to maintain optimal resource usage.

9. **Horizontal Pod Autoscaler (HPA)**: HPA automatically adjusts the number of replica pods for a deployment or replication controller based on CPU or custom metrics, ensuring that the application can handle varying levels of traffic.

10. **Security Policies**: Kubernetes security add-ons, such as Pod Security Policies (PSPs) or admission controllers, enforce security policies and controls to protect the cluster and its workloads from malicious attacks or misconfigurations.

These are just a few examples of Kubernetes add-ons. Depending on your specific requirements and use cases, you may choose to install additional add-ons to extend the functionality of your Kubernetes cluster.


**CoreDNS**
CoreDNS is a flexible, extensible DNS server used as the default DNS server in Kubernetes clusters. It provides DNS-based service discovery and resolution within the cluster, allowing Kubernetes services, pods, and other resources to be accessed by their domain names.







