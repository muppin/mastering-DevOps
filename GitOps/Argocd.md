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

#### Argocd Architecture

**Microservices**
- Repo Server- It will connect to git and get the state of resources
- Application Controller - Connect to k8s and get the state of k8s resources. It will compare both the states and try to sync. Statefulset.
- API Server - Used by users to connect with argocd via UI/CLI. Manages authentication.
- Dex - Light weight OIDC. Proxy server which can connect with any of your existing providers. It provides SSO capabilities for API server.
- Redis - Used for caching.
- ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/d0424126-e89f-4e60-84a0-ec8f901aeb1b)

_______________________________________________________________________________________________________________________________________________________________________________________________

**Scenarios**
![image](https://github.com/muppin/mastering-DevOps/assets/56094875/c3ae1f4b-d791-4f73-add4-965908eef8a3)


For argocd CLI refer to - https://argo-cd.readthedocs.io/en/stable/user-guide/commands/argocd/




