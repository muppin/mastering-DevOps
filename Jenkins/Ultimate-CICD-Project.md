### Steps

- Launch a T2-large instance
- Install docker, jenkins, sonarqube
- Create new Job-> Pipeline project
- Add path to jenkins file store in SCM (git)
- Install docker pipeline plugin -> Dashboard - manage jenkins- plugins- avail.plugins
- Maven is already installed here in docker container.
- Install sonarqube plugin in jenkins. In same VPC. (java-maven-sonar-argocd-helm-k8s/spring-boot-app/README.md)
- Start sonar server ``` cd sonarqube-9.4.0.54424/bin/linux-x86-64/
./sonar.sh start```
- Add inbound rules accordingly.
- **Authenticate jenkins with sonarqube**
     - Navigate to sonarqube (ec2_ip:9000)
     - Go to My Account -> security -> generate token
     - Copy token and add as credential (as secret text)
- Restart jenkins after installing all the plugins.
- Biuld and test stage- cd to java app and mvn clean package, it will search for pom.xml
- With this stage, artifact is created and stored in target folder.
- mvn sonar:sonar target is used.
- Add docker and github token in the jenkins file and jenkins credentials.
- edit sonar url in jenkins file.
- Create GKE cluster
- Install argo CD on GKE cluster. (https://argo-cd.readthedocs.io/en/stable/getting_started/)
    ```
        kubectl create namespace argocd
        kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

- Create Application on Argocd -> give repo url and path in order to fetch the manifest file.

_____________________________________________________________________________________________________________________________________________________________________________________

### important points

**Why we use docker container as a agent?**

- Use docker container as a agent, for cost optimization, as there is no need to launch separate VMs/instances as slaves.
- If u config multiple EC2 instances as slaves and if there is no load on certain days-> downside to this is, it will cost us even though we are not using it.
- You can use jenkins autoscaler, but Configuration overhead wil be there.
- We have to install dependencies on all slaves.
- But if we use docker container, it will bring up the container with all the dependencies.
- Container will be deleted right after the execution of all the stages.


 **Can a jenkins file in any location with any name- Yes, jenkins file can have any naming convention and can be store in any location.**

 **If jenkins file is present in source code, then there is no need to checkout stage. But if its in jenkins pipeline, as a script then checkout stage is required.**

 **What is the difference between mvn clean package and mvn clean install?**
 
    - If we want to push the archieve files (war, jar) to artifactory (ex. nexsus)

**pom.xml is responsible for getting the dependencies runtime and deploying the app. pom.xml is used for java apps only**
 
