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

### Ansible Ad-hoc commands

Ad hoc commands in Ansible are one-off commands that are run directly from the command line, without the need for writing a playbook. These commands allow you to perform quick tasks or operations on remote hosts managed by Ansible. Ad hoc commands are useful for tasks that do not require complex orchestration or automation.

Here's the basic syntax of an ad hoc command in Ansible:

```
ansible <target_hosts> -m <module> -a "<module_options>"
```

- `<target_hosts>`: Specifies the target hosts or groups of hosts on which the command will be executed.
- `-m <module>`: Specifies the Ansible module to be used for the task.
- `-a "<module_options>"`: Specifies the options or arguments for the module.

For example, to check the uptime of all hosts in the "web_servers" group, you can use the ad hoc command:

```
ansible web_servers -m command -a "uptime"
```

Here are a few common ad hoc commands and their purposes:

1. **Ping**: Check connectivity to hosts:
   ```
   ansible all -m ping
   ```

2. **Command/Shell**: Execute a command or shell script:
   ```
   ansible <target_hosts> -m command -a "<command>"
   ansible <target_hosts> -m shell -a "<shell_command>"
   ```

3. **Copy**: Copy files or directories to remote hosts:
   ```
   ansible <target_hosts> -m copy -a "src=<source_file> dest=<destination_file>"
   ```

4. **File**: Manage files or directories on remote hosts:
   ```
   ansible <target_hosts> -m file -a "path=<file_or_directory_path> state=<state>"
   ```

5. **Service**: Manage services on remote hosts:
   ```
   ansible <target_hosts> -m service -a "name=<service_name> state=<state>"
   ```

Ad hoc commands are convenient for quick tasks or troubleshooting, but for more complex and reusable tasks, writing playbooks is recommended.

***************************************************************************************************************************************************************************************************************************

### Inventory File

An inventory file in Ansible is a text file that contains a list of hosts and groups of hosts that Ansible will manage. It serves as a centralized location where you define the infrastructure that Ansible can interact with. The inventory file is a fundamental component of Ansible, as it determines the scope of hosts on which Ansible can execute tasks.

***************************************************************************************************************************************************************************************************************************

**example**

```ansible -i inventory all -m "shell" -a "touch devopsclass" ```

The command is an Ansible ad-hoc command used to execute a simple shell command (`touch devopsclass`) on all hosts specified in the inventory file (`inventory`). Let's break down the command:

- `ansible`: This is the Ansible command-line tool used to execute commands or playbooks.
  
- `-i inventory`: This option specifies the inventory file to use. In this case, the inventory file is named `inventory`. The inventory file contains a list of hosts on which the Ansible command will be executed.

- `all`: This parameter specifies the target hosts. In this case, `all` indicates that the command will be executed on all hosts listed in the inventory file.

- `-m "shell"`: This option specifies the Ansible module to use for the task. In this case, the `shell` module is used, which allows for executing shell commands on the target hosts.

- `-a "touch devopsclass"`: This option specifies the arguments or parameters to pass to the specified module (`shell` in this case). Here, the argument provided is `touch devopsclass`, which is a shell command to create a file named `devopsclass` in the current directory. The `touch` command is commonly used to update the access and modification timestamps of files, but if the file does not exist, it creates an empty file with the specified name (`devopsclass` in this case).

So, when you execute this Ansible ad-hoc command, it will create a file named `devopsclass` on all hosts listed in the `inventory` file by executing the `touch devopsclass` shell command on each host.

*************************************************************************************************************************************************************************************************************************

**Groups:** Hosts can be grouped together using square brackets []. This allows you to target multiple hosts with a single command. For example:

```
[webservers]
webserver1.example.com
webserver2.example.com

[databases]
db1.example.com
db2.example.com
```

**Command**

```ansible -i inventory webservers -m "shell" -a "touch devopsclass" ```

***************************************************************************************************************************************************************************************************************************

### Playbook

- An Ansible playbook is a YAML file that defines a set of tasks or configurations to be executed on remote hosts managed by Ansible. Playbooks are used to automate and orchestrate complex workflows, allowing for the provisioning, configuration, and management of infrastructure as code.
- start the playbook with 3 hyphens (---), which indicated that it is a yaml file.
- Palybbok.yaml can have multiple playbooks. Playbooks are lists.

  *Example*

``` - name: My first playbook
  hosts: all
  become: true
    
  tasks:
    - name: Install nginx
      apt:
        name: nginx
        state: present

    - name: Start nginx
      service:
        name: nginx
        state: started
```

**Give below ansible-playbook command to execute the playbook**
     
```ansible-playbook -i inventory playbook.yaml```


**Verbosity** - To get the debug logs, add -v to the command.

```ansible-playbook -vvv-i inventory playbook.yaml```

-vvv: This option enables verbose mode with increased verbosity level. By specifying -vvv, you'll get more detailed output during playbook execution, which can be helpful for troubleshooting and understanding what Ansible is doing at each step.

***********************************************************************************************************************************************************************************************************************

### Real time Usecases:

Using ansible playbooks to configure K8s cluster:

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/601342c1-8dab-4cf0-8b7b-9a9f4709b630)

************************************************************************************************************************************************************************************************************************

### Ansible Roles

Ansible roles are a way to organize and package sets of tasks, handlers, variables, and other Ansible artifacts into reusable units. Roles provide a structured approach to organizing automation logic and promoting code reuse across multiple projects and playbooks. They help simplify playbook management, enhance modularity, and improve maintainability of Ansible codebases.

```ansible-galaxy role init kubernetes```

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/79d90e8d-c6fe-4c4d-a72a-31f21498973b)



