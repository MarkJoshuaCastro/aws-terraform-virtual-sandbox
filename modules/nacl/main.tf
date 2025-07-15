### Public NACL ###

resource "aws_network_acl" "public_nacl" {
  vpc_id = var.vpc_id
  tags   = { Name = var.public_subnet_name }
}

# Inbound Rules
resource "aws_network_acl_rule" "public_ssh_in" {
  network_acl_id = aws_network_acl.public_nacl.id
  rule_number    = 100
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 22
  to_port        = 22
  egress         = false
}

resource "aws_network_acl_rule" "public_icmp_private_1_reply" {
  network_acl_id = aws_network_acl.public_nacl.id
  rule_number    = 200
  protocol       = "icmp"
  rule_action    = "allow"
  cidr_block     = var.private_1_subnet_cidr
  icmp_type      = 0
  icmp_code      = 0
  egress         = false
}

resource "aws_network_acl_rule" "public_icmp_private_2_reply" {
  network_acl_id = aws_network_acl.public_nacl.id
  rule_number    = 300
  protocol       = "icmp"
  rule_action    = "allow"
  cidr_block     = var.private_2_subnet_cidr
  icmp_type      = 0
  icmp_code      = 0
  egress         = false
}

resource "aws_network_acl_rule" "public_tcp_private_1_in" {
  network_acl_id = aws_network_acl.public_nacl.id
  rule_number    = 400
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = var.private_1_subnet_cidr
  from_port      = 1024
  to_port        = 65535
  egress         = false
}

resource "aws_network_acl_rule" "public_tcp_private_2_in" {
  network_acl_id = aws_network_acl.public_nacl.id
  rule_number    = 500
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = var.private_2_subnet_cidr
  from_port      = 1024
  to_port        = 65535
  egress         = false
}

# Outbound Rules
resource "aws_network_acl_rule" "public_tcp_all_out" {
  network_acl_id = aws_network_acl.public_nacl.id
  rule_number    = 100
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 1024
  to_port        = 65535
  egress         = true
}

resource "aws_network_acl_rule" "public_icmp_private_1_request" {
  network_acl_id = aws_network_acl.public_nacl.id
  rule_number    = 200
  protocol       = "icmp"
  rule_action    = "allow"
  cidr_block     = var.private_1_subnet_cidr
  icmp_type      = 8
  icmp_code      = 0
  egress         = true
}

resource "aws_network_acl_rule" "public_icmp_private_2_request" {
  network_acl_id = aws_network_acl.public_nacl.id
  rule_number    = 300
  protocol       = "icmp"
  rule_action    = "allow"
  cidr_block     = var.private_2_subnet_cidr
  icmp_type      = 8
  icmp_code      = 0
  egress         = true
}

resource "aws_network_acl_rule" "public_ssh_private_1" {
  network_acl_id = aws_network_acl.public_nacl.id
  rule_number    = 400
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = var.private_1_subnet_cidr
  from_port      = 22
  to_port        = 22
  egress         = true
}

resource "aws_network_acl_rule" "public_ssh_private_2" {
  network_acl_id = aws_network_acl.public_nacl.id
  rule_number    = 500
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = var.private_2_subnet_cidr
  from_port      = 22
  to_port        = 22
  egress         = true
}


# Public Subnet Association
resource "aws_network_acl_association" "public_assoc" {
  subnet_id       = var.public_subnet_id
  network_acl_id  = aws_network_acl.public_nacl.id
}


### 1st Private NACL ###
resource "aws_network_acl" "private_1_nacl" {
  vpc_id = var.vpc_id
  tags   = { Name = var.private_1_subnet_name }
}

# Inbound
resource "aws_network_acl_rule" "private_1_ssh_in" {
  network_acl_id = aws_network_acl.private_1_nacl.id
  rule_number    = 100
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = var.public_subnet_cidr
  from_port      = 22
  to_port        = 22
  egress         = false
}

resource "aws_network_acl_rule" "private_1_icmp_request_in" {
  network_acl_id = aws_network_acl.private_1_nacl.id
  rule_number    = 200
  protocol       = "icmp"
  rule_action    = "allow"
  cidr_block     = var.public_subnet_cidr
  icmp_type      = 8
  icmp_code      = 0
  egress         = false
}

resource "aws_network_acl_rule" "private_1_tcp_in" {
  network_acl_id = aws_network_acl.private_1_nacl.id
  rule_number    = 300
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 1024
  to_port        = 65535
  egress         = false
}

# Outbound
resource "aws_network_acl_rule" "private_1_tcp_out" {
  network_acl_id = aws_network_acl.private_1_nacl.id
  rule_number    = 100
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = var.public_subnet_cidr
  from_port      = 1024
  to_port        = 65535
  egress         = true
}

resource "aws_network_acl_rule" "private_1_icmp_reply_out" {
  network_acl_id = aws_network_acl.private_1_nacl.id
  rule_number    = 200
  protocol       = "icmp"
  rule_action    = "allow"
  cidr_block     = var.public_subnet_cidr
  icmp_type      = 0
  icmp_code      = 0
  egress         = true
}

resource "aws_network_acl_rule" "private_1_https_out" {
  network_acl_id = aws_network_acl.private_1_nacl.id
  rule_number    = 300
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 443
  to_port        = 443
  egress         = true
}

# 1st Private Subent Association
resource "aws_network_acl_association" "private_1_assoc" {
  subnet_id       = var.private_1_subnet_id
  network_acl_id  = aws_network_acl.private_1_nacl.id
}


### 2nd Private NACLs ###
resource "aws_network_acl" "private_2_nacl" {
  vpc_id = var.vpc_id
  tags   = { Name = var.private_2_subnet_name }
}

# Inbound
resource "aws_network_acl_rule" "private_2_ssh_in" {
  network_acl_id = aws_network_acl.private_2_nacl.id
  rule_number    = 100
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = var.public_subnet_cidr
  from_port      = 22
  to_port        = 22
  egress         = false
}

resource "aws_network_acl_rule" "private_2_icmp_request_in" {
  network_acl_id = aws_network_acl.private_2_nacl.id
  rule_number    = 200
  protocol       = "icmp"
  rule_action    = "allow"
  cidr_block     = var.public_subnet_cidr
  icmp_type      = 8
  icmp_code      = 0
  egress         = false
}

# Outbound
resource "aws_network_acl_rule" "private_2_tcp_out" {
  network_acl_id = aws_network_acl.private_2_nacl.id
  rule_number    = 100
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = var.public_subnet_cidr
  from_port      = 1024
  to_port        = 65535
  egress         = true
}

resource "aws_network_acl_rule" "private_2_icmp_reply_out" {
  network_acl_id = aws_network_acl.private_2_nacl.id
  rule_number    = 200
  protocol       = "icmp"
  rule_action    = "allow"
  cidr_block     = var.public_subnet_cidr
  icmp_type      = 0
  icmp_code      = 0
  egress         = true
}

# 2nd Private Association

resource "aws_network_acl_association" "private_2_assoc" {
  subnet_id       = var.private_2_subnet_id
  network_acl_id  = aws_network_acl.private_2_nacl.id
}
