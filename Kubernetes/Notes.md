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









___________________________________________________________________________________________________________________________________________________________________________________________

## HELM

- Package manager
- Helm helps you in managing K8s config
- Helm charts help you define, install and upgrade complex k8s application
- Helm is the best way to find, share and use software built on k8s
- it supports rollback and upgrades


**Helm Chart Structure**
- chart.yaml
- templates
- values.yaml

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/7847549a-2d14-47ad-b52f-b2a9408e66d1)


In Helm, a chart, a repository, and a release are key concepts used for managing applications and their deployments within Kubernetes:

1. **Chart:** 
   - A Helm chart is a package or bundle of Kubernetes resources required to deploy a particular application. It contains YAML files describing Kubernetes resources such as deployments, services, ingress rules, and more. Charts can be easily versioned and shared.

2. **Repository:** 
   - A Helm repository is a collection of published and versioned charts. It's a server that hosts and serves Helm charts over HTTP. Repositories are where Helm fetches charts from when installing or updating applications.

3. **Release:** 
   - A release in Helm represents a particular deployment of a Helm chart onto a Kubernetes cluster. It is an instance of a chart combined with specific configuration settings and options. Each deployment of a chart creates a unique release, allowing multiple instances of the same application with different configurations.

In summary, a Helm chart packages Kubernetes resources, a Helm repository stores and distributes these charts, and a release is an instance of a chart deployed onto a Kubernetes cluster with specific configurations. This structure allows for easy management, versioning, and deployment of applications within Kubernetes using Helm.

**Helm Installation**

    ```bash
 curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
 chmod 700 get_helm.sh
 ./get_helm.sh


**Helm create command**
- It will create a directory structure
- ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/bf4bfdef-3a20-4d2b-acdf-473da4bf8c4e)
- In this structure, focus on template -> deployment and service file will be stored here.
- **values.yml**- provide all the values which u want to override for ur app

**Helm v2 vs v3**

Helm v2 is more of release management and it has Client and server(Tiller) architecture. whenever install or upgrade is done everything is stored inside the architecture as a history.
The main cause of upgrading to v3 is the tiller has a high power in the kubernetes cluster like create, update and delete, which leads to security issue. 



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






    
    
 
  

  





