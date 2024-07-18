## Argocd
- Argocd is a gitops based CD tool for K8s with pull model design.
![image](https://github.com/muppin/mastering-DevOps/assets/56094875/b00069d9-f291-4baf-88fa-7b77d4e0be04)

_________________________________________________________________________________________________________________________________________________________________________________________

## Why Argocd?
![image](https://github.com/muppin/mastering-DevOps/assets/56094875/ebe0c9e5-c8fb-4b6e-8887-19da3b56694f)


____________________________________________________________________________________________________________________________________________________________________________________________

## Traditional CD Tools Vs. Argocd

#### Traditional CD tools-
- Install needed clients on CICD agents
       - helm
       - kubectl
- Grant access in CICD system to apply deployments into K8s cluster.
       - configure kubeconfig
- Open connectivity between CICD system and ur k8s cluster "security concern"
![image](https://github.com/muppin/mastering-DevOps/assets/56094875/ba7336e2-9e22-4d2d-81ff-6e6e57cf28f3)

#### Argocd Approach
![image](https://github.com/muppin/mastering-DevOps/assets/56094875/edb06d09-64d1-4ced-b1a1-b7f59b1890f1)



____________________________________________________________________________________________________________________________________________________________________________________________

## Argocd Architecture

### Components
![image](https://github.com/muppin/mastering-DevOps/assets/56094875/4ca8f490-50b2-4d85-9887-6d4128792b3d)

### API Server
![image](https://github.com/muppin/mastering-DevOps/assets/56094875/e5c04b39-938b-424f-9ab2-3ed411296353)

### Repo Server
![image](https://github.com/muppin/mastering-DevOps/assets/56094875/47fb0fc5-f076-459e-bc14-ff07ff5f14c5)

### Application Controller
![image](https://github.com/muppin/mastering-DevOps/assets/56094875/b4a513b4-13ee-45b8-aa57-f2d4b8c035bb)

### Additional Services
![image](https://github.com/muppin/mastering-DevOps/assets/56094875/b497fc21-7d60-4991-93fe-4ffe033f46f2)

.......................................................................................................................................................................................

**Microservices**
- Repo Server- It will connect to git and get the state of resources. Cloning of git repo. Generate K8s manifests.
- Application Controller - Connect to k8s and get the state of k8s resources. It will compare both the states and try to sync. Statefulset.
- API Server - Used by users to connect with argocd via UI/CLI. Manages authentication. Exposes the API consumed b web CLI/UI.
- Dex - Light weight OIDC. Proxy server which can connect with any of your existing providers. It provides SSO capabilities for API server.
- Redis - Used for caching.
- ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/d0424126-e89f-4e60-84a0-ec8f901aeb1b)

___________________________________________________________________________________________________________________________________________________________________________________________

## Application Source - Tools

Argocd supports below source as tools-
  - Helm
  - Kustomize application
  - Directory of yaml files
  - jsonnet

____________________________________________________________________________________________________________________________________________________________________________________________

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/0e66dff3-6992-4974-91ed-6cea28d2b3f7)

____________________________________________________________________________________________________________________________________________________________________________________________

## Desired State Vs. Actual State

- **Desired state** - Described in git
- **Actual state** - What is actually running in K8s cluster.
- **Sync** - Process of making desired state == actual state
![image](https://github.com/muppin/mastering-DevOps/assets/56094875/7038bffc-cbc8-4d29-b487-81cfb752c70d)

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/432da3cc-5f64-40ae-8de5-e676dc80bb8b)



___________________________________________________________________________________________________________________________________________________________________________________________

**Scenarios**

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/c3ae1f4b-d791-4f73-add4-965908eef8a3)

**argocd considers git as single source of truth, how to handle entries made by admission contoller. then admission controller that adds resource requests and limits?**

When using ArgoCD with an admission controller that automatically adds resource requests and limits, it can lead to discrepancies between the desired state defined in your Git repository and the actual state in the Kubernetes cluster. To handle this scenario while maintaining Git as the single source of truth, you can consider the following strategies:

### 1. **Declarative Admission Controller Policies**

If possible, define the policies and configurations of the admission controller in your Git repository. This way, you can version and manage these policies as part of your GitOps workflow.

### 2. **Sync Options in ArgoCD**

ArgoCD provides sync options that can help manage changes introduced by admission controllers. You can use the `ignoreDifferences` field to tell ArgoCD to ignore specific fields or annotations that are added by admission controllers.

#### Example: Ignore Differences

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: my-app
spec:
  source:
    repoURL: https://github.com/my-org/my-repo
    path: my-app
  destination:
    server: https://kubernetes.default.svc
    namespace: default
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
  ignoreDifferences:
    - group: ""
      kind: Deployment
      jsonPointers:
        - /spec/template/spec/containers/0/resources
```

In this example, ArgoCD is configured to ignore differences in the `resources` field of the first container in the `Deployment` resource.

### 3. **Admission Controller Configuration**

Configure the admission controller to add annotations or labels that ArgoCD can recognize and manage accordingly. This helps ensure that changes made by the admission controller are intentional and can be accounted for in the Git repository.

### 4. **Post-Processing Hooks**

ArgoCD supports lifecycle hooks that allow you to run custom scripts or commands at various stages of the synchronization process. You can use these hooks to manage changes introduced by the admission controller.

#### Example: Post-Sync Hook

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: my-app
spec:
  source:
    repoURL: https://github.com/my-org/my-repo
    path: my-app
  destination:
    server: https://kubernetes.default.svc
    namespace: default
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
  hooks:
    - name: post-sync
      exec:
        command: ["sh", "-c", "kubectl annotate deployment my-deployment my-annotation=value"]
```

### 5. **Customize Application Definitions**

Customize your application definitions to include the resource requests and limits that the admission controller would add. By defining these resources in Git, you ensure that the desired state matches the actual state.

#### Example: Define Resources in Git

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-deployment
spec:
  replicas: 3
  template:
    metadata:
      labels:
        app: my-app
    spec:
      containers:
        - name: my-container
          image: my-image:latest
          resources:
            requests:
              memory: "64Mi"
              cpu: "250m"
            limits:
              memory: "128Mi"
              cpu: "500m"
```

### 6. **Monitoring and Alerts**

Set up monitoring and alerts to notify you when there are discrepancies between the desired state and the actual state. This can help you quickly identify and address any issues that arise due to changes made by the admission controller.

#### Example: ArgoCD Notifications

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: argocd-notifications-cm
  namespace: argocd
data:
  triggers.yaml: |
    - name: on-sync-status-unknown
      condition: app.status.operationState.phase == 'Unknown'
      template: unknown-sync
  templates.yaml: |
    - name: unknown-sync
      title: "Application {{app.metadata.name}} sync status is unknown"
      body: |
        Application {{app.metadata.name}} in namespace {{app.metadata.namespace}} has sync status unknown.
```

### Conclusion

By using a combination of declarative policies, sync options, hooks, and monitoring, you can effectively manage changes introduced by admission controllers while maintaining Git as the single source of truth in ArgoCD. This approach ensures that your desired state remains consistent with the actual state in your Kubernetes cluster, even when admission controllers add resource requests and limits.




_____________________________________________________________________________________________________________________________________________________________________________________

- **To fetch decoded password for argocd UI-**
  
     ```
     kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo


- **Prune option in Sync-** Will delete the resources with the old name and create the new ones.

- **For argocd CLI refer to -** https://argo-cd.readthedocs.io/en/stable/user-guide/commands/argocd/


_______________________________________________________________________________________________________________________________________________________________________________________

## helm options

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/ac134ad9-857c-40ac-bd99-3ac01eefd2d1)

 - Note: by default in Argo CD, helm release name is equal to app name unless we specify it explicitly.
   

      ```
      helm:
        release-name: my-app   //my-app release name will be added to the resources
___________________________________________________________________________________________________________________________________________________________________________________

## Directory options

         ```
         Directory:
           recurse: true     //list all files in sub-directories as well.


![image](https://github.com/muppin/mastering-DevOps/assets/56094875/aa40ac01-b116-4421-8534-49e01c1d65d6)

____________________________________________________________________________________________________________________________________________________________________________________

## Kustomize Options

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/c819d5c0-c84e-4f89-91d2-1b3e7585d13b)

        ``` 
        kustomize:
          namePrefix: staging-
          commonLabels:
                app: demo
             
_____________________________________________________________________________________________________________________________________________________________________________________

## Multiple Sources for an application

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/34eda0fd-70f9-4240-8310-80385a8f89ce)

**Use Cases** -

- **Combine related resources that exist is different repos into one application.**
        - ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/d517e4d1-f8c2-45a9-b615-d2e057a26cd8)
  
- **Remote helm chart with git hosted values file.**
        - ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/b12e790f-6894-4037-94e0-be8d7636892b)

______________________________________________________________________________________________________________________________________________________________________________________

## Projects

- **Projects provides a logical grouping of applications.**
  
 ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/1e96c820-abad-4912-ba54-15365ae77f22)

- **Project Manifest**
  
![image](https://github.com/muppin/mastering-DevOps/assets/56094875/dc713034-9994-460a-83ea-525b23ea17e1)

- **After allowing specific scoped resources-**
  
![image](https://github.com/muppin/mastering-DevOps/assets/56094875/9bc17ac6-7937-46a5-a0d3-e1a2f98e7855)

- **Notes:**

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/8c254783-ceb0-4820-8758-39c65f2e12fd)

- **Roles**

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/271db4e5-64c6-4b45-b0b3-52af9d93e374)


- **Creating Tokens**

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/6de10a3a-fa3d-40dd-8a9e-3e71bef0582b)

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/f2d1744f-b49a-4ae9-bee9-b32a6cdd4923)


