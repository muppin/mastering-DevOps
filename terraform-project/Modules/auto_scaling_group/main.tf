resource "aws_launch_template" "foobar" {
  name  = "foobar"
  image_id      = "ami-0c7217cdde317cfec"
  instance_type = "t2.micro"
  vpc_security_group_ids = [var.sgforservers]
  }

  resource "aws_autoscaling_group" "bar" {
  #availability_zones = ["us-east-1a", "us-east-1b"]
  desired_capacity   = 2
  max_size           = 4
  min_size           = 1
  vpc_zone_identifier  = [var.subnet_id1, var.subnet_id2]

  launch_template {
    id      = aws_launch_template.foobar.id
    version = "$Latest"
  }
}

resource "aws_autoscaling_attachment" "example" {
  autoscaling_group_name = aws_autoscaling_group.bar.id
  lb_target_group_arn    = var.target_group_arn
}


####################APP TIER AUTO SCALING GROUP-----------------------------------------

resource "aws_launch_template" "foobar1" {
  name  = "foobar1"
  image_id      = "ami-0c7217cdde317cfec"
  instance_type = "t2.micro"
  vpc_security_group_ids = [var.sgforserversapp]
  }

  resource "aws_autoscaling_group" "bar1" {
  #availability_zones = ["us-east-1a", "us-east-1b"]
  desired_capacity   = 2
  max_size           = 4
  min_size           = 1
  vpc_zone_identifier  = [var.subnet_id3, var.subnet_id4]

  launch_template {
    id      = aws_launch_template.foobar1.id
    version = "$Latest"
  }
}

resource "aws_autoscaling_attachment" "example1" {
  autoscaling_group_name = aws_autoscaling_group.bar1.id
  lb_target_group_arn    = var.target_group_arn_APP
}