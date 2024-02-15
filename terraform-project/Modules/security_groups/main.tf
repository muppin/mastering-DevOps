resource "aws_security_group" "sgforlb" {
    vpc_id = var.vpc_id
    ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow incoming traffic from anywhere (update as needed)
  }
    ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow incoming traffic from anywhere (update as needed)
  }
    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Allow outgoing traffic to anywhere (update as needed)
  }
  
}

resource "aws_security_group" "sgforservers" {
    vpc_id = var.vpc_id
  #   ingress {
  #   from_port   = 22
  #   to_port     = 22
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"] # the traffic should come from load balancer
  # }
  #   ingress {
  #   from_port   = 80 #replace with application port
  #   to_port     = 80 #replace with application port
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"] # the traffic should come from load balancer
  # }
    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Allow outgoing traffic to anywhere (update as needed)
  }
  
}

#---------------------------APP TIER SECURITY GROUPS----------------------

resource "aws_security_group" "sgforlbApp" {
      vpc_id = var.vpc_id
    ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow incoming traffic from anywhere (update as needed)
  }
    ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow incoming traffic from anywhere (update as needed)
  }
    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Allow outgoing traffic to anywhere (update as needed)
  }
  
}

resource "aws_security_group" "sgforserversapp" {
      vpc_id = var.vpc_id
  #   ingress {
  #   from_port   = 22
  #   to_port     = 22
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"] # the traffic should come from load balancer
  # }
  #   ingress {
  #   from_port   = 80 #replace with application port
  #   to_port     = 80 #replace with application port
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"] # the traffic should come from load balancer
  # }
    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Allow outgoing traffic to anywhere (update as needed)
  }
  
}