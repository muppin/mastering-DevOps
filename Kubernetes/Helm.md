



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

To find the latest Helm plugins and their documentation, it's a good idea to check the Helm Hub and the official Helm GitHub organization. The Helm Hub is a centralized repository for discovering and sharing Helm charts and plugins.

Please note that Helm and its ecosystem are evolving, so be sure to refer to the official Helm documentation and the specific documentation for each plugin for the most up-to-date information.
Description: A Helm plugin to load values from Git repositories.
Installation:
bash
Copy code
helm plugin install https://github.com/aslafy-z/helm-git
helm-gcs:

Description: Helm plugin to install charts directly from Google Cloud Storage (GCS).
Installation:
bash
Copy code
helm plugin install https://github.com/hayorov/helm-gcs
helm-search:

Description: Allows you to search Helm hub and GitHub repositories.
Installation:
bash
Copy code
helm plugin install https://github.com/cwds/helm-search
 

