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
       - kubectl logs command will produce as the container in a pod  is trying and failing to pull the image
         
         ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/71f662bb-fa89-4896-84d3-5a17e12645a5)

  - **Solution:**
       - Validate the image name/version and update it correctly in the deployment manifest.
       - if the image is private, try to create a secret first and they apply
          - to create ```kubectl create secret docker-registry demo --docker-server=<your-registry-server> --docker-username=<your-name> --docker-password=<your-pword> --docker-email=<your-email>```
          - create a imagePullSecret and specify in deployment
          - ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/8cec9ed1-cb83-4aed-bd2b-d60b22872bfb)


   
**************************************************************************************************************************************************************************************************

### CrashLoopBackOff Error

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/b6ccf9ce-386a-45f4-8704-6e85fcc2dc46)


  ![Uploading image.png…]()

