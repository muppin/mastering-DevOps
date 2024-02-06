output "vpc_id" {
    value = aws_vpc.MyVPC.id
  
}

output "subnet_id1" {
    value = aws_subnet.PublicSubnet1.id
  
}

output "subnet_id2" {
    value = aws_subnet.PublicSubnet2.id
  
}

output "subnet_id3" {
    value = aws_subnet.PrivateSubnet1.id
  
}

output "subnet_id4" {
    value = aws_subnet.PrivateSubnet2.id
  
}

output "subnet_id5" {
    value = aws_subnet.PrivateSubnet3.id
  
}

output "subnet_id6" {
    value = aws_subnet.PrivateSubnet4.id
  
}