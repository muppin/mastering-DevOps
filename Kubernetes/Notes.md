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

**NOTE**
- Container will be restarted.
- For pod, new pod will created.

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
- Can be a single container or multiple containers. Example- service mesh
- POD provides shared network and storage to all containers.

**If we already utilize containers, what's the rationale behind employing Pods?**
Pods represent the running specification of containers and can encompass either one or multiple containers. Consider a service mesh with a primary container and sidecar containers containing APIs or load balancing rules. Alternatively, think of a container hosting an app that another main application relies upon. This setup facilitates shared network and storage, enabling seamless communication among all containers.

**Minikube**
- Minikube is a single node cluster.
- Minikube will create a VM and on top of it a single node cluster.
- To create a VM in windows/MAC, you need virtualization platform
- use command-> minikube start --memory=4096 --driver=hyperkit
- if you give only- minikube start, then by default it uses docker driver

___________________________________________________________________________________________________________________________________________________________________________________________
## DAY 34
### Kubernetes Deployment

**When we have Pods, why is Deployment necessary?**
Pods offer a running environment for containers, but Deployments provide critical management and scaling functionalities. They enable easy rollout of updates, version controls, scaling adjustments, and automated rollout strategies for Pods. Deployments ensure reliability, manageability, and seamless maintenance of the underlying Pods, offering a higher level of control and flexibility in managing containerized applications. Provides auto-scaling and auto-healing.

Deployment -->  Replica Set --> Pods
**Controllers** - always ensure the actual state == Desired State

**Deployment Vs. ReplicaSet**
Deployments focus on managing the overall lifecycle and updates of Pods, including their scaling and rollback, while ReplicaSets concentrate on maintaining a set number of identical Pods, ensuring reliability and scalability for the application. Replica set is a controller that provides auto healing capabilities.

**In real production environment, you will never create a POD, you need to create a Deployment and this deployment will create a replicaset. Replicaset will create POD.**
What is the ideal pod size?
It depends on number of concurrent users and number of connections one replica of  POD can handle.

### Example

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.14.2
        ports:
        - containerPort: 80
