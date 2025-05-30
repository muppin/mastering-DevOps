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
- By default TF will take terraform.tfvars only, but suppose if u have prod.tfvars and staging.tfvars then you have to pass it in terraform apply command.
- terraform apply -var-file=prod.tfvars
- If u don't want to push sensitive info to git repo, in that case also tfvars file is useful, we can ignore this particular file in gitignore.

### Provioners

Provisioners in Terraform are used to execute scripts or commands on a resource after it has been created or destroyed. They allow you to perform tasks such as installing software, configuring settings, or running initialization scripts on the provisioned resources.

There are two types of provisioners in Terraform:

1. **Remote Exec**: These provisioners execute scripts or commands on the provisioned resource over SSH or WinRM connections. They are typically used for tasks such as bootstrapping instances or configuring software.

   - **`remote-exec`**: Executes commands on a remote resource over SSH or WinRM.
   - **`file`**: Uploads files from the local machine to the remote resource over SSH or WinRM.

   Example:
   ```hcl
   resource "aws_instance" "example" {
     # Instance configuration...

     provisioner "remote-exec" {
       inline = [
         "echo 'Hello, World!' > /tmp/hello.txt",
         "sudo apt-get update",
         "sudo apt-get install -y nginx",
       ]
     }
   }
   ```

2. **Local Exec**: These provisioners execute scripts or commands on the machine running Terraform, rather than on the provisioned resource itself. They are typically used for tasks such as initializing local configurations or running post-deployment validation scripts.

   - **`local-exec`**: Executes commands on the local machine running Terraform.

   Example:
   ```hcl
   resource "null_resource" "example" {
     # Resource configuration...

     provisioner "local-exec" {
       command = "echo 'Resource provisioned.'"
     }
   }
   ```

Provisioners are useful for performing tasks that cannot be managed directly by Terraform's resource configuration, such as complex initialization processes or post-deployment configuration. However, they should be used with caution, as they introduce dependencies and can lead to issues with idempotence and reproducibility in your infrastructure management workflow. Whenever possible, it's recommended to use configuration management tools or cloud-init scripts for more complex provisioning tasks.

### Can you show me an example of using triggers in null resource with a real-world use case? 

A real-world use case of using `triggers` in a Terraform `null_resource` might involve managing infrastructure dependencies that aren't natively supported by Terraform. Let's explore an example related to cloud infrastructure where a `null_resource` is used to execute a custom script when specific conditions are met.

#### Scenario: Custom Script Execution after EC2 Instance IP Change

Imagine you have an application running on an AWS EC2 instance, and you need to update a DNS record whenever the public IP address of the instance changes. Terraform does not have native support to handle this directly, so you use a `null_resource` with `triggers` to manage the execution of a script that updates the DNS record.

#### Use Case: Update DNS Record When EC2 Public IP Changes

1. **Infrastructure Setup**:
   - You provision an EC2 instance using Terraform.
   - The public IP address of this instance is assigned dynamically by AWS.

2. **Requirement**:
   - Whenever the EC2 instance's public IP changes, a DNS record (e.g., in Route 53) needs to be updated to point to the new IP.

3. **Solution**:
   - You use a `null_resource` with `triggers` to detect changes in the EC2 instance's public IP address.
   - When the IP changes, the `null_resource` will run a script that updates the DNS record.

Here’s a Terraform configuration example for this scenario:

```hcl
provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"
}

# Fetch the public IP of the EC2 instance
data "aws_instance" "app_instance" {
  instance_id = aws_instance.app_server.id
}

# Null resource to trigger DNS update when the public IP changes
resource "null_resource" "update_dns" {
  triggers = {
    instance_public_ip = data.aws_instance.app_instance.public_ip
  }

  provisioner "local-exec" {
    command = <<EOT
      ./update_dns.sh ${self.triggers.instance_public_ip}
    EOT
  }
}
```

