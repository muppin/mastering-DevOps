### Providers

- Provider is plugin, that helps terraform to where it has to create the infrastructure. Basically it acts as a medium between terraform and aws.
- we can also create multi-region resources, say for example ec2 can be created on both us-east-1 and us-west-1 simultaneously.
- we can also create resources on multiple cloud providers, for ex: Azure and AWS by declaring 2 provider blocks.

### Variables

- Instead of hardcoding the values in the conf files, we use variables
- There are 2 types of variables
    - Input - to provide the values to the configuration files, we write variables.tf file.
    - Output - this shows the output on the console, we have to mention the fields which has to output in the outputs.tf file.

**terraform.tfvars**

- this will update or pass the values to the variables.tf files, instead of hardcoding the variables.tf files we pass the values using .tfvars file
- this is useful when there are multiple environments and you can have .tfvars for each one.

### Condition expressions

- refer this *https://github.com/iam-veeramalla/terraform-zero-to-hero/blob/main/Day-2/08-conditional-expressions.md#conditional-expressions*

### Terraform functions

- these are built-in functions available in Terraform
- The Terraform language includes a number of built-in functions that you can call from within expressions to transform and combine values. The general syntax for function calls is a function name followed by comma-separated arguments in parentheses
- The Terraform language does not support user-defined functions, and so only the functions built in to the language are available for use
- For ex:
   -  concat(list1, list2)
   -  element(list, index)
   -  length(list)
   -  map(key, value): Creates a map from a list of keys and a list of values.
  

For more information *https://github.com/iam-veeramalla/terraform-zero-to-hero/blob/main/Day-2*

### Terraform State file

- The Terraform state file is a crucial component of Terraform that helps it keep track of the resources it manages and their current state.
- This file, often named terraform.tfstate, is a JSON or HCL (HashiCorp Configuration Language) formatted file that contains important information about the infrastructure's current state, such as resource attributes, dependencies, and metadata.

Advantages of State file
- Resource tracking - keeps track of resources, attributes and dependencies so that we can update and destroy easily.
- Concurrency Control - tf uses statefile to lock resources, so multiple users dont modify simultaneously.
- Plan Configuration - tf uses statefile to display difference between desired state(tf code) and actual state(infrastructure)
- Resource Metadata - stores all metadata about each resource, like unique identifiers which is crucial for managing resources.

  ___________________________________________________________________________________________________________________________________________________________________________________________

### Terraform Locals

In Terraform, "locals" is a feature that allows you to declare reusable values within your configuration. These values can be used across multiple resources, modules, or expressions within your Terraform code. Locals are defined within the `locals` block and are scoped to the module or configuration where they are declared.

Here's a breakdown of how Terraform locals work:

1. **Declaration:** Locals are defined using the `locals` block within your Terraform configuration. Inside this block, you specify the names and values of the variables you want to define.

2. **Reusable Values:** Locals are useful for defining values that are used repeatedly within your configuration. Instead of repeating the same value in multiple places, you define it once as a local and reference it wherever needed.

3. **Scoping:** Locals are scoped to the module or configuration where they are defined. This means they are only accessible within the same module or configuration file.

4. **Immutable:** Locals are immutable, meaning their values cannot be changed once they are defined. They are evaluated only once during Terraform's execution and remain constant throughout the execution.

5. **Syntax:** The syntax for defining locals looks like this:
   ```hcl
   locals {
     variable_name = value
     another_variable = "some_value"
     staging_env = "staging"
   }
   ```

6. **Usage:** Locals are referenced using the `local` keyword followed by the name of the local variable. For example:
   ```hcl
   resource "aws_instance" "example" {
     instance_type = local.instance_type
     ami           = local.ami_id
     // other arguments
   }
   ```

By using locals, you can make your Terraform configurations more concise, easier to read, and maintainable by centralizing the definition of reusable values. It also helps in avoiding duplication of values and promotes consistency across your infrastructure code.

______________________________________________________________________________________________________________________________________________________________________________________

### Difference between Variables and locals

- **Scope:** Variables are globally accessible within a module or configuration, while locals are scoped to the module or block where they are defined.
- **Mutability:** Variables can have their values changed dynamically, while locals are immutable.
- **Use Cases:** Variables are primarily used for configuration customization and parameterization, while locals are used for defining reusable values or expressions within a single 
    module or configuration block.

In summary, variables are used for input configuration and customization, while locals are used for internal configuration and reducing duplication within your Terraform code.
Drawbacks


