resource "aws_iam_role" "this" {
  name               = var.role_name
  description        = var.description
  assume_role_policy = var.assume_role_policy
  tags               = { Name = var.role_name }
}

resource "aws_iam_instance_profile" "this" {
  name = var.role_name
  role = aws_iam_role.this.name
}

resource "aws_iam_role_policy_attachment" "s3_readonly" {
  for_each    = toset(var.policy_arns)
  role        = aws_iam_role.this.name
  policy_arn  = each.value
}
