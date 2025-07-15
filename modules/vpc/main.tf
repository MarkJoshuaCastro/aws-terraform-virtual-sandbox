locals {
  az = "${var.region}a"
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = { Name = var.vpc_name }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags   = { Name = var.igw_name }
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_cidr
  availability_zone = local.az
  tags              = { Name = var.public_subnet_name }
}

resource "aws_subnet" "private_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_1_subnet_cidr
  availability_zone = local.az
  tags              = { Name = var.private_1_subnet_name }
}

resource "aws_subnet" "private_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_2_subnet_cidr
  availability_zone = local.az
  tags              = { Name = var.private_2_subnet_name }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = { Name = var.public_subnet_name }
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private_1" {
  vpc_id = aws_vpc.main.id
  tags   = { Name = var.private_1_subnet_name }
}

resource "aws_route_table_association" "private_1_assoc" {
  subnet_id      = aws_subnet.private_1.id
  route_table_id = aws_route_table.private_1.id
}

resource "aws_route_table" "private_2" {
  vpc_id = aws_vpc.main.id
  tags   = { Name = var.private_2_subnet_name }
}

resource "aws_route_table_association" "private_2_assoc" {
  subnet_id      = aws_subnet.private_2.id
  route_table_id = aws_route_table.private_2.id
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id            = aws_vpc.main.id
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = [aws_route_table.private_1.id]
  tags              = {
    Name = var.vpc_endpoint_name
  }
}

