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

For more information *https://github.com/iam-veeramalla/terraform-zero-to-hero/blob/main/Day-2*
