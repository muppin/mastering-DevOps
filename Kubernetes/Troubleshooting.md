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


                            -  

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/4252826c-3fee-45e4-9a0c-b1a063fbdab8)