#### Breakdown:
- **`aws_instance` Resource**: Provisions the EC2 instance.
- **`data.aws_instance` Data Source**: Retrieves the public IP of the EC2 instance.
- **`null_resource.update_dns`**: Uses the `triggers` block to monitor changes to the public IP. If the IP changes, the `null_resource` will execute the script `update_dns.sh` with the new IP address as an argument.

#### Script Example (`update_dns.sh`):
This script could be something simple that uses the AWS CLI to update a DNS record in Route 53:

```bash
#!/bin/bash

NEW_IP=$1
HOSTED_ZONE_ID="Z1234567890ABC"
DNS_NAME="app.example.com"

aws route53 change-resource-record-sets --hosted-zone-id $HOSTED_ZONE_ID --change-batch '
{
  "Comment": "Update DNS record",
  "Changes": [
    {
      "Action": "UPSERT",
      "ResourceRecordSet": {
        "Name": "'"$DNS_NAME"'",
        "Type": "A",
        "TTL": 300,
        "ResourceRecords": [
          {
            "Value": "'"$NEW_IP"'"
          }
        ]
      }
    }
  ]
}'
```

#### Explanation:
- **Triggers**: The `triggers` block monitors the `instance_public_ip`. Whenever this value changes (e.g., if the instance is recreated or its IP is reassigned), Terraform will re-execute the `null_resource`.
- **Script Execution**: The script `update_dns.sh` is executed via the `local-exec` provisioner to update the DNS record with the new public IP.

This approach allows Terraform to handle custom operations based on changes in infrastructure state, even when those operations are outside Terraform's native functionality.

### Condition expressions

- refer this *https://github.com/iam-veeramalla/terraform-zero-to-hero/blob/main/Day-2/08-conditional-expressions.md#conditional-expressions*

### Modules:
**Advantages**
- Provides ownership to the code.
- Maintenance of code is easy.
- Easy to debug and test.
- Reusability.

Without modules, you write all the code in one main.tf file, that is difficult to understand, debug and test. That's why modules are used.

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

**Drawbacks**
The statefile in Terraform serves as a crucial component for tracking the state of the infrastructure managed by Terraform. However, it does come with some drawbacks:

- Centralized Management: The statefile is typically stored in a centralized location (e.g., local file system, remote storage), which means that it can become a single point of failure. If the statefile becomes corrupted or inaccessible, it can lead to inconsistencies and difficulties in managing the infrastructure.

- Security Risks: Depending on where the statefile is stored, there may be security risks associated with exposing sensitive infrastructure details. For example, storing the statefile in a version control system without proper access controls could expose infrastructure secrets to unauthorized users.

- Limited Visibility and Tracking: The statefile provides a snapshot of the infrastructure at a particular point in time. However, it may not offer comprehensive visibility into the history of changes or detailed tracking of modifications over time. This can make it difficult to troubleshoot issues or audit changes effectively.

- Scaling Challenges: As the complexity and scale of the infrastructure managed by Terraform grow, the size of the statefile can also increase significantly. This can lead to performance issues, longer processing times, and challenges in maintaining and managing the statefile efficiently.

**Overcoming Disadvantages with Remote Backends (e.g., S3)**:

- A remote backend stores the Terraform state file outside of your local file system and version control. Using S3 as a remote backend is a popular choice due to its reliability and scalability. Here's how to set it up:

- Create an S3 Bucket: Create an S3 bucket in your AWS account to store the Terraform state. Ensure that the appropriate IAM permissions are set up.

- Configure Remote Backend in Terraform:

#### In your Terraform configuration file (e.g., main.tf), define the remote backend.
```
terraform {
  backend "s3" {
    bucket         = "your-terraform-state-bucket"
    key            = "path/to/your/terraform.tfstate"
    region         = "us-east-1" # Change to your desired region
    encrypt        = true
    dynamodb_table = "your-dynamodb-table"
  }
}
```
- Replace "your-terraform-state-bucket" and "path/to/your/terraform.tfstate" with your S3 bucket and desired state file path.

- DynamoDB Table for State Locking:

- To enable state locking, create a DynamoDB table and provide its name in the dynamodb_table field. This prevents concurrent access issues when multiple users or processes run Terraform.

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

