Azure Resource Manager Template-

	• This is a JavaScript object notation file that actually contains the definition of the infrastructure.
	• You can store the ARM template in your source code repo along with the app code.
	• Bicep- Language released by Microsoft with same capabilities like ARM.

Deploying webapp with the help of ARM template-

Two things are required- azure web app & app service plan

1st resource type- web serverfarms --> for the deployment of app service plan

	• Create a new folder (template) in C/D drive
	• Open folder and create file- template01.json
	• Type arm and hit tab
	• Copy contents from microsoft document
	• Create new resource group
	• Deploy template and paste the contents of json file.


Deploying sql db server with the help of ARM template-

Two things are required- microsoft sql server & microsoft sql server/database


• Create a new folder (template) in C/D drive
• Open folder and create file- template02.json
• Type arm and hit tab
• Copy contents from microsoft document
• Create new resource group
• Deploy template and paste the contents of json file.

Modularize templates-

Deployment modes-
	1. Incremental Mode-  Here resources defined in the template are deployed. It does not interfere with other resources defined in the resource group which are not defined in the template.
	2. Complete Mode-  Here resources defined in the template will only be in the resource group. If there are other resources in the resource group they will be deleted.

Nested Template-
• One template within another.
• Only incremental mode.

Linked Template-
• One template linked to another.
• Only incremental mode.
• Create a new storage account within the resource group and give the url in json file.

Release Pipeline- ARM Template-

Release pipeline will be having 3 jobs-

• Azure SQL table creation
• Azure web app deploy
• Azure App service settings
Steps-
	1. Go to storage account->containers->template-> upload main.json file
	2. Go to release pipeline & create a new task -> "ARM template deployment"
	3. Make it as first task
	4. In template link->give link of main.json file

Dynamic creation of resources-

Concat function
Webapp name: "[concat ('webapp', uniquestring(resource group().id))]"

If you clone a pipeline, it will clone the Artifact as well! So whenever build is completed it will trigger both the release pipelines.


Terraform- Infrastructure as a Code 
• It is an open source tool developed by HashiCorp.
• It helps to manage and automate your infrastructure.
• It uses declarative language to define the code.
• Deploy Infrastructure
• Configure Infrastructure
• Change the code whenever required
• Share the code
• Create different versions of the code
• Works with variety of cloud platforms
• Code is human readable
• Avid community
• Open source project

Workflow-
• Write your terraform configuration file - It will define the resources which need to be deployed.
• Terraform Plan- Terraform looks at the config file and decides what needs to be deployed or changed.
• Terraform Apply- Apply all the changes as per the terraform configuration file.
Terraform init
Terraform plan -out main.tfplan
Terraform apply "main.tfplan"


DSC - Desired State Configuration
• Let's say u are hosting a web app on an azure VM or set of azure VMs, you need to ensure that IS-internet
Information services always need to be enabled.
• You need to ensure the config of machine should not drift or it could impact the app - For this u can make use of powershell DSC.

Azure Automation DSC-
• Built in server that ensures all the machines receive desired configs only.
• You can manage all the nodes and configs from azure portal.

Custom script Extension-
This extension can be used to download and run scripts on Azure VMs.

Team Services Agent Extension -
It ensures VM is added to the deployment group.

Application Health Extension-
You can monitor the health of individual extensions.
Can be used for rolling upgrades to the instances.


