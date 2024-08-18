#### How would you generate SSL keys, deploy Ingress controllers, and manage private Docker images in Kubernetes, ensuring everything is set up securely and functions correctly?
- To generate SSL keys, I'd use OpenSSL to create the private key and Certificate signing request(CSR) file and send CSR to Certificate authority for the SSL certificate
- create a Kubernetes secret for SSL certicates that store private key and SSL cert.
- Deploying the Ingress controller can be done via Helm, manifests etc and then configure ingress resource that uses the above SSL cerificate
- for managing private Docker images, I'd set up a private container registry, create a kubernetes secret that icludes authentication details and include an imagePullSecrets section to pull the images from private repo.

#### what is External name type of service in kubernetes?
- The ExternalName service type in Kubernetes provides a way to map a Kubernetes application to an external DNS name, enabling easy access to external resources from within a Kubernetes cluster. This is useful for integrating with external databases, APIs, and legacy systems.
- Example Use Case:
Suppose you have an external database service with the DNS name db.external-company.com and you want your Kubernetes application to connect to it without hardcoding the external DNS name. You can create an ExternalName service in Kubernetes:
```
apiVersion: v1
kind: Service
metadata:
  name: external-database
spec:
  type: ExternalName
  externalName: db.external-company.com
```
- After applying this configuration, your application can connect to external-database as if it were a native Kubernetes service, and Kubernetes will resolve it to db.external-company.com

#### How can you roll back to a previous version of your application in Kubernetes if something goes wrong after an update?
- Rolling back to a previous or specific  version of your application in Kubernetes is straightforward with the kubectl rollout undo command. By leveraging Kubernetes' deployment history and rollback features, you can quickly revert to a stable version of your application in case of issues with a new deployment.

#### Can you connect to your application locally without using a service, and explain how you would accomplish this?
- Yes, you can connect to your application running in a Kubernetes cluster locally without using a Kubernetes Service by using port forwarding. Port forwarding allows you to forward a port on your local machine to a port on a pod in the Kubernetes cluster. This is useful for debugging or testing your application locally without exposing it through a Kubernetes Service.
- ```kubectl port-forward <pod-name> <local-port>:<pod-port>```
- This is particularly useful for debugging, development, and testing. By forwarding a port from your local machine to a port on a pod, you can interact with your application as if it were running locally.

#### You have mentioned that you are Intermediate in Kubernetes, May I know what are the different ways to deploy your deployment?
- Deploying a Deployment can be done in two ways: one is Imperative and the other is Declarative. Imperative can be run directly with a command via CLI:
kubectl run app1 --image nginx:latest --dry-run -o yaml
- Declarative is commonly used with YAML or JSON, you write a manifest file and apply it:
kubectl apply -f testpod.yml
- There are other different ways as well like HELM and GITOPS way.

#### So my client requires all their websites should use SSL termination. Currently, the websites run on port 80, but they need to be automatically redirected to port 443 for secure connections. How would you achieve this?

#### Imagine you're building a Docker image for a Node.js application. What steps would you take to minimize the image size while ensuring all dependencies are included?

#### Imagine you are working on a Dockerfile for a web application. You need to ensure that your container does not run processes as the root user for security reasons, What steps you follow ?
- To ensure a container doesn't run processes as the root user, I will create a non-root user within the Dockerfile and switch to that user before running the application. This can be done by adding a `useradd` command to create a new user and the `USER` directive to switch to that user. Additionally, i will make sure i will set a working directory with `WORKDIR` to organize the file structure. This enhances security by preventing processes from having unnecessary root privileges.
```
  # Use an official base image
FROM node:14

# Create a non-root user and group
RUN groupadd -r appgroup && useradd -r -g appgroup -d /home/appuser -s /sbin/nologin -c "Docker image user" appuser

# Create a directory for the application and set permissions
RUN mkdir -p /app && chown -R appuser:appgroup /app

# Set the working directory
WORKDIR /app

# Copy the application code
COPY . /app

# Install application dependencies
RUN npm install

# Change ownership of the application files
RUN chown -R appuser:appgroup /app

# Switch to the non-root user
USER appuser

# Expose the application port
EXPOSE 3000

# Start the application
CMD ["node", "server.js"]
```

