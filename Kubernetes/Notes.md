What id K8s- Container Orchestration tool.

### Why K8s? Or Problems with Docker.

- **Problem 1- Single host nature of docker container** - Nature of docker scopes to one single host and .
- **Problem 2- Docker does not provides auto healing** - Docker containers are ephemeral (Short-lived) in nature and docker does not provide any auto-healing. 
- **Problem 3- Docker does not provides auto scaling** - Auto-scaling means as soon as load increases, scaling up of containers. But docker does not provide auto-scaling feature.
- **Problem 4- Docker does not provide Enterpise level support** - Load balancing, auto-healing, auto-scaling, firewall etc... these features are not there in docker. Docker is not used in production, only docker swarm can be used.


### How K8s is soloving these problems??

- **Solution 1** - K8s has multi node architecture, means if there is a faulty node, K8s will tranfer the pod to different node. It has cluster of nodes.
- **Solution 2** - K8s provide auto-healing means, Without user intervention container should start by itself. When API server gets a signal that a container is going down, even before it goes down K8s wil spin up a new container and it will fix the damage.
- **Solution 3** - K8s has Replica sets and HPA feature, which supports auto scaling.
- **Solution 4** - K8s provide Enterpise level support.


### K8s Architecture

-
