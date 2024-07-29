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
- kubectl port-forward <pod-name> <local-port>:<pod-port>
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

