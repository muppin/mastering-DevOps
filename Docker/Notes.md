**Docker networking**
- *None Network* - when the container runs in none network, it is just restricted to the container alone and cannot access anything outside of it.
- *Bridge (Default network)* - when the conatiner runs in this network, it can access the external world. It allows to access the containers that are created within this network with the container IP alone and not with the name.
- *Custom Bridge* - to access the containers with the help of their name, we have to deploy them inside custom bridge network.
- *Host Network* -  when any container is deployed inside host network, it can access anything in the external world.
