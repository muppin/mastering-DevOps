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

resource "aws_instance" "example" {
  ### Your existing EC2 instance configuration goes here...
}

resource "aws_eip" "example_eip" {
  instance = aws_instance.example.id # Associate with the specific instance
  ### Optionally specify VPC and other settings for the EIP
}

resource "aws_eip_association" "example_eip_assoc" {
  allocation_id = aws_eip.example_eip.id # Use the ID of the created EIP
  instance_id   = aws_instance.example.id # Use the ID of the EC2 instance
}



