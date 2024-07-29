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
