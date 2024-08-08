## Service Mesh

### What is Service Mesh?
- It helps in traffic management of your K8s cluster. Especially (East-west) traffic mgmnt.
- Traffic between the services within the k8s cluster in known as East-west traffic.
- Traffic from Internet to the application is referred as North-South traffic.


**Even though services can communicate with each other in a microservice architecture, then why do we need service Mesh??**

It provides below
- mTLS- Mutual TLS - It uploads certificates in each services so that the communication is secure.
- Canary A-B deployment, blue-green deployments
- Kiali - used for observability -> Every sidecar container knows which services are being accessed, they send this info to "ISTIOD", which is the main component of ISTIO and keeps track of all services that can be used for observability.



**How Service Mesh (ISTIO) Works?**

- Inside every pod, it adds a sidecar container along with the normal container.
- The sidecar container will have Envoy proxy app.
- This proxy server handles the traffic the traffic management of your POD.
- Any incoming/outgoing request will go through the sidecar container

**How does the communication between the ISTIO and API Server takes place?**

- It happens with the help of **Admission Controllers**.
- ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/34191f2f-8178-4901-900d-4dbfecaef90f)
- First the request is encountered by the API server where the authentication & authorization takes place, then before reaching to etcd the request is interrupted at admission controller level where it mutates and validates.
- For example, there is a request to create PVC. Admission controller looks for storage class, if itsv not there AC will create it (mutate) and then stores in etcd.


#### Admission Controllers

- An admission controller is a piece of code that intercepts requests to the Kubernetes API server prior to persistence of the object, but after the request is authenticated and authorized.
- Admission controllers may be validating, mutating, or both. Mutating controllers may modify objects related to the requests they admit; validating controllers may not.
- Admission controllers limit requests to create, delete, modify objects.

#### Dynamic Admission controller
- A Dynamic Admission Controller in Kubernetes is a customizable way to enforce and manage admission policies in your cluster.
- They can be used to enforce policies on objects being created, modified, or deleted, ensuring that they meet specific criteria or follow certain rules.
- has 2 types
   - Mutating Admission Webhooks
   - Validating Admission Webhooks

**How does the communication between the ISTIO and API Server takes place?**

- so ISTIO creates a Custom resource of kind: MutatingWebhookConfiguration
- this custom resource is submitted to the API server
- this custom resource is read by API server, it has like what rules are defined and at which webhook the request has to be intercepted.
- Custom resource tells if there is a pod creation request, then simply forward the request to ISTIOD i.e Admission Webhook.
- this ISTOD(Admission webhook) will inject the sidecar container and later send back the response to api server.
- The API server then uses this modified specification as the final version of the resource that will be persisted in etcd.
