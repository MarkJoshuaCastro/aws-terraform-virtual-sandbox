variable "region" {
  description = "AWS region to deploy resources in"
  type        = string
}

variable "vpc_name" {
  description = "Name tag for the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_name" {
  description = "Name of the public subnet"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "private_1_subnet_name" {
  description = "Name of the first private subnet"
  type        = string
}

variable "private_1_subnet_cidr" {
  description = "CIDR block for the first private subnet"
  type        = string
}

variable "private_2_subnet_name" {
  description = "Name of the second private subnet"
  type        = string
}

variable "private_2_subnet_cidr" {
  description = "CIDR block for the second private subnet"
  type        = string
}

variable "igw_name" {
  description = "Name tag for the Internet Gateway"
  type        = string
}

variable "vpc_endpoint_name" {
  description = "Name tag for the VPC Endpoint"
  type        = string
}


variable "user_ip" {
  description = "Your public IP address for SSH (no /32)"
  type        = string
}


variable "iam_role_name" {
  description = "Name tag for the IAM role"
  type        = string
}

variable "iam_description" {
  description = "Description for the IAM role"
  type        = string
}

variable "iam_assume_role_policy" {
  description = "Assume role policy for the IAM role"
  type        = string
}

variable "iam_policy_arns" {
  description = "List of IAM policy ARNs to attach to the IAM role"
  type        = list(string)
  default     = []
}


variable "public_instance_name" {
  description = "Name tag for the public EC2 instance"
  type        = string
}

variable "private_1_instance_name" {
  description = "Name tag for the first private EC2 instance"
  type        = string
}

variable "private_2_instance_name" {
  description = "Name tag for the second private EC2 instance"
  type        = string
}

variable "ec2_ami_id" {
  description = "AMI ID for the EC2 instances"
  type        = string
}

variable "ec2_instance_type" {
  description = "Instance type for the EC2 instances"
  type        = string
}

variable "ec2_key_pair" {
  description = "Key pair name for the EC2 instances"
  type        = string
}
