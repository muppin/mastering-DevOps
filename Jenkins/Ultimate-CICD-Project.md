### Steps

- Launch a T2-large instance
- Install docker, jenkins, sonarqube
- Create new Job-> Pipeline project
- Add path to jenkins file store in SCM (git)
- Install docker pipeline plugin -> Dashboard - manage jenkins- plugins- avail.plugins
- Maven is already installed here in docker container.
- Install sonarqube plugin in jenkins. In same VPC. (java-maven-sonar-argocd-helm-k8s/spring-boot-app/README.md)
- Start sonar server
   ```bash
   cd sonarqube-9.4.0.54424/bin/linux-x86-64/
   ./sonar.sh start
   ```
- Add inbound rules accordingly.

 **Authenticate jenkins with sonarqube**
     - Navigate to sonarqube (ec2_ip:9000)
     - Go to My Account -> security -> generate token
     - Copy token and add as credential (as secret text)
- Restart jenkins after installing all the plugins.
- Biuld and test stage- cd to java app and mvn clean package, it will search for pom.xml
- With this stage, artifact is created and stored in target folder.
- mvn sonar:sonar target is used.
- Add docker and github token in the jenkins file and jenkins credentials.
- edit sonar url in jenkins file.
- Create GKE cluster
- Install argo CD on GKE cluster. (https://argo-cd.readthedocs.io/en/stable/getting_started/)
    ```
        kubectl create namespace argocd
        kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

- Create Application on Argocd -> give repo url and path in order to fetch the manifest file.

___________________________________________________________________________________________________________________________

### Important points

**Why we use docker container as a agent?**

- Use docker container as a agent, for cost optimization, as there is no need to launch separate VMs/instances as slaves.
- If u config multiple EC2 instances as slaves and if there is no load on certain days-> downside to this is, it will cost us even though we are not using it.
- You can use jenkins autoscaler, but Configuration overhead wil be there.
- We have to install dependencies on all slaves.
- But if we use docker container, it will bring up the container with all the dependencies.
- Container will be deleted right after the execution of all the stages.


 **Can a jenkins file in any location with any name- Yes, jenkins file can have any naming convention and can be store in any location.**

 **If jenkins file is present in source code, then there is no need to checkout stage. But if its in jenkins pipeline, as a script then checkout stage is required.**

 **What is the difference between mvn clean package and mvn clean install?**
 - Both `mvn clean package` and `mvn clean install` are Maven commands used during the build lifecycle of a Maven project, and they serve different purposes:

### `mvn clean package`:

1. **Clean:**
   - The `clean` phase removes the `target` directory, which contains the compiled classes and other build artifacts from previous builds.

2. **Package:**
   - The `package` phase compiles the source code, runs tests, and packages the application into its distributable format. For example, for a Java project, it typically creates a JAR file. The packaged artifact is placed in the `target` directory.

3. **Use Case:**
   - This command is often used during local development and testing phases when you want to quickly build and package the application to test its functionality.

### `mvn clean install`:

1. **Clean:**
   - The `clean` phase, similar to the `mvn clean package`, removes the `target` directory.

2. **Install:**
   - In addition to the `package` phase, the `install` phase installs the packaged artifact into the local Maven repository (`~/.m2/repository`). This makes the artifact available for other projects to use as a dependency.

3. **Use Case:**
   - This command is used when you want to build, package, and install the artifact locally. It is especially useful in scenarios where you have a multi-module Maven project, and one module depends on another module's artifact.

### Key Differences:

1. **Local Repository:**
   - The primary difference lies in how the built artifact is handled. `mvn clean package` only creates the artifact in the `target` directory, while `mvn clean install` additionally installs the artifact to the local Maven repository.

2. **Usage in Multi-Module Projects:**
   - In a multi-module project, you might use `mvn clean install` in the parent project to build and install all modules locally. Subsequently, you can use `mvn clean package` in individual modules for quick local testing without installing artifacts.

3. **Team Collaboration:**
   - If you're collaborating with a team and want to share a snapshot of your project's artifact, you might prefer `mvn clean install`. Other team members can then use the installed artifact as a dependency.

### Summary:

- Use `mvn clean package` for local development, quick testing, or creating an artifact without installing it.
- Use `mvn clean install` when you want to build, package, and install the artifact locally for potential use in other projects within your development environment.

**pom.xml is responsible for getting the dependencies runtime and deploying the app. pom.xml is used for java apps only**

___________________________________________________________________________________________________________________________

Explaining a CI/CD pipeline for deploying Java code, which is containerized and deployed to an Amazon EKS cluster using Jenkins and ArgoCD, involves walking through the various stages of the pipeline. Below is a step-by-step explanation:

### 1. **Source Code Repository:**
   - Start by explaining that the Java source code is stored in a version control system like Git. Developers commit their changes to this repository.

### 2. **Jenkins Pipeline Trigger:**
   - Describe how the Jenkins pipeline is triggered, whether it's triggered on each commit, pull request, or manually triggered based on project requirements.

### 3. **Checkout Stage:**
   - The first stage involves checking out the Java source code from the version control system. Jenkins pulls the latest changes to the build server.

### 4. **Build and Unit Testing:**
   - Build the Java application using a build tool like Maven
   - mvn clean package:
        - clean: Deletes the target directory, which contains the compiled classes and other build artifacts from previous 
                 builds.
        - package: Compiles the source code, runs tests, and packages the application into a distributable format, 
                  typically a JAR file (for a Java project). The packaged artifact is placed in the target directory.

### 5. **Artifact Generation:**
   - Generate the Java artifacts, such as JAR files, that will be deployed to the EKS cluster.

### 6. **Dockerization:**
   - Containerize the Java application by building a Docker image. The Docker image includes the application code, dependencies, and necessary configurations. This step ensures a consistent and reproducible deployment environment.
   - Explain the dockerfile :
       - ```bash
         FROM adoptopenjdk/openjdk11:alpine-jre
         
         ARG artifact=target/spring-boot-web.jar

         WORKDIR /opt/app

         COPY ${artifact} app.jar

         ENTRYPOINT ["java","-jar","app.jar"]
         ```
         
       - this Dockerfile sets up a containerized environment for a Spring Boot application. It uses a lightweight OpenJDK 
         11 Alpine image, sets the working directory, copies the Spring Boot JAR file into the container, and specifies 
         the command to run the application when the container starts. The use of build arguments allows flexibility in 
         specifying the location of the application artifact during the build process.

### 7. ** Static code analysis**
   - mvn sonar:sonar target is used to do the static code analysis using sonarqube.
       - The mvn sonar:sonar command is used to analyze a Maven project using SonarQube. It triggers the SonarQube 
         analysis and sends the results to the SonarQube server for further inspection and reporting.

### 8. **Push Docker Image to Registry:**
   - Push the Docker image to a container registry (e.g., AWS ECR). The registry serves as a centralized repository for 
     storing and versioning Docker images.

### 9. **ArgoCD Application Configuration:**
   - Define the application configuration for ArgoCD, specifying details like the Git repository URL, path to Kubernetes manifests, and synchronization settings.

### 10. **ArgoCD Deployment:**
   - ArgoCD continuously monitors the Git repository for changes. When changes are detected, ArgoCD deploys the updated application to the EKS cluster, ensuring the desired state matches the configuration in the Git repository.

### 11. **EKS Cluster Integration:**
    - Explain how the EKS cluster is integrated with ArgoCD. This involves setting up ArgoCD in the cluster and establishing connectivity between ArgoCD and the cluster's Kubernetes API server.

### 12. **Verification and Validation:**
    - After the deployment, perform verification and validation steps. This may include running integration tests, validating the application's functionality, and ensuring that it behaves as expected in the EKS environment.

### 13. **Monitoring and Logging:**
    - Discuss how monitoring and logging are integrated into the pipeline and application. This ensures that you can track the performance and behavior of the Java application in the EKS cluster.

### 14. **Rollback Mechanism (Optional):**
    - Explain whether the pipeline includes a rollback mechanism in case issues are detected post-deployment. This might involve rolling back to a previous version or triggering a fix.

### 15. **Notifications:**
    - Mention any notification mechanisms, such as Slack notifications or email alerts, to keep the development team informed about the status of the pipeline and deployments.

### Conclusion:
   - Conclude by emphasizing that the CI/CD pipeline, powered by Jenkins and ArgoCD, automates the entire process from code changes to deployment, ensuring a reliable and repeatable delivery mechanism for the Java application on the EKS cluster.

Tailor the explanation based on the specific tools, frameworks, and deployment strategies used in your Jenkins CI/CD pipeline for Java applications on EKS with ArgoCD. Providing concrete examples and details will help showcase your understanding of the pipeline and deployment practices.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## CICD Best practices

Continuous Integration and Continuous Deployment (CI/CD) pipelines are critical components of modern software development workflows. Here are some best practices to consider when designing and implementing CI/CD pipelines:

1. **Automate Everything**: Automate as much of the pipeline as possible, including building, testing, and deployment processes. This reduces human error, improves consistency, and speeds up the delivery of software.

2. **Use Version Control**: Store all code and configuration in a version control system (e.g., Git). This ensures traceability, facilitates collaboration, and enables rollback to previous versions if needed.

3. **Keep Pipelines Small and Fast**: Break down pipelines into smaller, focused stages to improve maintainability and reduce build times. Use techniques like parallelization to execute tests and tasks concurrently, speeding up overall pipeline execution.

4. **Implement Automated Testing**: Include various types of automated tests, such as unit tests, integration tests, and end-to-end tests, in your pipeline. These tests help catch bugs early, validate changes, and ensure the overall quality of the software.

5. **Practice Infrastructure as Code (IaC)**: Define infrastructure resources (e.g., servers, databases, networks) as code using tools like Terraform or AWS CloudFormation. This enables reproducible and consistent environments, simplifies deployment, and facilitates scalability.

6. **Monitor Pipeline Health**: Monitor the health and performance of your CI/CD pipeline using metrics and logging. Track key indicators such as build success rate, build duration, and deployment frequency. Use this data to identify bottlenecks and areas for improvement.

7. **Implement Security Checks**: Integrate security checks into your pipeline to identify vulnerabilities early in the development process. This may include static code analysis, dependency scanning, and security testing.

8. **Use Environment Promotion**: Promote artifacts through multiple environments (e.g., development, staging, production) using automated processes. Ensure consistency between environments and minimize manual intervention to reduce the risk of errors.

9. **Enable Rollback Mechanisms**: Implement automated rollback mechanisms to revert deployments in case of failures or issues detected in production. This helps minimize downtime and maintain service availability.

10. **Document Pipelines**: Document your CI/CD pipelines, including configuration details, dependencies, and deployment procedures. Clear documentation helps onboard new team members, troubleshoot issues, and ensure continuity of operations.

11. **Implement Continuous Feedback**: Gather feedback from stakeholders, users, and monitoring systems continuously. Use this feedback to prioritize improvements, address pain points, and refine your pipeline over time.

12. **Practice Continuous Learning and Improvement**: Foster a culture of continuous learning and improvement within your team. Encourage experimentation, gather lessons learned from each deployment, and incorporate feedback to iterate and evolve your CI/CD practices.

By following these best practices, you can establish robust and efficient CI/CD pipelines that accelerate software delivery, enhance quality, and support the agility required in modern software development environments.
 
