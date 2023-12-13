**Pre-requisites**
- Install kubectl on your machine
- Install eksctl
- Install aws cli


**To create cluster**
eksctl create cluster --name demo-cluster1234 --region us-east-1 --fargate 

**Errors**
2023-12-12 23:24:36 [✖]  AWS::EC2::NatGateway/NATGateway: CREATE_FAILED – "Resource creation cancelled"
2023-12-12 23:24:36 [✖]  AWS::EC2::RouteTable/PublicRouteTable: CREATE_FAILED – "Resource creation cancelled"
2023-12-12 23:24:36 [✖]  AWS::EC2::RouteTable/PrivateRouteTableUSEAST1E: CREATE_FAILED – "Resource creation cancelled"
2023-12-12 23:24:36 [✖]  AWS::IAM::Policy/PolicyELBPermissions: CREATE_FAILED – "Resource creation cancelled"
2023-12-12 23:24:36 [✖]  AWS::EC2::RouteTable/PrivateRouteTableUSEAST1D: CREATE_FAILED – "Resource creation cancelled"
2023-12-12 23:24:36 [✖]  AWS::IAM::Policy/PolicyCloudWatchMetrics: CREATE_FAILED – "Resource creation cancelled"
2023-12-12 23:24:36 [✖]  AWS::EKS::Cluster/ControlPlane: CREATE_FAILED – "Resource handler returned message: \"Cannot create cluster 'my-new-cluster1' because us-east-1e, the targeted availability zone, does not currently have sufficient capacity to support the cluster. Retry and choose from these availability zones: us-east-1a, us-east-1b, us-east-1c, us-east-1d, us-east-1f (Service: Eks, Status Code: 400, Request ID: 78f44362-3b27-4e9e-9a44-350f0897d658)\" (RequestToken: e7f28ec5-4c72-3f89-296e-da4ab6c31ebe, HandlerErrorCode: InvalidRequest)"
2023-12-12 23:24:36 [!]  1 error(s) occurred and cluster hasn't been created properly, you may wish to check CloudFormation console
2023-12-12 23:24:36 [ℹ]  to cleanup resources, run 'eksctl delete cluster --region=us-east-1 --name=my-new-cluster1'
2023-12-12 23:24:36 [✖]  ResourceNotReady: failed waiting for successful resource state
Error: failed to create cluster "my-new-cluster1"

**EKS cluster creation failed due to insufficient capacity in the targeted availability zone "us-east-1e". The error message indicates that this zone does not currently have enough capacity to support the cluster.**

**Recomendation** - Retry the cluster creation process and choose an alternative availability zone from the available ones: us-east-1a, us-east-1b, us-east-1c, us-east-1d, us-east-1f. This can be specified during the cluster creation to target a different zone.

**eksctl create cluster --name demo-cluster1234 --region us-east-1 --fargate --zones us-east-1a --zones us-east-1b**

**Open ID Connector Provider**
To integrate with any identity provider (okta, ldap).

**Fargate Profile**
Restricted to a namespace, If u want to add new K8s resources, u need to add a new fargate profile.

**command** - aws eks update-kubeconfig --name demo-cluster1234 --region us-east-1
**Output** - Added new context arn:aws:eks:us-east-1:379475144136:cluster/demo-cluster1234 to C:\Users\avasishtha\.kube\config

**To list context**
kubectl config get-contexts

**Context**
In Kubernetes, a "context" refers to a user, a cluster, and a namespace combination. It encapsulates the cluster you want to interact with, the user identity you want to use, and the namespace you want to work within.
When you work with multiple clusters or have different roles within a cluster, managing contexts becomes essential for switching between different configurations easily. Kubernetes configuration file (kubeconfig) can contain multiple contexts, allowing you to seamlessly switch between different clusters and environments.
Here are the key components of a Kubernetes context:
**Cluster:**
Specifies the cluster endpoint, including the API server's URL.
It includes details like the cluster's certificate authority (CA) for secure communication.
**User:**
Describes the user identity used to authenticate with the cluster.
It includes details such as client certificates, keys, or token information.
**Namespace:**
Specifies the default namespace for the user within the cluster.
It determines the scope for resource management and visibility.


### Project Implementaion (https://github.com/iam-veeramalla/aws-devops-zero-to-hero/blob/main/day-22)

- **create fargate profile**
  ```
  eksctl create fargateprofile \
    --cluster demo-cluster \
    --region us-east-1 \
    --name alb-sample-app \
    --namespace game-2048
  
