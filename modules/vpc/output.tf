output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = aws_subnet.public.id
}

output "private_1_subnet_id" {
  description = "ID of the first private subnet"
  value       = aws_subnet.private_1.id
}

output "private_2_subnet_id" {
  description = "ID of the second private subnet"
  value       = aws_subnet.private_2.id
}

output "vpc_endpoint_id" {
  description = "ID of the S3 VPC endpoint"
  value       = aws_vpc_endpoint.s3.id
}

output "public_subnet_cidr" {
  description = "CIDR block of the public subnet"
  value       = aws_subnet.public.cidr_block
}

output "private_1_subnet_cidr" {
  description = "CIDR block of the first private subnet"
  value       = aws_subnet.private_1.cidr_block
}

output "private_2_subnet_cidr" {
  description = "CIDR block of the second private subnet"
  value       = aws_subnet.private_2.cidr_block
}
