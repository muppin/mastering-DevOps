### Installation of ebs-csi driver

- Check if eksctl is installed
  ``` eksctl ```

- The below command is used to associate an IAM OpenID Connect (OIDC) provider with your Amazon EKS cluster. This step is crucial for allowing your EKS cluster to interact with AWS services using IAM roles.
  ``` eksctl utils associate-iam-oidc-provider --cluster demo --region eu-west-1 --approve ```

- command to create serviceaccount
  ```
  eksctl create iamserviceaccount \
  --name ebs-csi-controller-sa \
  --namespace kube-system \
  --cluster demo \
  --attach-policy-arn arn:aws:iam::aws:policy/AmazonEBSCSIDriverPolicy \
  --approve \
  --role-only \
  --role-name AmazonEKS_EBS_CSI_DriverRole
  ```

- command to create kubernetes addon
  ``` eksctl create addon --name aws-ebs-csi-driver --cluster demo --service-account-role-arn arn:aws:iam::594039499837:role/AmazonEKS_EBS_CSI_DriverRole --force ```