```

___________________________________________________________________________________________________________________________________________________________________________________________

## DAY 35
### Kubernetes Services

**What If there is no service??**
- Suppose a container goes down, with the help of auto-healing feature it will come up again but the IP address will be changed. So to address this problem we can create service.yml which can provide load balancing capabilities.
- Without a service defined, the Pods might still function within the cluster, but they won't have a consistent and accessible endpoint for other components or external systems to interact with them.
- Instead of accessing IP, users can access services.

**What problems Services are solving??**
- **Load Balancing** - 
- **Service Discovery** - Unlike manually keeping track of IP addresses, service will only watch Labels and selectors. Service will keep track of all the pods with the help of labels, all the pods will have same label. If any pod goes down also again it will get new IP address but service will watch for Label and assign the traffic to that POD.
- **Expose to external world** - Normally to access App, need to ssh to cluster and then curl to pod IP. But to users we can't ask to do the same. Service will expose the app to outside world, it will make ur app accessible outside K8s cluster.


**Types Of K8s services**
- **Cluster IP** - Its the default service. App will be still accessible only inside Cluster. It only provides Service discovery and Load balancing.
- **NodePort** - It allows to access application inside ur organization, which means only ppl who have access to worker node IP, and they don't have access to cluster can access the app.
- **Load Balancing** - this mode of service exposes the application to the internet/external world, where it creates a public IP address. It will only work on cloud providers.


![image](https://github.com/muppin/mastering-DevOps/assets/56094875/ce2fb0f5-7447-4f55-a1cd-0215f1d49dff)



### Example

 ```
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  selector:
    app.kubernetes.io/name: MyApp
  ports:
    - protocol: TCP
      port: 80
      targetPort: 9376
 ```

______________________________________________________________________________________________________________________________________________________________________________________

## DAY 37
#### Kubernetes Services Deep Dive

port - service port for load balancer type service
target port- should be same as container port in deployment.yml
node port - 30000-32767, should be used with node ip address to access the app

_______________________________________________________________________________________________________________________________________________________________________________________

## DAY 38
#### Kubernetes RBAC

**Two primary responsibilities of RBAC**
- User Mgmt/user
- Managing the access on K8 services/service accounts

**Three major things to define RBAC in K8s**
- Service account/Users
- Roles/Cluster Roles
- Binding/ Cluster Role Binding

- K8s does not deal user mgmt, intead it Offloads the user mgmt to identity providers.
- Most popular offloading example is Sign in with google.
- The API server of K8s will act as a OAUTH Server, which will offload the user management to some identity provider.
- Whenever u create a Pod, a service account will be created, this SA will used to connect with any resource.


**To define access/to manage config/rules K8s provides two resources -**
- Roles/Cluster Roles - Role is a YMAL file where will provide all the access permission details
- Binding/ Cluster Role Binding - To attach role to a user, we use role binding. Used to attach role and service account. SA will take care of users, Role will take care of permissions and RB will take care of binding.

___________________________________________________________________________________________________________________________________________________________________________________________

### Persistent Volumes & Persistenet Volume Claims

- Whenever a pod restarts, all existing will not be saved.
- K8s does not give you data persistance out f the box.
- You need to configure it, basically we need a storage thst does'nt depend on pod lifecycle.
- Storage must be available on all pods.
- Storage need to survive even if the cluster crashes.

**Persistent Volumes-**
- Its a cluster resource used to create storage and store the data in it.
- You need to decide what type of storage u need? (Local or remote)
- Yo need to create and manage them by yourself. (task of a kubernetes admin)
- Use that physical storage in spec section.
- PV's are not namespaced.
- PV should be created before pod.

*Access Modes*
- ReadWriteMany(RWX): This mode allows the volume to be mounted as read-write by multiple nodes simultaneously. However, not all storage types support this mode. It's suitable for scenarios where multiple nodes need read-write access to the same volume, such as shared file storage.
- ReadWriteOnce(RWO): This mode allows the volume to be mounted as read-write by a single node. It's suitable for scenarios where the volume should be mounted as read-write by a single node, such as with a single-node application.
- ReadOnlyMany(ROX): With this mode, the volume can be mounted as read-only by multiple nodes. It's useful when the volume needs to be accessed in read-only mode by multiple nodes, such as for shared configuration or logs.
- ReadOnlyOnce(ROO): With this mode, the volume can be mounted as resd-only by a single node. Its useful when the volume needs to be accessed in read-only mode by single node, such as witha single-node application.
- ReadWriteOncePod(RWOP): with this mode, the volume can be mounted to a particular single pod.


*Local PV's*
- Local PV's violate below two data persistance requirements-
    - Bieng tied to a specific node
    - surving cluster crashes
    - not suitable for DB persistance
      
*Remote PV's*
- Example- google cloud, aws

**Persistant Volume Claim (PVC)**
- Applications has to claim the persistant volume, that can be done with PVC.
- PVC are used inside pod configuration

*Lifecycle*
- Pod requests the volume through the PV claim.
- Claim tries to find a volume the exact pv that fulfills the reuirement mentioned in pvc
- Volume has the actual storage backend.
- Claims must exist in the same namespace as of pod.

*Deletion Process*
- Deletion of pvc only happens if the claimed pod is deleted or modified in the yaml and if it has not been claimed.
- Deletion of Pv only happens if the claimed pvc is deleted and if it has not been claimed
- we can also delete using finalizers, but it is not recommended due to scurity thing.
- when the status of pv is released, you cant use that pv further and it should eventually be deleted.

**Storage Class**

In Kubernetes, when a StorageClass is defined, it serves as an abstraction layer that defines how dynamic provisioning of PersistentVolumes (PVs) should be handled. When a PersistentVolumeClaim (PVC) references a StorageClass, Kubernetes automatically creates a PV based on the defined StorageClass rules. 

For AWS specifically, when a PVC requests storage from a StorageClass, Kubernetes interacts with the AWS cloud provider through the AWS CSI (Container Storage Interface) driver to dynamically provision a PersistentVolume based on the specifications provided in the StorageClass.

Here's a general flow of how it works:

1. **PVC Request:** A PVC requests storage by specifying the desired storageClassName in its definition.

2. **StorageClass Configuration:** The StorageClass contains configurations specifying the provisioning details, such as the provisioner, parameters (like storage type, size, encryption, etc.), and AWS-specific settings.

3. **Dynamic Provisioning:** Kubernetes, through the CSI driver for AWS, communicates with AWS APIs to provision a new EBS volume based on the defined StorageClass rules.

4. **Creation of PV:** Once the EBS volume is provisioned in AWS, Kubernetes creates a PV object to represent this volume within the cluster.

5. **Binding PV to PVC:** Finally, Kubernetes binds the PVC to the dynamically provisioned PV, allowing the PVC to access the provisioned storage.

This dynamic provisioning mechanism allows Kubernetes to automate the creation of storage resources in the cloud provider (such as AWS) based on the defined policies in the StorageClass, providing users with on-demand storage that meets their specified requirements without manual intervention.


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
 
**Storinf the data at pod level**
- we user volume and volumeMounts to store the data at pod with emptyDir:{}
- the data is shared between the containers
- if the pod goes down the data will be lost and the data cant be shared between the pods.
 
**Storing the data at Node level**
- we use volume and volumeMounts to store data at the node level with hostPath:{}
- the data is shared between the pods
- if the node goes down the data will be lost and the data cant be shared among nodes.
 
The best practice would be storing the data at Remote storage for ex: cloud storage(Recommended), Local storage

___________________________________________________________________________________________________________________________

### Statefulsets
![image](https://github.com/muppin/mastering-DevOps/assets/56094875/d765e295-f5bb-481c-a75b-d401310bdb77)

**Problem 1**
To acheive high avalability, we need to increase the number of replicas, and when we use deployments all replicas will use the same persistent volumes. But in distributed DB if we use same PV for all the replicas then all pods will write to same DB which leads to data inconsistency.
![image](https://github.com/muppin/mastering-DevOps/assets/56094875/a0faf5ab-a84c-4829-90be-99b9c27e92f7)

**Solution**
Solution to this problem is a way to use separate PVC's for each replica, this can acheived using stateful sets.
In stateful set define the volume claim template, based on these templates separate volume claims are used for each pod which creates separate PVs.
![image](https://github.com/muppin/mastering-DevOps/assets/56094875/240d349c-a4bf-4c5d-aae4-dff73a75ded6)

**Problem 2**
In a typica master slave architecture, there are two types of pods-> Master and slaves. Master handles read/write where as slave handles read only
Basically when we create a deployment, all replicas come up at a time.

**solution**
when we use statefule set, First master pod comes and then salve 1 followed by slave 2.(Ordered)
if master pod doesnt come up, then there is no coming up of slaves as well.
while deletion as well the last pod is deleted first then at last master pod gets deleted.

for data to be written, the master pod gets the data written first, then slave 1 copies from master and slave 2 copies from slave 1.

**problem 3**
in a deployment name of the pod changes every time, when the pod restarts

**solution**
when we use statefulset, name of the pod doesnt change even if it restarts, called like Sticky identity.
Since the name of the pod is not changed, the pod again points to the same pv(this is taken care by Stateful sets).

**problem 4**
In a deployment when we use use service(it is kind of LB), the traffic goea to random pods

**solution**
in stateful set the service has to talk to a specific pod i.e. all writes should go to master and then salve1 should copy from it and slave 2 will get from slave1..... this goes on......
so we havce create a headless service, just by mention clusterIP = none
![image](https://github.com/muppin/mastering-DevOps/assets/121821200/7e5636e7-0f7e-4201-9391-72756bdebb30)

then, each pod gets a dns entry with name like mentioned above, so every time request goes to master pod.

**deployments vs statefulsets**
![image](https://github.com/muppin/mastering-DevOps/assets/121821200/73bbf172-ecba-41e0-92f9-250b3ad60928)

___________________________________________________________________________________________________________________________

#### Horizontal Pod Autoscaler
![image](https://github.com/muppin/mastering-DevOps/assets/56094875/dca992f8-cd1c-4bd4-85c3-0d6acfa555c0)



________________________________________________________________________________________________________________________________________________________________________________________

### Resource Management in Kubernetes

- CPU is compressible, means whenever an application is using maximum CPU it is throttled meaning it cuts down the CPU cycle and slows down the response rate instead of killing process.
- Memory is not compressible, means once a process gets a chunck of memory, it can't be taken away from it until it is released by the process itself.
![image](https://github.com/muppin/mastering-DevOps/assets/56094875/51d7bb49-8f49-4211-889f-831e2b9848a4)

**K8s compares the resource request defined in the POD, with the available resource on each node in the cluster and automatically assigns a node in the cluster to the pod.**

- **Request** - With request we define the minimum resources that should be available on a node to schedule a pod.
- **Limit** - With limits we define a maximum resource a pod can use.
- If we don't define the requests and limits, the K8s scheduler may schedule all our pods onto the same node without triggering any auto scaling which will eventually make the K8s node overloaded and unstable. And our application performance will suffer as the request will start throtlling, the maximim CPU is used and our pods will be killed as there is no enough memory is available.
- Once a pod is created resources (request/limits) can't be modified. Delete the pod and apply again.
- kubectl top command consumes the metrics exposed by the metric server through API server.
- To check the pod resource consumption, we need to enable the metrics server.

**OOMKilled error** - Out Of Memory killed, when the pod uses the more memory than defined in limit block. Suppose in limit limit we specified 3gigabyte but the pod is using 4GB of memory.

**Conclusion**
- When the pod uses more CPU than we define then the CPU is throttled.
- When the pod uses more memory than defined, the pod gets killed and restarted.
- Requests and limits are defined at the container level, not at the pod level.

**Memory Management**
![image](https://github.com/muppin/mastering-DevOps/assets/56094875/53150a09-f2fa-4c91-a49b-7f4f093bf23a)
K8s scheduler looks for the unalloacted resources not at the free resources, even though we have 3gb free memory pods will not be scheduled as K8s scheduler will look for unallocated memory.
![image](https://github.com/muppin/mastering-DevOps/assets/56094875/ce6d33c7-33e8-4ff6-9852-03473ea9fe27)
K8s will decide which pod to kill based on 3 classes-

### **Quality Of Service Class**
- We don't set this class to any pod, K8s will automatically assigns this class to the pod based on the requests and limits defined.

  
**1. Best Effort Class**
- When we don't define any requets/limits, K8s will assign Best Effort class to the pod.
- Applies to both memory and CPU.
- When k8s need to decide which pod to kill, it will kill pods in best effort class.

**2. Guarenteed Class**
- When we define equal request and limit to a pod, K8s assign Guarenteed class to the pod.

**3. Burstable class**
- Request =! limit, come under this class.

**Conclusion**-
- When the system is over commited the quality of service calss determines which class should be killed so the freed resouces can be given to the high priority pod.
- Pods with the best effort classes are killed first, followed by the burstable class and finally guarenteed pods.

**Limit Range**-
- When pod doesn't have any request and limit fields, K8s admin creates limit range for defining default limit.
- Whenever admin defines limitRange.yaml, need to specify default , min and max resources.
- Request should lie b/w min and max in order to get created, and if not it will go with defaults.

**Resource Quota**-
- With resource quota we can restrict the req and limit at the namespace level, instead of pod/container level.

___________________________________________________________________________________________________________________________________________________________________________________________

### Probes in Kubernetes

Any Pod/app can be in unhealthy state due various reasons, shown as below:
![image](https://github.com/muppin/mastering-DevOps/assets/56094875/78d9acd9-85ca-4253-ae91-369b87aafb3b)

- In all these situations it looks like pod is working at outside but internal functionality is broken due to these bugs and user will not be able to access the app.
- In all these cases we expect container to restart but K8s will not restart the containers because K8s by default just checks the containers main process and decides if the container is healthy or not, it doesn't checks the internal functionality of our app.
- Only if the main process crashes, kubelet will restart the container.
- If we don't treat these unhealthy pods our service becomes unstable.
- Debugging such pods is also tricky as the pod status shows running but we dont get the expected output.

  **To solve above issue, k8s probes comes into picture**
  
  **Probes**-
  - Investigates the pods if they are working correctly or not.
  - Basically they are customizing the behaviour of K8s to check if container is healthy or not.
  - Define the probes at the container level and not the pod level.
 
  **Types Of Probes**
  - Liveness
  - Readiness
  - Startup
 
  **Liveness Probe**
  - With liveness probe we can construct k8s on how to detect weather a pod is live or not/ healthy or not, by the use of commands or network request inside the container.
  - If the liveness probe command gives the exit code as 1, which indicates Failure, k8s assumes the pod is unhealthy and kubelet starts the pod.
  - Exit code=0, means suucess (pod is healthy)
  - In short **Liveness probe insures the the pod is always healthy**.
  - If the liveness probe fails, pod is automatically restarted.
    ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/10125364-ccda-482b-91b6-645f541fb343)

    #### Probing Mechanisms
    
    - **Exec** -
      - here we ask k8s to execute a command within a container.
      - If exit code is 0-> Healthy  and 1-> unhealthy.
      - 
    - **HTTP**
      - By making Network calls.
      - In this meachanism we ask kubernetes to make a http call to a url within the container.
      - K8s assumes a container is healthy if http response is in range - 200-399
      - and unhealthy if response is other than 200-399


    - **TCP**
      - With this meachanism we try to open a port.
      - The probe succeseeds if the specific container port is accepting traffic.
      - fails if port is not accepting the traffic.

    ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/8df348d8-8175-4b3e-9000-931a9b3c0028)


  #### Probing Customizations
    
 ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/e27ebe99-e75e-4080-9ccf-1c0c3f070b60)


 **Readiness Probe**
 - This probe identifies when a pod is ready to handle external traffic received from a service.
 - If the readiness probe fails then k8s removes the ip address of pod from the endpoint of all services it belongs to.
 - This probe is very helpful in instructing k8s that a running container should not get any traffic until it is ready.


**Difference between Liveness Probe and readiness probe**

If a liveness probe fails, the the pod will be restarted where as if a readiness probe fails the it would not be restarted, but it will be removed from the end pint list of all the services and it will not recieve any traffic.
And when the readiness probe is successful again, pod ip is added backand it will start receiving traffic.

**Startup Probe**
- Startup probe provides a way to delay the execution of Liveness probe and readiness probe until a container indicates that is is able to handle them.
- Liveness and readiness probe is executed only if the startup probe is succeeds.
- If a container fails its startup probe, container is killed and follows the pod restart policy.
- restart policy can be defined in spec section of pod

*Restart Policy*

In Kubernetes, the restart policy defines how containers in a pod should behave after they terminate, whether gracefully or due to a failure. The restart policy is set at the pod level and applies to all containers within that pod. There are three main restart policies:

### 1. Always (default):
- **RestartPolicy:** If a container terminates for any reason (graceful shutdown or failure), Kubernetes will always attempt to restart it.
- **Use Case:** Suitable for critical services that should always be running and resilient to temporary failures.

Example YAML snippet:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-pod
spec:
  restartPolicy: Always
  containers:
  - name: my-container
    image: my-image
    # ... other container configurations
```

