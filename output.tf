output "vpc_id" {
  description = "The ID of the created VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_id" {
  description = "The ID of the public subnet"
  value       = module.vpc.public_subnet_id
}

output "private_1_subnet_id" {
  description = "The ID of the first private subnet"
  value       = module.vpc.private_1_subnet_id
}

output "private_2_subnet_id" {
  description = "The ID of the second private subnet"
  value       = module.vpc.private_2_subnet_id
}

output "vpc_endpoint_id" {
  description = "The ID of the VPC S3 Gateway endpoint"
  value       = module.vpc.vpc_endpoint_id
}


output "iam_role_name" {
  value = module.iam.role_name
}

output "iam_role_arn" {
  value = module.iam.role_arn
}

output "iam_instance_profile_name" {
  value = module.iam.instance_profile_name
}


output "public_instance_ip" {
  value = module.ec2_public.public_ip
}

output "private_1_instance_ip" {
  value = module.ec2_private_1.private_ip
}

output "private_2_instance_ip" {
  value = module.ec2_private_2.private_ip
}
