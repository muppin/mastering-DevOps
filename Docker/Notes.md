**Dockerfile**

- FROM: will specify the base image
- LABEL: setting the author of the image
- WORKDIR : Set the working directory in the image
- COPY/ ADD : adding files or directories into the image
- RUN: Run the commands
- EXPOSE: to expose the ports
- CMD/ENTRYPOINT: choosing what command to run when the container is launched from the image

https://github.com/iam-veeramalla/Docker-Zero-to-Hero?tab=readme-ov-file
________________________________________________________________________________________________________________________________________________________________________________

**Difference between ADD and COPY

In a Dockerfile, both the `ADD` and `COPY` instructions are used to copy files and directories from the local filesystem into the Docker image being built. However, there are differences between the two:

1. **`COPY` Instruction**:
   - The `COPY` instruction is the simpler and more commonly used of the two.
   - Syntax: `COPY <src> <dest>`
   - It copies files or directories from the local filesystem into the Docker image.
   - It preserves the ownership and permissions of the files being copied.
   - It does not support automatic unpacking of compressed files or URLs.

2. **`ADD` Instruction**:
   - The `ADD` instruction is more powerful and flexible than `COPY`.
   - Syntax: `ADD <src> <dest>`
   - It copies files or directories from the local filesystem into the Docker image, similar to `COPY`.
   - Additionally, it supports automatic unpacking of compressed files (e.g., tarballs) and URLs.
   - It can also be used to fetch remote files or extract tar archives directly into the destination directory.
   - Due to its additional functionality, `ADD` is slightly more complex and may lead to unexpected behavior if not used carefully.

In summary, while both `COPY` and `ADD` are used to copy files into Docker images, `COPY` is preferred for simple file copying operations, while `ADD` provides additional features such as automatic unpacking and fetching of remote files, which may be useful in certain scenarios. However, it's generally recommended to use `COPY` unless you specifically require the extra functionality provided by `ADD`, to keep the Dockerfile simpler and easier to understand.

_________________________________________________________________________________________________________________________________________________________________________________________

### CMD Vs. ENTRYPOINT

Example with CMD:

Dockerfile
Copy code
FROM alpine:latest

#### Set default command to execute when container starts - can be overriden
CMD ["echo", "Hello, World!"]
In this example, the default command echo "Hello, World!" will be executed when the container starts. If no command is specified when running the container, this default command will be executed. However, if a command is specified when running the container (e.g., docker run <image> <command>), it will override the default command specified in the CMD instruction.

Example with ENTRYPOINT:

Dockerfile
Copy code
FROM alpine:latest

#### Set entry point for the container -will append 
ENTRYPOINT ["echo", "Hello,"]

#### Set default arguments to be passed to the entry point
CMD ["World!"]
In this example, the main command echo "Hello," is specified using the ENTRYPOINT instruction. The CMD instruction provides default arguments "World!" to be passed to the entry point. When the container starts, the main command (ENTRYPOINT) will always be executed, with the default arguments (CMD) appended to it. If a command is specified when running the container, it will be passed as arguments to the ENTRYPOINT command.

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/a11ed957-4bfe-4f16-bae6-449c3e077642)


__________________________________________________________________________________________________________________________________________________________________________________________

