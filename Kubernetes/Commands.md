- kubectl get pods - lists all the pods
- kubectl get deploy - lists all the deployments
- kubectl get rs - lists all the replica sets
- kubectl get svc - lists all the services
- kubectl create deployment *deployment-name* --image=*imagename* - creates a deployment and creates a default yaml file for it
- kubectl edit deployment *deployment-name* - opens a configuration file and you can edit.
- kubectl logs *pod-name* -  provides the logs of a pod
- kubectl describe pod *pod-name* - shows the state changes happened inside the pod
- kubectl exec -it *pod-name* -- bin/bash - enters inside the pod and helps in debugging
- kubectl delete deploy *deployment-name* - deletes an existing deployment.
- kubectl delete pod *pod-name* - deletes a pod.
- kubectl apply -f *file-name* - creates a kubernetes services according to the file.
- kubectl delete -f *file-name* - deletes a kubernetes services according to the file.
- kubectl get pods -o wide - lists the pods with complete information.
- kubectl get pods -w   -> used to watch (observe) changes in the Pods within the Kubernetes cluster in real-time.
- kubectl get deploy nginx-deployment -o yaml - list the particular deployment with complete information like status etc.
- kubectl describe service SERVICE_NAME -n NAMESPACE -> To verify if services are aligned with the running Pods in Kubernetes.
- kubectl get pods -v=7  -> used to retrieve information about pods in a K8s cluster with verbose output level 7. The -v flag is used to set the verbosity level, providing more detailed and verbose information about the pods.


**********************************************************************************************************************************************************************************************************************

Basic Kubectl commands which are essential for a DevOps engineer to manage within a Kubernetes cluster.

**💠Pods:**

- 🔸 Create a Pod: kubectl create -f pod.yaml
- 🔸 Get Pods: kubectl get pods
- 🔸 Describe Pod: kubectl describe pod <pod_name>
- 🔸 Logs: kubectl logs <pod_name>
- 🔸 Exec into Pod: kubectl exec -it <pod_name> -- <command>
- 🔸 Delete Pod: kubectl delete pod <pod_name>

**💠Deployments:**

- 🔸 Create a Deployment: kubectl create -f deployment.yaml
- 🔸 Get Deployments: kubectl get deployments
- 🔸 Describe Deployment: kubectl describe deployment <deployment_name>
- 🔸 Scale Deployment: kubectl scale --replicas=3 deployment/<deployment_name>
- 🔸 Rollout Status: kubectl rollout status deployment/<deployment_name>
- 🔸 Rollout History: kubectl rollout history deployment/<deployment_name>

**💠Services:**

- 🔸 Create a Service: kubectl create -f service.yaml
- 🔸 Get Services: kubectl get services
- 🔸 Describe Service: kubectl describe service <service_name>
- 🔸 Delete Service: kubectl delete service <service_name>

**💠ConfigMaps:**

- 🔸 Create a ConfigMap: kubectl create configmap <configmap_name> --from-file=<file_path>
- 🔸 Get ConfigMaps: kubectl get configmaps
- 🔸 Describe ConfigMap: kubectl describe configmap <configmap_name>
- 🔸 Delete ConfigMap: kubectl delete configmap <configmap_name>

**💠Secrets:**

- 🔸 Create a Secret: kubectl create secret generic <secret_name> --from-literal=<key>=<value>
- 🔸 Get Secrets: kubectl get secrets
- 🔸 Describe Secret: kubectl describe secret <secret_name>
- 🔸 Delete Secret: kubectl delete secret <secret_name>

**💠Nodes:**

- 🔸 Get Nodes: kubectl get nodes
- 🔸 Describe Node: kubectl describe node <node_name>

**💠Namespaces:**

- 🔸 Get Namespaces: kubectl get namespaces
- 🔸 Describe Namespace: kubectl describe namespace <namespace_name>

**💠 PersistentVolumes (PV) and PersistentVolumeClaims (PVC):**

- 🔸 Get PVs/PVCs: kubectl get pv / kubectl get pvc
- 🔸 Describe PV/PVC: kubectl describe pv <pv_name> / kubectl describe pvc <pvc_name>
- 🔸 Delete PV/PVC: kubectl delete pv <pv_name> / kubectl delete pvc <pvc_name>

**💠 Rolling Updates:**

- **To pause the rolling update** - kubectl rollout pause deployment deploy_name
- **To resume the rolling update** - kubectl rollout resume deployment deploy_name
- **To undo the rolling update** - kubectl rollout undo deployment deploy_name
- **To check the status rolling update** - kubectl rollout status deployment deploy_name