### 2. OnFailure:
- **RestartPolicy:** Kubernetes restarts the container only if it exits with a non-zero status code, indicating a failure.
- **Use Case:** Ideal for batch jobs or processes that might occasionally fail but should not be restarted on successful termination.

Example YAML snippet:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-pod
spec:
  restartPolicy: OnFailure
  containers:
  - name: my-container
    image: my-image
    # ... other container configurations
```

### 3. Never:
- **RestartPolicy:** Kubernetes does not restart the container, regardless of how it terminates (successful or unsuccessful).
- **Use Case:** Suitable for containers that perform a one-time task or are not intended to run continuously.

Example YAML snippet:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-pod
spec:
  restartPolicy: Never
  containers:
  - name: my-container
    image: my-image
    # ... other container configurations
```

**Summary**
![image](https://github.com/muppin/mastering-DevOps/assets/56094875/e46f235b-f1bb-4f62-91c8-1d9b41b3d3cc)

**Best Practices**
- A probe which runs too frequently wastes the resources and affects the app performance.
- A probe which runs infrequently can let containers sit in an unhealthy state for too long.
- Probes should be as light as possible to ensure our checks are executed quickly.
- A probe which does heavy lifting can slow down the container
  ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/7fe9b6da-2a5d-4743-9970-d08b8677a85c)


  _________________________________________________________________________________________________________________________________________________________________________________________

  #### Kubernetes Operators

  **K8s controller** - It maintains the state of resouces in k8s cluster.
  
  **Types of K8s controllers**
     - Native controllers- Replica set
     - Custom controllers- Argo CD, ISTIO, NGINX


