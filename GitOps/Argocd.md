#### Argocd Architecture

**Microservices**
- Repo Server- It will connect to git and get the state of resources
- Application Controller - Connect to k8s and get the state of k8s resources. It will compare both the states and try to sync. Statefulset.
- API Server - Used by users to connect with argocd via UI/CLI. Manages authentication.
- Dex - Light weight OIDC. Proxy server which can connect with any of your existing providers. It provides SSO capabilities for API server.
- Redis - Used for caching.
- ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/d0424126-e89f-4e60-84a0-ec8f901aeb1b)



**Scenarios**
![image](https://github.com/muppin/mastering-DevOps/assets/56094875/c3ae1f4b-d791-4f73-add4-965908eef8a3)


For argocd CLI refer to - https://argo-cd.readthedocs.io/en/stable/user-guide/commands/argocd/




