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

  



