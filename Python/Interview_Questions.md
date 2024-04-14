**Describe a real-world example of how you used Python to solve a DevOps challenge.**

Here you can talk about the projects that we did in this series
- GitHub Webhooks
- JIRA integration
- File Operations

**Sample answer**- Github-jira integration
- **Prolem statement**:
  - We have our sourcecode stored in github and all the work is tracked in jira
  - So there was a requirement given to me by the development team, that when ever a developer commits a pull request and comments "/jira"
  - a python script should be trigerred and that script should create a jira ticket with all the information available on pull request or github issue
  
- **Solution**:
  - I wrote a python script which is a flask based application
  - It will expose an API and that API will be shared with github
  - So whenever a developer comments "/jira", a github webhook is trigerred
  - and it send the payload to flask API
  - Now this flask API will read the pull request and check if the comment is "/jira", it will tak to the jira api and it will create a ticket


  **********************************************************************************************************************************************************************************

  **Discuss the challenges that you faced while using Python for DevOps and how did you overcome it.**

  - I was not able to figure out the issue_type_ID: I explored the documentation
  - It was my first time with flask
  - Issues with webhooks
 
  **********************************************************************************************************************************************************************************

  **How can you secure your Python code and scripts?**

  - Any kind of sensitive data, I will not put in the code
  - I will try to use options such as command line arguments
  - If there is a password or API tocken to put then an environment variable
  - Handle any sensetive information using Input variables, command line arguments or env vars.
 
  **********************************************************************************************************************************************************************************

  **Explain the difference between mutable and immutable objects.**

  - Mutable- can be changed
  - Immutable- can not be changed
 
  ********************************************************************************************************************************************************************************

  **Difference between list and tuples?**
  Lists are mutable and typically used for storing collections of items that can be changed, while tuples are immutable and commonly used to store collections of items that shouldn't change.

  ****************************************************************************************************************************************************************************************

  **If two different teams that expect you to have two different versions of same python pakage or module, how to resolve?**

  - use virtualenv
  - Virtualenv creates isolated Python environments, allowing different projects to use different versions of packages without conflicts. 
  - Creating a virtual environment:

**Creating a virtual environment named 'myenv'**

```virtualenv myenv```

#### Activating the virtual environment:

- **On Windows**
```myenv\Scripts\activate```

- **On Unix or MacOS**
```source myenv/bin/activate```

*************************************************************************************************************************************************************************************************
