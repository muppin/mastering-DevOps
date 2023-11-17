provider "aws" {
    region = "us-east-1" 

}

variable "cidr"  {
    default =  "10.0.0.0/16"  
}

resource "aws_vpc" "vpc1" {
    cidr_block = var.cidr
}


resource "aws_subnet" "public_sub1" {
    vpc_id = aws_vpc.vpc1.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true
}

resource "aws_subnet" "public_sub2" {
    vpc_id = aws_vpc.vpc1.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1b"
    map_public_ip_on_launch = true
}

resource "aws_subnet" "private_sub1" {
    vpc_id = aws_vpc.vpc1.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "us-east-1a"
}

resource "aws_subnet" "private_sub2" {
    vpc_id = aws_vpc.vpc1.id
    cidr_block = "10.0.3.0/24"
    availability_zone = "us-east-1b"
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc1.id
     
}

resource "aws_route_table" "rt"{
    vpc_id = aws_vpc.vpc1.id
    route  {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
     }
}

resource "aws_route_table_association" "rtas1" {
    subnet_id = aws_subnet.private_sub1.id
    route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "rtas2" {
    subnet_id = aws_subnet.private_sub2.id
    route_table_id = aws_route_table.rt.id
}

resource "aws_security_group" "sg" {
    name = "sg"
    vpc_id = aws_vpc.vpc1.id

    ingress {
        description = "ssh"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
            }

    ingress {
        description = "custom"
        from_port = 8000
        to_port = 8000
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
            }

    egress {
        description = "outbound"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
            }
}


resource "aws_launch_template" "foobar" {
  name_prefix   = "foobar"
  image_id      = "ami-0e83be366243f524a"
  instance_type = "t2.micro"
  security_group_names = ["sg"]
  }

resource "aws_autoscaling_group" "bar" {
  #availability_zones = ["us-east-1a", "us-east-1b"]
  desired_capacity   = 2
  max_size           = 4
  min_size           = 1
  vpc_zone_identifier  = [aws_subnet.private_sub1.id, aws_subnet.private_sub2.id]

  launch_template {
    id      = aws_launch_template.foobar.id
    version = "$Latest"
  }
}



resource "aws_key_pair" "demo1" {
    key_name = "terraform-demo1"
    public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "bastion" {
    ami = "ami-0e83be366243f524a"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public_sub1.id
    vpc_security_group_ids = ["sg"]
    associate_public_ip_address = true
    key_name      = aws_key_pair.demo1.key_name 
}

resource "aws_security_group" "sg2" {
    name = "sg2"
    vpc_id = aws_vpc.vpc1.id

    ingress {
        description = "custom"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
            }

    egress {
        description = "outbound"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
            }
}
resource "aws_lb" "example" {
  name               = "example-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["sg2"]
  subnets            = ["aws_subnet.public_sub1.id" , "aws_subnet.public_sub2.id" ]

  enable_deletion_protection = false
  enable_http2              = true
  enable_cross_zone_load_balancing = true

  # Add more ALB configurations as needed
}

resource "aws_lb_target_group" "example" {
  name     = "example-target-group"
  port     = 8000
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc1.id
  target_type = "instance"

  health_check {
    path     = "/"
    protocol = "HTTP"
    matcher  = "200-399"
    timeout  = 3
  }

  # Add more target group configurations as needed
}

resource "aws_autoscaling_attachment" "example" {
  autoscaling_group_name = aws_autoscaling_group.bar.id
  lb_target_group_arn    = aws_lb_target_group.example.arn
}

resource "aws_lb_listener" "example_listener" {
    load_balancer_arn = aws_lb.example.arn
    port = 80
    protocol = "HTTP"
    default_action {
        type = "forward"    
        target_group_arn = aws_lb_target_group.example.arn
    }
}

__________________________________________________________________________________________________________________



provider "aws" {
  region = "us-east-1" # Specify your desired AWS region
}

# Create VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "my-vpc"
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "my-igw"
  }
}

# Create two public subnets
resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-2"
  }
}

# Create two private subnets
resource "aws_subnet" "private_subnet_1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-east-1a"
  tags = {
    Name = "private-subnet-1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = "us-east-1b"
  tags = {
    Name = "private-subnet-2"
  }
}

# Create a route table for public subnets
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
  tags = {
    Name = "public-route-table"
  }
}

# Associate public subnets with the public route table
resource "aws_route_table_association" "public_subnet_association_1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_subnet_association_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_route_table.id
}

# Create a route table for private subnets
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.my_nat_gateway.id
  }
  tags = {
    Name = "private-route-table"
  }
}

# Associate private subnets with the private route table
resource "aws_route_table_association" "private_subnet_association_1" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_subnet_association_2" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_route_table.id
}


# Create a NAT gateway in the public subnet
resource "aws_nat_gateway" "my_nat_gateway" {
  allocation_id = aws_eip.my_eip.id
  subnet_id     = aws_subnet.public_subnet_1.id
}

# Allocate an Elastic IP for the NAT gateway
resource "aws_eip" "my_eip" {
    
}

# (Optional) Create an EC2 instance for the NAT gateway (if not using NAT Gateway)
resource "aws_security_group" "asg_security_group" {
  vpc_id = aws_vpc.my_vpc.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow incoming traffic from anywhere (update as needed)
  }
  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow incoming traffic from anywhere (update as needed)
  }
  # Add additional ingress rules as needed
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Allow outgoing traffic to anywhere (update as needed)
  }
}

resource "aws_launch_configuration" "my_launch_config" {
  name = "my-launch-config"
  image_id = "ami-0261755bbcb8c4a84" # Specify your desired AMI ID
  instance_type = "t2.micro" # Specify your desired instance type

  # Additional configuration options such as user_data, key_name, etc.

  security_groups = [aws_security_group.asg_security_group.name]
}

resource "aws_autoscaling_group" "my_asg" {
  desired_capacity     = 2
  max_size             = 4
  min_size             = 1
  vpc_zone_identifier  = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
  launch_configuration = aws_launch_configuration.my_launch_config.id

  # Additional Auto Scaling Group options as needed
  health_check_type          = "EC2"
  health_check_grace_period  = 300
  force_delete               = true
}


