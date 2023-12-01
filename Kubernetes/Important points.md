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
