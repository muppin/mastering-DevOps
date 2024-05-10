## Different types of apiGroups
In Kubernetes, API groups are used to organize and categorize resources within the Kubernetes API. Different API groups allow for versioning and modular organization of resources. Here are some commonly used API groups in Kubernetes:

1. **Core API Group (`""` or `"/v1"`):**
   - The core API group contains fundamental resources like Pods, Services, ReplicationControllers, and Secrets.
   - Example: `apiGroups: [""]` or `apiGroups: ["/v1"]`

2. **Apps API Group (`"apps"`):**
   - The "apps" API group includes resources related to higher-level abstractions for managing applications, such as Deployments, DaemonSets, ReplicaSets, and StatefulSets.
   - Example: `apiGroups: ["apps"]`

3. **Extensions API Group (`"extensions"`):**
   - The "extensions" API group was historically used for certain higher-level resources but is being deprecated in favor of the "apps" and other groups.
   - Example: `apiGroups: ["extensions"]`

4. **Batch API Group (`"batch"`):**
   - The "batch" API group includes resources for handling batch processing, such as Jobs and CronJobs.
   - Example: `apiGroups: ["batch"]`

5. **Networking API Group (`"networking.k8s.io"`):**
   - The "networking.k8s.io" API group includes resources for networking, like Ingress.
   - Example: `apiGroups: ["networking.k8s.io"]`

6. **Storage API Group (`"storage.k8s.io"`):**
   - The "storage.k8s.io" API group includes resources related to storage, such as StorageClasses and PersistentVolumeClaims.
   - Example: `apiGroups: ["storage.k8s.io"]`

7. **RBAC API Group (`"rbac.authorization.k8s.io"`):**
   - The "rbac.authorization.k8s.io" API group includes resources related to Role-Based Access Control (RBAC), such as Roles and ClusterRoles.
   - Example: `apiGroups: ["rbac.authorization.k8s.io"]`

8. **Authentication API Group (`"authentication.k8s.io"`):**
   - The "authentication.k8s.io" API group includes resources related to authentication mechanisms.
   - Example: `apiGroups: ["authentication.k8s.io"]`

9. **Authorization API Group (`"authorization.k8s.io"`):**
   - The "authorization.k8s.io" API group includes resources related to authorization mechanisms.
   - Example: `apiGroups: ["authorization.k8s.io"]`

These are some of the core and well-known API groups in Kubernetes. As Kubernetes evolves, new API groups may be introduced to support additional features and extensions. When creating RBAC roles or cluster roles, understanding the relevant API group for the resources you are managing is crucial for specifying the correct rules.
**For Yaml files refer to this - https://github.com/saikiranpi/RBAC**

## CrashLoopBackOff

The "CrashLoopBackOff" error in Kubernetes occurs when a container within a Pod repeatedly crashes immediately after starting, causing the container to enter a back-off state where Kubernetes attempts to restart it, but it continues to fail.

Here are some common reasons for the "CrashLoopBackOff" error and steps to troubleshoot:

1. **Check Container Logs:**
   - Use the following command to view the logs of the failing container: 
     ```bash
     kubectl logs <pod-name> -c <container-name>
     ```
   - Replace `<pod-name>` and `<container-name>` with the actual names.

2. **Correct Application Issues:**
   - Identify and fix any issues with your application code, dependencies, or configuration that may be causing the crash.

3. **Resource Constraints:**
   - Insufficient resources (CPU, memory) for the container can lead to crashes. Check the resource requests and limits in the Pod specification.

4. **Check Image and ImagePullPolicy:**
   - Ensure that the container image specified in the Pod is correct and exists.
   - Verify the `imagePullPolicy` to make sure it's appropriate for your scenario (e.g., set to `Always` if the image is frequently updated).

5. **Volumes and Mounts:**
   - Verify that any volumes and mounts are configured correctly.
   - Ensure that the paths specified in the volume mounts exist and have the necessary permissions.

6. **Startup Probes and Liveness Probes:**
   - If you have defined startup probes or liveness probes, check their configurations.
   - Adjust probe settings to accommodate the actual startup time of your application.

7. **Check for Crash Loop on Init Containers:**
   - If there are init containers, check their logs for errors as well.
   - Init containers must successfully complete before the main container starts.

8. **Update and Rollback:**
   - Ensure that you are using the correct version of your application and dependencies.
   - Consider rolling back to a previous working version if a recent deployment caused the issue.

9. **Pod Events and Descriptions:**
   - Check events and descriptions for the Pod to get more insights into why it is crashing:
     ```bash
     kubectl describe pod <pod-name>
     kubectl get events
     ```

10. **Check Cluster-Level Issues:**
   - Investigate whether there are cluster-level issues impacting the proper functioning of the Pod.

11. **Pod Security Policies:**
   - If Pod Security Policies are in place, ensure that the Pod complies with the policies.

By systematically going through these steps and investigating the logs, you should be able to identify the root cause of the "CrashLoopBackOff" error and take appropriate actions to resolve it.

## CreateContainerConfigError
The "CreateContainerConfigError" in Kubernetes is an error that occurs when Kubernetes encounters an issue while trying to create the configuration for a container within a Pod. This error can manifest during the initialization of a Pod, and it often prevents the container from starting.

Here are some common reasons and steps to troubleshoot and resolve the "CreateContainerConfigError":

