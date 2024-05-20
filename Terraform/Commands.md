### Terraform Commands

- **terraform init**
  - To initialize a Terraform project.

- **terraform init -upgrade**
  - Command used to upgrade Terraform modules to the latest available versions. This checks for updates to the modules specified in your configuration files and downloads the latest versions.

- **terraform plan**
  - Shows resources to be created.

- **terraform apply**
  - Creates infrastructure.

- **terraform validate**
  - Checks syntax.

- **terraform fmt**
  - Formatting.

- **terraform destroy**
  - Destroys infrastructure.

- **terraform show**
  - Displays the state file.

- **terraform apply -var-file=stage.tfvars**
  - Creates infrastructure using a specific tfvar file.

### Workspace Commands

- **terraform workspace new <name>**
  - Creates a new workspace.

- **terraform workspace select <name>**
  - Switches between workspaces.

- **terraform workspace list**
  - Lists all created workspaces.

- **terraform workspace show**
  - Displays the current workspace.

- **terraform workspace delete <name>**
  - Deletes a workspace.
 
## Interview Questions
 
### importing the infrastructure from the provider (Scenario-1)

- **terraform plan -generate-config-out=generated.tf**
  - It will create a file called generated.tf and import the details of the service

- **terraform import aws_resource_type.resource_name resource_id**
   - This command allows you to bring existing resources under Terraform management without destroying or recreating them.
   - To import multiple resources, you'll need to run the terraform import command for each resource separately. There isn't a direct way to import multiple resources at 
     once using a single command in Terraform.

### How to identify the manaual changes made to infrastructure (Scenario-2)

1 we have to setup a cronjob with **terraform refresh** command running in it to refersh the state file 
2 we can also have Strict IAM permissions.
3 Get the cloud watch logs, Lambda functions will have list of resources managed by terraform, whenever there is change made manually on these resorces a notification will be triggered.( need to implement )

### what if we lose the Terraform state file

Losing the Terraform state file can be problematic because it contains critical information about your infrastructure's current state and the relationships between resources. Without the state file, Terraform loses the ability to determine what resources it's managing and how they are configured.
Backups: If you have regular backups of your state file, you can restore it from a backup. This is why it's recommended to back up your state files in a safe and secure location.
 
**Recreate Infrastructure**: If you have access to the configuration files used to create the resources, you can recreate the infrastructure by using those configuration files. However, Terraform will treat this as creating entirely new resources, which might lead to conflicts if the existing resources weren't manually destroyed.
 
**Reimport Resources**: If some of the resources are still available in your cloud environment, you might be able to import them back into Terraform's state. The terraform import command allows you to import existing resources into Terraform's management. This can be complex, as it requires manually matching resources in the cloud with the corresponding resource configurations in your Terraform configuration files.
 
**Collaboration and Documentation**: If you're working in a team, check if any of your team members have a copy of the state file. If not, gather information about the resources from cloud provider consoles, APIs, or other documentation. While this won't recover the state directly, it can help you recreate your infrastructure configuration more accurately.
 
**Rebuilding and Testing**: In the worst-case scenario where the state is entirely lost and there are no backups or documentation available, you might need to start from scratch. This involves recreating your infrastructure configuration, testing thoroughly, and making sure the new resources match the desired state.

### Important
**ssh-keygen -t rsa** -> it will create a public private key on local

**nohup sudo python3 app.py > output.log 2>&1 &** - In background

**protocol is set to "-1," which often means all protocols**

**To create elastic IP and associate with EC2 Instance** - create eip and eip_association

**While refrencing security group, always use- security_groups = ["${aws_security_group.bastion_sg.id}"]**

resource "aws_instance" "example" {
  **Your existing EC2 instance configuration goes here...**
}

resource "aws_eip" "example_eip" {
  instance = aws_instance.example.id # Associate with the specific instance
  **Optionally specify VPC and other settings for the EIP**
}

resource "aws_eip_association" "example_eip_assoc" {
  allocation_id = aws_eip.example_eip.id # Use the ID of the created EIP
  instance_id   = aws_instance.example.id # Use the ID of the EC2 instance
}


## Explain the difference between declarative and imperative programming in the context of infrastructure provisioning. 

In the context of infrastructure provisioning, declarative and imperative programming represent two different paradigms for defining and managing infrastructure. Understanding the difference between these paradigms is crucial for selecting the right approach for your infrastructure management needs.

### Declarative Programming

**Declarative programming** focuses on **what** the desired state of the infrastructure should be, rather than specifying the exact steps to achieve that state. In this paradigm, you define the end state, and the provisioning tool determines how to achieve it.

