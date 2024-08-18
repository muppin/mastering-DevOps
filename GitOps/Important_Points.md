- **To create app via cli**
  
       ``` argocd app create app-2 --repo https://github.com/mabusaa/argocd-example-apps.git --path guestbook --dest-namespace app-2 --dest-server https://kubernetes.default.svc --revision master --sync-option CreateNamespace=true
  

 - **To list apps**
  
       ``` argocd app list
  

- **To sync app**
  
       ``` argocd app sync app-name


- **To list projects**
  
      ``` kubectl get appproject -n argocd


- **To create token for role**

      ``` argocd proj role create-token PROJECT-NAME ROLE-NAME


- **To delete app with generated token**
  
      ``` argocd app delete demo --grpc-web --auth-token TOKEN_VALUE


- **ArgoCD is a controller..can you manage ArgoCD using ArgoCd?**
- Yes, you can manage ArgoCD using ArgoCD itself through a GitOps approach. Although ArgoCD does not directly "control" other instances of itself in the sense of operational management, it can be used to deploy and manage configurations for other ArgoCD instances as part of a broader GitOps workflow. Here’s how it can be done:

### Managing ArgoCD with ArgoCD

1. **Centralized ArgoCD Instance**: 
   - You can have a central ArgoCD instance that manages the configuration of other ArgoCD instances. This central instance monitors a Git repository that contains the configuration for other ArgoCD instances.

2. **GitOps for ArgoCD Configuration**:
   - Store the manifests and configurations for deploying ArgoCD instances in a Git repository.
   - Use the central ArgoCD instance to create and manage `Application` resources that deploy these manifests across your clusters.

### Example Workflow

1. **Create Configuration Repositories**:
   - Store the Kubernetes manifests for ArgoCD instances in one or more Git repositories. This could include the configuration for deploying ArgoCD itself, as well as any specific settings or customizations.

2. **Define ArgoCD Applications**:
   - In your central ArgoCD instance, define `Application` resources that reference these repositories. These applications will deploy ArgoCD into the target clusters.

   **Example Manifest for Managing ArgoCD Instances**:
   ```yaml
   apiVersion: argoproj.io/v1alpha1
   kind: Application
   metadata:
     name: argo-cd-instance
     namespace: argocd
   spec:
     project: default
     source:
       repoURL: 'https://github.com/your-org/argo-cd-configs'
       path: 'argo-cd-instance'
       targetRevision: HEAD
     destination:
       server: 'https://<managed-cluster-api-server>'
       namespace: argocd
     syncPolicy:
       automated:
         prune: true
         selfHeal: true
   ```

3. **Automated Sync**:
   - Set up automated synchronization for these applications so that any changes in the Git repository are automatically applied to the clusters. This ensures that the ArgoCD instances are always up-to-date with the desired configuration.

4. **Monitor and Manage**:
   - Use the central ArgoCD dashboard to monitor the status of the deployments, manage application configurations, and handle any issues that arise.

### Example ArgoCD ApplicationSet

If you need to manage multiple ArgoCD instances across various clusters dynamically, you can use the `ApplicationSet` resource:

**Example ApplicationSet Manifest**:
```yaml
apiVersion: argoproj.io/v1alpha1
kind: ApplicationSet
metadata:
  name: argo-cd-applications
  namespace: argocd
spec:
  generators:
  - clusters: {}
  template:
    metadata:
      name: '{{name}}-argo-cd'
    spec:
      project: default
      source:
        repoURL: 'https://github.com/your-org/argo-cd-configs'
        path: 'argo-cd'
        targetRevision: HEAD
      destination:
        server: '{{server}}'
        namespace: argocd
      syncPolicy:
        automated:
          prune: true
          selfHeal: true
```

### Summary

While ArgoCD cannot directly "control" other ArgoCD instances in a traditional sense, it can be used to manage the deployment and configuration of those instances through a GitOps approach. This allows you to centrally manage and automate the deployment of ArgoCD configurations across multiple clusters using ArgoCD itself.
