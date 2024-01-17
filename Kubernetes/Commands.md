- kubectl get pods - lists all the pods
- kubectl get deploy - lists all the deployments
- kubectl get rs - lists all the replica sets
- kubectl get svc - lists all the services
- kubectl create deployment <deployment-name> --image=<imagename> - creates a deployment and creates a default yaml file for it
- kubectl edit deployment <deployment-name> - opens a configuration file and you can edit.
- kubectl logs <pod-name> -  provides the logs of a pod
- kubectl describe pod <pod-name> - shows the state changes happened inside the pod
- kubectl exec -it <pod-name> -- bin/bash - enters inside the pod and helps in debugging
- kubectl delete deploy <deployment-name> - deletes an existing deployment.
- kubectl delete pod <pod-name> - deletes a pod.
- kubectl apply -f <file-name> - creates a kubernetes services according to the file.
- kubectl delete -f <file-name> - deletes a kubernetes services according to the file.
- kubectl get pods -o wide - lists the pods with complete information.
- kubectl get pods -w   -> used to watch (observe) changes in the Pods within the Kubernetes cluster in real-time.
- kubectl get deploy nginx-deployment -o yaml - list the particular deployment with complete information like status etc.
- kubectl describe service SERVICE_NAME -n NAMESPACE -> To verify if services are aligned with the running Pods in Kubernetes.
- kubectl get pods -v=7  -> used to retrieve information about pods in a K8s cluster with verbose output level 7. The -v flag is used to set the verbosity level, providing more detailed and verbose information about the pods.


______________________________________________________________________________________________________________________

## Steps to create and deploy helm charts

- helm create chartname    // to create new helm chart
execute below commands at home level (outside the chart)
- helm template chartname  // to display all resources with values        
- helm lint chartname      // to show if any errors/failures in chart    Compilation   
- helm install v1 --debug --dry-run demochart   //v1 is the release name here
- helm install v1 chartname //v1 is the release name here
- helm list -a      //to list releases

___________________________________________________________________________________________________________________________

## Steps to Upgrade helm release

- Update the version in chart.yaml, according to semantic versionong.
- For example. V1= 0.1.0 then v2 should be 0.1.1
- Update replica count in values.yaml
- then upgrade the release -  helm upgrade releasename chartname

__________________________________________________________________________________________________________________________

## Rollback to previous version

- helm rollback releasename versionNumber
- example- helm rollback v1 1
- Note - In helm, you will always get a new revision number weather you have rollbacked or upgraded.

  ____________________________________________________________________________________________________________________________

## Delete Release

- helm delete releaseName
____________________________________________________________________________________________________________________________

## Adding Upstream Repo

There are five repo commands provided by Helm which can be used for add,list,remove,update,index the chart repository.

- *add* : Add chart repository
- helm repo add <REPOSITORY_NAME> <REPOSITORY_URL>
- *list* : List chart repository
- helm repo list   // lists all the repos available in cluster
- *update* : Update the chart information locally
- helm repo update  // updates the repo
- *index* : For generating the index file
- helm repo index <chartname>  // generates the index.yaml for the chart
- *remove* : Remove chart repository
- helm repo remove <repoName>  // removes chart repo


