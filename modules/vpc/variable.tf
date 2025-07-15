variable "region" {
  description = "AWS region for resources"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block of the VPC"
  type        = string
}

variable "public_subnet_name" {
  description = "Name of the public subnet"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block of the public subnet"
  type        = string
}

variable "private_1_subnet_name" {
  description = "Name of the first private subnet"
  type        = string
}

variable "private_1_subnet_cidr" {
  description = "CIDR block of the first private subnet"
  type        = string
}

variable "private_2_subnet_name" {
  description = "Name of the second private subnet"
  type        = string
}

variable "private_2_subnet_cidr" {
  description = "CIDR block of the second private subnet"
  type        = string
}

variable "igw_name" {
  description = "Name of the Internet Gateway"
  type        = string
}

variable "vpc_endpoint_name" {
  description = "Name of the VPC S3 Gateway endpoint"
  type        = string
}
