module "vpc" {
  source = "./modules/vpc"

  region   = var.region
  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr

  public_subnet_name = var.public_subnet_name
  public_subnet_cidr = var.public_subnet_cidr

  private_1_subnet_name = var.private_1_subnet_name
  private_1_subnet_cidr = var.private_1_subnet_cidr

  private_2_subnet_name = var.private_2_subnet_name
  private_2_subnet_cidr = var.private_2_subnet_cidr

  igw_name          = var.igw_name
  vpc_endpoint_name = var.vpc_endpoint_name
}


module "nacl" {
  source = "./modules/nacl"

  vpc_id                = module.vpc.vpc_id
  public_subnet_name    = var.public_subnet_name
  public_subnet_cidr    = module.vpc.public_subnet_cidr
  public_subnet_id      = module.vpc.public_subnet_id
  private_1_subnet_name = var.private_1_subnet_name
  private_1_subnet_cidr = module.vpc.private_1_subnet_cidr
  private_1_subnet_id   = module.vpc.private_1_subnet_id
  private_2_subnet_name = var.private_2_subnet_name
  private_2_subnet_cidr = module.vpc.private_2_subnet_cidr
  private_2_subnet_id   = module.vpc.private_2_subnet_id
}


module "sg" {
  source = "./modules/sg"

  vpc_id                = module.vpc.vpc_id
  user_ip               = var.user_ip
  public_subnet_name    = var.public_subnet_name
  public_subnet_cidr    = module.vpc.public_subnet_cidr
  private_1_subnet_name = var.private_1_subnet_name
  private_1_subnet_cidr = module.vpc.private_1_subnet_cidr
  private_2_subnet_name = var.private_2_subnet_name
  private_2_subnet_cidr = module.vpc.private_2_subnet_cidr
}

module "iam" {
  source             = "./modules/iam"
  role_name          = var.iam_role_name
  description        = var.iam_description
  assume_role_policy = var.iam_assume_role_policy
  policy_arns        = var.iam_policy_arns
}


module "ec2_public" {
  source              = "./modules/ec2"
  instance_name       = var.public_instance_name
  ami_id              = var.ec2_ami_id
  instance_type       = var.ec2_instance_type
  key_name            = var.ec2_key_pair
  subnet_id           = module.vpc.public_subnet_id
  security_group_id   = module.sg.public_sg_id
  associate_public_ip = true
}

module "ec2_private_1" {
  source               = "./modules/ec2"
  instance_name        = var.private_1_instance_name
  ami_id               = var.ec2_ami_id
  instance_type        = var.ec2_instance_type
  key_name             = var.ec2_key_pair
  subnet_id            = module.vpc.private_1_subnet_id
  security_group_id    = module.sg.private_1_sg_id
  iam_instance_profile = module.iam.instance_profile_name
  associate_public_ip  = false
}

module "ec2_private_2" {
  source              = "./modules/ec2"
  instance_name       = var.private_2_instance_name
  ami_id              = var.ec2_ami_id
  instance_type       = var.ec2_instance_type
  key_name            = var.ec2_key_pair
  subnet_id           = module.vpc.private_2_subnet_id
  security_group_id   = module.sg.private_2_sg_id
  associate_public_ip = false
}
