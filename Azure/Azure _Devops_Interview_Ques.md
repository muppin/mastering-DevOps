	• Azure DevOps is Software as a Service (SaaS) platform provided by Microsoft. It enables developers and DevOps teams to develop and deploy applications through an end-to-end DevOps toolchain. It also provides a collaborative and integrated environment supporting continuous integration, Git, and agile tools to plan and track work. 
	• Azure boards is a azure DevOps service is used for managing the project of software. The various abilities offered by it include reporting, dashboards, kanban, and scrums. Backlogs, queries, dashboards, sprints, and work items are the essential features of Azure boards.
	• With the help of Azure pipelines, the project codes can be built as well as tested automatically.
	• Azure Repos is a set of version control tools that you can use to manage your code.
	Azure Repos provides two types of version control:
	
	Git: distributed version control, we can make local copy and work, later we can push
	Team Foundation Version Control (TFVC): centralized version control -
	Typically, team members have only one version of each file on their dev machines. Historical data is maintained only on the server.
	
	
	
	• Azure Artifacts allows you to create, publish, and consume packages. Packages can include things like NuGet packages for .NET applications, npm packages for JavaScript applications, Maven packages for Java applications, and more. Azure Artifacts helps manage these dependencies by providing a central repository for your packages. 
	• The major benefits of DevOps are as follows:
	
	Customer satisfaction
	More engagement and collaboration between development and operation teams
	Faster code deployment in the market through continuous integration and delivery
	Faster operational support
	Higher efficiency
	Strong infrastructure and IT performance
	Continuous improvements and reduced failures
	Transparency between teams
	Constant monitoring and better adaption
	
	• Azure DevOps provides the following container support:
	
	Docker
	Kubernetes
	Azure Container Instances (ACI)
	Azure Container Registry (ACR)
	
	• Selenium is used for continuous testing in DevOps. It specializes in forms of regression and functional testing.
	• Azure test plans- It provides a set of tools and features to create, manage, and track tests, test cases, and test suites to ensure the quality and reliability of software applications.
	• Memcached is an open-source, high-performance, distributed memory caching system that is commonly used to accelerate and optimize the performance of web applications and databases.
	• The dogpile effect or cache stampede indicates the expiry of the cache, followed by the website being simultaneously hit by numerous requests. Semaphore lock helps prevent this effect by generating a new value as the cache expires.The Dogpile effect can be prevented by using a technique called “cache stampede protection” or “cache key lock”.
	• Scripts are written for software testing and made auto-executable so that testing can be automated and frequent releases are possible using the delivery pipelines.
	• Azure DevOps services are the cloud services of Microsoft Azure, and they offer a highly scalable and reliable hosted service that is globally available. DevOps Server, on the other hand, is an on-premise offering that is on a SQL Server backend.
	• Different scenarios-
	CI/CD for Azure VMs
	CI/CD for Azure Web Apps
	CI/CD for containers
	What should you do to make a NuGet package available to anonymous users outside your organization while minimizing the number of publication points?
	The answer is the introduction of a new feed for the package. Packages that are hosted in Azure Artifacts, find storage in a feed. Sharing packages with higher scalability and according to requirements can be ensured by setting up permissions on the feed. These multiple feeds enable control of access to packages across four levels. These four levels of access are as follows:
		• Owners
		• Readers
		• Contributors
		• Collaborators
	
	Publish the NuGet package to a public NuGet repository such as nuget.org.
	
	
	
	
	27. Which feature can be used for the development of a multi-tier application using Azure App Service web apps as the front end and an Azure SQL database as the back end?
	The appropriate option, in this case, is Application Map in Azure Application Insights. This is because it helps identify the performance bottlenecks and failure hotspots in different components of multi-tier applications.
	
	From <https://intellipaat.com/blog/interview-question/azure-devops-interview-questions/> 
	
	Popular CI/CD tools-
	Azure pipelines
	Jenkins
	Gitlab CI
	Bamboo
	Circle 
	CICodeship, 
	DeployBot, 
	AWS CodeDeploy
	
	A multi-stage pipeline is a type of pipeline in a continuous integration/continuous delivery (CI/CD) process that is split into multiple stages. Each stage represents a different step in the pipeline, such as building, testing, and deploying the application. The pipeline will typically start with the build stage, where the application is compiled and packaged. Then, it will move to the test stage, where automated tests are run to ensure the application is working as expected. Once the tests pass, the pipeline will move to the deploy stage, where the application is deployed to a staging or production environment.
	
	
	A pull request (PR) in Azure DevOps Repos is a feature that allows developers to submit changes they have made to a branch in a Git repository for review and merge into the main branch (often called ‘master’ or ‘main’). When a developer creates a pull request, they are proposing changes to the codebase. Other members of the team can then review the changes and provide feedback. If the changes are approved, the developer can then merge the changes into the main branch.
	
	
	A fork in Azure DevOps is a copy of a Git repository that allows a developer to make changes to the codebase without affecting the original repository. 
	
	To integrate Jenkins with Azure Pipelines, you can use the Azure DevOps plugin for Jenkins, which allows you to trigger builds, deployments, and other actions in Azure Pipelines from Jenkins.
	
	What are some of the useful plugins in Jenkins?
	Pipeline, git, maven,slack,sonarqube,EC2
	
	The general steps for moving or copying Jenkins from one server to another include:
		1. Backing up the Jenkins data
		2. Installing Jenkins on the target server
		3. Restoring the Jenkins data
		4. Configuring the target server
		5. Updating Jenkins plugins and configurations
		6. Update the Jenkins URL
	
	• What are fault domains and update domains?
	In Azure, a fault domain is a group of virtual machines (VMs) or physical hardware that share a common power source and network switch. A fault domain is essentially a way to group resources together so that if there is a failure, such as a power outage or network switch fails, it will only affect a subset of the overall resources in your deployment.
	An update domain is a group of virtual machines that are updated together during a planned maintenance event. During an update, only one update domain is taken offline at a time, so that the remaining update domains can continue to service requests.
	
	• Virtual machine scale sets (VMSS) are a feature of Azure that allows you to create and manage a group of identical, load-balanced virtual machines. Scale sets automatically increase or decrease the number of virtual machines in the set based on demand, ensuring that your application is always running at the desired level of performance.
	
	

