### Public SG ###

resource "aws_security_group" "public_sg" {
  name        = var.public_subnet_name
  description = "${var.public_subnet_name} SG"
  vpc_id      = var.vpc_id
  tags        = { Name = var.public_subnet_name }
}

# Inbound Rules
resource "aws_security_group_rule" "public_ssh_in" {
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 22
  to_port           = 22
  cidr_blocks       = ["${var.user_ip}/32"]
  security_group_id = aws_security_group.public_sg.id
}

resource "aws_security_group_rule" "public_icmp_echo_reply_p1_in" {
  type              = "ingress"
  protocol          = "icmp"
  from_port         = 0
  to_port           = 0
  cidr_blocks       = [var.private_1_subnet_cidr]
  security_group_id = aws_security_group.public_sg.id
}

resource "aws_security_group_rule" "public_icmp_echo_reply_p2_in" {
  type              = "ingress"
  protocol          = "icmp"
  from_port         = 0
  to_port           = 0
  cidr_blocks       = [var.private_2_subnet_cidr]
  security_group_id = aws_security_group.public_sg.id
}

resource "aws_security_group_rule" "public_tcp_p1_in" {
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 1024
  to_port           = 65535
  cidr_blocks       = [var.private_1_subnet_cidr]
  security_group_id = aws_security_group.public_sg.id
}

resource "aws_security_group_rule" "public_tcp_p2_in" {
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 1024
  to_port           = 65535
  cidr_blocks       = [var.private_2_subnet_cidr]
  security_group_id = aws_security_group.public_sg.id
}

# Outbound Rules
resource "aws_security_group_rule" "public_tcp_out_user" {
  type              = "egress"
  protocol          = "tcp"
  from_port         = 1024
  to_port           = 65535
  cidr_blocks       = ["${var.user_ip}/32"]
  security_group_id = aws_security_group.public_sg.id
}

resource "aws_security_group_rule" "public_icmp_request_p1_out" {
  type              = "egress"
  protocol          = "icmp"
  from_port         = 8
  to_port           = 0
  cidr_blocks       = [var.private_1_subnet_cidr]
  security_group_id = aws_security_group.public_sg.id
}

resource "aws_security_group_rule" "public_icmp_request_p2_out" {
  type              = "egress"
  protocol          = "icmp"
  from_port         = 8
  to_port           = 0
  cidr_blocks       = [var.private_2_subnet_cidr]
  security_group_id = aws_security_group.public_sg.id
}

resource "aws_security_group_rule" "public_ssh_p1_out" {
  type              = "egress"
  protocol          = "tcp"
  from_port         = 22
  to_port           = 22
  cidr_blocks       = [var.private_1_subnet_cidr]
  security_group_id = aws_security_group.public_sg.id
}

resource "aws_security_group_rule" "public_ssh_p2_out" {
  type              = "egress"
  protocol          = "tcp"
  from_port         = 22
  to_port           = 22
  cidr_blocks       = [var.private_2_subnet_cidr]
  security_group_id = aws_security_group.public_sg.id
}


### 1st Private SG ###

resource "aws_security_group" "private_1_sg" {
  name        = var.private_1_subnet_name
  description = "${var.private_1_subnet_name} SG"
  vpc_id      = var.vpc_id
  tags        = { Name = var.private_1_subnet_name }
}

# Inbound Rules
resource "aws_security_group_rule" "private_1_ssh_in" {
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 22
  to_port           = 22
  cidr_blocks       = [var.public_subnet_cidr]
  security_group_id = aws_security_group.private_1_sg.id
}

resource "aws_security_group_rule" "private_1_icmp_request_in" {
  type              = "ingress"
  protocol          = "icmp"
  from_port         = 8
  to_port           = 0
  cidr_blocks       = [var.public_subnet_cidr]
  security_group_id = aws_security_group.private_1_sg.id
}

resource "aws_security_group_rule" "private_1_tcp_global_in" {
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 1024
  to_port           = 65535
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.private_1_sg.id
}

# Outbound Rules
resource "aws_security_group_rule" "private_1_tcp_out" {
  type              = "egress"
  protocol          = "tcp"
  from_port         = 1024
  to_port           = 65535
  cidr_blocks       = [var.public_subnet_cidr]
  security_group_id = aws_security_group.private_1_sg.id
}

resource "aws_security_group_rule" "private_1_icmp_reply_out" {
  type              = "egress"
  protocol          = "icmp"
  from_port         = 0
  to_port           = 0
  cidr_blocks       = [var.public_subnet_cidr]
  security_group_id = aws_security_group.private_1_sg.id
}

resource "aws_security_group_rule" "private_1_https_out" {
  type              = "egress"
  protocol          = "tcp"
  from_port         = 443
  to_port           = 443
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.private_1_sg.id
}


### 2nd Private SG ###

resource "aws_security_group" "private_2_sg" {
  name        = var.private_2_subnet_name
  description = "${var.private_2_subnet_name} SG"
  vpc_id      = var.vpc_id
  tags        = { Name = var.private_2_subnet_name }
}

# Inbound Rules
resource "aws_security_group_rule" "private_2_ssh_in" {
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 22
  to_port           = 22
  cidr_blocks       = [var.public_subnet_cidr]
  security_group_id = aws_security_group.private_2_sg.id
}

resource "aws_security_group_rule" "private_2_icmp_request_in" {
  type              = "ingress"
  protocol          = "icmp"
  from_port         = 8
  to_port           = 0
  cidr_blocks       = [var.public_subnet_cidr]
  security_group_id = aws_security_group.private_2_sg.id
}

# Outbound Rules
resource "aws_security_group_rule" "private_2_tcp_out" {
  type              = "egress"
  protocol          = "tcp"
  from_port         = 1024
  to_port           = 65535
  cidr_blocks       = [var.public_subnet_cidr]
  security_group_id = aws_security_group.private_2_sg.id
}

resource "aws_security_group_rule" "private_2_icmp_reply_out" {
  type              = "egress"
  protocol          = "icmp"
  from_port         = 0
  to_port           = 0
  cidr_blocks       = [var.public_subnet_cidr]
  security_group_id = aws_security_group.private_2_sg.id
}
