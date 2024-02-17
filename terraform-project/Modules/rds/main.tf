resource "aws_db_instance" "name" {
  instance_class = "db.t3.micro"
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true  
  vpc_security_group_ids = [var.sgforlbDB]
  db_subnet_group_name = var.db_subnet_group_name
  multi_az = true
}