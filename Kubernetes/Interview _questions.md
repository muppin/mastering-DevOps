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








