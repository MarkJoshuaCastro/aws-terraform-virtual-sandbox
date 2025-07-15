variable "instance_name" {}
variable "ami_id" {}
variable "instance_type" {}
variable "key_name" {}
variable "subnet_id" {}
variable "security_group_id" {}
variable "iam_instance_profile" {
  default     = null
  description = "Optional IAM instance profile name"
}

variable "associate_public_ip" {
  description = "Whether to assign a public IP to the EC2 instance"
  type        = bool
  default     = false
}