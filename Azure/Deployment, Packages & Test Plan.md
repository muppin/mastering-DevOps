Blue - Green Deployments-

	• All users are directed to the blue environment (current production environment).
	• Once testing is done, then user will be directed to the green environment, now this becomes the new production.
	• Cons- more cost

Deployment Slots-

	• You have the chance to validate all application changes in the staging deployment slot
	• You can then swap the staging slot with the production slot
	• This helps eliminate the downtime for your app when new changes were deployed. 
	• You can also rollback the changes.
	• This feature is available in only- standard, premium and isolated app service plan.
	• Applications in deployment slots have their own host names.

Canary Deployment-

	• When a new feature is released for an application, it is only made available for a subset of users.
	• You can direct a percentage of users onto may be a new environment with new features.
	• Or maybe feature toggles by feature ON or OFF.

Azure Traffic Manager-

	• It is a DNS based traffic load balancer.
	• You can distribute the traffic to public facings apps across all azure regions.
	• You can direct traffic based on different routing methods.

   Priority Routing Method








Azure Traffic
Manager
Profile
(Runs on global
Level)

Azure Webapp    North Europe    Priority1

Azure Webapp    South US          Priority2

If North Europe location goes down, then traffic manager transfers the traffic to priority2 that is South US.



Weighted Routing Method -

	• Used for canary deployments.
	• You can weightage to the endpoints running behind the profile.
	• Users will be directed to the webapp with higher weightage.

Rolling Deployments-

	• This is done in a rolling fashion across the machines with each machine being replaced.
	• At any point in time you can have machines with older and newer app version.

Load Balancer- 

	• Health Probe- will check the health of VMs in the backend pool.
	• LB only needs private IP address of the VMs present in backend pool.
	• No need of public IP of VMs, disassociate public IP.

Package management-

	• Azure Artifacts- It is a tool which allows users to publish their packages. 
	•  .Net - NeuGet.org 
	• JavaScript- npm
	• Java - Maven packages
	• Python - PyPi python package index

Azure devops->artifacts->feed-> 
	• where packages are published, allows u to store, manage & group packages together.
	• Project based feeds- allows only people within the project to access.
	• Public feeds- allows u to share packages with anyone over the internet.

Requirements for Public feed-
	• They need to be created within public projects.
	• They cannot have upstream sources.
	• Public users cannot download universal packages.

Upstream sources
	• Here you can store packages from different sources on your feed.
	• Here the copy of the package from the upstream source will be stored in the feed.

Feed Views-
	• Helps to share certain packages.
	• By default all the packages are released to the local view.
	• The default views are- @Local, @Preview & @Release

Flaky Test-
	• Test that often pass but can fail at some point in time.
	• It provides different outcomes such as pass, fail even when there are no changes in the source code or execution environment.
	• Project settings-> Test mgmt-> Flaky test detection -> ON(system detection)

Azure App Config-
	• If you have config settings that need to be shared among multiple web apps, instead of defining settings separately on each azure web app, you can define it in azure app config.
	• Can also define feature flags in app config, that can be enabled or disabled at any point of time.


Selenium-
Testing tool.
User interface testing

Azure Test Plans-

	• Testing- Planned manual testing, user acceptance testing, capture test results.
	• Feedback- You can also get stakeholder's feedback.
	• Pipelines-There is integration with azure pipelines.
	• Traceability- The test cases and suites can be linked to the user stories features to provide ned to end traceability.

Access levels-
	• Stakeholder- can perform the test with feedback and test extensions, free, multiple users, can't create bug
	• Basic- Test execution, can perform the test with feedback and test extensions, analyse and review.
	• Basic+test- Test planning, Test execution, can perform the test with feedback and test extensions, analyse and review.

Test Runner-
	• Can run the test for web or desktop apps.
	• Can mark test as passed or failed.
	• Test results-Screen recordings and screen captures
	• Test and feedback extension- browser based extension

![image](https://github.com/user-attachments/assets/053d4188-bdce-4884-a85b-e75b143fb753)