_________________________________________________________________________________________________________________________________________________________________________________________


## Using Private Git repos in argocd

- Public repos can be directly used in argocd.
- Private repos need to be registered in argocd with proper authentication before using it in applications.
- Argocd support connecting to private repos using below ways:
       - HTTPS: using usrname, password and access tokens.
       - SSH: Using ssh private key
       - Github/ Github Enterprise: Github app credentials
- Private repo credentails are stored in normal k8s secrets.
- You can register the private repos using declarative approach, cli or UI.

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/8994ee48-7634-4f23-a03f-559475975059)


![image](https://github.com/muppin/mastering-DevOps/assets/56094875/28be74dd-5d79-4a7a-8a69-3f69c42d8109)


![image](https://github.com/muppin/mastering-DevOps/assets/56094875/416816f4-7455-4deb-8a23-16345ce63776)


![image](https://github.com/muppin/mastering-DevOps/assets/56094875/c0ba08b2-0305-47d3-ad55-ada130c8360a)


**Define and create k8s secret in order to connect private git repo with Argo CD.**

    ``` 
       apiVersion: v1
       kind: Secret
       metadata:
         name: private-repo-ssh
         namespace: argocd
         labels:
           argocd.argoproj.io/secret-type: repository
       stringData:
         type: git
         url: https://github.com/Vasishtha15/ArgoPractice.git
         sshPrivateKey: |



  _________________________________________________________________________________________________________________________________________________________________________________

  ## Private Helm Repos

  ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/fb036b0c-aa98-44e4-8c38-b8a12440ea4d)


  - 1. Declarative
       
       ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/0d86d7a2-1adb-48e5-9a73-f849332fcf6c)

    2. CLI

      ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/1fa75aa8-638e-4994-8353-b1f6cf3a270d)

    3. UI
____________________________________________________________________________________________________________________________________________________________________________________

## Credential Templates

credential templates are used to connect to multiple private repos without having to repeat credentials for each repository

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/7e43ecfb-4eb1-4d70-92a4-da2ebcd24189)


- **Declarative**
  
  ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/518bc118-7a4c-4402-aad1-fef3c020ba1f)

- **CLI**
  
  ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/66e5266a-99cc-43ad-b647-5e484846ff7b)

  __________________________________________________________________________________________________________________________________________________________________________________


   ## Sync Policies and Options

  **Automated Sync**
    
    ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/1883af07-8e0f-4c05-8ee9-a0d4f55afd80)

    ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/6fd10340-8069-401e-a146-c4c8825a5e67)

    ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/e847d28e-8dfa-44b3-8120-754087bf07ad)


    ________________________________________________________________________________________________________________________________________________________________________________

 **Automated PRune**
- Enable auto prune if u want the resources to be removed from the cluster (web UI) when they are removed from the git to sync(desired state = actual atate).

    ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/4d6864a6-07ed-4961-b140-9eb4ac28c701)

    ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/58fa51de-6a27-425a-a308-22a9a845e434)

    ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/b878444a-e65e-4c65-aa40-d60a45b97aa2)

  ________________________________________________________________________________________________________________________________________________________________________________

 **Automated Self Healing**
  - on Enabling automated self healing, argocd tries to keep in sync i.e desired state= actual state.
  - If auser does anything like manually updating the k8s resorces in the cluster, argocd will detect this and self heals the resources in order to keep in syn.  
  - enabling the self heal declaratively
  
    ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/9d870b59-01f3-487f-b302-5577dd222bff

___________________________________________________________________________________________________________________________________________________________________________

**Sync Options**
 - Users can customise how the resorces are synced between the target cluster amd desired state
    - Most of the options are available at application level
    - some of the options available using resorce annotations

 There are certain options
 - No prune - argocd prvents an object from being pruned, even though the app will be out of syn it will not prune the object in the cluster.
 - Disable kubectl validation - in confusion
 - ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/7e5dfd11-c030-4abc-8921-30beda2ac272)

 - Selective sync - selective sync will sync only out-of-sync resources.
 - Prune Last - argocd will prune this application or resource at last if it were deployed as part of multiple application.
 - Replace resources - if enabled, argocd will replace all the resources during the sync operation. At resource level set replace = true under annotaions. At app level set it under sync options. Manifests level: You can use the replace annotation at manifest level to achieve this. (argocd.argoproj.io/sync-options: Replace=true)
 - Fail on shared resource -if enabled, argocd will fail if any resource in this application is found in other applications. Argo CD will make multiple attempts to sync the resources but it will fail.


Note: 
- Prevent pruning can be achieved at manifests level or entire application level (by default pruning disabled at application level unless you enable it).
- Selective sync option will sync only out-of-sync resources. You need it when you have thousands of resources in which sync take a long time and puts pressure on API server.
- For Fail on shared resource - By default Argo CD will apply the resources even if it was available in multiple applications, unless we configure the sync to fail option if any resource is found in other applications.



  The `validate=false` option in ArgoCD disables validation of resources during application deployment. By default, ArgoCD validates resources against Kubernetes schema and manifests to ensure correctness before applying changes. However, using `validate=false` allows deploying resources without pre-deployment validation, which can be useful in certain scenarios where strict validation might hinder deployments.

**Example/Usecase:**

Consider a scenario where you have custom Kubernetes resources or manifests that aren't fully compliant with the strict validation rules. In such cases, when you attempt to deploy these resources using ArgoCD, it might fail due to validation errors even though the resources could potentially function without issues.

Let's say you have a custom resource definition (CRD) that ArgoCD doesn't fully recognize or validate against. To deploy these resources without validation, you can use the `validate=false` flag. For instance:

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: my-app
spec:
  destination:
    namespace: my-namespace
    server: https://kubernetes.default.svc
  source:
    repoURL: <URL_TO_YOUR_REPO>
    path: manifests/
    targetRevision: HEAD
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
    syncOptions:
      - Validate=false  # Use validate=false to skip validation
```

By setting `validate=false` in the `syncOptions` of the application manifest, ArgoCD will proceed with deployment without validating the resources against the Kubernetes schema. This can be useful when you have custom resources or specific use cases where strict validation might interfere with the deployment process.

However, it's crucial to use `validate=false` judiciously because it bypasses validation checks, potentially allowing invalid configurations to be applied to your cluster. It's recommended to understand the implications and only use this option when necessary, ensuring the deployed resources won't cause unexpected issues in your cluster.

_________________________________________________________________________________________________________________________________________________________________________________________

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/13854235-79ba-494a-a063-7c15e6e4e30e)

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/8e4a9dc0-98c0-4dc6-bf51-235fff88b14b)

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/c07c8916-7efc-45ef-a197-ab89031bafa0)

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/27d84c7a-340a-4d0e-85e8-4e6416abb2e6)

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/cb018992-94f6-4e8a-8ad4-7d023f823fc7)

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/d8c856e1-1373-426e-9884-97417cf8d240)

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/2bfc8ff9-a07a-4452-8ba3-1de476c35f50)

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/3c95adbb-af24-4d43-a825-b21e212dc8ed)