#### How can you prevent your Docker build from using the previous cache when you run the build?
- To prevent your Docker build from using the previous cache, you can use the --no-cache option with the docker build command. This ensures that Docker does not use any cached layers and builds the image from scratch
- If you want to clear all the build cache before building the image, you can use docker builder prune: and then build the image from scratch

#### can I overwrite the build ARG when running container , if not, what flag you pass to overwrite ?
- No, you cannot directly overwrite a build-time argument (`ARG`) when running a container. Build arguments (`ARG`) are used only during the build process and are not available at runtime. To pass configuration values to a running container, you should use environment variables (`ENV`).

##### Setting Environment Variables in Docker

1. **During Build**: You can set default environment variables using the `ENV` instruction in the Dockerfile.
2. **During Run**: You can override these environment variables when running the container using the `-e` flag.

##### Example Dockerfile with `ARG` and `ENV`

Here's an example Dockerfile that uses both `ARG` and `ENV`:

```Dockerfile
# Use a base image
FROM node:14

# Set a build-time argument
ARG APP_VERSION=1.0

# Set environment variables
ENV APP_VERSION=${APP_VERSION}
ENV APP_ENV=production

# Create app directory
RUN mkdir -p /app
WORKDIR /app

# Copy application files
COPY . /app

# Install dependencies
RUN npm install

# Expose the app port
EXPOSE 3000

# Start the app
CMD ["node", "server.js"]
```

##### Building the Docker Image with `ARG`

You can pass a build argument using the `--build-arg` flag when building the Docker image:

```sh
docker build --build-arg APP_VERSION=2.0 -t my-app .
```

##### Running the Docker Container with `ENV`

You can override the environment variables using the `-e` flag when running the container:

```sh
docker run -e APP_ENV=development -e APP_VERSION=2.0 -p 3000:3000 my-app
```

##### Summary

While you cannot overwrite a build argument (`ARG`) at runtime, you can achieve similar functionality by setting environment variables (`ENV`) and overriding them when running the container. Use `-e` flag with `docker run` to pass and override environment variables. This method provides flexibility to configure your application at runtime without needing to rebuild the image.

####  if I wanted to deleted all stopped containers, all network which were not used by any containers and all dangling images . What is that one command, I can run?
- You can clean up your Docker environment by removing all stopped containers, unused networks, and dangling images with a single command using docker system prune. This command will remove all unused data in your Docker environment.
- ```docker system prune -a -f```

#### Imagine you are managing Docker images on your system. How would you list all the dangling images, and then how would you delete ?
- docker images --filter=dangling=true This command shows the unwanted none files
- docker image prune -f = this command deletes the dangling images.

#### During development or testing phases, if you want to ensure that Docker automatically removes a container once you stop it, how would you achieve this?
- To ensure that Docker automatically removes a container once it stops, you can use the --rm flag when running the container. This flag is used to automatically clean up the container and remove it when it exits. This is particularly useful during development or testing phases when you want to avoid accumulating stopped containers.
- ``` docker run --rm -d --name frontend -p 8001:80 containername ```

#### Scenario based questions
1. Scenario: Your team’s build time has increased significantly over the past few sprints. How would you address this issue? ✨
 Answer:
 - Analyze Build Pipeline: Review each step in the build pipeline to identify bottlenecks. Look at logs, monitor system performance, and review code changes.
 - Parallel Builds: Implement parallel execution for independent tasks.
 - Caching: Use caching mechanisms for dependencies, containers, or artifacts to avoid redundant work.
 - Optimize Test Suite: Optimize the test suite by identifying and running only the necessary tests, possibly using a test impact analysis tool.
 - Incremental Builds: Implement incremental builds that only compile changed code rather than the entire codebase.

2. Scenario: A deployment failed in production, causing a critical outage. How do you handle the situation and ensure it doesn’t happen again? ✨
 Answer:
 - Immediate Rollback: Trigger an immediate rollback to the last known stable version to restore service.
 - Root Cause Analysis: Perform a root cause analysis to determine why the deployment failed. Check logs, code changes, and configuration files.
 - Implement CI/CD Guardrails: Implement safety checks, such as automated smoke tests, canary releases, and blue-green deployments.
 - Monitoring & Alerts: Ensure that robust monitoring and alerting systems are in place to catch potential issues early.
 - Documentation: Document the incident and update the deployment process to prevent recurrence.