#### Characteristics:

1. **State Definition:** You specify the desired state of resources, not the steps to create or modify them.
2. **Idempotency:** Applying the same configuration multiple times will not change the system after the initial application if it is already in the desired state.
3. **Automation:** The underlying tool handles the logic to reach the desired state from the current state.
4. **Human-Readable:** Often easier to understand and manage because it focuses on the final configuration.

#### Example: Terraform

Terraform uses a declarative approach to define infrastructure. Here is an example of a Terraform configuration:

```hcl
provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  tags = {
    Name = "example-instance"
  }
}
```

In this example, you declare the desired state of an AWS EC2 instance. Terraform will figure out the necessary steps to create, update, or delete the instance to match this state.

### Imperative Programming

**Imperative programming** focuses on **how** to achieve a specific state by defining the exact commands or steps to follow. In this paradigm, you explicitly define the sequence of operations to perform.

#### Characteristics:

1. **Step-by-Step Instructions:** You provide a sequence of commands to create or modify resources.
2. **Procedural:** The focus is on the procedure and order of operations.
3. **Less Abstraction:** More control over each operation but can be more complex and error-prone.
4. **Not Necessarily Idempotent:** Re-running the same script can have different outcomes if not carefully managed.

#### Example: Bash Script

Here is an example of an imperative approach using a Bash script to provision an AWS EC2 instance:

```bash
#!/bin/bash

# Set AWS region
aws configure set region us-west-2

# Create EC2 instance
INSTANCE_ID=$(aws ec2 run-instances --image-id ami-0c55b159cbfafe1f0 --count 1 --instance-type t2.micro --query 'Instances[0].InstanceId' --output text)

# Add a tag to the instance
aws ec2 create-tags --resources $INSTANCE_ID --tags Key=Name,Value=example-instance

echo "EC2 instance created with ID: $INSTANCE_ID"
```

In this example, you explicitly define each step to configure AWS, create an EC2 instance, and tag it. The script must be run in the correct order to achieve the desired state.

### Key Differences

1. **Focus:**
   - **Declarative:** Focuses on the desired end state.
   - **Imperative:** Focuses on the specific steps to achieve the end state.

2. **Idempotency:**
   - **Declarative:** Naturally idempotent; re-applying the same configuration does not cause changes if the desired state is already achieved.
   - **Imperative:** Requires careful management to ensure idempotency; re-running the script can lead to different outcomes.

3. **Abstraction:**
   - **Declarative:** Higher level of abstraction, hiding the complexity of the underlying operations.
   - **Imperative:** Lower level of abstraction, giving more control over the details of the operations.

4. **Ease of Use:**
   - **Declarative:** Often easier to read and manage due to the focus on end state.
   - **Imperative:** Can be more complex and harder to manage due to the need to define every step explicitly.

### Conclusion

Choosing between declarative and imperative programming for infrastructure provisioning depends on your specific needs:

- **Declarative** approaches like Terraform are generally better for defining infrastructure as code because they simplify the process of managing and maintaining the desired state of infrastructure.
- **Imperative** approaches provide more control and flexibility but require more detailed management and are prone to complexity and errors.

Both paradigms have their use cases, and sometimes a combination of both might be employed to leverage the strengths of each approach.

_____________________________________________________________________________________________________________________________________________________________________________

## Terraform commands used on a daily basis:

1. terraform init:
- Initializes a working directory containing Terraform configuration files.

2. terraform plan:
- Generates an execution plan, outlining actions Terraform will take.

3. terraform apply:
- Applies the changes described in the Terraform configuration.

4. terraform destroy:
- Destroys all resources described in the Terraform configuration.

5. terraform validate:
- Checks the syntax and validity of Terraform configuration files.

6. terraform refresh:
- Updates the state file against real resources in the provider.

7. terraform output:
- Displays the output values from the Terraform state.

8. terraform state list:
- Lists resources within the Terraform state.

9. terraform show:
- Displays a human -readable output of the current state or a specific resource’s state.

10. terraform import:
- Imports existing infrastructure into Terraform state.

11. terraform fmt:
- Rewrites Terraform configuration files to a canonical format.

12. terraform graph:
- Generates a visual representation of the Terraform dependency graph.

13. terraform providers:
- Prints a tree of the providers used in the configuration.

14. terraform workspace list:
- Lists available workspaces.

15. terraform workspace select:
- Switches to another existing workspace.

16. terraform workspace new:
- Creates a new workspace.

17. terraform workspace delete:
- Deletes an existing workspace.

18. terraform output:
- Retrieves output values from a module.

19. terraform state mv:
- Moves an item in the state.

