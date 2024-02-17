output "sgforlb" {
    value = aws_security_group.sgforlb.id
}

output "sgforservers" {
    value = aws_security_group.sgforservers.id
  
}

output "sgforlbApp" {
  value = aws_security_group.sgforlbApp.id
}

output "sgforserversapp" {
  value = aws_security_group.sgforserversapp.id
}

output "sgforlbDB" {
  value = aws_security_group.sgforlbDB.id
}