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
- 