3. Scenario: You need to integrate a new tool into the existing CI/CD pipeline, but it’s not directly supported by your current setup. What’s your approach? ✨
 Answer:
 - Evaluate Compatibility: Assess whether the new tool has plugins or APIs that can integrate with the existing CI/CD tools.
 - Custom Scripting: Write custom scripts to integrate the tool using available APIs or CLI options.
 - Dockerization: Containerize the tool and use it as part of the pipeline to ensure compatibility and reproducibility.
 - Community Support: Check if the tool has community plugins or integrations that could be used or modified.
 - Testing: Thoroughly test the integration in a staging environment before rolling it out to production.


4. Scenario: Your team is moving from a monolithic architecture to microservices. How would you adjust your CI/CD pipeline to accommodate this change? ✨ 
 Answer:
 - Automated Testing: Implement contract testing between services and ensure end-to-end integration tests.
 - Containerization: Containerize each microservice for consistent deployment across environments.
 - Service Discovery: Ensure that your deployment includes service discovery mechanisms to manage service interactions.
 - Monitoring & Logging: Enhance monitoring and logging to capture service-specific metrics and logs, and aggregate them for centralized monitoring.


#### how to achieve canary without using service-mesh?

To achieve canary deployments with weighted traffic distribution using Kubernetes Ingress, you can utilize features from an Ingress controller that supports traffic splitting, such as Istio, NGINX, or Traefik.

Here's how you can achieve this:

##### 1. **Set Up Your Deployments:**
   - **Stable Deployment**: This is the existing version of your application.
   - **Canary Deployment**: This is the new version of your application that you want to test.

##### 2. **Create Services for Each Deployment:**
   - **Stable Service**: Points to the stable deployment.
   - **Canary Service**: Points to the canary deployment.

##### 3. **Configure Ingress for Weighted Traffic Splitting:**

###### **Using NGINX Ingress Controller:**

You can use the `nginx.ingress.kubernetes.io/canary` annotations for this purpose.

Here's an example Ingress configuration:

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: my-app-ingress
  namespace: default
  annotations:
    nginx.ingress.kubernetes.io/canary: "true"
    nginx.ingress.kubernetes.io/canary-weight: "20"  # 20% traffic to Canary
spec:
  rules:
  - host: my-app.example.com
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: my-app-stable
            port:
              number: 80
```

And for the canary deployment:

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: my-app-canary-ingress
  namespace: default
  annotations:
    nginx.ingress.kubernetes.io/canary: "true"
    nginx.ingress.kubernetes.io/canary-weight: "20"
spec:
  rules:
  - host: my-app.example.com
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: my-app-canary
            port:
              number: 80
```

##### 4. **Gradually Increase Canary Traffic:**
   - Initially, you might want to start with a low weight (e.g., 5-10%).
   - Monitor the canary deployment’s performance.
   - Gradually increase the weight if the canary version is stable.
   - If issues arise, you can revert the canary traffic weight to 0%.

##### 5. **Automate Traffic Shifting (Optional):**
   - Use tools like Flagger or Argo Rollouts to automate and manage the canary release process.
   - These tools can automatically shift traffic based on metrics (like response time, error rate) and handle rollbacks if the canary fails.

##### 6. **Monitor the Deployment:**
   - Use monitoring tools to track the performance and stability of the canary deployment.
   - Ensure you have metrics and logs to observe how the canary version is performing.

This approach allows you to safely test new versions of your application in production with a controlled amount of traffic before a full rollout.


#### how will you achieve blue green deployment?

Blue-green deployment is a release management strategy that minimizes downtime and reduces risk by running two production environments, Blue and Green, where only one (usually Blue) serves live production traffic at any time. The idea is to deploy the new version of your application (Green) in parallel with the old version (Blue), and once the new version is tested and verified, traffic is switched from Blue to Green. If something goes wrong, you can quickly revert traffic back to Blue.

Here’s how you can achieve Blue-Green Deployment in a Kubernetes environment:

##### Steps to Achieve Blue-Green Deployment

