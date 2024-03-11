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

# Set default command to execute when container starts
CMD ["echo", "Hello, World!"]
In this example, the default command echo "Hello, World!" will be executed when the container starts. If no command is specified when running the container, this default command will be executed. However, if a command is specified when running the container (e.g., docker run <image> <command>), it will override the default command specified in the CMD instruction.

Example with ENTRYPOINT:

Dockerfile
Copy code
FROM alpine:latest

# Set entry point for the container
ENTRYPOINT ["echo", "Hello,"]

# Set default arguments to be passed to the entry point
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