**Docker networking**
- *None Network* - when the container runs in none network, it is just restricted to the container alone and cannot access anything outside of it.
- *Bridge (Default network)* - whenever we deploy any containers, it sits under this network and docker creates a virtual network called veth0/docker0 so that the containers can communicate each with each other and also communicate with host.
- *Custom Bridge* - whenever we want to isolate the containers from the deafult bridge, we have to create custom bridge network and deploy containers in it to secure.
- *Host Network* -  if we deploy containers in the Host network, the container directly gets bound to the eth0 of host, so anyone having access to host can access the container. which is not secure.
- *overlay network* - An overlay network in Docker is a network driver that enables communication between Docker containers running on different Docker hosts. This is especially useful in a swarm mode (Docker's built-in orchestration feature) where containers can be distributed across multiple nodes. Overlay networks allow containers on different hosts to communicate seamlessly as if they were on the same network.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

**Docker Volumes**
- To persist the data stored in a container we use docker volumes.
Docker volumes and bind mounts are two ways to persist data in Docker containers. They enable data to persist beyond the life of a container and facilitate sharing data between containers and the host system. Here’s an overview of each:

### Docker Volumes

**Docker volumes** are managed by Docker and stored in a part of the host filesystem which is managed by Docker (`/var/lib/docker/volumes/` on Linux). They provide several advantages:

- **Isolation from Host Filesystem**: Volumes are not dependent on the filesystem structure of the host machine, which makes them portable across different hosts.
- **Docker Management**: Volumes are managed by Docker, so Docker commands can be used to create, mount, and inspect volumes.
- **Better Performance**: In some scenarios, volumes can provide better performance, especially on Windows and macOS where the file system performance with bind mounts can be slower.
- **Backup and Restore**: Volumes can be easily backed up and restored using Docker commands.

**Creating and using volumes**:

1. **Create a volume**:
   ```sh
   docker volume create my_volume
   ```

2. **Run a container with a volume**:
   ```sh
   docker run -d -v my_volume:/app/data my_image
   ```

### Bind Mounts

**Bind mounts** bind a directory or file from the host machine into a container. The data in the bind mount is not managed by Docker but by the host's filesystem. Bind mounts are useful in development environments but come with a few caveats:

- **Direct Host Access**: Bind mounts provide direct access to the host filesystem, which can be useful for development (e.g., accessing source code) but can also be a security risk.
- **Path Dependency**: Since bind mounts rely on host paths, they can be less portable between different hosts.
- **Flexibility**: Bind mounts can be used to mount files or directories from anywhere on the host system, which can be convenient.

**Creating and using bind mounts**:

1. **Run a container with a bind mount**:
   ```sh
   docker run -d -v /host/path:/container/path my_image
   ```

### Comparison

| Feature             | Docker Volumes                            | Bind Mounts                               |
|---------------------|-------------------------------------------|-------------------------------------------|
| **Location**        | Managed by Docker (`/var/lib/docker/`)    | Any location on the host filesystem       |
| **Isolation**       | Isolated from the host filesystem         | Directly accessible by the host           |
| **Performance**     | Generally better performance              | May have performance overhead on some OS  |
| **Management**      | Managed with Docker CLI                   | Managed by the host filesystem            |
| **Backup/Restore**  | Easily backed up and restored with Docker | Requires manual backup and restore        |
| **Portability**     | Portable across different hosts           | Dependent on host filesystem structure    |
| **Security**        | Provides better isolation                 | Less secure due to direct host access     |

### Example Use Cases

- **Docker Volumes**: Ideal for production databases, application data, and any scenario where data persistence and portability are critical.
- **Bind Mounts**: Suitable for development scenarios where you need to frequently change source code, configuration files, or data files and want to reflect these changes instantly inside the container.

Understanding the differences between Docker volumes and bind mounts helps in choosing the right storage strategy for your Dockerized applications.

____________________________________________________________________________________________________________________________________________________________________________________________

**Access the Volume on the Host:**

Once the container is running, you can access the volume on the host system by navigating to the directory where Docker volumes are stored. By default, Docker volumes are stored in /var/lib/docker/volumes.

bash
Copy code
cd /var/lib/docker/volumes/my_volume/_data

______________________________________________________________________________________________________________________________________________________________________________________

**Docker Compose**

Docker Compose is a tool for defining and running multi-container Docker applications. With Compose, you use a YAML file to configure your application's services. Then, with a single command, you can create and start all the services from your configuration.

simple example of a Docker Compose configuration file (`docker-compose.yml`) that defines a web application composed of two services: a web server (running nginx) and a database server (running PostgreSQL):

```yaml
version: '3.8'

services:
  web:
    image: nginx:latest
    ports:
      - "8080:80"
    volumes:
      - ./app:/usr/share/nginx/html
    networks:
      - my_network

  db:
    image: postgres:latest
    environment:
      POSTGRES_USER: myuser
      POSTGRES_PASSWORD: mypassword
      POSTGRES_DB: mydatabase
    volumes:
      - pgdata:/var/lib/postgresql/data
    networks:
      - my_network

networks:
  my_network:

volumes:
  pgdata:
```

In this example:

- The `version` key specifies the version of the Docker Compose file format being used (in this case, version 3.8).
- Under the `services` key, two services are defined: `web` and `db`.
- The `web` service uses the `nginx:latest` image, exposes port 8080 on the host and mounts the `./app` directory on the host to `/usr/share/nginx/html` in the container.
- The `db` service uses the `postgres:latest` image, sets environment variables for the PostgreSQL database (`POSTGRES_USER`, `POSTGRES_PASSWORD`, `POSTGRES_DB`), and mounts a named volume (`pgdata`) to persist the database data.
- Both services are connected to a custom network named `my_network`.
- The `networks` and `volumes` sections at the bottom define a custom network and a named volume.

With this Docker Compose file, you can use the `docker-compose up` command to start both services defined in the file. Docker Compose will automatically create the necessary network and volume if they do not already exist.

This example demonstrates how Docker Compose simplifies the process of defining and managing multi-container applications, allowing you to specify the configuration of each service and their relationships in a single YAML file.

___________________________________________________________________________________________________________________________

**Docker build cache**

Dockerfile should be efficient enough, it should be written such that the top stages are kept constant and not made any changes frequently so that build time is very less on the later builds.

For more info: https://www.baeldung.com/ops/docker-build-cache

___________________________________________________________________________________________________________________________

**How to ensure docker container stays up and running**

To ensure that Docker containers stay up and running, even if the system or Docker service restarts, you can use a combination of Docker restart policies and possibly a process manager or orchestration tool. Here's a general guide:

### 1. **Restart Policies:**

Docker provides restart policies that define what should happen when a container exits (either successfully or due to an error). You can use the `--restart` option with the `docker run` command to set the restart policy.

- **Always Restart:**
  ```bash
  docker run --restart always -d your_image
  ```

  In Docker, the always restart policy ensures that a container restarts automatically whenever it stops. Whether it’s manually stopped or exits due to an error, Docker will promptly restart it.

- **Unless Stopped:**
  ```bash
  docker run --restart unless-stopped -d your_image
  ```

  This restart policy is similar to "always," but it won't restart containers that were manually stopped.

- **No Restart (Default):**
  ```bash
  docker run --restart no -d your_image
  ```

  This restart policy means that the container will not automatically restart.

### 2. **Use Docker Compose:**

If you are managing multiple containers as part of an application, consider using Docker Compose. Compose allows you to define multi-container applications in a single file and provides additional features, including restart policies.

Example `docker-compose.yml`:

```yaml
version: '3'
services:
  your_service:
    image: your_image
    restart: always
    # Add other service configurations as needed
```

Then, run your services using:

```bash
docker-compose up -d
```

### 3. **Process Managers or Orchestration Tools:**

For more advanced scenarios, especially if you have a larger set of containers or are working in a clustered environment, you might want to consider using orchestration tools like Docker Swarm or Kubernetes. These tools provide more advanced management features and can help ensure high availability.

### 4. **Monitoring and Health Checks:**

Implement health checks within your containers to ensure that the application inside the container is healthy. Docker provides health check options that you can include in your Dockerfile.

Example in Dockerfile:

```Dockerfile
HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost/ || exit 1
```

### 5. **Logging and Monitoring:**

Set up logging and monitoring for your containers to detect issues early and take appropriate actions.

Remember to adapt these suggestions based on your specific use case, system architecture, and infrastructure. Always test your setup thoroughly to ensure that it meets your requirements.

________________________________________________________________________________________________________________________

**How to remove Dangling images**

Dangling images are those that have no associated containers and are not tagged. To remove dangling images in Docker, you can use the `docker image prune` command. Here's how you can do it:

```bash
docker image prune
```

This command will remove all dangling images. Docker will prompt you for confirmation before proceeding, and you can type `y` to confirm or `n` to cancel.

If you want to bypass the confirmation prompt, you can use the `-f` or `--force` option:

```bash
docker image prune -f
```

This command will forcefully remove all dangling images without asking for confirmation.

Keep in mind that this operation is irreversible, and it permanently deletes the dangling images. Make sure you don't need any of these images before running the prune command. If you want to see a list of images that would be deleted without actually removing them, you can use the `docker image ls -q -f dangling=true` command:

```bash
docker image ls -q -f dangling=true
```

This command lists the IDs of the dangling images. If the list looks safe to remove, you can then run the `docker image prune` command to clean them up.

Remember that the commands provided here might need administrative privileges, so you might need to use `sudo` or run the commands in a privileged shell depending on your system configuration.

__________________________________________________________________________________________________________________________

**how to create an image from running app**

To create a Docker image from a running container, you can use the `docker commit` command. This command takes a snapshot of the file system and configuration of a running container and creates a new image from it.

Here's a step-by-step guide:

1. **Run Your Application in a Container:**
   
   Make sure your application is running in a Docker container. If it's not already running, start your application using the appropriate Docker run command.

   ```bash
   docker run -d --name my_running_app my_image
   ```

   Replace "my_running_app" with the desired name for your running container and "my_image" with the image name or ID.

2. **Get the Container ID:**

   To use the `docker commit` command, you need the Container ID of the running container.

   ```bash
   docker ps
   ```

   Find the Container ID of your running application container.

3. **Create a Docker Image from the Running Container:**

   Use the `docker commit` command to create a new image from the running container.

   ```bash
   docker commit <container_id> my_new_image
   ```

   Replace `<container_id>` with the actual Container ID of your running container, and "my_new_image" with the desired name for your new Docker image.

4. **Check the Newly Created Image:**

   After running the `docker commit` command, you can check if the new image was created successfully.

   ```bash
   docker images
   ```

   You should see the newly created image in the list.

Now, you have a Docker image created from your running application container. Keep in mind that this approach captures the current state of the container, including the file system and configuration. However, it doesn't capture the container's history or metadata.

Note: While `docker commit` can be useful in certain situations, it's generally recommended to use Dockerfiles and version-controlled build processes for creating reproducible and maintainable images.

