**Dockerfile**

- FROM: will specify the base image
- LABEL: setting the author of the image
- WORKDIR : Set the working directory in the image
- COPY/ ADD : adding files or directories into the image
- RUN: Run the commands
- EXPOSE: to expose the ports
- CMD/ENTRYPOINT: choosing what command to run when the container is launched from the image


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

#### Set default command to execute when container starts
CMD ["echo", "Hello, World!"]
In this example, the default command echo "Hello, World!" will be executed when the container starts. If no command is specified when running the container, this default command will be executed. However, if a command is specified when running the container (e.g., docker run <image> <command>), it will override the default command specified in the CMD instruction.

Example with ENTRYPOINT:

Dockerfile
Copy code
FROM alpine:latest

#### Set entry point for the container
ENTRYPOINT ["echo", "Hello,"]

#### Set default arguments to be passed to the entry point
CMD ["World!"]
In this example, the main command echo "Hello," is specified using the ENTRYPOINT instruction. The CMD instruction provides default arguments "World!" to be passed to the entry point. When the container starts, the main command (ENTRYPOINT) will always be executed, with the default arguments (CMD) appended to it. If a command is specified when running the container, it will be passed as arguments to the ENTRYPOINT command.

__________________________________________________________________________________________________________________________________________________________________________________________

**Docker networking**
- *None Network* - when the container runs in none network, it is just restricted to the container alone and cannot access anything outside of it.
- *Bridge (Default network)* - whenever we deploy any containers, it sits under this network and docker creates a virtual network called veth0/docker0 so that the containers can communicate each with each other and also communicate with host.
- *Custom Bridge* - whenever we want to isolate the containers from the deafult bridge, we have to create custom bridge network and deploy containers in it to secure.
- *Host Network* -  if we deploy containers in the Host network, the container directly gets bound to the eth0 of host, so anyone having access to host can access the container. which is not secure.
- *overlay network* - An overlay network in Docker is a network driver that enables communication between Docker containers running on different Docker hosts. This is especially useful in a swarm mode (Docker's built-in orchestration feature) where containers can be distributed across multiple nodes. Overlay networks allow containers on different hosts to communicate seamlessly as if they were on the same network.

**Docker Volumes**
To persist the data stored in a container we use docker volumes.
we can persist data using two methods
- Volumes - here the directory is created inside the docker host vm to persist the data from the container.
- Bind Mounts - here we mention our local directory, so that the data is persisted in our local system.

____________________________________________________________________________________________________________________________________________________________________________________________

**Access the Volume on the Host:**

Once the container is running, you can access the volume on the host system by navigating to the directory where Docker volumes are stored. By default, Docker volumes are stored in /var/lib/docker/volumes.

bash
Copy code
cd /var/lib/docker/volumes/my_volume/_data

______________________________________________________________________________________________________________________________________________________________________________________

**Docker Compose**

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

  This restart policy ensures that the container restarts automatically unless explicitly stopped.

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