**K8s Operators**
- Operators Bundles, packages and manages k8s controllers.

#### Helm Vs. Operators

Kubernetes Operators and Helm are both tools used in Kubernetes but serve different purposes and have distinct functionalities:

### Kubernetes Operators:

1. **Purpose:** Kubernetes Operators are software extensions that automate the management of applications and complex workloads on Kubernetes.
  
2. **Custom Controllers:** Operators are implemented as custom controllers, extending Kubernetes' API to manage specific applications beyond the capabilities of built-in controllers.

3. **Automation:** They automate operational tasks such as application deployment, scaling, upgrades, backups, and configuration management.
  
4. **Domain-Specific Knowledge:** Operators encapsulate domain-specific knowledge about an application's lifecycle, allowing for intelligent management and self-healing capabilities.
  
5. **Examples:** etcd Operator, Prometheus Operator, managing databases, and stateful applications.

### Helm:

1. **Purpose:** Helm is a package manager for Kubernetes, used to define, install, and manage Kubernetes applications.
  
2. **Packaging and Deployment:** Helm packages applications into charts, which contain Kubernetes manifests and metadata for easy deployment and management.
  
3. **Templating:** Helm uses templating to allow parameterization and customization of Kubernetes manifests before deployment.
  
4. **Reusability:** Charts can be shared and reused across different environments, simplifying the deployment of complex applications.

