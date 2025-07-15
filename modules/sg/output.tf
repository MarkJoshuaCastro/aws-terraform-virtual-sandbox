output "public_sg_id" {
  value = aws_security_group.public_sg.id
}

output "private_1_sg_id" {
  value = aws_security_group.private_1_sg.id
}

output "private_2_sg_id" {
  value = aws_security_group.private_2_sg.id
}
