output "public_nacl_id" {
  value = aws_network_acl.public_nacl.id
}

output "private_1_nacl_id" {
  value = aws_network_acl.private_1_nacl.id
}

output "private_2_nacl_id" {
  value = aws_network_acl.private_2_nacl.id
}
