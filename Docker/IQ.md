**Interview Questions**

- **What is difference btwn Docker container and Virtual machine?**
  In summary, Docker containers are more lightweight, portable, and efficient for certain types of applications, especially in modern, cloud-native development. Virtual machines, on the other hand, provide stronger isolation and are more suitable for running legacy applications or scenarios where multiple operating systems are needed on the same infrastructure. The choice between containers and VMs depends on the specific requirements of the application and the infrastructure.

- **How to ensure that container starts whenever the docker host is startred?**
  Basically just run the container with the --restart always

- **what is the purpose of Docker-compose?**
  Docker Compose is a tool for defining and running multi-container Docker applications. It allows you to describe your application's services, networks, and volumes in a single file, typically named docker-compose.yml.
  Docker Compose simplifies the process of working with multi-container Docker applications by providing a clear and concise way to define, configure, and manage the various components of an application stack. It is 
  particularly useful for development, testing, and deployment scenarios where multiple containers need to work together as part of a larger application.

- **How docker image is different from docker container?**
  Image is template that is used to create one or more containers, while containers are running instances of the docker image
  container is writable so that you can write the data and you cannot do the same in image.

- **Can we modify the docker image?**
  Docker images are typically designed to be immutable, meaning that once an image is built, its contents do not change. However, you can create a new image based on an existing one, make modifications, and then save it 
  as a new image.

- **What are networking modes in docker?**
  Refer to networking notes.md
  overlay network - an overlay network is a type of network that facilitates communication between containers running on different Docker hosts in a docker swarm cluster.

- **What are docker volumes and why they are important in data persistance?**

- **when you start a docker container and it doesnt start properly.. how do you trouble shoot?**
    check the docker logs, inspect the container and monitor the docker events.

- **how do you secure docker containers?**
   - use official images
   - implement least privilage
   - use non-root users
   - use distroless images
 
- **Explain distroless images**
  A Distroless image in Docker is a minimalistic Docker image that contains only the application and its runtime dependencies, without including any additional operating system packages or tools. These images are designed to be lightweight, secure, and efficient, making them ideal for running containerized applications in production environments.

- **How would you troubleshoot docker deamon? Suppose a pod is not coming up on any node, how will you troubleshoot?**
    Troubleshooting a Docker daemon when a container is not coming up on any node involves several steps to identify and address potential issues. Here's a structured approach to troubleshoot:

1. **Check Docker Daemon Status:**
   - Ensure that the Docker daemon is running on the affected node(s). You can check the status of the Docker daemon using the following command:
     ```
     systemctl status docker
     ```
   - If the Docker daemon is not running, try restarting it:
     ```
     systemctl restart docker
     ```

2. **Inspect Container Logs:**
   - Check the logs of the container that failed to start. Use the `docker logs` command to inspect the logs of the container:
     ```
     docker logs <container-id or container-name>
     ```
   - Look for any error messages or warnings that might indicate why the container failed to start.

3. **Check Docker Events:**
   - Use the `docker events` command to monitor Docker events in real-time. This can help identify any events related to the container or Docker daemon:
     ```
     docker events
     ```
   - Look for events such as container start failures, image pull errors, or resource constraints.

4. **Verify Resource Availability:**
   - Ensure that there are sufficient resources (CPU, memory, disk) available on the node(s) to run the container. Use tools like `top`, `htop`, or `docker stats` to monitor resource utilization:
     ```
     docker stats <container-id or container-name>
     ```

5. **Check Docker Networking:**
   - Verify that the container's networking configuration is correct and that there are no conflicts with ports or network interfaces. Use the `docker inspect` command to inspect the container's network settings:
     ```
     docker inspect <container-id or container-name> | grep -i network
     ```

6. **Check Image Availability:**
   - Ensure that the Docker image required by the container is available locally or can be pulled from the configured Docker registry. Use the `docker images` command to list available images:
     ```
     docker images
     ```
   - If the image is not available locally, try pulling it from the registry:
     ```
     docker pull <image-name>
     ```

7. **Review Docker Configuration:**
   - Review the Docker daemon configuration (`/etc/docker/daemon.json`) for any misconfigurations or settings that might affect container startup.
   - Check for any customizations or restrictions that could prevent containers from starting.

8. **Check Node Health:**
   - Ensure that the node(s) where the container is supposed to run are healthy and reachable. Check for any hardware or network issues that might affect node availability.

By following these steps and systematically investigating potential issues, you can diagnose and troubleshoot why a container is not coming up on any node in a Docker environment.
