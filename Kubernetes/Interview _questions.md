- **If you are using cluster ip, how u are exposing it to the outside world?**
  With the help of ingress. Ingress will expose to http/https traffic.

- **How u are managing files on diff environments?**
  With the help of helm charts. For every env, we have different values.yml.
  For cost cutting we don't use HPA for sit where as HPA is imp in pre-prod and prod.


- ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/e07efc89-fb31-4873-94c6-b78168d4bec9)

- ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/8dadf063-122f-406e-86d2-28134a95ea05)

- **how ttwo containers inside the pod communicate each other?**
  using localhost:portnumber

- ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/4f11b6e2-fcca-43a9-b835-495dff1f5ef2)

- ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/af9047cb-0631-4910-aed4-e8aeb91750c9)

- ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/c3324a58-9fde-408c-98b6-5f3014a4fe8a)

- ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/b55e5c99-77ca-4c98-9a75-e3f7cb8082ae)

- **What is a init container?**
   - Init containers are specialized containers in Kubernetes that run to completion before the main application containers in a pod are started. They are used to perform initialization tasks or setup steps that must complete successfully before the main application can start.

- **What is a custom controller?**

- ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/1d199768-c07e-40ba-a629-85460a0b0757)

- **What is PSP(Pod security policy)?**

- **Stateful sts Vs. Deployments**

- ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/d76d1d43-aeaa-46ad-af60-dba9f600cc24)

- A Pod Disruption Budget (PDB) is a Kubernetes policy that limits the number of pods of a replicated application that can be down simultaneously due to voluntary disruptions. PDBs can help ensure that applications are highly available, even when there are frequent voluntary disruptions.

- What all details are inside deamon set?

A DaemonSet in Kubernetes ensures that all (or some) nodes run a copy of a specific Pod. Here are some details you might want to consider when working with DaemonSets:

1. **Pod Template**: 
   - DaemonSets use a Pod template to create Pods on each node. This template specifies the container(s) to run and other Pod-level configurations like volumes, service account, and labels.

2. **Node Selector**:
   - You can specify a node selector to control which nodes the DaemonSet should be deployed to. This allows you to target specific nodes based on labels.

3. **Update Strategy**:
   - DaemonSets do not have a rolling update strategy by default. When you update the DaemonSet, it will create new Pods with the updated configuration while retaining the old Pods until they are terminated or updated.

4. **Tolerations**:
   - Tolerations allow the DaemonSet to schedule Pods on nodes with taints. This is useful for running DaemonSets on nodes with special requirements or constraints.

5. **Pod Affinity and Anti-Affinity**:
   - You can use pod affinity and anti-affinity rules to control the placement of Pods created by the DaemonSet, ensuring they are co-located or spread across nodes based on certain criteria.

6. **Resources**:
   - Define resource requests and limits for the Pods created by the DaemonSet to ensure proper resource utilization and isolation.

7. **Volumes**:
   - Use volumes to provide persistent storage or share data between containers in the Pods created by the DaemonSet.

8. **Service Account**:
   - Specify a service account for the Pods created by the DaemonSet to control access to Kubernetes APIs and other resources.

9. **Security Context**:
   - Configure security context settings such as privilege levels, SELinux options, and capabilities for the containers in the Pods.

10. **Annotations and Labels**:
    - Add annotations and labels to the DaemonSet and Pods for better management, monitoring, and integration with other Kubernetes components.

11. **Pod Lifecycle**:
    - Understand the Pod lifecycle, including creation, termination, and restarting, to manage the Pods created by the DaemonSet effectively.

By considering these details, you can deploy and manage DaemonSets effectively in your Kubernetes cluster, ensuring that the desired Pods are running on all or specific nodes as required.

**Difference between service and virtual service in k8s?**
In Kubernetes, both Services and Virtual Services are used to manage network traffic to applications, but they serve different purposes and are associated with different Kubernetes components.

1. **Service:**
   - A Service in Kubernetes is an abstraction that defines a logical set of Pods and a policy by which to access them. It provides a stable endpoint (IP address and port) for accessing a group of Pods that provide the same service.
   - Services can be of different types:
     - ClusterIP: Exposes the Service on an internal IP in the cluster, accessible only from within the cluster.
     - NodePort: Exposes the Service on a specific port on each node's IP address. The Service is accessible externally using the Node's IP address and the allocated port.
     - LoadBalancer: Creates an external load balancer in the cloud provider's network, and the Service is accessible externally through the load balancer's IP address.
     - ExternalName: Maps the Service to the contents of the externalName field (e.g., DNS name).

