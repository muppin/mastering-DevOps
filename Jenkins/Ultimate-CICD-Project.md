### Steps

- Launch a T2-large instance
- Install docker, jenkins, sonarqube
- Create new Job-> Pipeline project
- Add path to jenkins file store in SCM (git)
- Install docker pipeline plugin -> Dashboard - manage jenkins- plugins- avail.plugins
- Maven is already installed here in docker container.
- Install sonarqube plugin (sonarqubee scanner) in jenkins. In same VPC. (java-maven-sonar-argocd-helm-k8s/spring-boot-app/README.md)
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

_________________________________________________________________________________________________________________________________________________________________________________________

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

 __________________________________________________________________________________________________________________________________________________________________________________________

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
  
__________________________________________________________________________________________________________________________________________________________________________________________

      
### What is target directory in sense of mvn clean package and how it is created?

In Maven, when you run the command `mvn clean package`, Maven executes the `clean` and `package` phases of the build lifecycle. Let's break down what happens and how the `target` directory fits into this process:

1. **Clean Phase:**
   - The `clean` phase is responsible for cleaning up the output of previous builds. It deletes the `target` directory, along with any files generated during previous builds.

2. **Package Phase:**
   - The `package` phase is responsible for packaging the compiled source code (e.g., Java classes) into a distributable format, such as a JAR (Java Archive) file.
   - During the `package` phase, Maven compiles the source code, runs any necessary tests, and creates the artifact specified by the project's packaging type (e.g., JAR, WAR, etc.).
   - The resulting artifact is placed in the `target` directory.

3. **Target Directory:**
   - The `target` directory is a standard directory created by Maven to store all output files generated during the build process. It is located in the root directory of the Maven project.
   - After running `mvn clean package`, you will find the packaged artifact (e.g., JAR file) inside the `target` directory.
   - Additionally, the `target` directory may contain other files and directories generated during the build process, such as compiled classes (`*.class` files), test reports, and other build-related metadata.

4. **Creation of Target Directory:**
   - Maven automatically creates the `target` directory when needed during the build process.
   - During the `clean` phase, Maven deletes the existing `target` directory and its contents.
   - During subsequent phases, such as `compile`, `test`, and `package`, Maven generates output files and stores them in the `target` directory.

In summary, the `target` directory is a standard directory in Maven projects where output files, including packaged artifacts like JAR files, are stored during the build process. It is automatically created and managed by Maven.

### Summary:

- Use `mvn clean package` for local development, quick testing, or creating an artifact without installing it.
- Use `mvn clean install` when you want to build, package, and install the artifact locally for potential use in other projects within your development environment.

**pom.xml is responsible for getting the dependencies runtime and deploying the app. pom.xml is used for java apps only**

__________________________________________________________________________________________________________________________________________________________________________________________


Explaining a CI/CD pipeline for deploying Java code, which is containerized and deployed to an Amazon EKS cluster using Jenkins and ArgoCD, involves walking through the various stages of the pipeline. Below is a step-by-step explanation:

To integrate a Docker image scanner stage into the CI/CD pipeline, we can place it after the Dockerization step and before pushing the Docker image to the registry. This step will ensure that the Docker image is scanned for security vulnerabilities and compliance issues before it is pushed to AWS ECR or any other container registry.

### Step-by-Step CI/CD Pipeline Explanation

1. **Source Code Repository:**
   - The Java source code is stored in a version control system like Git. Developers commit their changes to this repository, which will trigger the CI/CD pipeline.

2. **Jenkins Pipeline Trigger:**
   - The Jenkins pipeline is triggered by events such as commits, pull requests, or manually, depending on the project requirements.

3. **Checkout Stage:**
   - Jenkins checks out the latest Java source code from the version control system to the build server.

4. **Build and Unit Testing:**
   - The Java application is built using Maven.
     ```bash
     mvn clean package
     ```
     - **`clean`:** Deletes the target directory, clearing previous build artifacts.
     - **`package`:** Compiles the code, runs tests, and packages the application into a JAR file, which will be deployed to the EKS cluster.

5. **Static Code Analysis:**
   - Static code analysis is performed using SonarQube.
     ```bash
     mvn sonar:sonar
     ```
   - This step detects bugs, code smells, and security vulnerabilities in the Java code, sending the results to the SonarQube server for detailed inspection.

6. **Dockerization:**
   - Containerize the Java application by building a Docker image. Here’s a sample `Dockerfile`:
     ```Dockerfile
     FROM adoptopenjdk/openjdk11:alpine-jre
     ARG artifact=target/spring-boot-web.jar
     WORKDIR /opt/app
     COPY ${artifact} app.jar
     ENTRYPOINT ["java","-jar","app.jar"]
     ```
   - This Dockerfile sets up the container for the Spring Boot application, using an Alpine-based OpenJDK image.

7. **Docker Image Scanning:**
   - **Docker image scanning** is integrated after Dockerization to check the Docker image for vulnerabilities using a tool like **Trivy** or **Aqua Security**.
     ```bash
     trivy image --exit-code 1 --severity HIGH ${IMAGE_NAME}:${BUILD_NUMBER}
     ```
   - The scanner will analyze the Docker image for security vulnerabilities. If any critical vulnerabilities are found, the pipeline will fail, preventing insecure images from being pushed to the registry.