### Comparison:

- **Scope:** Operators are focused on automating complex application management, while Helm primarily deals with packaging, versioning, and deploying Kubernetes applications.
  
- **Abstraction Level:** Helm abstracts application deployment and management into reusable charts, while Operators provide a higher level of automation, often tailored to specific applications with domain-specific knowledge.
  
- **Automation vs. Packaging:** Operators automate operations based on defined logic, while Helm focuses on packaging and templating Kubernetes manifests for easy application deployment.
  
- **Use Cases:** Helm is ideal for standardizing application deployment, while Operators excel in managing stateful applications and providing intelligent lifecycle management.

### Synergy:

- Operators and Helm can complement each other. Helm charts can package Operators along with application manifests, allowing for streamlined deployment and management of complex applications.

Both Kubernetes Operators and Helm serve essential roles in the Kubernetes ecosystem, catering to different aspects of application management, packaging, and automation within Kubernetes clusters.


__________________________________________________________________________________________________________________________________________________________________________
**Reconciliation**

**Helm does not provide reconciliation** - Means if someone modifies deployment, services wrongly then helm does not have the capability to overrride these changes.

**Operators have reconciliation logic** - Operators will continously monitor and overrides any wrong changes. Auto-healing.
___________________________________________________________________________________________________________________________________________________________________________

**Updates**

**Helm** - With helm then its our responsibility to create and deploy the new version of helm charts.

**Operators** - If we use operators and enable automatic sync/upgrades. It automatically upgrades the new version of controllers.
____________________________________________________________________________________________________________________________________________________________________________

**operatorhub.io** - where all the approved k8s operators are there.

**OLM** 
- Operator lifecycle manager
- OLM will create operator related resources.

___________________________________________________________________________________________________________________________
### Network policies

In Kubernetes, you can use Network Policies to control the communication between pods within a cluster. Network Policies define rules that specify how pods can communicate with each other. Here's a general guide on how to set up network policies to limit communication between pods:

