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
