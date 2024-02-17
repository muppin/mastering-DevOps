
resource "aws_lb" "example" {
  name               = "example-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sgforlb]
  subnets            = [var.subnet_id1 , var.subnet_id2 ]

  enable_deletion_protection = false
  enable_http2              = true
  enable_cross_zone_load_balancing = true

  # Add more ALB configurations as needed
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

resource "aws_lb_target_group" "example" {
  name     = "example-target-group1"
  port     = 80 # depends on the application port
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  target_type = "instance"

  health_check {
    path     = "/"
    protocol = "HTTP"
    matcher  = "200-399"
    timeout  = 3
  }

  # Add more target group configurations as needed
}

#----------INTERNAL LB----------------------------------

resource "aws_lb" "example-alb-APP" {
  name               = "example-alb-APP"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [var.sgforlbApp]
  subnets            = [var.subnet_id3 , var.subnet_id4 ]

  enable_deletion_protection = false
  enable_http2              = true
  enable_cross_zone_load_balancing = true
}

resource "aws_lb_listener" "example_listener_APP" {
    load_balancer_arn = aws_lb.example-alb-APP.arn
    port = 80
    protocol = "HTTP"
    default_action {
        type = "forward"    
        target_group_arn = aws_lb_target_group.example-APP.arn
    }
}

resource "aws_lb_target_group" "example-APP" {
  name     = "example-target-group2"
  port     = 80 # depends on the application port
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  target_type = "instance"

  health_check {
    path     = "/"
    protocol = "HTTP"
    matcher  = "200-399"
    timeout  = 3
  }

  # Add more target group configurations as needed
}
