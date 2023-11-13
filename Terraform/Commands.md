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
