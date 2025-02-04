provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr_block = var.vpc_cidr_block
  public_subnets = var.public_subnets
  private_subnets = var.private_subnets
  azs            = var.azs
}

module "ec2" {
  source = "./modules/ec2"

  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type
  subnet_id     = module.vpc.private_subnets[0]
  security_group_ids = [module.vpc.default_security_group_id]
}

module "rds" {
  source = "./modules/rds"

  db_name     = var.rds_db_name
  db_username = var.rds_db_username
  db_password = var.rds_db_password
  subnet_ids  = module.vpc.private_subnets
  vpc_id      = module.vpc.vpc_id
}

module "s3" {
  source = "./modules/s3"

  bucket_name = var.s3_bucket_name
}