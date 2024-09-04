## Deployment-

A build (eg. Web app) can be deployed on any of the following-

	• Azure VM (IAAS)
	• Azure web apps (PAAS)
	• Azure Kubernetes (Container based service)

## Process of Application Deployment-

	1. Test environment
	2. Stating environment
	3. Production environment

## Manual Deployment-

	• Clone the azure repo in VS, so that we can have fresh code
	• Go to Microsoft azure portal->All resources->create-> Web app
	• Now web app will be deployed
	• Go to VS and publish your project and select azure app service

## Release Pipelines-

	• Create a new release pipeline
	• Release pipeline can have multiple stages (test, stating, prod)
	• Add artifact->build
	• Transfer from build pipeline to release pipeline-->publish artifact task
	• Workflow-> change in build pipeline--> will trigger a build--> which will go to artifact (continuous deployment trigger)-->which will trigger release pipeline

## Approval & Gates-

### Manual way-

## Pre-deployment Approval-
A user need to validate the change request so that any deployment can be done to that stage.

## Post deployment approval-
A user need to sign off on the deployment done so that it can be move to another stage.

## Automated Way- kind of prechecks

## Pre-deployment gate-
A user need to ensure that there are no active work items active for the build to be deployed to a stage.

## Post-deployment Gate-
A user need to ensure that no issues are tagged against a deployment, before it can proceed to the next stage.

For manual intervention in pipeline->you can add agentless job

## Deployment Groups Implementation-
	• If we want to run app on multiple VM's at a time, then we can set target as a deployment group
	• An agent need to be installed on each VM

To add connection string in release pipeline--> Under agent job -->Add Azure app service setting job
Connection string will directly take code from DB

## Deployment of container based app-

	
	• Install docker on a VM
	• Publish the .NET app on to the VM.
	• Create a custom image with the help of a dockerfile.
	• This image will be having the app.
	• Now publish this image to a private registry. (download azure CLI on vm for this)
	• It could be azure container registry.
	• Deploy the container--> Either on azure container instance or Azure Kubernetes.

## Doing the same with the help of Build pipeline to streamline the process-

	• Go to azure container registry -> repository-> delete repo
	• Copy the docker file to the code folder, so that azure pipeline can pick it up from there
	• Create Git repository
	• Go to the repo in azure devops portal and set up a build
	• Build and create a push in the azure container registry
	• Select docker, it will create a service connection with azure container registry
	• Edit the default YAML file, docker task will take the code not the docker file from the staging directory
	• So we will add buildcontext inside the docker task
	• That will take the build from the artifact staging directory

## Doing the same with the help of Release pipeline-

	• Release pipeline-> Create pipeline
	• Add empty job
	• Create job-> azure cli add inline script
	• Creating container instance


## Deployment to Azure Kubernetes-


	• Create azure Kubernetes cluster
	• Once cluster is created go to workload create and add YAML file
	• Go to services and coy the code to YAML file

## Doing the same job by editing the build yaml pipeline-

	• Go the service connection and create service connection with the existing azure Kubernetes cluster
	• Add the manifest files(app.ymi and service.yml) inside the project.
	• Add the azure repos- commit- push & pull
	• It will trigger the build, cancel the build.
	• Now edit the pipeline-> add task -> "Deploy on kubernetes"


## Doing the same job with release pipeline-
	
	
	• Go to cluster and delete the service and workload.
	• Delete the task of manifest
	• Add the task to publish the artifact
	• Create new release pipeline
	• Agent job-> deploy to kubernetes -> create two jobs one for app.yml and other for service.yml
	• Release the pipeline

Container Jobs- to isolate the entire build process within the same machine.

	
