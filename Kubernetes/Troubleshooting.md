## Types Of Errors

### ImagePullBackOff Error

  - **What is the error**
       - When the cluster is not able to pull the container image to create a pod.
       - When we do "kubectl get pod" we can see this error in the status column.
       - There will be ErrImagePull error, then k8s will delay in pulling the image, it will retry multiple times with an increment in the delay.
       - kubelet will try to read the deployment.ymal and look for secrets in case of private image, and when it did not find any such secrets in deploy.yml it will trigger ErrImagePull error.
       - This process of delaying is called BackOFF, thats why this error is called ImagePullBackOff error.
    
  - **Possible reasons of occurance?**
       - Invalid image
       - Non existing image
       - If it a private image
       - we have not created ImagePullSecret to authenticate
    
  - **How to troubleshoot:**
       - kubectl describe pod
       - kubctl events

  