Note- 
- Tags are good for production as they are more stable and less frequently changed.
- Most restricted way is to track with a specific commit.
- Tag is like a published copy, can't be modified.

In ArgoCD, `targetRevision: HEAD` and `targetRevision: master` refer to different states within a Git repository that the application will deploy.

- **`targetRevision: HEAD`:**
  - Refers to the latest commit in the default branch of the repository.
  - It represents the most recent state of the repository, regardless of the branch name.
  - Useful when you want the application to track the latest changes irrespective of the branch name, ensuring it always deploys the most recent commit.

- **`targetRevision: master` (or specific branch name):**
  - Specifies a particular branch (in this case, the `master` branch) as the target for deployment.
  - It deploys the state of the application as per the latest commit on the specified branch.
  - This setting is beneficial when you want the application to follow a specific branch for deployment, ensuring stability by deploying changes from a known and controlled branch.

The choice between `targetRevision: HEAD` and `targetRevision: master` depends on the deployment strategy and the desired behavior of the application within the Git repository.

- **Use `targetRevision: HEAD` when:**
  - You want the application to deploy the most recent changes, regardless of the branch name.
  - There's a need to track changes from any branch dynamically without explicitly specifying a particular branch.

- **Use `targetRevision: master` when:**
  - You prefer to deploy from a specific, stable branch (in this case, the `master` branch).
  - The application should consistently track and deploy changes from a known branch.

It's important to consider the repository's branching strategy, stability of branches, and the desired behavior of the application when choosing between these options in ArgoCD configuration.








 

    

    




















