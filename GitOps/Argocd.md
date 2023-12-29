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

____________________________________________________________________________________________________________________________________________________________________________________________

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



____________________________________________________________________________________________________________________________________________________________________________________________
**Scenarios**
![image](https://github.com/muppin/mastering-DevOps/assets/56094875/c3ae1f4b-d791-4f73-add4-965908eef8a3)


For argocd CLI refer to - https://argo-cd.readthedocs.io/en/stable/user-guide/commands/argocd/

_____________________________________________________________________________________________________________________________________________________________________________________
- To fetch decoded password for argocd UI- 
    ``` kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo

- Prune option in Sync- Will delete the resources with the old name and create the new ones.


_______________________________________________________________________________________________________________________________________________________________________________________

**helm options**

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/ac134ad9-857c-40ac-bd99-3ac01eefd2d1)

 - Note: by default in Argo CD, helm release name is equal to app name unless we specify it explicitly.
   

      ```helm:
            release-name: my-app   //my-app release name will be added to the resources
___________________________________________________________________________________________________________________________________________________________________________________
**Directory options**

         ```Directory:
              recurse: true     //list all files in sub-directories as well.


![image](https://github.com/muppin/mastering-DevOps/assets/56094875/aa40ac01-b116-4421-8534-49e01c1d65d6)

____________________________________________________________________________________________________________________________________________________________________________________

**Kustomize Options**

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/c819d5c0-c84e-4f89-91d2-1b3e7585d13b)

        ``` kustomize:
              namePrefix: staging-
              commonLabels:
                app: demo
             
_____________________________________________________________________________________________________________________________________________________________________________________

### Multiple Sources for an application

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/34eda0fd-70f9-4240-8310-80385a8f89ce)

**Use Cases** -
- **Combine related resources that exist is different repos into one application.**
        - ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/d517e4d1-f8c2-45a9-b615-d2e057a26cd8)
  
- **Remote helm chart with git hosted values file.**
        - ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/b12e790f-6894-4037-94e0-be8d7636892b)

______________________________________________________________________________________________________________________________________________________________________________________

### Projects

- Projects provides a logical grouping of applications.
  
 ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/1e96c820-abad-4912-ba54-15365ae77f22)

- Project Manifest
  
![image](https://github.com/muppin/mastering-DevOps/assets/56094875/dc713034-9994-460a-83ea-525b23ea17e1)

- After allowing specific scoped resources-
  
![image](https://github.com/muppin/mastering-DevOps/assets/56094875/9bc17ac6-7937-46a5-a0d3-e1a2f98e7855)

- Notes:

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/8c254783-ceb0-4820-8758-39c65f2e12fd)














