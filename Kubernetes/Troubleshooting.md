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
    
  - **How to troubleshoot:**
       - kubectl describe pod
       - kubctl events

  ![Uploading image.png…]()