1. **Check Container Specification:**
   - Review the container specifications in your Pod definition. Ensure that the image name, command, and arguments are correct.
   - Verify that the syntax of the Pod definition is correct.

2. **Container Image Issues:**
   - Ensure that the container image specified in the Pod exists and is accessible.
   - Check the image repository, tag, and pull policy.

3. **Volume and Mount Configuration:**
   - Check if there are issues with volumes and mounts in the Pod specification. Ensure that paths and permissions are set correctly.
   - Verify that the volumes and mounts declared in the Pod definition are valid.

4. **Resource Constraints:**
   - Examine the resource requests and limits for the container. If the container lacks sufficient resources (CPU, memory), it might fail to start.
   - Adjust resource specifications as needed.

5. **Init Containers:**
   - If there are init containers in the Pod definition, ensure they are configured correctly and are not causing issues.

6. **Check Node Logs:**
   - Examine the logs on the Kubernetes node where the Pod is scheduled. Node-level issues might be contributing to the error.

7. **Container Configuration Files:**
   - If using ConfigMaps or Secrets for configuration files, ensure that they are correctly mounted and the files are accessible.
   - Check for issues with file permissions.

8. **API Server Logs:**
   - Check the logs of the Kubernetes API server for any errors or issues during the creation of the container configuration.

9. **ImagePullSecrets:**
   - If your container image is hosted in a private registry, ensure that the required ImagePullSecrets are specified in the Pod definition.

10. **Check for Cluster-Level Issues:**
   - Investigate whether there are cluster-level issues that might be affecting Pod creation.

11. **Network Policies:**
   - If network policies are in place, ensure that they are not blocking the necessary communication for the container.

12. **Pod Security Policies:**
   - If Pod Security Policies are in place, ensure that the Pod complies with the policies.

By systematically going through these steps and examining logs, you can identify the underlying cause of the "CreateContainerConfigError" and take appropriate actions to resolve it. Each case may be unique, so it's essential to gather information from logs and configurations to pinpoint the issue accurately.

The `kube-system` namespace in Kubernetes is a reserved namespace that is typically used for system-level components, infrastructure services, and cluster-wide resources that are crucial for the proper functioning and management of the Kubernetes cluster itself. It's a convention in Kubernetes to organize and separate these system components from user applications and workloads.

Key characteristics of the `kube-system` namespace include:

1. **System Components:**
   - Essential Kubernetes system components, such as the kube-controller-manager, kube-scheduler, kube-proxy, and other core controllers and services, are often deployed in the `kube-system` namespace.

2. **Cluster-Wide Services:**
   - Services that provide functionality across the entire cluster, such as DNS (CoreDNS or kube-dns), cluster networking components (like Flannel or Calico), and the Kubernetes API server, are commonly found in the `kube-system` namespace.

3. **Controller Managers:**
   - Various controller managers, including those responsible for managing nodes, pods, and other resources, are often deployed in the `kube-system` namespace.

4. **Infrastructure Components:**
   - Infrastructure-related components like the Kubernetes Dashboard, cloud provider-specific controllers, and storage-related controllers may also be deployed in the `kube-system` namespace.

5. **Security and Permissions:**
   - The `kube-system` namespace is protected, and access to resources within this namespace often requires elevated permissions. This helps ensure that only authorized users or system components can manage and interact with critical infrastructure services.

6. **Separation from User Workloads:**
   - Placing system-level components in a dedicated namespace helps separate them from user applications and workloads, reducing the risk of unintended interference. It also aids in resource organization and management.

It's important to note that while the `kube-system` namespace is a common convention, it's not mandatory, and the specific organization of namespaces may vary based on cluster configurations and policies. However, many Kubernetes distributions and setups follow this convention to provide a clear separation between system components and user workloads.

Here's a simplified example of viewing resources in the `kube-system` namespace:

```bash
kubectl get pods --namespace=kube-system
```

This command retrieves information about pods running in the `kube-system` namespace. You can replace `kube-system` with the specific namespace you want to inspect.

Always refer to your specific Kubernetes distribution's documentation and best practices for guidance on namespace organization and the placement of system components.

### Error

- (Problem) Warning  FailedScheduling  8s (x3 over 10m)  default-scheduler  0/2 nodes are available: 2 Too many pods. preemption: 0/2 nodes are available: 2 No preemption victims fou
nd for incoming pod..
- (solution) The warning you're seeing indicates that the Kubernetes scheduler is unable to schedule a pod because there are no nodes available for it. The error message specifically mentions that there are too many pods and preemption is not possible as there are no preemption victims found.
- check the node resources using kubectl top nodes and kubectl describe node *nodename*

### Quick reference for determining pod limits
When considering Kubernetes cluster size best practices, it's essential to understand the recommended pod limits for various platforms.

Kubernetes recommends (or can reliably support)
- No more than 110 pods per node
- No more than 5,000 nodes
- No more than 150,000 total pods in a cluster
- No more than 300,000 total containers
- Google Kubernetes Engine (GKE): Limits it to 100 pods per node irrespective of the size of the node.
- Azure Kubernetes Service (AKS): Allows up to 250 pods per node irrespective of the size of the node.
- Amazon Elastic Kubernetes Service (EKS): Imposes a pod limit depending on the node size. For example, t3.small allows only 11 pods, while m5.4xlarge allows 234 pods.
- **Note**: This article uses “nodes” and “worker nodes” synonymously. We don’t discuss master node sizing in this post.
