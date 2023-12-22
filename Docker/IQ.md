**Interview Questions**

- What is difference btwn Docker container and Virtual machine?
  In summary, Docker containers are more lightweight, portable, and efficient for certain types of applications, especially in modern, cloud-native development. Virtual machines, on the other hand, provide stronger isolation and are more suitable for running legacy applications or scenarios where multiple operating systems are needed on the same infrastructure. The choice between containers and VMs depends on the specific requirements of the application and the infrastructure.

- How to ensure that container starts whenever the docker host is startred?
  Basically just run the container with the --restart always

- what is the purpose of Docker-compose?
  Docker Compose is a tool for defining and running multi-container Docker applications. It allows you to describe your application's services, networks, and volumes in a single file, typically named docker-compose.yml.
  Docker Compose simplifies the process of working with multi-container Docker applications by providing a clear and concise way to define, configure, and manage the various components of an application stack. It is particularly useful for development, testing, and deployment scenarios where multiple containers need to work together as part of a larger application.

- how docker image is different from docker container?
  Image is template that is used to create one or more containers, while containers are running instances of the docker image
  container is writable so that you can write the data and you cannot do the same in image.

- Can we modify the docker image?
  Docker images are typically designed to be immutable, meaning that once an image is built, its contents do not change. However, you can create a new image based on an existing one, make modifications, and then save it as a new image.

- What are networking modes in docker?
  Refer to networking notes.md
  overlay network - an overlay network is a type of network that facilitates communication between containers running on different Docker hosts in a docker swarm cluster.

- What are docker volumes and why they are important in data persistance?

- when you start a docker container and it doesnt start properly.. how do you trouble shoot?
  check the docker logs, inspect the container and monitor the docker events.

- how do you secure docker containers?
  use official images
  implement least privilage
  use non-root users
  use distroless images
