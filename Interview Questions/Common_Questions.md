### How would you generate SSL keys, deploy Ingress controllers, and manage private Docker images in Kubernetes, ensuring everything is set up securely and functions correctly?
- To generate SSL keys, I'd use OpenSSL to create the private key and Certificate signing request(CSR) file and send CSR to Certificate authority for the SSL certificate
- create a Kubernetes secret for SSL certicates that store private key and SSL cert.
- Deploying the Ingress controller can be done via Helm, manifests etc and then configure ingress resource that uses the above SSL cerificate
- for managing private Docker images, I'd set up a private container registry, create a kubernetes secret that icludes authentication details and include an imagePullSecrets section to pull the images from private repo. 