1. **Check Network Policy Support:**
   - Ensure that your Kubernetes cluster supports Network Policies. Some Kubernetes distributions, especially managed services, may require additional configuration or may not support Network Policies.

2. **Install a Network Policy Provider:**
   - Depending on your Kubernetes environment, you might need to install a network policy provider. For example, Calico, Cilium, or Weave are popular providers. Follow the installation instructions for the provider of your choice.

3. **Define Network Policies:**
   - Write Network Policy YAML files to define the rules for pod communication. Below is an example of a simple Network Policy that allows communication only between pods labeled with `app: frontend` and `app: backend`.

    ```yaml
    apiVersion: networking.k8s.io/v1
    kind: NetworkPolicy
    metadata:
      name: allow-frontend-backend
    spec:
      podSelector:
        matchLabels:
          app: frontend
      ingress:
      - from:
        - podSelector:
            matchLabels:
              app: backend
    ```

   - Save this configuration in a file, e.g., `allow-frontend-backend.yaml`.

4. **Apply the Network Policy:**
   - Apply the Network Policy to your cluster using the `kubectl apply` command.

    ```bash
    kubectl apply -f allow-frontend-backend.yaml
    ```

5. **Verify Network Policy:**
   - Confirm that the Network Policy has been applied successfully:

    ```bash
    kubectl get networkpolicies
    kubectl describe networkpolicy allow-frontend-backend
    ```

6. **Test the Communication:**
   - Deploy pods with the specified labels (`app: frontend` and `app: backend`) and test whether communication is restricted as per the defined Network Policy.

   ```bash
   kubectl run frontend-pod --labels=app=frontend --image=your-frontend-image
   kubectl run backend-pod --labels=app=backend --image=your-backend-image
   ```

   - Attempt to establish communication between the pods and observe whether the Network Policy rules are enforced.

Remember that network policies are namespace-specific, so ensure that your pods and policies are in the same namespace. Additionally, network policies work at the pod level, considering pod labels for matching. The example provided is simple, and you can create more complex policies based on your specific requirements. Always thoroughly test your policies to ensure they behave as expected in your environment.

### for EKS

Amazon EKS (Elastic Kubernetes Service) supports Kubernetes Network Policies, allowing you to define and enforce communication rules between pods in your cluster. EKS relies on the underlying CNI (Container Network Interface) plugin used in your cluster to implement network policies.

Here are the general steps to work with Network Policies on Amazon EKS:

1. **Choose a CNI Plugin:**
   - EKS supports different CNI plugins, such as Calico, AWS VPC CNI, and others. The choice of CNI plugin may affect how Network Policies are implemented. For example, Calico is a popular choice for Network Policies on EKS.

2. **Enable Network Policies:**
   - Ensure that your EKS cluster is configured to support Network Policies. Some EKS clusters might have Network Policies enabled by default, while others may require additional configuration during cluster creation.

3. **Install Calico (or Other CNI Plugin):**
   - If you choose Calico, you might need to install it as the CNI plugin for your EKS cluster. Follow the documentation provided by the CNI plugin you've selected.

4. **Define Network Policies:**
   - Write Network Policy YAML files to define the communication rules between pods. Use labels and selectors to specify which pods the policy applies to. For example:

    ```yaml
    apiVersion: networking.k8s.io/v1
    kind: NetworkPolicy
    metadata:
      name: allow-frontend-backend
    spec:
      podSelector:
        matchLabels:
          app: frontend
      ingress:
      - from:
        - podSelector:
            matchLabels:
              app: backend
    ```

5. **Apply Network Policies:**
   - Use `kubectl apply` to apply your Network Policies to the EKS cluster:

    ```bash
    kubectl apply -f allow-frontend-backend.yaml
    ```

6. **Verify Network Policies:**
   - Confirm that the Network Policy has been applied:

    ```bash
    kubectl get networkpolicies
    kubectl describe networkpolicy allow-frontend-backend
    ```

7. **Test the Communication:**
   - Deploy pods with the specified labels and test whether communication is restricted as per the defined Network Policy.

   ```bash
   kubectl run frontend-pod --labels=app=frontend --image=your-frontend-image
   kubectl run backend-pod --labels=app=backend --image=your-backend-image
   ```

8. **Monitor and Troubleshoot:**
   - Use Kubernetes tools like `kubectl` and logs to monitor and troubleshoot any issues with your Network Policies.

Keep in mind that the specific steps may vary depending on the CNI plugin and Kubernetes version used in your EKS cluster. Always refer to the documentation provided by Amazon EKS and the chosen CNI plugin for the most accurate and up-to-date information.

___________________________________________________________________________________________________________________________

### how to set the admission contol policies to avoid running the privilagedcontainers

To prevent the execution of privileged containers in your Kubernetes cluster, you can use admission control policies. Kubernetes provides admission controllers that allow you to define policies and rules for handling requests to the API server. One such admission controller is the `PodSecurityPolicy` (PSP), which can be used to control various security-related aspects of pod creation, including preventing privileged containers.

