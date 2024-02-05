resource "aws_route_table" "my_rt1" {
  vpc_id = var.vpc_id

  route {
  cidr_block = var.rt_cidr_block
  gateway_id = var.gateway_id
    
  }
}