20. terraform state pull:
- Pulls the state from a remote backend.

21. terraform state push:
- Pushes the state to a remote backend.

22. terraform state rm:
- Removes items from the state.

23. terraform taint:
- Manually marks a resource for recreation.

24. terraform untaint:
- Removes the ‘tainted’ state from a resource.

25. terraform login:
- Saves credentials for Terraform Cloud.

26. terraform logout:
- Removes credentials for Terraform Cloud.

27. terraform force -unlock:
- Releases a locked state.

28. terraform import:
- Imports existing infrastructure into your Terraform state.

29. terraform plan -out:
- Saves the generated plan to a file.

30. terraform apply -auto -approve:
- Automatically applies changes without requiring approval.

31. terraform apply -target=resource:
- Applies changes only to a specific resource.

32. terraform destroy -target=resource:
- Destroys a specific resource.

33. terraform apply -var=”key=value”:
- Sets a variable’s value directly in the command line.

34. terraform apply -var -file=filename.tfvars:
- Specifies a file containing variable definitions.

35. terraform apply -var -file=filename.auto.tfvars:
- Automatically loads variables from a file.

________________________________________________________________________________________________________________________________________________________________________________________

## What is terraform sentinal configuration?

Terraform Sentinel is a policy-as-code framework used to enforce governance and compliance policies on Terraform infrastructure configurations. It allows organizations to define, enforce, and automate compliance policies across their infrastructure managed by Terraform.

### Key Concepts of Terraform Sentinel

1. **Policy-as-Code:** Policies are written as code, allowing them to be version-controlled, reviewed, and automated.
2. **Enforcement Levels:** Policies can be enforced at different levels (e.g., advisory, soft-mandatory, hard-mandatory), allowing flexible policy enforcement.
3. **Integration with Terraform Enterprise/Cloud:** Sentinel policies are integrated with Terraform Enterprise and Terraform Cloud, providing a way to enforce policies during the plan, apply, and destroy phases.

### Components of Sentinel

1. **Policies:** The rules that define what is and isn't allowed. These are written in the Sentinel language.
2. **Imports:** Sentinel can import data from different sources, such as Terraform configurations, plans, and states, to use in policy evaluations.
3. **Rules:** These define the logic within policies. Rules can be used to allow or deny actions based on specific conditions.

### Writing a Basic Sentinel Policy

#### Example Policy: Restricting Instance Types

Let's say you want to enforce a policy that only allows certain EC2 instance types. Here's how you could write such a policy in Sentinel.

1. **Create the Sentinel Policy File:**

Create a file named `restrict_instance_types.sentinel`.

```hcl
# Import the tfplan/v2 import
import "tfplan/v2" as tfplan

# Define the list of allowed instance types
allowed_instance_types = [
  "t2.micro",
  "t2.small",
  "t3.micro"
]

# Get the planned resources
instances = filter tfplan.resources as _, resource {
  resource.type is "aws_instance"
}

# Define the main rule
main = rule {
  all instances as instance {
    instance.applied.instance_type in allowed_instance_types
  }
}
```

### Steps to Implement Sentinel Policies

1. **Write the Policy:**
   Write your policies in the Sentinel language, saving them with a `.sentinel` extension.

2. **Upload the Policy to Terraform Cloud/Enterprise:**
   - Navigate to your Terraform Cloud/Enterprise workspace.
   - Go to the "Policies" section.
   - Add a new policy by uploading your `.sentinel` file.

3. **Apply the Policy to Workspaces:**
   Attach the policy to the relevant workspaces. This ensures the policy is enforced whenever a plan or apply action is performed.

4. **Run Terraform Operations:**
   When you run `terraform plan` or `terraform apply`, the Sentinel policies will be evaluated. Depending on the enforcement level, the operation might proceed, provide warnings, or be blocked entirely if the policies are violated.

### Example Scenario: Enforcing the Policy

When you run `terraform plan` or `terraform apply`, Terraform Cloud/Enterprise will evaluate the policy:

- **Allowed Instance Type:**
  If the instance type is in the allowed list (e.g., `t2.micro`), the operation proceeds.

- **Disallowed Instance Type:**
  If the instance type is not in the allowed list (e.g., `m4.large`), the operation will be blocked with a policy violation message.

### Conclusion

Terraform Sentinel is a powerful tool for enforcing compliance and governance policies in your infrastructure as code workflows. By writing policies in the Sentinel language and integrating them with Terraform Cloud/Enterprise, you can ensure that your infrastructure adheres to organizational standards and best practices. This helps in maintaining security, compliance, and operational consistency across your deployments.