Here are the general steps to set up a `PodSecurityPolicy` to avoid running privileged containers:

1. **Enable the PodSecurityPolicy admission controller:**
   Ensure that the `PodSecurityPolicy` admission controller is enabled on your Kubernetes API server. This can be done by modifying the Kubernetes API server configuration.

   For example, you might need to add the `PodSecurityPolicy` admission controller to the `--enable-admission-plugins` flag in your Kubernetes API server configuration file. Edit the file and look for a line similar to:

   ```yaml
   - --enable-admission-plugins=...
   ```

   Add `PodSecurityPolicy` to the list.

2. **Create a PodSecurityPolicy:**
   Create a `PodSecurityPolicy` manifest file specifying the desired policies, including the one that prevents privileged containers. Save the following YAML to a file, e.g., `restrict-privileged-containers-psp.yaml`:

   ```yaml
   apiVersion: policy/v1beta1
   kind: PodSecurityPolicy
   metadata:
     name: restrict-privileged-containers
   spec:
     privileged: false
     # Add other policies as needed
     # ...
   ```

   Note: In the example above, `privileged: false` ensures that pods cannot be run with the `privileged` security context.

3. **Apply the PodSecurityPolicy:**
   Apply the `PodSecurityPolicy` to the cluster using `kubectl`:

   ```bash
   kubectl apply -f restrict-privileged-containers-psp.yaml
   ```

4. **Create a ClusterRole and ClusterRoleBinding for the PSP:**
   Create a `ClusterRole` and a `ClusterRoleBinding` to associate the `PodSecurityPolicy` with a set of users or service accounts. For example:

   ```yaml
   apiVersion: rbac.authorization.k8s.io/v1
   kind: ClusterRole
   metadata:
     name: psp:restrict-privileged-containers
   rules:
   - apiGroups: ['policy']
     resources: ['podsecuritypolicies']
     verbs: ['use']
     resourceNames: ['restrict-privileged-containers']

   ---

   apiVersion: rbac.authorization.k8s.io/v1
   kind: ClusterRoleBinding
   metadata:
     name: psp:restrict-privileged-containers
   roleRef:
     apiGroup: rbac.authorization.k8s.io
     kind: ClusterRole
     name: psp:restrict-privileged-containers
   subjects:
   - kind: Group
     name: system:serviceaccounts
     namespace: default
   ```

   This example binds the `PodSecurityPolicy` to service accounts in the `default` namespace.

5. **Update RBAC Roles:**
   Ensure that your existing roles and role bindings include the necessary permissions for using the `PodSecurityPolicy`. This might include granting permission to specific users or service accounts.

6. **Test:**
   Create a pod to test whether the `PodSecurityPolicy` is applied:

   ```yaml
   apiVersion: v1
   kind: Pod
   metadata:
     name: test-pod
   spec:
     containers:
     - name: test-container
       image: nginx
   ```

   Apply the pod manifest:

   ```bash
   kubectl apply -f test-pod.yaml
   ```

   Verify that the pod is not created due to the `PodSecurityPolicy` restrictions.

Remember to carefully review and adapt the policies to fit your security requirements. The example provided is a basic illustration, and you might need to customize the policies based on your specific use case and security needs.

___________________________________________________________________________________________________________________________

### PDB (Pod Disruption Budget)

A Pod Disruption Budget (PDB) is a resource policy in Kubernetes that allows you to control the disruption caused by voluntary disruptions, such as when performing rolling updates or draining nodes. It helps ensure the availability of applications during such disruptions by limiting the number of pods that can be simultaneously unavailable within a specified set of pods.

Here are key components and aspects of a Pod Disruption Budget:

1. **Objective:**
   - The primary goal of a Pod Disruption Budget is to ensure high availability of applications during planned disruptions. It helps prevent scenarios where too many pods are taken down simultaneously, potentially causing downtime or degraded performance.

2. **Specifying the Budget:**
   - A PDB is specified as a resource object in the Kubernetes cluster. It defines the maximum number of concurrently disrupted pods allowed within a specified set of pods.

3. **Selectors and Labels:**
   - The PDB applies to a set of pods defined by selectors and labels. You specify a selector in the PDB to identify the pods that fall under the budget. Only the pods matching the selector will be subject to the constraints defined in the PDB.

4. **MaxUnavailable:**
   - The key parameter in a PDB is `maxUnavailable`, which specifies the maximum number or percentage of pods that can be unavailable simultaneously. For example, you might set `maxUnavailable: 1` to allow only one pod to be down at any given time during disruptions.

5. **Usage Scenarios:**
   - PDBs are often used in conjunction with controllers like Deployments or StatefulSets during rolling updates. When updating or scaling down, the PDB ensures that the disruption is gradual, avoiding a sudden loss of availability.

