variable "role_name" {}
variable "description" {}
variable "assume_role_policy" {}
variable "policy_arns" {
  type    = list(string)
  default = []
}


