## Terraform Commands

### terraform init
To initialize a Terraform project.

### terraform init -upgrade
The `terraform init -upgrade` command is used to upgrade Terraform modules to the latest available versions. It checks for updates to the modules specified in your configuration files and downloads the latest versions.

### terraform plan
Displays resources to be created.

### terraform apply
Creates infrastructure.

### terraform validate
Checks syntax.

### terraform fmt
Formats the code.

### terraform destroy
Destroys infrastructure.

### terraform show
Displays the state file.

### terraform apply -var-file=stage.tfvars
Creates infrastructure using a specific tfvars file.

## Workspace Commands

### terraform workspace new <name>
Creates a new workspace.

### terraform workspace select <name>
Switches between workspaces.

### terraform workspace list
Lists all created workspaces.

### terraform workspace show
Displays the current workspace.

### terraform workspace delete <name>
Deletes a workspace.