8. **Push Docker Image to Registry:**
   - If the Docker image passes the scan, it is pushed to a container registry (e.g., AWS ECR) for centralized storage and versioning.

9. **Updating the Manifest Repo:**
   - After pushing the Docker image to ECR, the next step updates the Kubernetes manifest repository. The manifest repo holds Kubernetes configuration files.
     - A script runs to update the image tag in the Kubernetes deployment file:
       ```bash
       sed -i "s/replaceImageTag/${BUILD_NUMBER}/g" java-maven-sonar-argocd-helm-k8s/spring-boot-app-manifests/deployment.yml
       ```
     - This ensures the latest image is deployed to the EKS cluster.

10. **ArgoCD Application Configuration:**
    - Define the ArgoCD application configuration, including the Git repository URL, Kubernetes manifest path, and sync settings. ArgoCD will monitor for changes in this repository.

11. **ArgoCD Deployment:**
    - ArgoCD automatically deploys the updated application to the EKS cluster when it detects changes in the Git repository. This ensures the cluster's state matches the desired state defined in the manifest.

12. **EKS Cluster Integration:**
    - ArgoCD is integrated with the EKS cluster, allowing it to communicate with the Kubernetes API server to deploy the application.

13. **Verification and Validation:**
    - Perform verification and validation steps post-deployment. This includes running integration tests, validating the application’s functionality, and ensuring it behaves as expected in the EKS environment.

14. **Monitoring and Logging:**
    - Integrate monitoring and logging tools to track the performance and behavior of the Java application running in the EKS cluster.

15. **Rollback Mechanism (Optional):**
    - Include a rollback mechanism if issues are detected after deployment. This could involve rolling back to a previous version or triggering a new build to address the issues.

16. **Notifications:**
    - Implement notification mechanisms such as Slack notifications or email alerts to keep the development team informed about pipeline and deployment statuses.

### Conclusion:
- The CI/CD pipeline, enhanced with Jenkins, ArgoCD, and a Docker image scanning stage, ensures a secure, reliable, and repeatable delivery mechanism for the Java application on the EKS cluster. Image scanning improves the security posture by preventing vulnerabilities from reaching production.

This approach ensures that your application is not only functional but also secure and compliant with best practices before being deployed to production.

**********************************************************************************************************************************************************************************************************************

## SonarQube

- SonarQube is one of the security tools used in DevSecOps pipelines
- SonarQube is an open-source platform developed by SonarSource for continuous inspection of code quality.
- It performs automatic reviews of code to detect bugs, vulnerabilities, and code smells in over 25 programming languages, including Python, Java, JavaScript, C#, and many others.
- It basically does two tasks - **Code coverage** and **Code quality check**

**Code Coverage**
- Code coverage is a metric used to measure the proportion of your source code that is executed during automated tests.
- It helps you understand how thoroughly your tests exercise your codebase.
- Typically, code coverage is expressed as a percentage, representing the ratio of lines of code executed by tests to the total lines of code in the project.

**Code Quality Check**
In SonarQube, code quality checks are performed through the analysis of various aspects of your codebase. Here's an overview of the key components of code quality checks in SonarQube:

1. **Static Code Analysis**: SonarQube analyzes your code statically, meaning it doesn't execute the code but rather inspects its structure, syntax, and patterns. It checks for a wide range of issues such as bugs, vulnerabilities, code smells, and security vulnerabilities.

2. **Code Smells**: Code smells refer to patterns in your code that may indicate a problem or a potential area for improvement. Examples include duplicated code, long methods or functions, complex control flow, and so on. SonarQube detects these smells and provides suggestions for refactoring to improve code maintainability and readability.

3. **Bugs**: SonarQube identifies potential bugs in your codebase, such as null pointer dereferences, resource leaks, and other common programming errors. By detecting these issues early, you can prevent them from causing problems in production.

4. **Vulnerabilities**: SonarQube includes security analysis rules that detect common security vulnerabilities in your code, such as SQL injection, cross-site scripting (XSS), and insecure cryptography usage. Addressing these vulnerabilities helps improve the security posture of your application.

5. **Code Duplication**: SonarQube detects duplicated code fragments within your codebase and highlights them, allowing you to consolidate duplicate code and reduce maintenance overhead.

6. **Code Coverage**: While not a direct part of SonarQube's analysis, integrating code coverage reports into SonarQube allows you to track test coverage metrics alongside other code quality metrics. This gives you a holistic view of your codebase's quality and test coverage.

7. **Quality Gates**: SonarQube allows you to define quality gates, which are sets of conditions that your code must meet to be considered acceptable. Quality gates typically include thresholds for metrics such as code coverage, code duplication, and the number of bugs and vulnerabilities. If your code fails to meet these conditions, the build or analysis process can be halted, preventing low-quality code from being deployed.

By integrating SonarQube into your CI/CD pipeline, you can automatically run code quality checks on every code change, ensuring that issues are detected early and providing immediate feedback to developers. This helps maintain a high level of code quality and ensures that your applications are secure, reliable, and maintainable.

**Qulaity Profiles**
In SonarQube, a quality profile is a collection of rules and settings that define the criteria used to assess the quality of your code during static code analysis. Quality profiles are associated with specific languages and are used to enforce coding standards, identify potential issues, and maintain code quality across projects.

 