6. **Pod Deletion Order:**
   - PDBs work in coordination with the pod deletion order specified by controllers. Controllers, when rolling out updates, adhere to the PDB constraints to ensure that the specified maximum number of pods is not exceeded.

7. **Example PDB Definition:**
   ```yaml
   apiVersion: policy/v1beta1
   kind: PodDisruptionBudget
   metadata:
     name: example-pdb
   spec:
     maxUnavailable: 1
     selector:
       matchLabels:
         app: my-app
   ```

   In this example, the PDB named `example-pdb` allows a maximum of 1 pod to be unavailable at a time, and it applies to pods labeled with `app: my-app`.

8. **Status Information:**
   - The PDB provides status information, including the number of disruptions allowed based on the specified constraints. This information can be helpful for monitoring and troubleshooting.

By using Pod Disruption Budgets, you can ensure that updates and maintenance activities are performed in a controlled manner, minimizing the impact on your application's availability. It's particularly valuable in scenarios where maintaining a certain level of service is crucial.

___________________________________________________________________________________________________________________________

### Different types of containers

In Kubernetes, containers are encapsulated and portable units that can run applications and their dependencies. Containers are managed and orchestrated by Kubernetes to ensure scalability, reliability, and ease of deployment. While there is a single type of container runtime commonly used in Kubernetes (such as Docker), Kubernetes itself supports different types of containers, each with its own purpose. Here are the key types:

1. **Application Containers:**
   - These are the standard containers that encapsulate the application code, libraries, and dependencies. Application containers run the actual workloads, such as web servers, databases, or custom applications. Docker is a popular container runtime for building and running application containers.

2. **Init Containers:**
   - Init containers are separate containers that run and complete before the main application container starts. They are used for setup or initialization tasks, such as downloading data, running database migrations, or waiting for other services to be ready. Init containers help ensure that the main application container starts in a well-prepared environment.

3. **Sidecar Containers:**
   - Sidecar containers are additional containers deployed alongside the main application container within the same pod. They share the same network and storage space. Sidecar containers enhance the functionality of the main application container by providing supplementary features, such as logging, monitoring, or data syncing.

4. **Helper Containers:**
   - Helper containers are similar to sidecar containers but are used for one-time tasks, such as performing backup operations, running cron jobs, or executing periodic tasks within the same pod. Once the task is complete, the helper container exits.

5. **Ephemeral Containers:**
   - Ephemeral containers are used for debugging purposes. They are temporary containers added to a running pod to troubleshoot issues or inspect the state of the system. Ephemeral containers provide a way to interact with the running pod without modifying its definition.

6. **Job and CronJob Containers:**
   - Kubernetes supports running batch processes using Job and CronJob resources. Jobs consist of one or more pods that run to completion, performing a specific task. The containers within these pods are designed to execute short-lived, non-replicated tasks.

7. **DaemonSet Containers:**
   - DaemonSets are used to ensure that a copy of a specific pod is running on every node in the cluster. The containers within DaemonSet pods are designed to provide cluster-wide services, such as log collection or monitoring agents, ensuring that every node has the necessary services running.

8. **StatefulSet Containers:**
   - StatefulSets are used for managing stateful applications that require stable network identities and persistent storage. The containers within StatefulSet pods are designed to handle stateful workloads, like databases, where maintaining unique identities and data persistence is essential.

While there is a diversity of containers and pod types in Kubernetes, it's crucial to choose the appropriate container types based on the specific requirements of your applications and workloads. The flexibility provided by different container types allows you to build complex and scalable systems within the Kubernetes ecosystem.

_________________________________________________________________________________________________________________________________________________________________________________________________________________________

- **Different types of errors in k8s**

https://cloudtweaks.com/2023/01/common-kubernetes-errors/

___________________________________________________________________________________________________________________________________________________________________________________________________________________________

## Service Mesh

  - Service mesh manages communication between micro services.
 
  **Challenges**

  - How will services know how to talk to each other
    ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/766eb184-e2b8-4ce7-a557-ac37ad398b1e)

  - Security
    ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/ab6b00ad-31be-4e43-b71c-a88b8fbad02b)

  - Developers are not able to focus on business logic
    ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/bddb9bd9-07b8-4cab-a6fd-7bd56abdd10f)

 **Solution**

- Solution is service mesh. It will encapsulate all the non-business logic into the sidecar proxy.
 ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/e76aecf7-79a1-4d90-8502-b50ae5d51af9)

- Service mesh will have a control plane that will inject the proxy directly to every micro service pod.
  ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/c351146f-7c17-4518-83bc-ac14d146795a)

 **Features**
 ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/0b7562eb-4832-4337-9626-d650409d2676)


 ### Istio

 - Istio is the implementaion of service mesh.
   ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/61321043-070e-4d50-9c50-f36e42b4e991)

   ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/eea9e5a1-9833-44c5-afd3-166bc4077fde)




   **Istio Architecture**
   ![Uploading image.png…]()

   ******************************************************************************************************************************************************************************************************************












    
    
 
  

  





