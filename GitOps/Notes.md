### GitOps 

**What is GitOps?**

- GitOps uses git as a single source of truth to deliver application and infrastructure.
- Git integrated approach for CD.


**Some popular GitOps Tools**
![image](https://github.com/muppin/mastering-DevOps/assets/56094875/741fdec4-6066-4a56-b5c8-575ba0f57700)


**Why GitOps?**

- To track changes made in K8s cluster over a period of time.
- Versioning
- Auditing
- Infrastructure delivery
- Application delivery


#### GitOps Principles

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/0f6492e6-b1af-42b5-87ec-5c7770a87050)


- **Reconcilation** - If someone goes to the k8s cluster and tries to directly edit k8s resources, gitops contoller will not allow. It will only take git as a single source of truth.
- Git Ops conroller continously watches the state of entire k8s cluster and state of entire git repository, and if any change is observed by the gitops controller, It will override the changes.
- Override happens on K8s cluster, because gitops takes git as a single source of truth.


**Is GitOps for Kubernestes only?**
- By principle the answer is No. But the popular gitops like ArgoCD and flux target K8s.


![image](https://github.com/muppin/mastering-DevOps/assets/56094875/1e1471ac-76da-4c6e-90a6-31f8538a45f5)

__________________________________________________________________________________________________________________________________________________________________________________________

#### GitOps Push Vs. Pull

GitOps leverages Git as the source of truth for managing infrastructure and application configurations. The primary difference between the push and pull models in GitOps lies in how changes are propagated to the target environments.

1. **Push Model:**
   - In the push model of GitOps, changes are pushed directly to the Git repository.
   - When changes are committed and pushed to the repository, a CI/CD system or an operator continuously monitors the repository.
   - The CI/CD system detects changes and triggers the deployment process based on those changes. It pulls configurations from the Git repository and applies them to the target environment.
   - The continuous synchronization between the Git repository and the target environment ensures that the actual state matches the desired state defined in the repository.

2. **Pull Model:**
   - In the pull model of GitOps, a controller or an agent running within the target environment continuously pulls or synchronizes with the Git repository.
   - The controller periodically checks the repository for changes and compares the current state in the target environment with the desired state defined in the repository.
   - If any discrepancies are found, the controller automatically initiates the synchronization process by pulling the updated configurations from the Git repository and applying them to the target environment.

**Advantages:**

- **Push Model:**
  - Immediate deployment: Changes trigger deployments as soon as they are pushed to the repository.
  - Controlled trigger: Changes can be precisely controlled and triggered based on commit and push events.

- **Pull Model:**
  - Autonomy: The target environment can periodically check for changes, allowing it to be more self-sufficient.
  - Continuous reconciliation: Ensures continuous alignment between the desired state and the actual state.

**Considerations:**

- **Push Model:**
  - Continuous monitoring and triggering from the CI/CD system or operator are necessary.
  - The deployment process might rely heavily on the availability and configuration of the CI/CD system.

- **Pull Model:**
  - Requires an agent or controller running within the target environment, which needs to be managed and maintained.
  - Synchronization intervals need to be configured appropriately to balance resource consumption and responsiveness.

Both models have their strengths, and the choice between push and pull models in GitOps often depends on the specific requirements of the organization, infrastructure, and deployment workflows. Some organizations might prefer the immediate trigger of the push model, while others may value the autonomy and continuous reconciliation offered by the pull model.

_________________________________________________________________________________________________________________________________________________________________________________________

### ArgoCD

- For Basic Understanding refer to Argocd.md notes
- ArgoCD basically comes with two modes of deploy
   - Hub-Spoke Model - here there is a centralised kubernetes cluster which has ArgoCD installed in it, this ArgoCD takes care of the deployments of all other kubernetes cluster environments.
   - Standalone Model - If there are different environments of clusters and ArgoCD is installed in each of the env, then its a Standalone Model.
   - ![image](https://github.com/user-attachments/assets/926dd729-0daa-4b0c-bee7-fab2d56b5640)
 
#### How to implement Hub-Spoke model 

- ![image](https://github.com/user-attachments/assets/cf92f240-c3b7-45c7-9c0b-e479d630d358)

- Create a Hub Cluster and Create a spoke clusters
- Update the kube config files for each of the clusters
- Switch to hub cluster using ```kubectl config use-context <hub-cluster-context-name>```
- Install the ArgoCD in the Hub Cluster
- Now we need to add the spoke clusters to the ArgoCD
- To add the spoke clusters, we need to install argocd cli.
- Login to ArgoCD server ```argocd login <argocd-server> --username admin --password <password>```
- Add each spoke cluster ```argocd cluster add <context-name>```
- very the added clusters using cli ```argocd cluster list``` and Argocd UI
  