- **Scope:** Variables are globally accessible within a module or configuration, while locals are scoped to the module or block where they are defined. A variable can be scoped globally, while a local is only accessible within the local module.
- **Mutability:** Variables can have their values changed dynamically, while locals are immutable. A local's value doesn't change once assigned, while a variable's value can be manipulated via expressions.
- **Use Cases:** Variables are primarily used for configuration customization and parameterization, while locals are used for defining reusable values or expressions within a single 
    module or configuration block.

In summary, variables are used for input configuration and customization, while locals are used for internal configuration and reducing duplication within your Terraform code.

_________________________________________________________________________________________________________________________________________________________________________________________

### Loops

- Loops work with collections like list, map or sets.
- For each loop works only with sets or maps not with list.

In Terraform, you can use different constructs to iterate over lists or maps and perform actions based on each element. Three commonly used constructs for iteration are the `for` expression, the `for_each` meta-argument, and the `count` meta-argument.

**1. For**

- With for loops you can iterate through a list, a set, a tuple, a map, or an object.

- for loops can produce different results depending on how they are declared, the type of brackets decide the result type.

- **It’s important to know that for loops are used to manipulate and transform values and not delegate the creation of N instances of a resource - we use the count or for_each argument to achieve that.**

#### Declaring a for loop that produces a tuple #

Here we’re storing the names coming from a data source into a local named regions using a for loop.
```
data "aws_regions" "available" {}

locals {
  regions = [for name in data.aws_regions.available.names : name]
}
```

#### Optionally we could extract the index from the for loop using a second symbol right after the for keyword.

data "aws_regions" "available" {}
```
locals {
  regions_indices = [for index, name in data.aws_regions.available.names : index]
}
```
In the above example, regions_indices its value is a tuple containing the indices (0, 1, 2, etc) of the region names.

#### Declaring a for loop that produces an object #

- If we use curly braces to annotate our for loop, we produce an object. When producing an object we must provide an additional expression using =>, this constructs the values of the object for each key we iterate through.
```
locals {
  numbers         = [2, 4, 6]
  squared_numbers = {for number in local.numbers : number => number * number}
}
```
The above example produces the following object:
```
$ terraform console
> local.squared_numbers
{
  "2" = 4
  "4" = 16
  "6" = 36
}
```

#### Declare a for loop that filters out elements #

- Optionally you can include an if clause in the for loop to filter out elements.

data "aws_regions" "available" {}
```
locals {
  regions = [for name in data.aws_regions.available.names : name if != ""]
}
```

**2. `for_each` Meta-Argument:**
The `for_each` meta-argument allows you to create multiple instances of a resource or module based on the elements of a map. It's useful when you want to manage a collection of resources where each element has a unique identifier.

Example:
```hcl
variable "subnets" {
  type = map(string)
  default = {
    subnet1 = "10.0.1.0/24"
    subnet2 = "10.0.2.0/24"
  }
}

resource "aws_subnet" "example" {
  for_each = var.subnets

  vpc_id            = "vpc-12345678"
  cidr_block        = each.value
  availability_zone = "${var.availability_zone}"
}
```

Here, `for_each` iterates over the `subnets` map, creating a subnet resource for each element. Each subnet is uniquely identified by its key in the map.

**3. `count` Meta-Argument:**
The `count` meta-argument specifies the number of resource instances to create. It's typically used when you want to create a fixed number of instances of a resource, such as in a simple array or list.

Example:
```hcl
variable "instance_count" {
  type    = number
  default = 3
}

resource "aws_instance" "example" {
  count         = var.instance_count
  ami           = "ami-12345678"
  instance_type = "t2.micro"
}
```

In this example, `count` determines the number of `aws_instance` resources to create based on the value of the `instance_count` variable.

Each of these constructs has its own use cases and advantages, so choose the one that best fits your requirements based on the structure of your data and the desired outcome.

________________________________________________________________________________________________________________________________________________________________________________________
### Dynamic blocks

