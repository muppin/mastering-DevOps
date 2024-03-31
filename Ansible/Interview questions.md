## Interview Questions


- **What programming language ansible uses?**
  Python

 ***************************************************************************************************************************************************************************************************************************
- **Does ansible supports only Linux or Windows also?**
  It supports both.
  
  **************************************************************************************************************************************************************************************************************************

- **Which protocol ansible uses to support windows and linux?**
  For linux protocol used in ssh, and for windows protocol used in winRm

 ****************************************************************************************************************************************************************************************************************************
- **Why did u choose Ansible? OR Diff b/w ansible, puppet and chef?**

**********************************************************************************************************************************************************************************************************************
- **Is ansible pull or push mechanism?**
  Push
  
 *******************************************************************************************************************************************************************************************************************
- **In which prog lang you write playbooks?**
  YAML

***********************************************************************************************************************************************************************************************************************

- **Does Ansible supports all cloud providers?**
  For Ansible it does not matter about the cloud providers, things which matter are public IP address, ssh/winRm enabled to this machine.
  
****************************************************************************************************************************************************************************************************************************
- **Difference between ansible ad-hoc commands and playbooks?**

  Ansible ad-hoc commands and playbooks are both used for automation and management of systems, but they differ in terms of their purpose, structure, and complexity:

1. **Purpose**:
   - **Ad-hoc Commands**: Ad-hoc commands are designed for quick, one-off tasks or troubleshooting on remote systems. They are ideal for tasks that do not require complex orchestration or multiple steps.
   - **Playbooks**: Playbooks, on the other hand, are YAML files that contain a series of tasks and configurations, allowing for more complex automation workflows. Playbooks are used for defining the desired state of systems and orchestrating multiple tasks in a structured manner.

2. **Structure**:
   - **Ad-hoc Commands**: Ad-hoc commands are executed directly from the command line and consist of a single Ansible module and its parameters.
   - **Playbooks**: Playbooks are structured YAML files that include various sections such as hosts, tasks, variables, handlers, and more. They provide a more organized and reusable way to define automation workflows.

3. **Complexity**:
   - **Ad-hoc Commands**: Ad-hoc commands are simple and straightforward, suitable for performing tasks such as running a single command, copying files, or restarting services on remote systems.
   - **Playbooks**: Playbooks support more complex automation scenarios, allowing for conditional execution, loops, error handling, and integration with variables and templates. They are well-suited for managing infrastructure at scale and implementing infrastructure as code practices.

4. **Reusability**:
   - **Ad-hoc Commands**: Ad-hoc commands are not easily reusable since they are executed directly from the command line without any formal structure or organization.
   - **Playbooks**: Playbooks promote reusability and maintainability as they can be version-controlled, shared, and reused across different projects and environments. They facilitate modularization and abstraction of automation logic.

In summary, while ad-hoc commands are quick and useful for simple tasks or troubleshooting, playbooks provide a more structured and scalable approach to automation, allowing for complex workflows and better maintainability of infrastructure code.

***************************************************************************************************************************************************************************************************************************

- **How can you group servers OR how can u execute a certain task on only some specific servers?**  Groups: Hosts can be grouped together using square brackets [].

