Continuous Integration-

Automatically building and testing the code when a team member commits a code changes to version control.

Azure Pipelines-

	• Build and test your code projects.
	• Can be used for both continuous integration and continuous delivery.

Using Azure Pipelines-

	• YAML syntax
	• YAML- Human friendly data serialization language used for all languages.
	• Helps to easily identify the changes in the pipeline that could break the pipeline.

Token-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

Microsoft hosted agents-
Microsoft-hosted agents for Azure Pipelines - Azure Pipelines | Microsoft Learn
	• A fresh virtual machine is created for each new job of pipeline.
	• After the job is run, VM is discarded.

Self-hosted Agent-

	• You want to create your own agent.
	• You want to persist the builds.

Mend (WhiteSource)

	• This is an open source software security and compliance mgmt. tool.
	• It integrates with azure devops set of tools with build pipelines.
	• It can check for any sort of security vulnerabilities, licensing issues.

Adding Unit test-

	• First add the local test as a part of your project on your local machine
	• Edit the pipeline, add the test as a task
	• Now commit from Azure, it will trigger the pipeline, but test is still not published
	• Now commit-> pull & push from visual studio
	• This will again trigger the pipeline, this time we can see a test tab.

Code Coverage-

	• How much part of your code is tested by the test?
	• Now go to the project, add new folder named as module.
	• Now within this module add a new class named functions
	• Now invoke this function from the test, publish all the changes.

Authentication-

Build GitHub repositories - Azure Pipelines | Microsoft Learn


	
	
	SonarCloud-
	
	• Used for code quality.
	• Enhance your workflow with continuous code quality and security.


Pipeline Caching-

Pipeline caching - Azure Pipelines | Microsoft Learn

Caching the packages, so that they can be reused again.


Azure pipelines integration with Microsoft Teams-

Integrate Azure Pipelines and Microsoft Teams - Azure Pipelines | Microsoft Learn

How to create a workflow from GitHub that will trigger a pipeline-

	• Clone repo from github to VS
	• Now create a folder in project, named .github
	• Now create one more folder inside this folder, named workflows
	• Inside this folder add a "new item", that should be a YAML file.


JENKINS (Continuous Integration tool)

Create a new VM
Copy public IP address of VM take a putty session
Run the installation commands