Dynamic blocks in Terraform provide a way to create repetitive blocks of configuration dynamically, based on the elements of a list, set, or map. This allows for more flexible and concise configuration, especially when dealing with repetitive resource definitions or complex configurations.

Here's a basic overview of how dynamic blocks work:

1. **Syntax:**
   Dynamic blocks are defined using the `dynamic` keyword followed by the name of the block you want to generate dynamically. Within the dynamic block, you use the `for_each` or `content` argument to specify how the block should be generated.
   ```hcl
               variable "ports" {
              type = list(number)
              default = [80, 443, 8080]
            }
            
            resource "aws_security_group" "example" {
              name        = "example-security-group"
              description = "Example security group"
            
              dynamic "ingress" {
                for_each = var.ports
                content {
                  from_port   = ingress.value
                  to_port     = ingress.value
                  protocol    = "tcp"
                  cidr_blocks = ["0.0.0.0/0"]
                }
              }
            }
   ```


2. **`for_each` Argument:**
   - When using `for_each`, you specify a collection (set, or map) and Terraform iterates over each element in the collection, dynamically creating a block for each element.
   - Each iteration provides access to the current element's attributes, which can be referenced within the dynamic block using the `value` keyword.

3. **`content` Argument:**
   - Alternatively, you can use the `content` argument to dynamically generate blocks based on arbitrary expressions or calculations.
   - This allows for more complex logic or dynamic configurations, where the structure of the block may depend on other factors beyond simple iteration.

4. **Use Cases:**
   - Dynamic blocks are commonly used when you have a variable number of similar configurations to define, such as security group rules, subnet definitions, or tags.
   - They help reduce duplication and improve readability by centralizing repetitive configuration patterns.

5. **Benefits:**
   - Provides a concise and flexible way to generate repetitive configuration blocks based on dynamic data.
   - Allows for dynamic configuration based on the contents of lists, sets, or maps, enabling more dynamic and data-driven infrastructure definitions.

6. **Considerations:**
   - While dynamic blocks offer flexibility, they should be used judiciously to maintain clarity and readability in your Terraform configurations.
   - Care should be taken to ensure that dynamic configurations remain manageable and understandable, especially as complexity increases.

Overall, dynamic blocks are a powerful feature of Terraform that enable more dynamic, concise, and data-driven configurations, particularly in scenarios where repetitive configurations need to be generated based on dynamic data or conditions.
___________________________________________________________________________________________________________________________

### Terraform datasources

Certainly! In Terraform, data sources are used to retrieve information from an existing infrastructure or external source, and then use that information within the Terraform configuration. Data sources are defined using the `data` block in a Terraform configuration file. Here is a basic syntax for a data source block:

```hcl
data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}
```

In this example, the data source is named `aws_ami` and has the alias `latest_amazon_linux`. It retrieves information about the latest Amazon Linux AMI (Amazon Machine Image) from AWS. This data source does not create any resources; instead, it allows you to refer to attributes of the retrieved AMI within your Terraform configuration.

Here's a breakdown of the key components:

- `data`: Indicates the beginning of a data source block.
- `aws_ami`: The type of data source, in this case, fetching information about an Amazon Machine Image on AWS.
- `latest_amazon_linux`: An alias for this specific instance of the data source. This alias is used to refer to the data source in other parts of your Terraform configuration.
- `most_recent` and `owners`: Parameters specific to the AWS data source, indicating that you want the most recent AMI owned by the specified AWS account.
- `filter`: A block inside the data source to further filter the results based on certain criteria.

You can then reference attributes of the data source elsewhere in your configuration. For example:

```hcl
resource "aws_instance" "example" {
  ami           = data.aws_ami.latest_amazon_linux.id
  instance_type = "t2.micro"
  # other configuration...
}
```

In this case, the `ami` attribute of the `aws_instance` resource is set to the `id` attribute of the `latest_amazon_linux` data source, effectively using the information retrieved by the data source in the creation of a new AWS instance.

Data sources are powerful because they allow you to dynamically incorporate information from your infrastructure or external services into your Terraform configuration. This makes your configurations more flexible and adaptable to changes in the environment.

