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