2. **Virtual Service (Istio):**
   - Virtual Service is a concept specific to Istio, an open-source service mesh platform for Kubernetes. It is used to control the routing of traffic to services within the Istio service mesh.
   - Virtual Services in Istio allow you to define routing rules and traffic management policies for HTTP, gRPC, and TCP traffic. These rules can include traffic splitting, traffic shifting, retries, timeouts, fault injection, and more.
   - Virtual Services work in conjunction with other Istio resources like DestinationRules and Gateways to enable advanced traffic management, security, and observability features in a microservices architecture.

In summary, while both Services and Virtual Services in Kubernetes are used for managing network traffic, Services are a core Kubernetes resource for exposing and accessing applications running in the cluster, whereas Virtual Services are specific to Istio and provide advanced traffic management capabilities within an Istio service mesh.

********************************************************************************************************************************************************************************************************************
### A pod is having 20GB of PV and pods claim also 20 GB. Space is exhausted. What will happen to pod?

When a pod's Persistent Volume (PV) is exhausted and the pod claims the entire available space, it can lead to issues. Let's break down the scenario:

1. **Pod Claims 20 GB:**
   - The pod specifies a Persistent Volume Claim (PVC) requesting 20 GB of storage.
   - The PVC is a request for storage resources from the Kubernetes cluster.

2. **PV Provides 20 GB:**
   - The PV (Persistent Volume) is a storage resource provisioned by the cluster.
   - In this case, the PV also provides 20 GB of storage.

3. **Space Exhaustion:**
   - Since the pod claims the entire available space (20 GB), there is no additional storage left.
   - Any further attempts to write data to the PV will fail due to insufficient space.

4. **Impact on the Pod:**
   - When the pod runs out of space, it may encounter errors related to file writes, database operations, or any other storage-dependent tasks.
   - If the application within the pod continues to write data, it could crash or become unresponsive.

5. **Possible Scenarios:**
   - If the application handles storage errors gracefully, it might log warnings or retry operations.
   - If the application does not handle storage errors well, it could terminate unexpectedly.

6. **Resolution:**
   - To resolve this issue, consider the following steps:
     - **Resize PV:** Increase the size of the PV to accommodate the pod's storage needs.
     - **Optimize Storage Usage:** Review the application's data storage requirements and optimize them if possible.
     - **Monitor and Scale:** Continuously monitor storage usage and scale resources accordingly.

Remember that Kubernetes dynamically manages PVs and PVCs, so adjusting the PV size or optimizing storage usage should be done carefully to avoid disrupting the application. 

*********************************************************************************************************************************************************************************************************
 ### How can I resize a Persistent Volume?

 Certainly! To resize a **Persistent Volume (PV)** in Kubernetes, follow these steps:

1. **Check PV Support:**
   - Ensure that the underlying storage provider supports volume expansion for the specific PV type (e.g., AWS-EBS, GCE-PD, Azure Disk, etc.).
   - Kubernetes v1.11 and later versions have volume expansion enabled by default¹.

2. **Edit the PVC:**
   - Locate the **PersistentVolumeClaim (PVC)** associated with the PV you want to resize.
   - Edit the PVC using the following command:
     ```
     kubectl edit pvc <your_pvc_name>
     ```
   - In the PVC YAML, modify the `spec.resources.requests.storage` field to specify the new desired size (e.g., increase it from 20 GB to a larger value).

3. **Trigger Automatic Resizing:**
   - Once you've edited the PVC, Kubernetes will interpret the change as a request for more space.
   - The system will automatically trigger volume resizing based on the updated PVC.

4. **File System Expansion (Block Storage):**
   - For block storage volume types (e.g., GCE-PD, AWS-EBS, Azure Disk, Cinder, Ceph RBD), additional steps are needed:
     - Whenever the pod(s) referencing your volume are restarted, Kubernetes will automatically handle file system expansion.
     - The pod(s) must be terminated to trigger this process.

5. **Network Attached File Systems (Glusterfs, Azure File):**
   - Network attached file systems (like Glusterfs and Azure File) can be expanded without restarting the referencing pod.
   - These systems do not require special file system expansion.

Remember that shrinking persistent volumes is **not supported**. Only expansion is allowed. Make sure to verify the storage provider's support and follow best practices for resizing volumes in your specific environment. 😊¹²³⁴

