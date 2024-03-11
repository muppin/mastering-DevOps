**Dockerfile**

FROM: will specify the base image
LABEL: setting the author of the image
COPY/ ADD : adding files or directories into the image
RUN: Run the commands
EXPOSE: to expose the ports
CMD/ENTRYPOINT: choosing what command to run when the container is launched from the image


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
- *Bridge (Default network)* - when the conatiner runs in this network, it can access the external world. It allows to access the containers that are created within this network with the container IP alone and not with the name.
- *Custom Bridge* - to access the containers with the help of their name, we have to deploy them inside custom bridge network.
- *Host Network* -  when any container is deployed inside host network, it can access anything in the external world.

**Docker Volumes**
To persist the data stored in a container we use docker volumes.
we can persist data using two methods
- Volumes - here the directory is created inside the docker host vm to persist the data from the container.
- Bind Mounts - here we mention our local directory, so that the data is persisted in our local system.