__________________________________________________________________________________________________________________________________________________________________________________________

## Terraform Dependencies

### Implicit Dependencies:

Implicit dependencies in Terraform are those that Terraform automatically detects based on how resources are referenced within your configuration files. Terraform analyzes these references to determine the order in which resources should be created, updated, or destroyed.

Consider an example where we have an S3 bucket and an AWS Lambda function. The Lambda function requires the S3 bucket to be created before it can be deployed because it needs to read from or write to the bucket.

```hcl
// Define the S3 bucket
resource "aws_s3_bucket" "example_bucket" {
  bucket = "example-bucket"
  // Additional configuration...
}

// Define the Lambda function
resource "aws_lambda_function" "example_lambda" {
  function_name = "example_lambda_function"
  // Additional configuration...

  // Lambda function requires access to the S3 bucket
  // Terraform detects this reference and creates an implicit dependency
  s3_bucket = aws_s3_bucket.example_bucket.id
}
```

In this example:

- Terraform detects that the Lambda function references the S3 bucket through the `s3_bucket` attribute.
- Therefore, it automatically creates a dependency where the Lambda function depends on the S3 bucket.
- When Terraform executes the configuration, it ensures that the S3 bucket is created before attempting to create the Lambda function.

### Explicit Dependencies:

Explicit dependencies in Terraform are defined using the `depends_on` parameter within a resource block. You use explicit dependencies when you need to specify dependencies that Terraform cannot infer automatically or when you want to enforce a specific order of resource creation, update, or deletion.

Let's extend the previous example to include an IAM role that the Lambda function assumes. We want to ensure that the IAM role is created before the Lambda function is deployed.

```hcl
// Define the IAM role
resource "aws_iam_role" "example_role" {
  name = "example_lambda_role"
  // Additional configuration...
}

// Define the Lambda function
resource "aws_lambda_function" "example_lambda" {
  function_name = "example_lambda_function"
  // Additional configuration...

  // Lambda function requires access to the S3 bucket
  s3_bucket = aws_s3_bucket.example_bucket.id

  // Lambda function assumes the IAM role
  // We specify an explicit dependency using depends_on
  depends_on = [aws_iam_role.example_role]
}
```

In this example:

- We define an IAM role (`aws_iam_role.example_role`) before the Lambda function.
- We use the `depends_on` parameter in the Lambda function resource block to specify that the Lambda function depends explicitly on the IAM role.
- This ensures that Terraform creates the IAM role before attempting to create the Lambda function.

Explicit dependencies give you control over the order of resource creation, especially in complex scenarios where implicit dependencies might not be sufficient or accurate.

______________________________________________________________________________________________________________________________________________________________________________________

### Code for AWS Lambda with S3 (using dependencies)

```hcl
// Define the S3 bucket
resource "aws_s3_bucket" "example_bucket" {
  bucket = "example-bucket45678"
  
}

resource "aws_s3_object" "example_object" {
  bucket = aws_s3_bucket.example_bucket.id
  key    = "ayushi/hello-python.zip"  # Specify your desired key for the object
  source = "C:/Users/avasishtha/learningTerraform/terraform-zero-to-hero/Dependencies/python/hello-python.zip"  # Specify the local file path you want to upload
  
  # Additional optional configurations
  acl    = "private"  # Access Control List (ACL) for the object (e.g., private, public-read)
}

// Define the IAM role
resource "aws_iam_role" "example_role" {
  name = "example_lambda_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

// Define the IAM policy
resource "aws_iam_policy" "example" {
  name        = "example-policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ]
      Resource = ["arn:aws:logs:*:*:*"]
    },{
      Effect = "Allow"
      Action = [
        "ec2:CreateNetworkInterface",
        "ec2:DescribeNetworkInterfaces",
        "ec2:DeleteNetworkInterface"
      ]
      Resource = ["*"]
    }]
  })
}

resource "aws_iam_role_policy_attachment" "example" {
  policy_arn = aws_iam_policy.example.arn
  role = aws_iam_role.example_role.name
}

# Generates an archive from content, a file, or a directory of files.

data "archive_file" "zip_the_python_code" {
 type        = "zip"
 source_dir  = "C:/Users/avasishtha/learningTerraform/terraform-zero-to-hero/Dependencies/python/"
 output_path = "C:/Users/avasishtha/learningTerraform/terraform-zero-to-hero/Dependencies/python/hello-python.zip"
}

// Define the Lambda function
resource "aws_lambda_function" "example_lambda" {
  function_name = "example_lambda_function"
  role = aws_iam_role.example_role.arn
  runtime = "python3.8"
  handler = "hello-python.lambda_handler"

  // Lambda function requires access to the S3 bucket
  // Terraform detects this reference and creates an implicit dependency
  s3_bucket = aws_s3_bucket.example_bucket.id
  s3_key = aws_s3_object.example_object.key
  // Lambda function assumes the IAM role
  // We specify an explicit dependency using depends_on
  depends_on = [aws_iam_role_policy_attachment.example]
}
```
__________________________________________________________________________________________________________________________________________________________________________________________