Source: Conversation with Copilot, 28/5/2024
(1) Resizing Persistent Volumes using Kubernetes. https://kubernetes.io/blog/2018/07/12/resizing-persistent-volumes-using-kubernetes/.
(2) kubernetes - Can a Persistent Volume be resized? - Stack Overflow. https://stackoverflow.com/questions/40335179/can-a-persistent-volume-be-resized.
(3) Persistent Volumes | Kubernetes. https://kubernetes.io/docs/concepts/storage/persistent-volumes/.
(4) Increasing size of persistent disks on kubernetes. https://stackoverflow.com/questions/45594836/increasing-size-of-persistent-disks-on-kubernetes.
(5) en.wikipedia.org. https://en.wikipedia.org/wiki/Kubernetes.

***********************************************************************************************************************************************************************************************************

### What are the risks of resizing a PV?

Resizing a **Persistent Volume (PV)** in Kubernetes can introduce certain risks and considerations. Let's explore them:

1. **Data Integrity:**
   - When resizing a PV, the underlying storage system may need to adjust the file system or block device.
   - If not handled properly, this process could lead to data corruption or loss.
   - Always back up critical data before attempting any PV resizing.

2. **Application Impact:**
   - Resizing a PV may require restarting the pods that use it.
   - If your application is sensitive to downtime or restarts, plan accordingly.
   - Some applications may not handle pod restarts gracefully, leading to service disruptions.

3. **File System Expansion (Block Storage):**
   - For block storage PVs (e.g., AWS EBS, GCE PD, Azure Disk), the file system inside the PV needs to be expanded.
   - If the file system expansion fails, it could leave the PV in an inconsistent state.
   - Ensure that the file system type (e.g., ext4, xfs) supports online resizing.

4. **Network File Systems (NFS, GlusterFS):**
   - Expanding network file system PVs (like NFS or GlusterFS) is generally safer.
   - These file systems can be resized without disrupting the pods.
   - However, ensure that the network file system itself supports resizing.

5. **Provider-Specific Behavior:**
   - Different cloud providers have varying behavior when resizing PVs.
   - Some providers automatically handle file system expansion, while others require manual steps.
   - Understand the specifics for your chosen storage provider.

6. **Cluster State and Control Plane:**
   - PV resizing involves interactions with the Kubernetes control plane.
   - Ensure that your cluster is healthy and stable before attempting any PV changes.
   - Monitor the control plane components during the resizing process.

7. **Rolling Updates:**
   - If you have multiple replicas of a pod, consider a rolling update strategy.
   - Resize one pod at a time to avoid service disruptions.
   - Monitor the application's behavior during the update.

8. **Monitoring and Verification:**
   - After resizing, verify that the PV and PVC have the expected size.
   - Monitor application logs for any unexpected errors related to storage.

Remember to test the resizing process in a non-production environment first. Document your steps and have a rollback plan in case anything goes wrong. 

********************************************************************************************************************************************************************************************************************

### We have defined a limit to a pod, will VPA exceed this limit and assign resources to the pod?

**Vertical Pod Autoscaling (VPA)** aims to optimize resource allocation for pods by adjusting their resource requests and limits based on historical usage. However, VPA **will not exceed the specified resource limits** set for a pod. Let's break it down:

1. **Resource Limits:**
   - When you define resource limits for a pod (e.g., CPU and memory), those limits act as hard boundaries.
   - Kubernetes enforces these limits to prevent a pod from consuming more resources than allocated.
   - If a pod reaches its resource limits, Kubernetes may throttle or terminate it.

2. **VPA Behavior:**
   - VPA analyzes historical resource usage data for pods.
   - It then recommends optimal resource requests and limits based on observed patterns.
   - The goal is to strike a balance between efficiency and performance.
   - VPA adjusts the resource requests (minimum required) and limits (maximum allowed) within the specified bounds.

3. **VPA Constraints:**
   - VPA respects the limits you've set for a pod.
   - It won't assign resources beyond those limits.
   - If VPA suggests changes that violate the limits, Kubernetes won't apply them.

4. **Example Scenario:**
   - Suppose you set a pod's memory limit to 512 MB.
   - VPA analyzes usage and recommends a higher memory request (e.g., 1 GB).
   - However, it won't exceed the 512 MB limit you defined.

In summary, VPA optimizes resource utilization while staying within the boundaries you've set. It won't violate the specified resource limits. 😊








