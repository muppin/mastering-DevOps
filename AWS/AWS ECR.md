### ECR - Elastic Container Registry

The Elastic Container Registry (ECR) is a fully-managed Docker container registry service provided by Amazon Web Services (AWS). It allows users to store, manage, and deploy Docker container images in the AWS cloud.

Key features of ECR include:

- Integration with AWS: ECR seamlessly integrates with other AWS services such as Amazon Elastic Container Service (ECS), Amazon Elastic Kubernetes Service (EKS), AWS Lambda, and AWS Batch, making it easy to deploy and manage containerized applications.
- Security: ECR provides secure access control using AWS Identity and Access Management (IAM) policies. It also supports encryption of data at rest and in transit to ensure the security of container images.
Scalability and Availability: ECR is designed to be highly scalable and available. It automatically scales to handle large numbers of container images and is built on the AWS global infrastructure for high availability.
- Lifecycle Policies: ECR supports lifecycle policies that allow users to define rules for automatically cleaning up old or unused container images, helping to manage storage costs and keep the registry organized.
- Private Registry: ECR repositories are private by default, meaning that container images stored in ECR are only accessible to users and services with the appropriate permissions.
- Overall, ECR provides a convenient and reliable solution for storing and managing container images in the AWS cloud, offering seamless integration with other AWS services and robust security features.


### To push Docker images to Amazon Elastic Container Registry (ECR)

1. **Authenticate Docker to ECR**: Before you can push images to ECR, you need to authenticate Docker to your ECR registry. You can do this by running the `aws ecr get-login-password` command and using its output to authenticate Docker.

   ```bash
   aws ecr get-login-password --region <AWS_REGION> | docker login --username AWS --password-stdin <AWS_ACCOUNT_ID>.dkr.ecr.<AWS_REGION>.amazonaws.com
   ```

   Replace `<AWS_REGION>` with your AWS region (e.g., us-east-1) and `<AWS_ACCOUNT_ID>` with your AWS account ID.

2. **Tag Your Docker Image**: Tag the Docker image with the ECR repository URI. This URI follows the pattern `<AWS_ACCOUNT_ID>.dkr.ecr.<AWS_REGION>.amazonaws.com/<REPOSITORY_NAME>`.

   ```bash
   docker tag <IMAGE_NAME>:<TAG> <AWS_ACCOUNT_ID>.dkr.ecr.<AWS_REGION>.amazonaws.com/<REPOSITORY_NAME>:<TAG>
   ```

   Replace `<IMAGE_NAME>:<TAG>` with the name and tag of your Docker image, and `<REPOSITORY_NAME>` with the name of your ECR repository.

3. **Push Docker Image to ECR**: Push the tagged Docker image to the ECR repository.

   ```bash
   docker push <AWS_ACCOUNT_ID>.dkr.ecr.<AWS_REGION>.amazonaws.com/<REPOSITORY_NAME>:<TAG>
   ```

   Replace `<AWS_REGION>`, `<AWS_ACCOUNT_ID>`, `<REPOSITORY_NAME>`, and `<TAG>` with your AWS region, AWS account ID, ECR repository name, and Docker image tag, respectively.

Here's an example of the complete sequence of commands:

```bash
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 123456789012.dkr.ecr.us-east-1.amazonaws.com
docker tag my-image:latest 123456789012.dkr.ecr.us-east-1.amazonaws.com/my-repository:latest
docker push 123456789012.dkr.ecr.us-east-1.amazonaws.com/my-repository:latest
```

Make sure to replace the placeholders (`<AWS_REGION>`, `<AWS_ACCOUNT_ID>`, `<REPOSITORY_NAME>`, `<IMAGE_NAME>`, and `<TAG>`) with your actual AWS configuration and Docker image information.
