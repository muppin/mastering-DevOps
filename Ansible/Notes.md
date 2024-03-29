## Configuration Management

- Configuration management is the process of managing and controlling changes to software, infrastructure, and systems in a consistent and efficient manner. It involves tracking and regulating changes to ensure that systems and software are configured correctly and remain in a desired state over time.
- Configuration management reduces the overhead of managing configurations on multiple servers.


## Problems without Configuration Mgmt tools (Ansible, puppet, chef etc):

- **Manual Configuration:** Without Ansible or similar automation tools, system administrators would need to manually configure each server and system individually. This process is time-consuming, error-prone, and not scalable, especially in environments with a large number of servers.
- **Inconsistency:** Manual configurations often lead to inconsistencies across systems. Even with meticulous attention to detail, human error can result in configurations that deviate from the desired state. Inconsistent configurations can lead to operational issues, security vulnerabilities, and difficulties in troubleshooting.
- **Difficulty in Scaling:** As the number of servers and systems increases, managing configurations manually becomes increasingly challenging. Adding new servers, updating configurations, and ensuring consistency across the infrastructure becomes a daunting task without automation.
- **Repetitive Tasks:** Many system administration tasks are repetitive in nature, such as installing software packages, updating configurations, and restarting services. Without automation, administrators spend a significant amount of time performing these routine tasks instead of focusing on more strategic initiatives.
- **Limited Visibility and Control:** Manual configuration management often lacks centralized visibility and control. It can be difficult to track changes, enforce policies, and ensure compliance across the infrastructure without a centralized automation tool like Ansible.


## Ansible:

- Ansible is an open-source automation tool that simplifies the process of configuration management, application deployment, and task automation. It uses a simple and human-readable language (YAML) to define configurations and tasks, allowing users to automate repetitive tasks efficiently across multiple systems. Ansible operates over SSH, which means it doesn't require any additional software to be installed on target machines, making it easy to set up and use.
- Ansible is written in python. You can write your own modules.

## Why Ansible? over Puppet

**Puppet** -
- Works on pull mechanism.
- Master| slave model- laptop will act as master and all other remote servers will act as slaves.
- Config lang is puppet lang.


**Ansible** -
- Works on push mechanism: you write playbooks on ur laptop and then push it to remote servers.
- Agentless: will just give list of remote servers in inventory file. Scale up and down is easy.
- It has dyanamic inventory- it will automatically sense the server and do the config changes.
- Provides good Support to both windows and linux as comapred to other config mgmt tools.
- Simple, written in yaml.


## Drawbacks of Ansible

- Still config mgmt is difficult for windows servers.
- Not good with debugging.
- We can run ansible in debugging mode, but still debugging logs are not that much easy to understand by devops engineers.
- Performance issues.

  **********************************************************************************************************************************************************************************************

  ### Ansible installation

  ``sudo apt update
    sudo apt install ansible``


  **Verify**
  
  ``ansible --version``
**********************************************************************************************************************************************************************************************

### For passwordless Authentication

- Do ssh-keygen in ansible host.
- Copy the public key
- Do ssh-keygen in target host also
- Paste this public key in the authorised keys of target host.
- Now access the target host on ansible host without any password.
- ssh private_ip of target server.
  
************************************************************************************************************************************************************************************************




