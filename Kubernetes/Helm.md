# HELM

- Package manager
- Helm helps you in managing K8s config
- Helm charts help you define, install and upgrade complex k8s application
- Helm is the best way to find, share and use software built on k8s
- it supports rollback and upgrades


**Helm Chart Structure**
- chart.yaml
- templates
- values.yaml

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/7847549a-2d14-47ad-b52f-b2a9408e66d1)


In Helm, a chart, a repository, and a release are key concepts used for managing applications and their deployments within Kubernetes:

1. **Chart:** 
   - A Helm chart is a package or bundle of Kubernetes resources required to deploy a particular application. It contains YAML files describing Kubernetes resources such as deployments, services, ingress rules, and more. Charts can be easily versioned and shared.

2. **Repository:** 
   - A Helm repository is a collection of published and versioned charts. It's a server that hosts and serves Helm charts over HTTP. Repositories are where Helm fetches charts from when installing or updating applications.

3. **Release:** 
   - A release in Helm represents a particular deployment of a Helm chart onto a Kubernetes cluster. It is an instance of a chart combined with specific configuration settings and options. Each deployment of a chart creates a unique release, allowing multiple instances of the same application with different configurations.

In summary, a Helm chart packages Kubernetes resources, a Helm repository stores and distributes these charts, and a release is an instance of a chart deployed onto a Kubernetes cluster with specific configurations. This structure allows for easy management, versioning, and deployment of applications within Kubernetes using Helm.

**Helm Installation**

      `curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
       chmod 700 get_helm.sh
       ./get_helm.sh`    

**Helm create command**
- It will create a directory structure
- ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/bf4bfdef-3a20-4d2b-acdf-473da4bf8c4e)
- In this structure, focus on template -> deployment and service file will be stored here.
- **values.yml**- provide all the values which u want to override for ur app

**Helm v2 vs v3**

Helm v2 is more of release management and it has Client and server(Tiller) architecture. whenever install or upgrade is done everything is stored inside the architecture as a history.
The main cause of upgrading to v3 is the tiller has a high power in the kubernetes cluster like create, update and delete, which leads to security issue. 


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

Basically, the repo is nothing but the collection of helm charts. There are five repo commands provided by Helm which can be used for add,list,remove,update,index the chart repository.

- **add**: Add chart repository
- helm repo add <REPOSITORY_NAME> <REPOSITORY_URL>
- **list** : List chart repository
- helm repo list   // lists all the repos available in cluster
- **update** : Update the chart information locally
- helm repo update  // updates the repo
- **index** : For generating the index file
- helm repo index *chartname*  // generates the index.yaml for the chart
- **remove** : Remove chart repository
- helm repo remove *repoName*  // removes chart repo
- helm search repo *RepoName*  // It should return you back with all the charts which are available inside bitnami 
  repository

**Take an example to add on the prometheus monitoring to you kubernetes cluster**
- firstly you will add the helm repo i.e. **helm repo add prometheus-community https://prometheus-community.github.io/helm-charts**
- update the helm repo **helm repo update**
- install the chart from the above repo **helm install prometheus prometheus-community/prometheus**

#### NOTE-
When you run helm repo update, Helm contacts the specified chart repositories and updates the local cache or index of charts. This ensures that you have the latest information about the charts and their versions available in those repositories. It's similar to running apt-get update or yum update on a package manager for a traditional operating system.

____________________________________________________________________________________________________________________________

## Helm Plugins

As of my last knowledge update in January 2022, Helm plugins are extensions that provide additional functionality to Helm, a package manager for Kubernetes applications. Helm plugins can be used to enhance Helm's capabilities or to integrate it with other tools. Keep in mind that Helm and its ecosystem are actively developed, so there may be new plugins or changes after my last update.

To use Helm plugins, you typically need to install them and then run them as commands alongside the standard Helm commands. Here are some examples of Helm plugins:

1. **helm-diff:**
   - **Description:** Shows the differences between releases.
   - **Installation:**
     ```bash
     helm plugin install https://github.com/databus23/helm-diff
     ```

2. **helm-secrets:**
   - **Description:** A plugin for managing Helm secrets.
   - **Installation:**
     ```bash
     helm plugin install https://github.com/zendesk/helm-secrets
     ```

3. **helm-git:**
   - **Description:** A Helm plugin to load values from Git repositories.
   - **Installation:**
     ```bash
     helm plugin install https://github.com/aslafy-z/helm-git
     ```

4. **helm-gcs:**
   - **Description:** Helm plugin to install charts directly from Google Cloud Storage (GCS).
   - **Installation:**
     ```bash
     helm plugin install https://github.com/hayorov/helm-gcs
     ```

5. **helm-search:**
   - **Description:** Allows you to search Helm hub and GitHub repositories.
   - **Installation:**
     ```bash
     helm plugin install https://github.com/cwds/helm-search
     ```

 