### AWS Lambda with Terraform

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/7dab9235-df31-4fc4-8af2-dca35cf192c4)

- here code means, python code + terraform code (main.tf)
- then in second step, we need to zip the python code
- after that upload the zipped file to AWS lambda

**Project structure**
![image](https://github.com/muppin/mastering-DevOps/assets/56094875/21a14cf1-bf0e-462c-845d-9592ff1c1802)

- Once we execute the main.tf, it will create zip file with the help of data block.
- This zip file will be created inside the python folder
- ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/18d63b8d-a3a7-4073-809b-d8704b78c0cb)

__________________________________________________________________________________________________________________________________________________________________________________________

### AWS S3 

```hcl
/ Define the S3 bucket
resource "aws_s3_bucket" "example_bucket" {
  bucket = "example-bucket45678"
  
}

resource "aws_s3_object" "example_object" {
  bucket = aws_s3_bucket.example_bucket.id
  key    = "ayushi/hello-python.zip"  # Specify your desired key for the object
  source = "C:/Users/avasishtha/learningTerraform/terraform-zero-to-hero/Dependencies/python/hello-python.zip"  # Specify the local file path you want to upload
  
  # Additional optional configurations
  acl    = "private"  # Access Control List (ACL) for the object (e.g., private, public-read)
}
```
________________________________________________________________________________________________________________________________________________________________________________________

### Null resource

- Null resource will not create any resource
- it is used to run commands, scripts, playbooks etc.
- ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/58fcf3d6-46e6-4a03-8fe3-88fb3bb7abca)

- If the id is changed then it will trigger the provisioner (local exec
- If u write a null resource without trigger, it will only execute once.
- When u again do terraform apply, null resource will not be created
- Therefor null resource will only be executed if there is a change in ID.

  **Use Case** - Suppose we change the instance type/ami_id from t2-micro to t2-small, the id (aws_instance.example.type) inside the trigger block will be updated, which will trigger the provisioner to execute commands, scripts on a new instance.


```hcl
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "Instance1" {
  instance_type = "t2.micro"
  ami = "ami-0c7217cdde317cfec" # change this
  subnet_id = "subnet-0e74b3f0aec8bc739" # change this
}


resource "null_resource" "Null_example" {

    triggers = {
        id = timestamp()
    }
  provisioner "local-exec" {
    command = "echo hello world!"
  }
}
```
___________________________________________________________________________________________________________________________

### tfenv

- It is a utility of terraform and this tool helps you to manage and install multiple different versions of terraform.
- We need to install explicitly
- why do we need this? to upgarde or rollback to the specific version.
- Installation steps:
   - git clone https://github.com/tfutils/tfenv.git ~/.tfenv
   - echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> ~/.bashrc
   - source ~/.bashrc


**Commands**
- tfenv -v
- tfenv list-remote  (List installable versions)
- tfenv list (List installed versions)
- tfenv install *version*
- tfenv install latest
- tfenv use *version*
- tfenv uninstall *version*

