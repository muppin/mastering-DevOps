## Types Of Errors

### ImagePullBackOff Error

  - **What is the error**
       - When the cluster is not able to pull the container image to create a pod.
       - When we do "kubectl get pod" we can see this error in the status column.
       - kubelet will try to read the deployment.ymal and look for secrets in case of private image, and when it does not find any such secrets in deploy.yml it will trigger ErrImagePull error.
       - First, there will be ErrImagePull error, then k8s will delay in pulling the image, it will retry multiple times with an increment in the delay.
       - This process of multiple retries and delaying results in BackOFF, thats why this error is called ImagePullBackOff error.
    
  - **Possible reasons of occurance?**
       - Invalid image
       - Non existing image
       - If it is a private image and we have not created ImagePullSecret to authenticate
         ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/35d7ed58-61b3-4cd8-8952-361a8766837d)

    
  - **How to troubleshoot:**
       - Use ```kubectl get events | grep <pod_Name>```  to get the events of the specific pod.
       - use ```kubectl describe pod <pod_name>``` and check the event section to check events
       - use ```kubectl logs <pod_name>``` command will produce as the container in a pod  is trying and failing to pull the image
         
         ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/71f662bb-fa89-4896-84d3-5a17e12645a5)

      - If the issue is becuase of private image, below error can be seen
        ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/e4d7b2a5-665e-4533-b441-7435f5d4b4a1)


  - **Solution:**
       - Validate the image name/version and update it correctly in the deployment manifest.
       - if the image is private, try to create a secret first and they apply
          - to create ```kubectl create secret docker-registry demo --docker-server=<your-registry-server> --docker-username=<your-name> --docker-password=<your-pword> --docker-email=<your-email>```
          - create a imagePullSecret and specify in deployment
          - ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/8cec9ed1-cb83-4aed-bd2b-d60b22872bfb)


   
**************************************************************************************************************************************************************************************************

### CrashLoopBackOff Error

  - **What is the error**
      - When you see "CrashLoopBackOff," it means that kubelet is trying to run the container, but it keeps failing and crashing. After crashing, Kubernetes tries to restart the container automatically, but if the container keeps failing repeatedly, you end up in a loop of crashes and restarts, thus the term "CrashLoopBackOff."
      - ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/b6ccf9ce-386a-45f4-8704-6e85fcc2dc46)


  - **Possible reasons of occurance?**
       - Misconfigurations :
             - Misconfigurations can encompass a wide range of issues, from incorrect environment variables to improper setup of service ports or volumes.
             - These misconfigurations can prevent the application from starting correctly, leading to crashes.
             - ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/c26e9f60-da27-452b-8687-2a271f1429e1)

       - Errors in the Liveness Probes :
             - If a liveness probe is incorrectly configured, it might falsely report that the container is unhealthy, causing Kubernetes to kill and restart the container repeatedly.
         
         ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/852dbfed-850c-4dd1-8d9e-0b0c2af9bcb9)
         

       - The Memory Limits Are Too Low :
             - If the memory limits set for a container are too low, the application might exceed this limit, especially under load, leading to the container being killed by Kubernetes.
       - Wrong Command Line Arguments :
             - Containers might be configured to start with specific command-line arguments. If these arguments are wrong or lead to the application exiting (for example, passing an invalid option to a command), the container will exit immediately
       - For more info : https://github.com/iam-veeramalla/kubernetes-troubleshooting-zero-to-hero/tree/main/02-CrashLoopBackOff

  - **How to Trouble Shoot:**
      - use ```kubectl get events | grep <pod_name>``` to get the events of the specific pod.
      - use ```kubectl describe pod <pod_name>``` and check the event section to check events.
      - use ```kubectl logs <pod_name>``` command will produce as the "python3: can't open file '/app/app1.py': [Errno 2] No such file or directory" (this is because of misconfiguration)
      - ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/2a33c3b9-80a2-4854-bb59-b33bda218349)
   
  - **NOTE**
  - If we have OOM killed error in a pod, follow below:
    ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/c2e916a8-8cfd-4787-8d8b-4e66fab4dbed)


https://www.linkedin.com/posts/schakraborty007_kubernetes-k8s-devops-activity-7156144230950727680-mTvL?utm_source=share&utm_medium=member_desktop                            -  

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/4252826c-3fee-45e4-9a0c-b1a063fbdab8)


### 3 scenarios that are common in production environment

#### Resource Sharing

- whenever the application starts using more memory or starts leaking memory, it affects other applications running in the cluster in a particular namespace which results in crash of a pod because of OOMKilled error and also other namespaces not getting enough resource. to overcome this we have to have resourcequota.yaml should be define at namespace level.
- so here developers performs a performance benchmarking to know how much resource that the microservice might require and then devops engineer provides by writing resorcequota.yaml to the particular namespace.
- this solves the problem at the cluster level i.e. by implementing the resorce quota manifest file.

**but the proble still persists at the particular namesapce level.**
- to troubleshoot this we come up with the requests and limits defined at the pod/microservice level.
- here we ask the developers to make the performance benchmarking at each microservice level to address this issue

**Blast radius**
- Before introducing resource quote manifest, balst radius is for entire cluster, after that it reduces to namespace.
- before introducing requests and limits, blast radius is for particular name, after that it reduces to pod. evntually that pod will be crashed because of OOMKilled error.

#### How will you resolve the issue having OOMKilled error.

- so whenevr we come accross this issue even after setting up the resource quote, requests and limits. we have to check the thread dump and heap dump and provide these details to the development team. so that developers work on this and come up with the new application.(thats all we devops engs can do)
- In the context of a pod in Kubernetes or a similar container orchestration system, a thread dump and heap dump are diagnostic tools used for troubleshooting and understanding the behavior of an application running inside the pod.
- in python you can use threading modules for thread dumps, garbage collector and objgraph modules for heap dumps.

#### Cluster Upgrades.

- ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/6a05bd13-1b60-45ae-9e9f-1e43d2845211)
- whenevr there is a scenario to upgrade the kubernetes cluster, we follow the detailed manual.
- firstly uwe take a backup.
- we have to go through the release notes and know what all functionalities are added and depricated.
- we go towards control plane components and perfrom the upgrades.
- then we upgrade the worked plane components
     - we drain the node one by one, here the PDB also comes into picture while draining the nodes and upgrade them.