##### 1. **Prepare Two Separate Deployments**
   - Create two deployments: one for the current (Blue) version and another for the new (Green) version.
   - These deployments should have distinct labels or selectors to differentiate them.

   **Example of Blue Deployment:**
   ```yaml
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     name: my-app-blue
   spec:
     replicas: 3
     selector:
       matchLabels:
         app: my-app
         version: blue
     template:
       metadata:
         labels:
           app: my-app
           version: blue
       spec:
         containers:
         - name: my-app
           image: my-app:1.0.0
           ports:
           - containerPort: 8080
   ```

   **Example of Green Deployment:**
   ```yaml
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     name: my-app-green
   spec:
     replicas: 3
     selector:
       matchLabels:
         app: my-app
         version: green
     template:
       metadata:
         labels:
           app: my-app
           version: green
       spec:
         containers:
         - name: my-app
           image: my-app:2.0.0
           ports:
           - containerPort: 8080
   ```

##### 2. **Create a Single Service**
   - Create a single Kubernetes Service that routes traffic to the active deployment.
   - Initially, the service should point to the Blue deployment.

   **Example Service:**
   ```yaml
   apiVersion: v1
   kind: Service
   metadata:
     name: my-app
   spec:
     selector:
       app: my-app
       version: blue
     ports:
     - port: 80
       targetPort: 8080
   ```

##### 3. **Deploy the Green Version**
   - Deploy the Green version of the application alongside the Blue version.
   - Both deployments will be running, but only the Blue deployment will receive traffic initially.

##### 4. **Test the Green Version**
   - Before switching traffic, test the Green deployment. You can expose it temporarily via a separate Service or use port-forwarding for internal testing.
   - Ensure that the Green deployment is functioning correctly.

##### 5. **Switch Traffic to the Green Deployment**
   - Update the Kubernetes Service selector to point to the Green deployment.

   **Update Service to Point to Green Deployment:**
   ```yaml
   apiVersion: v1
   kind: Service
   metadata:
     name: my-app
   spec:
     selector:
       app: my-app
       version: green
     ports:
     - port: 80
       targetPort: 8080
   ```

   - After updating, the service will start routing traffic to the Green deployment.

##### 6. **Monitor the Green Deployment**
   - Monitor the performance of the Green deployment closely to ensure it is working as expected.
   - If any issues arise, you can revert traffic to the Blue deployment by simply updating the Service selector back to the Blue version.

##### 7. **Clean Up the Old Deployment (Optional)**
   - Once the Green deployment is stable and you are confident that it works, you can scale down or delete the Blue deployment.

   ```yaml
   kubectl delete deployment my-app-blue
   ```

##### 8. **Rollback Plan**
   - In case of issues with the Green deployment, you can quickly revert to the Blue deployment by updating the Service selector back to Blue.

   **Revert to Blue Deployment:**
   ```

```yaml
   apiVersion: v1
   kind: Service
   metadata:
     name: my-app
   spec:
     selector:
       app: my-app
       version: blue
     ports:
     - port: 80
       targetPort: 8080
   ```

##### Example Workflow

1. **Blue Deployment:** Initially, your service is routing traffic to the Blue deployment.
2. **Green Deployment:** Deploy the Green version alongside Blue without impacting the live traffic.
3. **Testing:** Thoroughly test the Green version while it runs in parallel.
4. **Switch Traffic:** Update the service to point to the Green deployment.
5. **Monitor:** Keep an eye on the Green deployment's performance and user feedback.
6. **Rollback:** If needed, quickly revert the service back to Blue by changing the service selector.

##### Tools to Facilitate Blue-Green Deployment

- **Helm:** Helm charts can be used to automate the process of deploying Blue and Green environments.
- **ArgoCD:** If you’re using GitOps, ArgoCD can manage the Blue-Green deployment strategy.
- **Ingress Controllers:** Use Ingress to route traffic based on headers or paths for more complex routing needs.

##### Summary

Blue-Green deployment in Kubernetes allows you to deploy new versions of your application with minimal risk and downtime. By running two separate environments and controlling traffic using a single service, you can safely switch between versions and roll back if necessary. This strategy provides a robust method for handling production releases, especially in environments that demand high availability and minimal disruption.
