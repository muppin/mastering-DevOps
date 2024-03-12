- Jenkins by default runs on port 8080
- ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/a421d99b-b0ec-416f-9f36-9deedadc6965)


**Credentials**
- **Scope** - System and Global
     - System - Only available for jenkins server and nodes. Not for jenkins jobs.
     - Global - Everywhere acessible ( jenkins, nodes, items, all child items)
     - Project - Limited to project, only with multibranch pipeline. Inside pipeline. System credentials not accessible here.

- **ID** - Reference  for your credentials
- **Folder plugin** - Enables to organize build jobs in folders. Credentials scoped to your project.



**Discover Branches**
- Filter by name - Regular expression. Example: `^dev|master.*$ `
- For all branches `.*`  (Any character, any number of times)
  

**Jenkins File**
![image](https://github.com/muppin/mastering-DevOps/assets/56094875/ed8a9c85-9bc4-4852-bd20-e1962a1c81c3)

- **Replay the stage** - If u want to modify jenkins file without commiting it on gitrepo - then navigate to Pipeline- select one of the build -> replay -> edit and run
-  **Restart from stage** - Go to specific build -> dropdown -> Restart from stage -> BY this u can run a specific stage and this will skip other stages.


**Trigger Jenkins Build Automatically**
As a best practice to use both webhook and polling, as webhooks are sometimes unreliable.

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/437716d5-04d2-4646-ba4e-513451079660)


Payload url- for webhook
example- http://52.91.12.115:8080/github-webhook/


**Post Attribute**
- Executes some logic after all stages are executed.
- Example: Build status or build status changes
- Conditions:
     - Always: Code inside the post block will aways be executed, no matter if build fails or suceeds.
     - Success: Executes only if the build suceeds.
     - Failure: Will execute if the build fails.

**Conditionals**
```
    when {
        expression {
            BRANCH_NAME == dev    \\ stage will only execute if current branch is dev
          }
    }
```


- Branch name is always provided as an env variable by jenkins out of the box.
- Environment var- BRANCH_NAME


**Environment Variables**
- To check which variables are available from jenkins- see at  /env-vars.html
  ```
    environment {
           NEW_VERSION == '1.6'
                }
  ```
  You can use this env var inside stages as-
  ` ${NEW_VERSION} `

  
**Credentials**
- credentials(credentialID) binds the credentials to you env variable
- WithCredentials() wrapper -

  ``` With

  ----------------------------------------------------------------------------------------------------------------------
**Configuring Build tools inside jenkins file**
with wrappers-

![Uploading image.png…]()


- It can be done with the help of "tools" command also
- Works with only 3 tools- maven, gradle and jdk

tools{
gradle "version"
}

--------------------------------------------------------------------------------------------------------------------------
## Jenkins plugins

Jenkins plugins are extensions that enhance the functionality of the Jenkins automation server. They allow users to add new features, integrate with external tools and services, and customize Jenkins to suit their specific requirements. Plugins can be installed and managed through the Jenkins web interface.

Here are some key points about Jenkins plugins:

1. **Functionality Enhancement**: Plugins add new capabilities to Jenkins, such as support for different version control systems (e.g., Git, Subversion), build tools (e.g., Maven, Gradle), testing frameworks (e.g., JUnit, Selenium), and deployment platforms (e.g., Kubernetes, AWS).

2. **Integration with External Tools and Services**: Plugins enable integration with a wide range of external tools and services, including issue trackers (e.g., JIRA, GitHub Issues), code review systems (e.g., Gerrit, GitHub Pull Requests), notification systems (e.g., Slack, Email), and continuous deployment platforms (e.g., Docker, Ansible).

3. **Customization and Extensibility**: Plugins allow users to customize and extend Jenkins to meet their specific needs. Users can develop their own plugins or choose from thousands of existing plugins available in the Jenkins Plugin Index.

4. **Easy Installation and Management**: Plugins can be installed and managed through the Jenkins web interface. Users can browse the available plugins, install new plugins, update existing plugins, and configure plugin settings directly from the Jenkins dashboard.

5. **Plugin Dependency Management**: Jenkins automatically handles dependencies between plugins, ensuring that all required dependencies are installed when a plugin is installed or updated. This simplifies plugin management and ensures compatibility between plugins.

6. **Community Contributions**: Jenkins has a large and active community of developers who contribute to the development and maintenance of plugins. This community-driven approach ensures that plugins are continuously updated and improved to meet the evolving needs of Jenkins users.

Overall, Jenkins plugins play a crucial role in extending the functionality of Jenkins and enabling users to build powerful, customized automation pipelines for their software development and delivery processes.
  



